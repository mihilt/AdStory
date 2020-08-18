package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.BoardCategory;
import common.MvcFileRenamePolicy;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class BoardInsertServlet
 */
@WebServlet("/board/insert")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<BoardCategory> categoryList = new BoardService().selectCategoryList();
		System.out.println("categoryList = "+categoryList);
		
		request.setAttribute("categoryList", categoryList);
		request.getRequestDispatcher("/WEB-INF/views/board/boardInsert.jsp")
			   .forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//MultipartRequest객체를 생성하면,
		//서버pc에 업로드파일을 자동으로 저장해준다.
		
		//업로드파일을 저장할 경로
		// /는 웹루트디렉토리를 가리킴
		String saveDirectory = getServletContext().getRealPath("/upload/board-images");
		
		//10MB로 업로드할 파일용량 제한: 10 * 1kb * 1kb
		int maxPostSize = 10 * 1024 * 1024;
		
		String encoding = "utf-8";
		
		//중복이름 처리정책 객체
//		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		FileRenamePolicy policy = new MvcFileRenamePolicy();
		
		MultipartRequest multipartRequest
			= new MultipartRequest(request, 
								   saveDirectory, 
								   maxPostSize, 
								   encoding, 
								   policy);
		
		//1.사용자 입력값 : 반드시 MultipartRequest로부터 값을 가져온다.
		int categoryKey = Integer.parseInt(multipartRequest.getParameter("categoryKey"));
//		int userKey = ImultipartRequest.getParameter("boardWriter");
		String memberId = multipartRequest.getParameter("memberId");
		int userKey = Integer.parseInt(multipartRequest.getParameter("userKey"));
		int userPoint = Integer.parseInt(multipartRequest.getParameter("userPoint"));
		String title = multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content");
		int clickPrice = Integer.parseInt(multipartRequest.getParameter("clickPrice"));
		String url = multipartRequest.getParameter("url");
		int point = Integer.parseInt(multipartRequest.getParameter("point"));
		//사용자가 업로드한 파일명
		String originalFileName 
			= multipartRequest.getOriginalFileName("upFile");
		//실제 서버컴퓨터에 저장된 파일명
		String renamedFileName
			= multipartRequest.getFilesystemName("upFile");

		//2.업무로직
		int insertResult = 0;
		int boardNo =0;
		if(point <= userPoint || point <0) {
			insertResult = new BoardService().insertBoard(board,memberId,userKey,point);
			boardNo = board.getKey();			
		}
//		System.out.println("boardNo@servlet = "+boardNo);
//		System.out.println("insertresult@servlet = " + insertResult);
//		System.out.println("logresult@servlet = " + logResult);
		
		//3.view단처리
		String msg = "";
		String loc = "";
		
		if(insertResult > 0 ) {
			msg = "게시글 등록 성공!";
			loc = request.getContextPath()+"/board/view?boardNo="+boardNo;
			//세션에 저장된 member객체 갱신
			HttpSession session = request.getSession();
			Member updateMember = new MemberService().selectOne(memberId);
			Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
			
			if(memberId.equals(memberLoggedIn.getMemberId()))
				session.setAttribute("memberLoggedIn", updateMember);
		}
		else {
			msg = "게시글 등록 실패!";
			loc = request.getHeader("referer");
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
			   .forward(request, response);
		
			
		
		
		
	}

}



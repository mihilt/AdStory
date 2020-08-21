package board.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.BoardCategory;
import common.MvcFileRenamePolicy;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/board/update")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.사용자 입력값 boardNo
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		//2.업무로직
		BoardService boardService = new BoardService();
		Board board =boardService.selectOne(boardNo);
		System.out.println("board@servlet = " + board);
		List<BoardCategory> categoryList = boardService.selectCategoryList();
		
		//3.jsp view단 처리
		request.setAttribute("board", board);
		request.setAttribute("categoryList", categoryList);
		request.getRequestDispatcher("/WEB-INF/views/board/boardUpdate.jsp")
			   .forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//MultipartRequest객체 생성 준비
		//업로드파일을 저장할 경로
		String saveDirectory = getServletContext().getRealPath("/upload/board-images");
		//10MB로 업로드할 파일용량 제한: 10 * 1kb * 1kb
		int maxPostSize = 10 * 1024 * 1024;
		String encoding = "utf-8";
		//중복이름 처리정책 객체
		FileRenamePolicy policy = new MvcFileRenamePolicy();
		//0.MultipartRequest객체 생성
		MultipartRequest multipartRequest
			= new MultipartRequest(request, 
								   saveDirectory, 
								   maxPostSize, 
								   encoding, 
								   policy);
		
		//1.사용자 입력값 : 반드시 MultipartRequest로부터 값을 가져온다.
		int boardNo = Integer.parseInt(multipartRequest.getParameter("boardNo"));
		int categoryKey = Integer.parseInt(multipartRequest.getParameter("categoryKey"));
		String title = multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content");
		String url = multipartRequest.getParameter("url");
		//사용자가 업로드한 파일명
		String originalFileName 
			= multipartRequest.getOriginalFileName("upFile");
		//실제 서버컴퓨터에 저장된 파일명
		String renamedFileName
			= multipartRequest.getFilesystemName("upFile");
		
		String delFile = multipartRequest.getParameter("delFile");
		
		//수정하지 않는 항목 제외(userKey,clickPrice,point,url)
		Board board = new Board(boardNo, categoryKey, 0, title, content, null,null,
				0, 0, url, originalFileName, renamedFileName, 0,null,null);
		
		Board oldBoard = new BoardService().selectOne(boardNo);
		System.out.println("boardNo@servlet="+boardNo);
		System.out.println("oldBoard@servlet="+oldBoard);
		String oldRenamedFileName = oldBoard.getRenamedFileName();
		String oldOriginalFileName = oldBoard.getOriginalFileName();
		
		//첨부파일 수정관련
		//이전 첨부파일이 존재하는 경우만 실행
		if(oldOriginalFileName != null) {
			File oldFile = new File(saveDirectory, oldRenamedFileName);
			
			//1.첨부파일을 새로 추가한 경우
			// 이전 첨부파일 삭제 | db에는 새파일데이터로 수정
			if(originalFileName != null) {
				boolean result = oldFile.delete();
				System.out.println(oldFile + (result?"삭제성공!":"삭제실패"));
			}
			//2.첨부파일만 삭제한 경우
			// 이전 첨부파일 삭제 |db에는 null로 수정
			else if(delFile != null) {
				boolean result = oldFile.delete();
				System.out.println(oldFile + (result?"삭제성공!":"삭제실패"));
			}
			//3.기존 첨부파일 유지하는 경우
			// db의 정보도 그대로 유지
			else {
				board.setOriginalFileName(oldOriginalFileName);
				board.setRenamedFileName(oldRenamedFileName);
			}
			
		}
		
		//2.업무로직
		int result = new BoardService().updateBoard(board);
		System.out.println("result@servlet = " + result);
		
		//3.view단처리
		String msg = "";
		String loc = request.getContextPath() + "/board/view?boardNo=" + boardNo;
		
		if(result > 0) {
			msg = "게시글 수정 성공!";
		}
		else {
			msg = "게시글 수정 실패!";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
			   .forward(request, response);
		
	}

}

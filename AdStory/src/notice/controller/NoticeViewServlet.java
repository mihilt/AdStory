package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Utils;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeViewServlet
 */
@WebServlet("/notice/view")
public class NoticeViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				Notice notice = new Notice();
		//1.파리미터 글번호
				
				int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
						
								
				//게시글 하나 가져오기
				
				notice = new NoticeService().selectOne(noticeNo);
				
				String view = "/WEB-INF/views/notice/noticeView.jsp";
				//게시글 가져오기에 실패한경우
				if(notice == null){
					request.setAttribute("msg", "조회한 게시글이 존재하지 않습니다.");
					request.setAttribute("loc", "/notice/list");
					view = "/WEB-INF/views/common/msg.jsp";
				}
				else {
					
					
					//제목
					String noticeTitle = notice.getTitle();
					noticeTitle = Utils.getSecureString(noticeTitle);
					notice.setTitle(noticeTitle);
					
					//내용
					String noticeContent = notice.getContent();
					noticeContent = Utils.getSecureString(noticeContent);
					noticeContent = Utils.getStringWithBr(noticeContent);
					notice.setContent(noticeContent);
				}
				
				//3.view단 처리위임
				request.setAttribute("notice", notice);

				
				RequestDispatcher reqDispatcher = request.getRequestDispatcher(view);
				reqDispatcher.forward(request, response);
			}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

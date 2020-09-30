package notice.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;
import notice.model.vo.NoticeCategory;

/**
 * Servlet implementation class NoticeUpdate
 */
@WebServlet("/notice/update")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.사용자 입력값 boardNo
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		List<NoticeCategory> categoryList = new NoticeService().selectCategoryList();
		request.setAttribute("categoryList", categoryList);
		//2.업무로직
		Notice notice = new NoticeService().selectOne(noticeNo);
		
		
		//3.jsp view단 처리
	
		
		request.setAttribute("notice", notice);
		request.getRequestDispatcher("/WEB-INF/views/notice/noticeUpdate.jsp")
			   .forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("content");
		int categoryKey = Integer.parseInt(request.getParameter("categoryKey"));
		
		Notice notice = new Notice(noticeNo, categoryKey, noticeTitle,noticeContent, null);
		int result = new NoticeService().updateNotice(notice);

		String msg = "";
		String loc = request.getContextPath() + "/notice/view?noticeNo=" + noticeNo;
		
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
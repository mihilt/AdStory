package notice.controller;

import java.io.IOException;
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
 * Servlet implementation class NoticeInsertServlet
 */
@WebServlet("/notice/insert")
public class NoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<NoticeCategory> categoryList = new NoticeService().selectCategoryList();
		request.setAttribute("categoryList", categoryList);
		request.getRequestDispatcher("/WEB-INF/views/notice/noticeInsert.jsp").forward(request, response);
		
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int categoryKey = Integer.parseInt(request.getParameter("categoryKey"));
		System.out.println("category@servlet="+categoryKey);
		Notice notice = new Notice(0, categoryKey, title, content, null);
		
		int result = new NoticeService().insertNotice(notice);
		System.out.println("result@servlet = " + notice);
		
		String msg = "";
		String loc = request.getContextPath() + "/notice/list";
		if(result > 0) {
			msg = "게시글 등록 성공!";
		}
		else {
			msg = "게시글 등록  실패!";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	}

}

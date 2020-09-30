package enquiry.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import enquiry.model.service.EnquiryService;
import enquiry.model.vo.Enquiry;


/**
 * Servlet implementation class EnquiryDeleteServlet
 */
@WebServlet("/enquiry/delete")
public class EnquiryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnquiryDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.전송값 꺼내서 변수에 기록하기.
				//String javax.servlet.ServletRequest.getParameter(String arg0)
				int enquiryNo = Integer.parseInt(request.getParameter("enquiryNo"));
				
				//2.서비스로직호출
				Enquiry enquiry = new EnquiryService().selectOne(enquiryNo);
				int result = new EnquiryService().deleteBoard(enquiryNo);
						
				
				//3. 받은 결과에 따라 뷰페이지 내보내기
				String view = "/WEB-INF/views/common/msg.jsp";
				String msg = "";
				String loc = request.getContextPath() + "/enquiry/elist";

				if(result>0)
					msg = "게시글 삭제 성공!";
				else 
					msg = "게시글 삭제 실패!";	
				
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				
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

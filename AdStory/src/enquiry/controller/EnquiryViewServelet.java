package enquiry.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Utils;
import enquiry.model.service.EnquiryService;
import enquiry.model.vo.Enquiry;

/**
 * Servlet implementation class EnquiryViewServelet
 */
@WebServlet("/enquiry/view")
public class EnquiryViewServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnquiryViewServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.파리미터 글번호
				int enquiryNo  = Integer.parseInt(request.getParameter("enquiryNo"));
					
				
				//2.비지니스로직 호출
				//게시글 하나 가져오기
				
				Enquiry enquiry = new EnquiryService().selectOne(enquiryNo);

				
				String view = "/WEB-INF/views/enquiry/enquiryView.jsp";
				//게시글 가져오기에 실패한경우
				if(enquiry == null){
					request.setAttribute("msg", "조회한 게시글이 존재하지 않습니다.");
					request.setAttribute("loc", "/enquiry/elist");
					view = "/WEB-INF/views/common/msg.jsp";
				}
				else {
					
					//제목
					String enquiryTitle = enquiry.getTitle();
					enquiryTitle = Utils.getSecureString(enquiryTitle);
					enquiry.setTitle(enquiryTitle);
					
					//내용
					String enquiryContent = enquiry.getContent();
					enquiryContent = Utils.getSecureString(enquiryContent);
					enquiryContent = Utils.getStringWithBr(enquiryContent);
					enquiry.setContent(enquiryContent);
				}
				
				//3.view단 처리위임
				request.setAttribute("enquiry", enquiry);
				
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

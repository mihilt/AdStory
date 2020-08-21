package enquiry.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import enquiry.model.service.EnquiryService;
import enquiry.model.vo.Enquiry;

/**
 * Servlet implementation class EnquiryUpdateServlet
 */
@WebServlet("/enquiry/answer")
public class EnquiryAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnquiryAnswerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.사용자 입력값 boardNo
				int enquiryNo = Integer.parseInt(request.getParameter("enquiryNo"));
				
				//2.업무로직
				Enquiry enquiry = new EnquiryService().selectOne(enquiryNo);
			
				
				//3.jsp view단 처리
				request.setAttribute("enquiry", enquiry);
				request.getRequestDispatcher("/WEB-INF/views/enquiry/enquiryView.jsp")
					   .forward(request, response);
			
			}

			/**
			 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
			 */
			protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				int enquiryNo = Integer.parseInt(request.getParameter("enquiryNo"));
					
				String enquiryAnswer = request.getParameter("enquiryAnswer");
				String updateStatus = request.getParameter("updateStatus");
				
				Enquiry enquiry = new Enquiry(enquiryNo, 0, null, null, enquiryAnswer,updateStatus, null);
				int result = new EnquiryService().answerEnquiry(enquiry);

				String msg = "";
				String loc = request.getContextPath() + "/enquiry/view?enquiryNo=" + enquiryNo;
				
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

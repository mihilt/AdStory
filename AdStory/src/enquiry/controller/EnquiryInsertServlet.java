package enquiry.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import enquiry.model.service.EnquiryService;
import enquiry.model.vo.Enquiry;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class EnquiryInsertServlet
 */
@WebServlet("/enquiry/insert")
public class EnquiryInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnquiryInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/enquiry/enquiryInsert.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int enquiryUser = Integer.parseInt(request.getParameter("enquiryWriter"));
		
//		String enquiryWriter = request.getParameter("enquiryWriter");
		String enquiryTitle = request.getParameter("enquiryTitle");
		String enquiryContent = request.getParameter("enquiryContent");
		
		Enquiry enquiry = new Enquiry(0, enquiryUser, enquiryTitle, enquiryContent, null,null);
		
		int result = new EnquiryService().insertEnquiry(enquiry);
		
		String msg = "";
		String loc = request.getContextPath() + "/enquiry/elist";
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



package admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Utils;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberFinderServlet
 */
@WebServlet("/admin/memberFinder")
public class AdminMemberFinderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberFinderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");
		
		int cPage = 1;
		int numPerPage = 20;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));			
		} catch(NumberFormatException e) {
			
		}
		
		System.out.println(searchType);
		System.out.println(searchKeyword);
		
		Map<String, Object> param = new HashMap<>();
		param.put("searchType", searchType);
		param.put("searchKeyword", searchKeyword);
		param.put("cPage", cPage);
		param.put("numPerPage", numPerPage);
		System.out.println("param = " + param);
		
		List<Member> list = new MemberService().searchMember(param);
		System.out.println("list@servlet = " + list);
		
		int totalContents = new MemberService().getTotalContents(param);
		System.out.println("totalContents@servlet = " + totalContents);
		
		//페이지바 문자열을 리턴할 static메소드 호출
		String url = request.getRequestURI() 
				   + "?searchType=" + searchType
				   + "&searchKeyword=" + searchKeyword;
					
		String pageBar = Utils.getPageBarHtml(cPage, numPerPage, totalContents, url);
		
		//3. view handling
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/WEB-INF/views/admin/memberFinder.jsp")
			   .forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

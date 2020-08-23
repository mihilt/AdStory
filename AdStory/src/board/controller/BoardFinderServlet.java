package board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.BoardCategory;
import common.Utils;
import member.model.vo.Member;

/**
 * Servlet implementation class BoardFinderServlet
 */
@WebServlet("/board/finder")
public class BoardFinderServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFinderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String searchType = request.getParameter("searchType");
      String searchKeyword = request.getParameter("searchKeyword");
      int userKey=0;
      HttpServletRequest httpReq = (HttpServletRequest)request;
      HttpSession session = httpReq.getSession();
      Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
      if(memberLoggedIn != null) {
         
         userKey = memberLoggedIn.getKey();
      }
      int cPage = 1;
      int numPerPage = 20;
      try {
         cPage = Integer.parseInt(request.getParameter("cPage"));         
      } catch(NumberFormatException e) {
         
      }
      
      
      Map<String, Object> param = new HashMap<>();
      param.put("searchType", searchType);
      param.put("searchKeyword", searchKeyword);
      param.put("cPage", cPage);
      param.put("numPerPage", numPerPage);
      param.put("userKey",userKey);
      
      BoardService boardService = new BoardService();
      List<Board> list = boardService.searchBoard(param);
      List<BoardCategory> categoryList = boardService.selectCategoryList();
//      System.out.println("list@servlet = " + list);
      
      int totalContents = new BoardService().getTotalContents(param);
      
      //페이지바 문자열을 리턴할 static메소드 호출
      String url = request.getRequestURI() 
               + "?searchType=" + searchType
               + "&searchKeyword=" + searchKeyword;
               
      String pageBar = Utils.getPageBarHtml(cPage, numPerPage, totalContents, url);
      
      //3. view handling
      request.setAttribute("list", list);
      request.setAttribute("pageBar", pageBar);
      request.setAttribute("categoryList", categoryList);
      if(searchType.equals("category")) {   
         request.setAttribute("categoryKey", searchKeyword);
         request.getRequestDispatcher("/WEB-INF/views/board/boardFinder.jsp")
         .forward(request, response);      
      }else {
         request.getRequestDispatcher("/WEB-INF/views/board/BoardList.jsp")
         .forward(request, response);
      }
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}
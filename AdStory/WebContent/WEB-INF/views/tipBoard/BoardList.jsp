<%@page import="tipboard.model.vo.TipBoardWithCommentCnt"%>
<%@page import="java.util.List"%>
<%@page import="tipboard.model.vo.TipBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
    List<TipBoard> list = (List<TipBoard>)request.getAttribute("list");

%>
<div class = "m-12">  

    <p class = "text-3xl border-b-2 mb-10">팁 게시판</p>
    <p class = "my-5">
                    팁 게시판
    </p>
    
	<%  if(list == null || list.isEmpty()){ %>     
	            <div class="text-lg text text-red-700 text-center">조회된 게시물이 없습니다.</div>
	<% } else { %>
    <div class = "text-center ">
	    <table class = "m-auto">
	        <tr>
	            <th style='min-width : 48px' class = "mobile-hide-table px-2 pb-2">번호</th>
	            <th class = "px-4 pb-2">제목</th>
	            <th style='min-width : 80px'class = "px-4 pb-2">작성자</th>
	            <th style='min-width : 116px' class = "mobile-hide-table px-4 pb-2">작성일</th>
	            <th style='min-width : 56px' class = "px-1 pb-2">조회수</th>
	            <th style='min-width : 56px' class = "px-1 pb-2">추천수</th>
	        </tr>
	
	<%		
	    	boolean color = false;
	    	
	        for(TipBoard b : list){
	%>      
		  <%if(color == true){ color = false; %>
		    <tr class = "bg-gray-200 border hover:bg-blue-200 ">
		  <% } else { color = true;%>
		    <tr class="border hover:bg-blue-200 ">
		  <% } %>
	            <td class = "mobile-hide-table px-2 py-2"><%= b.getKey() %></td>
	            <td class = " text-left px-4 w-2/3 hover:text-blue-700 hover:underline hover:font-bold cursor-pointer"
	            onclick="location.href='<%= request.getContextPath() %>/tipBoard/view?boardNo=<%= b.getKey() %>'">
	                <%= b.getTitle() %>
	                <span class="text-blue-700 font-extrabold">
		                <% if(((TipBoardWithCommentCnt)b).getBoardCommentCnt() > 0){ %>
	                    (<%= ((TipBoardWithCommentCnt)b).getBoardCommentCnt() %>)
	                    <% } %>
                    </span>
	            </td>
	            <td class = "px-4"><%= b.getMemberId() %></td>
				<%
				   String date[] = b.getPostDate().split(" ");
				%>
	            <td class = "mobile-hide-table px-4"><%= date[0] %></td>
	            <td class = "px-1"><%= b.getReadCount() %></td>
	            <% if(b.getRecommend()>4){ %>
	            <td class = "px-1 text-red-600 font-extrabold"><%= b.getRecommend() %></td>
	            <%} else { %>
	            <td class = "px-1"><%= b.getRecommend() %></td>
	            <% } %>
	        </tr>   
   
	       <%       } %>
	    </table>
	
		<div class="align-middle flex justify-center">
	        <div class="flex rounded-md mt-8">
	            <%=request.getAttribute("pageBar")%>
	        </div>
	    </div>

   <%    }     %>   
	    <div class="py-10 m-auto" style='max-width:1024px;'>
		    <button
		          class="float-left bg-transparent hover:bg-blue-500 text-blue-500 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
		          onclick="location.href='<%=request.getContextPath()%>/tipBoard/list/recommended';">
		         인기글</button>
		 <% if( memberLoggedIn != null ){ %>
	        <button
	              class="float-right bg-transparent hover:bg-blue-500 text-blue-500 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
	              onclick="location.href='<%=request.getContextPath()%>/tipBoard/insert';">
	                          글쓰기
	        </button>
	   <% } %>
	        
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
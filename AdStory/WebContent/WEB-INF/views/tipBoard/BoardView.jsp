<%@page import="java.util.List"%>
<%@page import="tipboard.model.vo.TipBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
    TipBoard b = (TipBoard)request.getAttribute("tipBoard");
%>
<div class = "m-12">  

    <p class = "text-3xl border-b-2 mb-10">팁 게시판</p>
    <p class = "my-5">
        <a class = "text-blue-600 hover:underline" href="<%= request.getContextPath() %>/tipBoard/list">
                    팁 게시판
        </a> 
        > <%=b.getKey() %>번 게시글
    </p>
    <div class="">
	    <div>
	       <div class="bg-gray-200 text-xl border-t-2 border-b p-1 px-3">
              <%=b.getTitle() %>
	       </div>

	    </div>

	    <div class="p-1 px-3 py-2">
	       <div>
              <span class="text-sm"><%=b.getMemberId() %> </span> | <span class="text-sm"> <%=b.getPostDate() %></span>
              <span class="text-sm float-right">조회수 : <%=b.getReadCount() %></span>
           </div>
	       <div class= "py-5 ">
	           <%=b.getContent() %>    
	       </div>
	       <div class= "text-center border-b">
	           <button
	               class="my-5 bg-transparent hover:bg-blue-500 text-blue-500 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
	               onclick="location.href='<%=request.getContextPath()%>/tipBoard/recommend?boardNo=<%= b.getKey() %>';">
	               <i class="far fa-thumbs-up"></i> 추천 : <%=b.getRecommend() %>
	           </button>
	       </div>
           <button
               class="my-5 bg-transparent hover:bg-blue-500 text-blue-500 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
               onclick="location.href='<%=request.getContextPath()%>/tipBoard/list';">
                              뒤로
           </button>
	    </div>
    </div>
	
 
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
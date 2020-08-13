<%@page import="java.text.SimpleDateFormat"%>
<%@page import="pointlog.vo.PointLog"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>


<div class="m-12">
    <p class = "text-3xl border-b-2">관리자 - 포인트 로그 조회</p>
    
    <p class = "my-5">
        <a class = "text-blue-600 hover:underline" href="<%= request.getContextPath() %>/admin/main">
                    메인
        </a> 
        > 포인트 로그 조회
    </p>
    <div>
        <p class = "text-sm">포인트 로그를 조회합니다.</p>
    </div>



<%
    List<PointLog> list = (List<PointLog>)request.getAttribute("list");
    
    String realStatus = "";
    
    

%>    
  

<div class="p-10">
	<table class="table-auto m-auto">
	  <thead>
	    <tr>
	      <th class="px-4 py-2">시간</th>
	      <th class="px-4 py-2">아이디</th>
	      <th class="px-4 py-2">상황</th>
	      <th class="px-4 py-2">포인트</th>
	      <th class="px-4 py-2">해당 게시글</th>
	    </tr>
	  </thead>
	  <tbody>
	  
	  
<%  if(list == null || list.isEmpty()){  %>     
      
                <div class = "m-auto text-xl">조회된 로그가 없습니다.</div>

<%  
    } else {
        
        for(PointLog l : list){
            switch(l.getStatus()){
            case "I":
                realStatus="충전";
                break;
            case "O":
                realStatus="출금";
                break;
            case "E":
                realStatus="게시글 등록";
                break;
            case "C":
                realStatus="게시글 클릭";
                break;
            case "A":
                realStatus="관리자 입력";
                break;      
            }
%>      
   <%if(l.getKey()%2==0){ %>
        <tr>
   <%} else {%>
        <tr class="bg-gray-100">
   <% } %>
        
          <td class="border px-4 py-2"><%=l.getLogDateTime() %></td>
          
          <td class="border px-4 py-2"><%=l.getRefMemberId() %></td>
          
          <td class="border px-4 py-2"><%= realStatus %></td>
          
          <!-- 포인트 -->
    <% if(l.getPoint() > 0){ %>        
          <td class="text-blue-600 border px-4 py-2">+<%=l.getPoint() %>P</td>
    <% } else { %>      
          <td class="text-red-700 border px-4 py-2"><%=l.getPoint() %>P</td>
    <% } %>
    
                  <!-- 게시글 -->
    <%if(null == l.getRefPostTitle()){ %>
          <td class="border px-4 py-2"></td>
    <% } else { %>
          <td class="border px-4 py-2"><%=l.getRefPostTitle() %></td>
    <% } %>
    
    
        </tr>
                
                
    <% } %> 
<% } %> 
	    
		  </tbody>
		</table>

	     <!-- pageBar -->
	    <div class="align-middle flex justify-center">
	         <div class="flex rounded-md mt-8">
	             <%= request.getAttribute("pageBar") %>
	         </div>
	    </div>

    </div>  

</div>



<!-- 밑에 여백 -->
<div class="bottom-of-main"></div>
                
                
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
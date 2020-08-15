<%@page import="pointlog.vo.PointLogRanking"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class = "m-8">  
    
    <!-- 상단 nav -->
    <nav class="mb-10 text-center font-bold sm:flex sm:justify-center sm:items-center mt-4">
        <div class="flex flex-col sm:flex-row">
            <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="<%= request.getContextPath() %>">회사소개</a>
            <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="<%= request.getContextPath() %>/home/notice">공지사항</a>
            <span class="mt-3 text-blue-700 sm:mx-3 sm:mt-0">포인트 랭킹</span>
            <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="<%= request.getContextPath() %>/home/manual">초보자 메뉴얼</a>
            <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="<%= request.getContextPath() %>/home/FAQ">자주 묻는 질문(FAQ)</a>
        </div>
    </nav>
    
    <div>
        <div class = "text-center">
            <p class = "text-4xl">포인트 랭킹</p>
            <!-- <a href="" class = "mx-5 text-blue-500 hover:text-blue-900">일간랭킹</a> -->
            <!-- <a href="" class = "mx-5 text-blue-500 hover:text-blue-900">주간랭킹</a> -->
        
            <% SimpleDateFormat df = new SimpleDateFormat("yyyy년 MM월 dd일"); %>
            <p class = "text-xl my-5"><%= df.format(Calendar.getInstance().getTime())%> 현재 랭킹</p>
            
            <%
		    List<PointLogRanking> list = (List<PointLogRanking>)request.getAttribute("list");
            %> 
              
<%  if(list == null || list.isEmpty()){  %>     
            <div class = "m-auto text-xl text-red-700">오늘 날짜 기준 조회된 랭킹목록이 없습니다.</div>
            
            
<%  } else { %>
	
		    <table class="table-auto m-auto">
		    <thead>
		      <tr>
		        <th class="px-4 py-2">순위</th>
		        <th class="px-4 py-2">아이디</th>
		        <th class="px-4 py-2">포인트</th>
		
		      </tr>
		    </thead>
		    <tbody>
		    
		    <%
		    	int num = 0;
		        for(PointLogRanking l : list){ %>
		        
                    <% num++; %>

                    <% if(num%2==0){ %>
				        <tr>
                    <%} else {%>
				        <tr class="bg-gray-100">
                    <% } %>
     
     
    <% if(num == 1 ){ %>  
                <td class="border px-4 py-2 bg-indigo-100 font-bold text-blue-700"><%=num %>위</td>
                <td class="border px-4 py-2 bg-indigo-100 font-bold text-blue-700"><%=l.getMemberId() %></td>
                <td class="border px-4 py-2 bg-indigo-100 font-bold text-blue-700"><%=(String)Commas.format(l.getSumPoint()) %>P</td>
    <%} else {%>     
                <td class="border px-4 py-2"><%=num %>위</td>
                <td class="border px-4 py-2"><%=l.getMemberId() %></td>
                <td class="border px-4 py-2"><%=(String)Commas.format(l.getSumPoint()) %>P</td>
    <% } %>       

               
            
                <% } %>
                </tr>
         </tbody>
        </table>
            <% } %> 
        </div>
        
    </div>
    
    <p class = "text-center my-10 text-red-600 text-sm">*일반회원이 게시글 홍보를 통해 오늘 얻은 포인트만 집계 처리한 순위입니다.</p>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
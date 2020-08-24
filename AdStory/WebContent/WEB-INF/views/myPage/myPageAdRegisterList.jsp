<%@page import="board.model.vo.Board"%>
<%@page import="member.model.vo.MemberAdList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="m-12">
    <p class = "text-3xl border-b-2">마이페이지 - 광고등록 현황</p>
    
    <p class = "my-5">
        <a class = "text-blue-600 hover:underline" href="<%= request.getContextPath() %>/myPage">
                    마이페이지
        </a> 
        > 광고등록 현황
    </p>
    <div>
        <p class = "text-sm"><%= memberLoggedIn.getMemberId() %>님의 광고신청 현황을 조회합니다.</p>
    </div>

<%
    List<Board> list = (List<Board>)request.getAttribute("list");
    
    String realStatus = "";
%>    
  
<div class="pt-10">
  
<%  if(list == null || list.isEmpty()){  %>     
                <div class= text-center>
                    <div class = "m-auto text-xl text-red-700">조회된 광고등록 목록이 없습니다.</div>
                </div>

<% } else { boolean color = false;%>  
    
       <table class="table-auto m-auto">
        <thead>
          <tr>
            <th class="px-4 py-2">광고 제목</th>
            <th class="px-4 py-2">마감</th>
            <th class="px-4 py-2">잔여 포인트</th>
  
          </tr>
        </thead>
        <tbody>
  
        <% for(Board b : list){ %>
        
           <%if(color == true){ color = false; %>
		        <tr>
		   <%} else { color = true; %>
		        <tr class="bg-gray-100">
		   <% } %>
                
                <td class="border px-4 py-2"><%= b.getTitle() %></td>
            
            
            
            
            <% if ("F".equals(b.getStatus())){ %>
            	<td class="border px-4 py-2"></td>
            <%} else {%>
            	<td class="border px-4 py-2 text-red-600">마감</td>
            <% } %>    
                <td class="border px-4 py-2"><%= (String)Commas.format(b.getPoint()) %>P</td>
                    
            </tr>
            
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
<% } %> 
</div>            


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
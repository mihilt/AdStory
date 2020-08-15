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
        <p class = "text-sm"><%= memberLoggedIn.getMemberId() %>님의 광고등록 현황을 조회합니다.</p>
    </div>

<%
    List<MemberAdList> list = (List<MemberAdList>)request.getAttribute("list");
    
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
            <th class="px-4 py-2">기업명</th>
            <th class="px-4 py-2">마감</th>
            <th class="px-4 py-2">광고 잔여액</th>
            <th class="px-4 py-2">총 수익</th>
            <th class="px-4 py-2">URL</th>
          </tr>
        </thead>
        <tbody>
  
        <% for(MemberAdList l : list){ %>
        
           <%if(color == true){ color = false; %>
		        <tr>
		   <%} else { color = true; %>
		        <tr class="bg-gray-100">
		   <% } %>
  
                <td class="border px-4 py-2"><%= l.getTitle() %></td>
                <td class="border px-4 py-2"><%= l.getName() %></td>
                <td class="border px-4 py-2"><%= l.getStatus() %></td>
                <td class="border px-4 py-2"><%= (String)Commas.format(l.getPoint()) %></td>
                <td class="border px-4 py-2"><%= (String)Commas.format(l.getRevenue()) %></td>
                <td class="border px-4 py-2">http://<%= request.getServerName() %>:<%= request.getServerPort() %><%= request.getContextPath() %>/AD?num=<%= l.getKey() %></td>
                
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
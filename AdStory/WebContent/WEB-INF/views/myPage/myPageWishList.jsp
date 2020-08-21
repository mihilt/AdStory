<%@page import="member.model.vo.MemberWishList"%>
<%@page import="member.model.vo.MemberAdList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="m-12">
    <p class = "text-3xl border-b-2">마이페이지 - 위시리스트 현황</p>
    
    <p class = "my-5">
        <a class = "text-blue-600 hover:underline" href="<%= request.getContextPath() %>/myPage">
                    마이페이지
        </a> 
        > 위시리스트 현황
    </p>
    <div>
        <p class = "text-sm"><%= memberLoggedIn.getMemberId() %>님의 위시리스트 현황을 조회합니다.</p>
    </div>

<%
    List<MemberWishList> list = (List<MemberWishList>)request.getAttribute("list");
    
    String realStatus = "";
%>    
  
<div class="pt-10">
  
<%  if(list == null || list.isEmpty()){  %>     
                <div class= text-center>
                    <div class = "m-auto text-xl text-red-700">조회된 위시리스트 목록이 없습니다.</div>
                </div>

<% } else { boolean color = false;%>  
    
       <table class="table-auto m-auto">
        <thead>
          <tr>
            <th class="px-4 py-2">기업명</th>
   
            <th class="px-4 py-2">연락처</th>
 
            <th class="px-4 py-2">주소</th>
 
            <th class="px-4 py-2">이메일</th>
          </tr>
        </thead>
        <tbody>
  
        <% for(MemberWishList l : list){ %>
        
           <%if(color == true){ color = false; %>
		        <tr>
		   <%} else { color = true; %>
		        <tr class="bg-gray-100">
		   <% } %>
  
                <td class="border px-4 py-2"><%= l.getRefCUserName() %></td> 
                <td class="border px-4 py-2"><%= l.getRefPhoneNum() %></td> 
                <td class="border px-4 py-2"><%= l.getRefAddress() %></td> 
                <td class="border px-4 py-2"><%= l.getRefEmail() %></td>  
                
                
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
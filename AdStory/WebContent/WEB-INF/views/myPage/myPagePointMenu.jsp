<%@page import="pointlog.vo.PointLog"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="m-12">
    <p class = "text-3xl border-b-2">마이페이지 - 포인트 관리</p>
    
    <p class = "my-5">
        <a class = "text-blue-600 hover:underline" href="<%= request.getContextPath() %>/myPage">
                    마이페이지
        </a> 
        > 포인트 관리
    </p>
    <div>
        <p class = "text-sm"><%= memberLoggedIn.getMemberId() %>님의 포인트 로그를 조회합니다.</p>
    </div>



<%
    List<PointLog> list = (List<PointLog>)request.getAttribute("list");
    
    String realStatus = "";
%>    
  

<div class="pt-10">

      
      
<%  if(list == null || list.isEmpty()){  %>     
                <div class= text-center>
                    <div class = "m-auto text-xl text-red-700">조회된 로그가 없습니다.</div>
                </div>

<%  
    } else { boolean color = false;%>
    	
        <table class="table-auto m-auto">
        <thead>
          <tr>
            <th class="px-4 py-2">시간</th>
            <th class="px-4 py-2">상황</th>
            <th class="px-4 py-2">해당 게시글</th>
            <th class="px-4 py-2">입출내역</th>
            <th class="px-4 py-2">잔액</th>
          </tr>
        </thead>
        <tbody>
   
         <% for(PointLog l : list){
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
   <%if(color == true){ color = false; %>
        <tr>
   <%} else { color = true; %>
        <tr class="bg-gray-100">
   <% } %>
        
          <td class="border px-4 py-2"><%=l.getLogDateTime() %></td>
          
          <td class="border px-4 py-2"><%= realStatus %></td>

                  <!-- 게시글 -->
    <%if(null == l.getRefPostTitle()){ %>
          <td class="border px-4 py-2"></td>
    <% } else { %>
          <td class="border px-4 py-2"><%=l.getRefPostTitle() %></td>
    <% } %>
    
              <!-- 포인트 -->
    <% if(l.getPoint() > 0){ %>        
          <td class="text-blue-600 border px-4 py-2">+<%=(String)Commas.format(l.getPoint()) %>P</td>
    <% } else { %>      
          <td class="text-red-700 border px-4 py-2"><%=(String)Commas.format(l.getPoint()) %>P</td>
    <% } %>
    
          <td class="border px-4 py-2 font-bold"><%=(String)Commas.format(l.getRemainPoint()) %>P</td>

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


<div class="m-12">

     <div class = "border-8">
     <button class = "border-8" onclick="location.href='<%= request.getContextPath() %>/myPage/point/charge?memberId=<%= memberLoggedIn.getMemberId()%>'">포인트 충전</button>
     <button class = "border-8" onclick="location.href='<%= request.getContextPath() %>/myPage/point/withdraw?memberId=<%= memberLoggedIn.getMemberId()%>'">포인트 출금</button>
     </div>
     
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
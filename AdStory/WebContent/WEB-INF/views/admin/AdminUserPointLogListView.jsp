<%@page import="java.text.SimpleDateFormat"%>
<%@page import="pointlog.vo.PointLog"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<%
    List<PointLog> list = (List<PointLog>)request.getAttribute("list");
    String reqMemberId = (String)request.getAttribute("memberId");
    String realStatus = "";
%>    
  

<div class="m-12">
    <p class = "text-3xl border-b-2">관리자 - 포인트 로그 조회</p>
    
    <p class = "my-5">
        <a class = "text-blue-600 hover:underline" href="<%= request.getContextPath() %>/admin/main">
                    메인
        </a> 
        >
        <a class = "text-blue-600 hover:underline" href="<%= request.getContextPath() %>/admin/userPointLogView">
                포인트 로그 조회
        </a>
        > 아이디 검색
    </p>
    <div>
        <p class = "text-sm"><%= reqMemberId %>님의 포인트 로그를 조회합니다.</p>
    </div>
    

<div class="pt-10">

      
      
<%  if(list == null || list.isEmpty()){  %>     
                <div class= text-center>
                    <div class = "m-auto text-xl text-red-700">조회된 로그가 없습니다.</div>
                </div>
<%  
    } else { %>
        
        
           <table class="table-auto m-auto">
              <thead>
                <tr>
                  <th class="px-4 py-2">시간</th>
                  <th class="px-4 py-2">아이디</th>
                  <th class="px-4 py-2">상황</th>
                  <th class="px-4 py-2">해당 게시글</th>
                  <th class="px-4 py-2">입출내역</th>
                </tr>
              </thead>
              <tbody>
<%    
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
                
<% } %> 
        <div id="search-memberId" class="flex m-auto mt-10">
            <form class="m-auto" action="<%=request.getContextPath()%>/admin/userPointLogView/search">
                <input class= "px-5 py-1 text-gray-700 bg-gray-200 rounded" type="text" name="memberId" value=<%= reqMemberId %> size="25" placeholder="검색할 아이디를 입력하세요."/>
                <button class = "px-4 py-1 text-blue-500 font-light tracking-wider hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded" type="submit">검색</button>           
            </form> 
        </div>

    </div>  


</div>



<!-- 밑에 여백 -->
<div class="bottom-of-main"></div>
                
                
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
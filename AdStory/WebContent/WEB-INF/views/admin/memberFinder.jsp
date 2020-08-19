<%@page import="java.text.SimpleDateFormat"%>
<%@page import="pointlog.vo.PointLog"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>


<div class="m-12">
    <p class = "text-3xl border-b-2">관리자 - 회원 조회</p>
    
    <p class = "my-5">
        <a class = "text-blue-600 hover:underline" href="<%= request.getContextPath() %>/admin/main">
                    메인
        </a> 
        > 회원 조회
    </p>
    <div>
        <p class = "text-sm">회원을 조회합니다.</p>
    </div>
    

<%
    List<Member> list = (List<Member>)request.getAttribute("list");
    
    String realStatus = "";
%>    
  

<div class="pt-10">

      
      
<%  if(list == null || list.isEmpty()){  %>     
                <div class= text-center>
                    <div class = "m-auto text-xl text-red-700">조회된 목록이 없습니다.</div>
                </div>
<%  
    } else { boolean color = false;%>
        
        
           <table class="table-auto m-auto">
              <thead>
                <tr>
                  <th class="px-2 py-2">KEY</th>
                  <th class="px-2 py-2">아이디</th>
                  <th class="px-2 py-2">이름 / 기업명</th>
                  <th class="px-2 py-2">회원구분</th>
                  <th class="px-2 py-2">잔여 포인트</th>
                  <th class="px-2 py-2">전화번호</th>
                  <th class="px-2 py-2">계좌은행명</th>
                  <th class="px-2 py-2">계좌번호</th>
                  <th class="px-2 py-2">사업자번호</th>
                  <th class="px-2 py-2">이메일</th>
                  <th class="px-2 py-2">주소</th>
                  <th class="px-2 py-2">가입날짜</th>
                </tr>
              </thead>
              <tbody>
<%    
        for(Member m : list){
%>      
     <%if(color == true){ color = false; %>
          <tr class = "text-sm">
     <%} else { color = true; %>
          <tr class="bg-gray-100 text-sm">
     <% } %>
	          <td class="border px-2 py-2"><%=m.getKey() %>z</td>
	          <td class="border px-2 py-2 text-blue-500 hover:underline"><a href="<%=request.getContextPath()%>/myPage/view?memberId=<%=m.getMemberId()%>"><%=m.getMemberId() %></a></td>
	          <td class="border px-2 py-2"><%=m.getName() %></td>
	          
<%
String memberRoleKor ="";
if("U".equals(m.getMemberRole())){
 memberRoleKor = "일반회원";
} else if("C".equals(m.getMemberRole())){
 memberRoleKor = "기업회원";
} else {
 memberRoleKor = "관리자";   
}	   
%> 
	          <td class="border px-2 py-2"><%=memberRoleKor%></td>  
	          <td class="border px-2 py-2"><%=(String)Commas.format(m.getPoint())%>P</td>
	          <td class="border px-2 py-2"><%=m.getPhoneNum() %></td>
	          <td class="border px-2 py-2"><%=m.getAccountName() %></td>
	          <td class="border px-2 py-2"><%=m.getAccountNum() %></td>
	          <td class="border px-2 py-2"><%=m.getBussinessNum() != null ? m.getBussinessNum() : ""%></td>
	          <td class="border px-2 py-2"><%=m.getEmail() %></td>
	          <td class="border px-2 py-2"><%=m.getAddress() != null ? m.getAddress() : "" %></td>
	          <td class="border px-2 py-2"><%=m.getEnrollDate() %></td>
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
            <form class="m-auto" action="<%=request.getContextPath()%>/admin/memberFinder">
		        <select name="searchType" class="border text-grey-darker py-1 px-2 pr-8 rounded leading-tight focus:outline-none" id="searchType">
		         <option value="memberId">아이디</option>
		         <option value="memberName">이름 / 기업명</option>
		        </select>
                <input class= "px-5 py-1 text-gray-700 bg-gray-200 rounded" type="text" name="searchKeyword"  size="25" placeholder=""/>
                <button class = "px-4 py-1 text-blue-500 font-light tracking-wider hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded" type="submit">검색</button>           
            </form> 
        </div>
    </div>  
</div>

<!-- 밑에 여백 -->
<div class="bottom-of-main"></div>
                
                
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
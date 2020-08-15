<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class = "m-8">  
    
     <div class = "text-center">
            <p class = "text-4xl">마이페이지</p>
     </div>
     <div>
           아이디 : <%= memberLoggedIn.getMemberId() %>
     <br />      
           이름 : <%= memberLoggedIn.getName() %>
     <br />
           회원 유형 : <%= changedMemberRole %>
     <br />      
           가입일 : <%= memberLoggedIn.getEnrollDate() %>
     <br />      
           포인트 : <%= (String)Commas.format(memberLoggedIn.getPoint()) %>P
     </div>
     <div class = "border-8">
     <button class = "border-8">개인정보 변경</button>
     <button class = "border-8" onclick="location.href='<%= request.getContextPath() %>/myPage/point?memberId=<%= memberLoggedIn.getMemberId()%>'">포인트 관리</button>
     <button class = "border-8">광고등록 현황</button>
     </div>
    
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="m-12">
    <p class = "text-3xl border-b-2">마이페이지 - 포인트 충전</p>
    
    <p class = "my-5">
        <a class = "text-blue-600 hover:underline" href="<%= request.getContextPath() %>/myPage">
                    마이페이지
        </a>
        > 
        <a class = "text-blue-600 hover:underline" href="<%= request.getContextPath() %>/myPage/point?memberId=<%= memberLoggedIn.getMemberId()%>">
                    포인트 관리
        </a>
        > 포인트 충전
    </p>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
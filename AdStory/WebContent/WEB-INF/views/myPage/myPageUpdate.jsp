<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="m-12">
    <p class = "text-3xl border-b-2">마이페이지 - 내정보 변경</p>
    
    <p class = "my-5">
        <a class = "text-blue-600 hover:underline" href="<%= request.getContextPath() %>/myPage">
                    마이페이지
        </a> 
        > 내정보 변경
    </p>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
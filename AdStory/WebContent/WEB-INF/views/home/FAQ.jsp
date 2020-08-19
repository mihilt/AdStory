<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class = "m-12">  
    
    <!-- 상단 nav -->
    <nav class="mb-10 text-center font-bold sm:flex sm:justify-center sm:items-center mt-4">
        <div class="flex flex-col sm:flex-row">
            <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="<%= request.getContextPath() %>">사이트 소개</a>
            <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="<%= request.getContextPath() %>/home/notice">공지사항</a>
            <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="<%= request.getContextPath() %>/home/pointRanking/today">포인트 랭킹</a>
            <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="<%= request.getContextPath() %>/home/manual">초보자 가이드</a>
            <span class="mt-3 text-blue-700 sm:mx-3 sm:mt-0">자주 묻는 질문(FAQ)</span>
        </div>
    </nav>
    <p class = "text-3xl border-b-2 mb-10">자주 묻는 질문(FAQ)</p>
    <div>
    
        FAQ
    </div>
    
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
Map<String, Integer> sales = new HashMap<>();
sales = (Map<String, Integer>)request.getAttribute("sales");
%>

<div class="m-12">
    <p class = "text-3xl border-b-2">관리자 - 수익조회</p>
    
    <p class = "my-5">
        <a class = "text-blue-600 hover:underline" href="<%= request.getContextPath() %>/admin/main">
                    메인
        </a> 
        > 수익조회
    </p>
    
    <p class = "text-sm text-red-700">* <b>실시간 수익</b>은 아직 출금되지 않은 포인트를 매출에 집계한 값입니다.</p>
    <p class = "text-sm text-red-700 mb-10">* <b>확정 수익</b>은 모든 회원들이 남김없이 포인트를 출금한다고 가정했을 경우 생기는 수수료 수익만 산출한 값입니다.</p>
    
    <div class = "w-9/12 m-auto">
	    <p class = "text-center text-2xl py-2">오늘의 수익</p>
	    <div class="flex mb-2">
	      <div class="text-center border grid w-1/2 text-lg py-2">
	                실시간 수익
	      </div>
	      
	      <div class="text-center border-r border-t border-b grid w-1/2 text-lg py-2">
	        <%=(String)Commas.format(sales.get("T1")) %>원
	      </div>
	    </div>
	    <div class="flex mb-10">
	      <div class="text-center border grid w-1/2 text-lg py-2">
	                확정 수익
	      </div>
	      
	      <div class="text-center border-r border-t border-b grid w-1/2 text-lg py-2">
	        <%=(String)Commas.format(sales.get("T2")) %>원
	      </div>
	    </div>
	    
	        <p class = "text-center text-2xl py-2">주간 수익</p>
	    <div class="flex mb-2">
	      <div class="text-center border grid w-1/2 text-lg py-2">
	                실시간 수익
	      </div>
	      
	      <div class="text-center border-r border-t border-b grid w-1/2 text-lg py-2">
	        <%=(String)Commas.format(sales.get("W1")) %>원
	      </div>
	    </div>
	    <div class="flex mb-10">
	      <div class="text-center border grid w-1/2 text-lg py-2">
	                확정 수익
	      </div>
	      
	      <div class="text-center border-r border-t border-b grid w-1/2 text-lg py-2">
	        <%=(String)Commas.format(sales.get("W2")) %>원
	      </div>
	    </div>
	    
	        <p class = "text-center text-2xl py-2">연간 수익</p>
	    <div class="flex mb-2">
	      <div class="text-center border grid w-1/2 text-lg py-2">
	                실시간 수익
	      </div>
	      
	      <div class="text-center border-r border-t border-b grid w-1/2 text-lg py-2">
	        <%=(String)Commas.format(sales.get("Y1")) %>원
	      </div>
	    </div>
	    <div class="flex mb-10">
	      <div class="text-center border grid w-1/2 text-lg py-2">
	                확정 수익
	      </div>
	      
	      <div class="text-center border-r border-t border-b grid w-1/2 text-lg py-2">
	        <%=(String)Commas.format(sales.get("Y2")) %>원
	      </div>
	    </div>
    </div>
    
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
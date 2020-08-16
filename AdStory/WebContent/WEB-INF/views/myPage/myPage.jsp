<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class = "m-12">  
     <p class = "text-3xl border-b-2">마이페이지</p>
     
     <div class = "text-center m-10">
                  아이디 : <%= memberLoggedIn.getMemberId() %>
	     <br />      
	           이름 : <%= memberLoggedIn.getName() %>
	     <br />
	           회원 유형 : <%= changedMemberRole %>
	     <br />      
	           가입일 : <%= memberLoggedIn.getEnrollDate() %>
	     <br />      
	           보유 포인트 : <%= (String)Commas.format(memberLoggedIn.getPoint()) %>P
     </div>
 
     <div class = "">
        <div class="flex mb-4">
        
		  <div class=" text-blue-500 font-light tracking-wider hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded w-1/3 h-12 m-2">
		      <button class="w-full h-full" onclick="location.href='<%= request.getContextPath() %>/myPage/update?memberId=<%= memberLoggedIn.getMemberId()%>'">
		                  내정보 변경
		      </button>
		  </div>
		  
		  <div class=" text-blue-500 font-light tracking-wider hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded w-1/3 h-12 m-2">
		      <button class="w-full h-full" onclick="location.href='<%= request.getContextPath() %>/myPage/point?memberId=<%= memberLoggedIn.getMemberId()%>'">
		                  포인트 관리
		      </button>
		  </div>
		  
		  <div class=" text-blue-500 font-light tracking-wider hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded w-1/3 h-12 m-2">
			  <button class="w-full h-full" onclick="location.href='<%= request.getContextPath() %>/myPage/adList?memberId=<%= memberLoggedIn.getMemberId()%>'">
			         광고등록 현황
			  </button>
		  </div>
		  
		</div>
     </div>
    
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
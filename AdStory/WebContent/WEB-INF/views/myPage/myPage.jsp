<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class = "m-12">  
    <p class = "text-3xl border-b-2 mb-10">마이페이지</p>
    
	<div class="md:flex shadow-lg  mx-6 md:mx-auto mb-20 max-w-lg md:max-w-2xl h-64 rounded-lg">
	   <img class="md:block hidden h-full w-full md:w-1/3  object-cover rounded-lg rounded-r-none pb-5/6" 
	   src="<%=request.getContextPath() %>/images/<%=profileImageName %>" >
	   <div class="w-full md:w-2/3 px-4 py-4 bg-white rounded-lg">
	      <div class="flex items-center">
	         <h2 class="text-xl text-gray-800 font-medium mr-auto"><%= memberLoggedIn.getMemberId() %>님의 마이페이지</h2>
	         <p class="text-gray-800 font-semibold tracking-tighter">
	            <%= changedMemberRole %>
	         </p>
	      </div>
	      <p class="text-sm text-gray-700 mt-4">
	                이름 : <%= memberLoggedIn.getName() %>
	      </p>
	      <p class="text-sm text-gray-700">
	                계좌은행 : <%= memberLoggedIn.getAccountName() %>
	      </p>
	      <p class="text-sm text-gray-700">
	                계좌번호 : <%= memberLoggedIn.getAccountNum() %>
	      </p>
	      <p class="text-sm text-gray-700">
	                가입일 : <%= memberLoggedIn.getEnrollDate() %>
	      </p>
	      <p class="text-sm text-gray-700">
	                보유 포인트 : <%= (String)Commas.format(memberLoggedIn.getPoint()) %>P
	      </p>
	   </div>
	</div>
 
 
 
     <div class = "mx-10">
        <div class="flex mb-4">
		  <div class=" text-blue-500 font-light tracking-wider hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded w-1/3 h-12 m-2">
		      <button class="w-full h-full" onclick="location.href='<%= request.getContextPath() %>/myPage/view?memberId=<%= memberLoggedIn.getMemberId()%>'">
		                  내정보 보기
		      </button>
		  </div>
		  
		  <div class=" text-blue-500 font-light tracking-wider hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded w-1/3 h-12 m-2">
		      <button class="w-full h-full" onclick="location.href='<%= request.getContextPath() %>/myPage/point?memberId=<%= memberLoggedIn.getMemberId()%>'">
		                  포인트 관리
		      </button>
		  </div>
		  
        <% if("U".equals(memberLoggedIn.getMemberRole())){%>
		  <div class=" text-blue-500 font-light tracking-wider hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded w-1/3 h-12 m-2">
			  <button class="w-full h-full" onclick="location.href='<%= request.getContextPath() %>/myPage/adList?memberId=<%= memberLoggedIn.getMemberId()%>'">
			     광고신청 현황
			  </button>
		  </div>
		<% } else if("C".equals(memberLoggedIn.getMemberRole())) { %>
          <div class=" text-blue-500 font-light tracking-wider hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded w-1/3 h-12 m-2">
              <button class="w-full h-full" onclick="location.href='<%= request.getContextPath() %>/myPage/adRegisterList?memberId=<%= memberLoggedIn.getMemberId()%>'">
                                    광고등록 현황
              </button>
          </div>
		<% } %>  
		</div>
     </div>
    
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
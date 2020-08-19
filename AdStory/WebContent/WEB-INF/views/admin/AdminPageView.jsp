<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<% 
Integer withdrawNum = (Integer)request.getAttribute("withdrawNum");
int withdraw=withdrawNum.intValue();
%>
<div class="m-12">
    <p class = "text-3xl border-b-2">관리자 - 메인</p>
    
    
<div class = "my-10">
    


	<div class = "w-9/12 m-auto">
	
        <div class="flex flex-wrap mb-20">
            <div class="w-full md:w-1/2 p-3">
            <%if(withdraw > 0) {%>
                <div class="bg-red-100 border-b-4 border-red-500 rounded-lg shadow-lg p-5">
                    <div class="flex flex-row items-center">
                        <div class="flex-1 text-center">
                            <h5 class="font-bold uppercase text-gray-600">미완료 출금요청 갯수</h5>
                            <h3 class="font-bold text-3xl"><%=withdraw %><span class="text-red-600"><i class="fas fa-caret-up"></i></span></h3>
                        </div>
                    </div>
                </div>
            <% } else { %>
                <div class="bg-blue-100 border-b-4 border-blue-500 rounded-lg shadow-lg p-5">
                    <div class="flex flex-row items-center">
                        <div class="flex-1 text-center">
                            <h5 class="font-bold uppercase text-gray-600">미완료 출금요청 갯수</h5>
                            <h3 class="font-bold text-3xl">0</h3>
                        </div>
                    </div>
                </div>
            <% } %>
            </div>
            <div class="w-full md:w-1/2 p-3">
                <!-- <div class="bg-red-100 border-b-4 border-red-500 rounded-lg shadow-lg p-5">
                    <div class="flex flex-row items-center">
                        <div class="flex-1 text-center">
                            <h5 class="font-bold uppercase text-gray-600">미완료 문의 갯수</h5>
                            <h3 class="font-bold text-3xl">0 <span class="text-red-600"><i class="fas fa-caret-up"></i></span></h3>
                        </div>
                    </div>
                </div>
            </div> -->
            <div class="bg-blue-100 border-b-4 border-blue-500 rounded-lg shadow-lg p-5">
                    <div class="flex flex-row items-center">
                        <div class="flex-1 text-center">
                            <h5 class="font-bold uppercase text-gray-600">미완료 문의 갯수</h5>
                            <h3 class="font-bold text-3xl">0</i></span></h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	
	    <div class="flex mb-4">
		  <div class="grid w-1/2 h-20 mx-2">
	        <button class="text-blue-500 bg-transparent border border-solid border-blue-500 hover:bg-blue-500 hover:text-white active:bg-blue-600 font-bold uppercase px-8 py-3 rounded outline-none focus:outline-none mr-1 mb-1" type="button"
		        onclick="location.href = '<%= request.getContextPath() %>/admin/userPoint';"/>
		                회원 포인트 증가 / 차감
	        </button> 
		  </div>
		  
		  <div class="grid w-1/2 h-20 mx-2">
		    <button class="text-blue-500 bg-transparent border border-solid border-blue-500 hover:bg-blue-500 hover:text-white active:bg-blue-600 font-bold uppercase px-8 py-3 rounded outline-none focus:outline-none mr-1 mb-1" type="button"
		        onclick="location.href = '<%= request.getContextPath() %>/admin/userWithdrawList';"/>
		                 출금요청 목록
	        </button>
		  </div>
		</div>
		
		
	    <div class="flex mb-4">
		  
		  <div class="grid w-1/2 h-20 mx-2">
		    <button class="text-blue-500 bg-transparent border border-solid border-blue-500 hover:bg-blue-500 hover:text-white active:bg-blue-600 font-bold uppercase px-8 py-3 rounded outline-none focus:outline-none mr-1 mb-1" type="button"
		        onclick="location.href = '<%= request.getContextPath() %>/admin/userPointLogView';"/>
		                포인트 로그 조회
	        </button> 
		  </div>
		  
		  <div class="grid w-1/2 h-20 mx-2">
	        <button class="text-blue-500 bg-transparent border border-solid border-blue-500 hover:bg-blue-500 hover:text-white active:bg-blue-600 font-bold uppercase px-8 py-3 rounded outline-none focus:outline-none mr-1 mb-1" type="button"
	        onclick="location.href = '<%= request.getContextPath() %>/admin/sales';"/>
		          수익 조회
	        </button>
		  </div>
		  
		</div>
	   
	    <div class="flex mb-4">
	      <div class="grid w-1/2 h-20 mx-2">
	        <button class="text-blue-500 bg-transparent border border-solid border-blue-500 hover:bg-blue-500 hover:text-white active:bg-blue-600 font-bold uppercase px-8 py-3 rounded outline-none focus:outline-none mr-1 mb-1" type="button"
	        onclick="location.href = '<%= request.getContextPath() %>/admin/memberList';"/>
	                    회원 조회
	        </button> 
	      </div>
	      
	      <div class="grid w-1/2 h-20 mx-2">
	        <button class="text-blue-500 bg-transparent border border-solid border-blue-500 hover:bg-blue-500 hover:text-white active:bg-blue-600 font-bold uppercase px-8 py-3 rounded outline-none focus:outline-none mr-1 mb-1" type="button"
	        onclick="location.href = '';"/>
	                    ㅁㄹ
	        </button>
	      </div>
	      
	    </div>
	</div>
    
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
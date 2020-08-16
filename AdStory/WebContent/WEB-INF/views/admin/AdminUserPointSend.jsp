<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script>
function pointSendValidate(){
    const $userId = $("[name=userId]");
    const $pointAmount = $("[name=pointAmount]");

    if(/^.+$/.test($userId.val()) == false){
        alert("정확한 아이디를 입력하세요.");
        return false;
    }
    if((/[^0-9]/g.test($pointAmount.val()) == true) | ($pointAmount.val()=="")){
    	
        alert("적립할 포인트를 정확하게 입력하세요.");
        return false;
    }
    
    return true;
}
</script>

<div class="m-12">
    <p class = "text-3xl border-b-2">관리자 - 유저 포인트 관리</p>
    
    <p class = "my-5">
        <a class = "text-blue-600 hover:underline" href="<%= request.getContextPath() %>/admin/main">
                    메인
        </a> 
        > 유저 포인트 관리
    </p>
 
    
    <div class = "my-10">
		<div class="leading-loose">
		    <form class="max-w-xl m-4 p-10 bg-white rounded shadow-xl m-auto" action="<%= request.getContextPath() %>/admin/userPoint/send" method="POST" >
		      <p class="text-gray-800 font-medium">회원의 포인트를 올리거나 줄일 수 있습니다.</p>
		        <div>
		        <input name="radio" type="radio" value="increase" checked> <label
		                    for="radio-1">증가</label>
		   
		        <input name="radio" type="radio" value="decrease"> <label
		                    for="radio-2">감소</label>
		        </div>
		      <div class="">
		        <label class="block text-sm text-gray-00" for="userId">아이디</label>
		        <input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded" name="userId" type="text" required="" placeholder="아이디" aria-label="userId">
		      </div>
		      <div class="mt-2">
		        <label class="block text-sm text-gray-600" for="pointAmount">적립 포인트</label>
		        <input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded" name="pointAmount" type="text" required="" placeholder="적립 포인트" aria-label="pointAmount">
		      </div>
		      <div class="mt-4 grid">
		        <button class="px-4 py-1 text-blue-500 font-light tracking-wider hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded" type="submit" onclick="return pointSendValidate();">실행</button>
		      </div>
		    </form>
		</div>
    </div>

 
    
    
    
    
    
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
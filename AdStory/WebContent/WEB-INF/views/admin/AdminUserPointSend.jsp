<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script>
function pointSendValidate(){
    const $userId = $("[name=userId]");
    const $pointAmount = $("[name=pointAmount]");
    const $message = $("[name=message]");
    

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
    <div>
        <p class = "text-sm">회원의 포인트를 올리거나 줄일 수 있습니다.</p>
    </div>
    
    <div class = "my-10">
        <form action="<%= request.getContextPath() %>/admin/userPoint/send"
                                                      method="POST" >
            <div class = "m-2">
                <div>
                    <input name="radio" type="radio" value="increase" checked> <label
                        for="radio-1">증가</label>
       
                    <input name="radio" type="radio" value="decrease"> <label
                        for="radio-2">감소</label>
                </div>
            </div>                               
                                                      
            <div>                                          
                <input name ="userId" class="m-2 bg-gray-200 appearance-none border-2 border-gray-200 rounded py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" type="text" placeholder="아이디">
            </div>
            <div>    
                <input name ="pointAmount" class="m-2 bg-gray-200 appearance-none border-2 border-gray-200 rounded py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" type="text" placeholder="적립 포인트">
            </div>
            

			<button class="m-2 text-blue-500 bg-transparent border border-solid border-blue-500 hover:bg-blue-500 hover:text-white active:bg-blue-600 font-bold uppercase px-8 py-3 rounded outline-none focus:outline-none mr-1 mb-1" type="submit"
            onclick="return pointSendValidate();"/>
                            확인
            </button>
        </form>
    </div>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
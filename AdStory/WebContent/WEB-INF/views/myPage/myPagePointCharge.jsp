<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>
function pointChargeValidate(){
    const $pointAmount = $("[name=pointAmount]");

    if((/[^0-9]/g.test($pointAmount.val()) == true) | ($pointAmount.val()=="")){
        
        alert("적립할 포인트를 정확하게 입력하세요.");
        return false;
    }
    
    return true;
}

</script>
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
    
    
    
    
    <div class="leading-loose">
	  <form class="max-w-xl m-4 p-10 bg-white rounded shadow-xl m-auto" action="<%= request.getContextPath() %>/myPage/point/charge/action?memberId=<%= memberLoggedIn.getMemberId() %>" method="POST">
	    <div class="">
	      <input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded" name="pointAmount" type="text" required="" placeholder="충전 포인트를 입력해주세요.">
	    </div>
	    <div class="mt-4 grid">
	      <button class="px-4 py-1 text-blue-500 font-light tracking-wider hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded" type="submit"
	      onclick="return pointChargeValidate();">충전하기</button>
	    </div>
	  </form>
	</div>


</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
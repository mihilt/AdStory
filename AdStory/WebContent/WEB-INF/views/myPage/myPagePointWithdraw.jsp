<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script>
function pointWithdrawValidate(){
    const $pointAmount = $("[name=pointAmount]");
    const $requirements = $("[name=requirements]");

    
    if($pointAmount.val() > <%=memberLoggedIn.getPoint() %>){
    	alert("보유하신 포인트보다 많이 출금신청 할 수 없습니다.")
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
    <p class = "text-3xl border-b-2">마이페이지 - 포인트 출금</p>
    
    <p class = "my-5">
        <a class = "text-blue-600 hover:underline" href="<%= request.getContextPath() %>/myPage">
                    마이페이지
        </a>
        > 
        <a class = "text-blue-600 hover:underline" href="<%= request.getContextPath() %>/myPage/point?memberId=<%= memberLoggedIn.getMemberId()%>">
                    포인트 관리
        </a>
        > 포인트 출금
    </p>
    
    <div class="leading-loose" >
	  <form class="max-w-xl m-4 p-10 bg-white rounded shadow-xl m-auto" action="<%= request.getContextPath() %>/myPage/point/withdraw/action?memberId=<%= memberLoggedIn.getMemberId() %>" method="POST">
	    <p class="text-gray-800 font-medium text-red-700">*출금신청 전 내정보의 계좌번호를 다시 확인해주세요.</p>
	    <div class="my-4">
	      <label class="block text-sm text-gray-00" for="pointAmount">출금 포인트</label>
          <input class="w-full px-5 py-2 text-gray-700 bg-gray-200 rounded" id="pointAmount" name="pointAmount" type="text" required="" placeholder="출금 포인트를 입력해주세요." aria-label="pointAmount">
        </div>
	    <div class="my-4">
	      <label class="block text-sm text-gray-00" for="requirements">요구사항</label>
	      <input class="w-full px-5 py-4 text-gray-700 bg-gray-200 rounded" id="requirements" name="requirements" type="text" placeholder="요구사항을 입력해주세요." aria-label="requirements">
	    </div>
	   
        <div class="mt-5 grid">
          <button class="px-4 py-1 text-blue-500 font-light tracking-wider hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded" type="submit" 
          onclick="return pointWithdrawValidate();">
                         출금 신청하기
          </button>
        </div>
	  </form>
	</div>
    
    
    
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
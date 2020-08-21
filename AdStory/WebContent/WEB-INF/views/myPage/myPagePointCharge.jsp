<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
var IMP = window.IMP;
IMP.init('imp63123307');

function pointChargeValidate(){
    const $pointAmount = $("[name=pointAmount]");
    if((/[^0-9]/g.test($pointAmount.val()) == true) | ($pointAmount.val()=="")){  
        alert("적립할 포인트를 정확하게 입력하세요.");
        return false;
    }
    IMP.request_pay({
        pg : 'kakaopay',
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : 'AD Story',
        amount : $pointAmount.val(),
        buyer_email : '<%=memberLoggedIn.getEmail() %>',
        buyer_name : '<%=memberLoggedIn.getName() %>',
        buyer_tel : '<%=memberLoggedIn.getPhoneNum() %>',
        buyer_addr : '<%=memberLoggedIn.getAddress() %>',
        buyer_postcode : '123-456',
    }, function(rsp) {
        if ( rsp.success ) {
            jQuery.ajax({
                url: "/payments/complete",
                type: 'POST',
                dataType: 'json',
                data: {
                    imp_uid : rsp.imp_uid
                }
            }).done(function(data) {

                if ( everythings_fine ) {
                    msg = '결제가 완료되었습니다.';
                    msg += '\n고유ID : ' + rsp.imp_uid;
                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                    msg += '\결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;
                    
                    alert(msg);
                } else {

                }
            });  
            
            $("[id=frm]").submit();
        } else {
            msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            location.href="<%=request.getContextPath()%>/myPage/point/charge?memberId=<%=memberLoggedIn.getMemberId() %>";
            alert(msg);
        }
    });
    return false;
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
	  <div id="frm" class="max-w-xl m-4 p-10 bg-white rounded shadow-xl m-auto" action="<%= request.getContextPath() %>/myPage/point/charge/action?memberId=<%= memberLoggedIn.getMemberId() %>" method="POST">
	    <div class="">
	      <input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded" name="pointAmount" type="text" required="" placeholder="충전 포인트를 입력해주세요.">
	    </div>
	    <div class="mt-4 grid">
	      <button class="px-4 py-1 text-blue-500 font-light tracking-wider hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded" type="button"
	      onclick="pointChargeValidate();">충전하기</button>
	    </div>
	  </div>
	</div>


</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
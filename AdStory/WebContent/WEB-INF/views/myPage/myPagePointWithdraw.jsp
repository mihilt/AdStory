<%@page import="member.model.vo.MemberWithdraw"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script>
function pointWithdrawValidate(){
    const $pointAmount = $("[name=pointAmount]");
    const $requirements = $("[name=requirements]");
    
    if($pointAmount.val() < 5000){
        alert("5000p 이상부터 출금신청이 가능합니다.")
        return false;
    }
    
    if($pointAmount.val() % 1000 != 0){
        alert("1000p 단위로 출금신청을 해야합니다.")
        return false;
    }
    
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
	    <p class="text-gray-800 font-bold text-red-700">*출금신청 전 내정보의 계좌번호를 다시 확인해주세요.</p>
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
        
        <div class="mt-10">
            <p class="text-gray-800 text-sm">* 수수료 10%를 제외한 금액만 출금신청으로 들어갑니다.</p>
            <p class="text-gray-800 text-sm">* 5000p 이상부터 출금이 가능합니다.</p>
            <p class="text-gray-800 text-sm">* 1000p 단위로 출금이 가능합니다 ex)5500p → 출금 불가능</p>
        </div>
        
	  </form>
	</div>
    

    
<%
    List<MemberWithdraw> list = (List<MemberWithdraw>)request.getAttribute("list");
    
    String realStatus = "";
%>    

<div class="pt-20">

<%  if(list == null || list.isEmpty()){  %>     
                <div class= text-center>
                    <div class = "m-auto text-xl text-red-700"><%= memberLoggedIn.getMemberId() %>님은 아직 처리되지 않은 출금 신청 목록이 없습니다.</div>
                </div>
<%  
    } else { boolean color = false; %>
        <div>
	        <p class = "pt-5 text-red-700 text-center text-sm"><%= memberLoggedIn.getMemberId() %>님의 아직 처리되지 않은 출금 신청 목록을 조회합니다.</p>
	    </div>
        <table class="table-auto m-auto">
        <thead>
          <tr>
            <th class="px-4 py-2">시간</th>
            <th class="px-4 py-2">출금 신청 액수</th>
            <th class="mobile-hide-table px-4 py-2">요구사항</th>
        </thead>
        <tbody>      

         <% for(MemberWithdraw w : list){ %>      
        
           <%if(color == true){ color = false; %>
		        <tr>
		   <%} else { color = true; %>
		        <tr class="bg-gray-100">
		   <% } %>
			      <td class="mobile-hide-table border px-4 py-2"><%=w.getDateTime() %></td>
			      <td class="mobile-hide-table border px-4 py-2"><%=(String)Commas.format(Integer.parseInt(w.getWithdraw())) %>원</td>
			      <td class="mobile-hide-table border px-4 py-2"><%=w.getRequirements() %></td>
                </tr>
    <% } %> 
          </tbody>
        </table>
         <!-- pageBar -->
        <div class="align-middle flex justify-center">
             <div class="flex rounded-md mt-8">
                 <%= request.getAttribute("pageBar") %>
             </div>
        </div>

    </div>  
<% } %> 
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
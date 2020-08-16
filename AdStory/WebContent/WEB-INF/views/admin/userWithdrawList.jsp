<%@page import="member.model.vo.MemberWithdraw"%>
<%@page import="java.util.List"%>
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
    <p class = "text-3xl border-b-2">관리자 - 출금요청 목록</p>
    
    <p class = "my-5">
        <a class = "text-blue-600 hover:underline" href="<%= request.getContextPath() %>/admin/main">
                    메인
        </a> 
        > 출금요청 목록
    </p>
 


        
<%
    List<MemberWithdraw> list = (List<MemberWithdraw>)request.getAttribute("list");
    
    String realStatus = "";
%>    

<div class="pt-20">

<%  if(list == null || list.isEmpty()){  %>     
                <div class= text-center>
                    <div class = "m-auto text-xl text-red-700">출금 신청 목록이 없습니다.</div>
                </div>
<%  
    } else { boolean color = false; %>
    
        <div>
            <p class = "pb-10 text-red-700 text-center">*출금신청 액수는 수수료 처리를 완료한 값
            입니다.</p>
        </div>
        <table class="table-auto m-auto">
        <thead>
          <tr>
            <th class="px-4 py-2">시간</th>
            <th class="px-4 py-2">아이디</th>
            <th class="px-4 py-2">이름</th>
            <th class="px-4 py-2">은행</th>
            <th class="px-4 py-2">계좌번호</th>
            <th class="px-4 py-2">출금 신청 액수</th>
            <th class="mobile-hide-table px-4 py-2">요구사항</th>
            <th class="px-4 py-2">완료버튼</th>
        </thead>
        <tbody>      

         <% for(MemberWithdraw w : list){ %>      
        
           <%if(color == true){ color = false; %>
                <tr>
           <%} else { color = true; %>
                <tr class="bg-gray-100">
           <% } %>
                  <td class="border px-4 py-2"><%=w.getDateTime() %></td>
                  <td class="border px-4 py-2"><%=w.getMemberId() %></td>
                  <td class="border px-4 py-2"><%=w.getName() %></td>
                  <td class="border px-4 py-2"><%=w.getAccountName() %></td>
                  <td class="border px-4 py-2"><%=w.getAccountNum() %></td>
                  <td class="border px-4 py-2"><%=(String)Commas.format(Integer.parseInt(w.getWithdraw())) %>원</td>
                  <td class="border px-4 py-2"><%=w.getRequirements() %></td>
                  <% if("F".equals(w.getStatus())) { %>
                  <td class="cursor-pointer hover:bg-white hover:text-blue-500 text-center align=center border bg-blue-500 text-white font-bold"
                  onclick="location.href='<%= request.getContextPath() %>/admin/checkWithdraw?key=<%=w.getKey()%>';">확인</td>
                  <% } else { %>
                  <td class="m-auto border px-4 py-2 text-red-700">처리완료</td>
                  <% } %>
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
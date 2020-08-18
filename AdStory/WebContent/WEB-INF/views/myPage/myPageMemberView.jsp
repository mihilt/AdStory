<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<%
Member member = (Member)request.getAttribute("member");
    
String memberRoleStr = "";
    
if("U".equals(member.getMemberRole())){
	memberRoleStr = "일반회원";
}else if("C".equals(member.getMemberRole())){
    memberRoleStr = "기업회원";
}else{
    memberRoleStr = "관리자";
}


%>

<script type = "text/javascript">
	function updateMember(){
	        var frm = $("#memberFrm");
	        var url = "<%=request.getContextPath() %>/myPage/update";
	        frm.attr('action',url);
	        frm.submit();
	        
	}
	    
	function deleteMember(){
	    var bool = confirm("정말로 탈퇴하시겠습니까?");
	    if(bool){
	        var frm = $("[name=memberDeleteFrm]");
	        frm.submit();
	    }
	        
	}
	      
	function updatePassword(){
	    var url = "<%= request.getContextPath() %>/myPage/updatePassword?memberId=<%= member.getMemberId() %>";
	    var title = "updatePassword";
	    var status =  "left=500px, top=200px, width=400px, height=210px";
	    
	    open(url,title,status);
	}       
</script>    




<div class="m-12">
    <p class = "text-3xl border-b-2">마이페이지 - 내정보 보기</p>
    
    <p class = "my-5">
        <a class = "text-blue-600 hover:underline" href="<%= request.getContextPath() %>/myPage">
                    마이페이지
        </a> 
        > 내정보 보기
    </p>

    <div>

	    <form id="memberFrm" method="post">
	        <table class="m-auto">
	            <tr>
	                <th>아이디</th>
	                <td>
	                    <input class = "font-bold text-black border mx-2 px-2" type="text" name="memberId" id="memberId_" value="<%= member.getMemberId() %>" readonly>
	                </td>
	            </tr>
	            
	            <tr>
	                <th>회원구분</th>
	                <td>    
	                   <input class = "font-bold text-black border mx-2 px-2" type="text"  name="memberRole" id="memberName" value="<%= memberRoleStr %>"  readonly>
	                </td>
	            </tr>
	            
	            <tr>
	                <th>잔여 포인트</th>
	                <td>    
	                   <input class = "font-bold text-black border mx-2 px-2" type="text"  name="memberRole" id="memberName" value="<%= (String)Commas.format(member.getPoint()) %>P"  readonly>
	                </td>
	            </tr>
	            
	            <% if("C".equals(member.getMemberRole())){ %>
	            <tr>
	                <th>사업자번호</th>
	                <td class="">    
	                   <input class = "font-bold text-black border mx-2 px-2" type="text"  name="bussinessNum" id="memberName" value="<%= member.getBussinessNum() != null ? member.getBussinessNum() : "" %>" readonly>
	                </td>
	            </tr>
	            <% } %>
	            
                <tr>
                    <th><%= ("C".equals(member.getMemberRole()) ? "기업명" : "이름") %></th>
                    <td class="">    
                       <input class = "border mx-2 px-2" type="text"  name="name" value="<%= member.getName() %>" required>
                    </td>
                </tr>
	            
	            <tr>
	                <th>전화번호</th>
	                <td class="">    
	                   <input class = "border mx-2 px-2" type="tel"  name="phoneNum" value="<%= member.getPhoneNum() %>" required>
	                </td>
	            </tr>
	            
	            <tr>
	                <th>계좌은행명</th>
	                <td class="">    
	                   <input class = "border mx-2 px-2" type="text"  name="accountName" value="<%= member.getAccountName() %>"  required>
	                </td>
	            </tr>
	            
	            <tr>
	                <th>계좌번호</th>
	                <td class="">    
	                   <input class = "border mx-2 px-2" type="text"  name="accountNum" value="<%= member.getAccountNum() %>"  required>
	                </td>
	            </tr>
	            
	   
	            <tr>
	                <th>이메일</th>
	                <td class="">    
	                   <input class = "border mx-2 px-2" type="email"  name="email" value="<%= member.getEmail() %>">
	                </td>
	            </tr>
	            
	            <tr>
	                <th>주소</th>
	                <td class="">    
	                   <input class = "border mx-2 px-2" type="text"  name="address" value="<%= member.getAddress() != null ? member.getAddress() : "" %>">
	                </td>
	            </tr>
	            
	        </table>
	        <div class="m-auto table mt-10">
	        
		        <input class="bg-white cursor-pointer hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded text-blue-500 mx-2 p-2" type="button" onclick="updateMember();" value="정보수정"/>
		        
		        <input class="bg-white cursor-pointer hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded text-blue-500 mx-2 p-2" type="button" onclick="updatePassword();" value="비밀번호변경"/>
		        
		        <input class="bg-white cursor-pointer hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded text-blue-500 mx-2 p-2" type="button" onclick="deleteMember();" value="탈퇴"/>
		        
	        </div>
	    </form>
	    
        <!-- 탈퇴용 폼 -->
	    <form action="<%= request.getContextPath() %>/member/delete" 
	          method="POST" 
	          name="memberDeleteFrm">
	        <input type="hidden" name="memberId" value="<%= member.getMemberId() %>"/>
	    </form>
	    
    </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
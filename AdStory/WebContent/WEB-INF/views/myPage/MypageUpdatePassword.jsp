<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member" %>
<%
	String memberId = (String)request.getParameter("memberId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.5.1.js"></script>
<style>
div#updatePassword-container table {margin:0 auto; border-spacing: 20px;}
div#updatePassword-container table tr:last-of-type td {text-align:center;}
</style>
<script>
$(function(){
	$("[name=updatePwdFrm]").submit(passwordValidate);
	$("#password_chk").blur(passwordValidate);
});

function passwordValidate(){
	var pwd_new = $("#password_new").val().trim();
	var pwd_chk = $("#password_chk").val().trim();
	
	if(pwd_new!=pwd_chk){
		alert("입력한 비밀번호가 일치하지 않습니다.");
		$("#password_new").select();
		return false;
	}
	
	return true;	
}
</script>
</head>
<body>
	<div class = "m-auto" id="updatePassword-container">
		<form name="updatePwdFrm" action="<%=request.getContextPath()%>/myPage/updatePassword" method="post" >
			<table >
				<tr>
					<th>현재 비밀번호</th>
					<td><input type="password" name="password" id="password" required></td>
				</tr>
				<tr>
					<th>변경할 비밀번호</th>
					<td>
						<input type="password" name="password_new" id="password_new" required>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>	
						<input type="password" id="password_chk" required><br>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit"  value="변경" />&nbsp;
						<input type="button" onclick="self.close();" value="닫기" />						
					</td>
				</tr>
			</table>
			<input type="hidden" name="memberId" value="<%=memberId %>" />
		</form>
	</div>
</body>
</html>
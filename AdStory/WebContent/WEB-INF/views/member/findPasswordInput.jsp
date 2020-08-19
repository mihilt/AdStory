<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기-회원정보입력</title>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.5.1.js"></script>

<%! public int getRandom(){
	int random = 0;
	random = (int)Math.floor((Math.random()*(99999-10000+1)))+10000;
	return random;
}%>

</head>
<body>

<form name="Frm1">
	<input type="hidden" name="receiver" />
	<input type="hidden" readonly="readonly" name="code_check" id="code_check_" 
							value="<%=getRandom()%>"/>
</form>

	<section id="find_container">
	<h2>회원정보입력</h2>
	<form name="findFrm" 
	  	  action="<%= request.getContextPath() %>/member/memberfind" 
	  	  method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" placeholder="4글자이상" name="memberId" id="memberId_" required>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" id="name" required><br/>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="email" id="receiver_" name="receiver" placeholder="abc@xyz.com">
					<input type="button" id="submit" value="인증번호 발송" onclick = "checkEmail();"/>
					<div id="checkCode"></div>
					<input type="hidden" readonly="readonly" name="code_check" id="code_check_" 
							value="<%=getRandom()%>"/>
					<input type="hidden" id="emailValid" value="0"/>
				</td>
			</tr>
		</table>
		<input type="submit" value="확인" />
		<button class="return" onclick="location.href='<%= request.getContextPath() %>';">비동의</button>
	</form>
	</section>


<script>
function checkEmail() {
	
	var url = "";//checkIdDuplicateFrm의 action값이 사용되므로, 비워둠.
	var title = "EmailCheckPopup";
	var spec = "left=500px, top=300px, width=300px, height=200px";
	open(url, title, spec);
	
	
	var $frm = $("[name=Frm1]");
	var $receiver = $("#receiver_");
	var $code_check = $("#code_check_");
	$frm.attr("action", 
	  "<%=request.getContextPath()%>/member/sendPasswordMail");
	$frm.attr("method", "POST");
	$frm.attr("target", title);//폼과 팝업창 연결
	$frm.find("[name=receiver]").val($receiver.val());
	$frm.find("[name=code_check]").val($code_check.val());
	$frm.submit();
}

</script>


</body>
</html>
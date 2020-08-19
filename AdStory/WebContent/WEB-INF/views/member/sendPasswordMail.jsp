<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String email = (String)request.getAttribute("email"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일팝업</title>


<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.5.1.js"></script>
<script>

function checkCode() {
	var v1= form2.code_check.value;
	var v2= form2.code.value;
	
	if(v1 != v2) {
		document.getElementById('checkCode').style.color = "red";
		document.getElementById('checkCode').innerHTML = "잘못된인증번호";
		makeNull();
	} else {
		document.getElementById('checkCode').style.color = "blue";
		document.getElementById('checkCode').innerHTML = "인증되었습니다.";
		makeReal();
	}
	
}

function makeReal() {
	var hi = document.getElementById("hi")
	hi.type = "button";
}

function makeNull() {
	var hi = document.getElementById("hi")
	hi.type = "hidden";
}




function closePopup(){
	
	var $frm = $(opener.document.findFrm);
	$frm.find("#receiver_").val("<%= email %>");
	$frm.find("#emailValid").val(1); //이게 왜 안되는거지??...맞는데..??? 왜 못찾는거지
	
	
	self.close();
}
	
</script>

</head>
<body>

	<form id="form2">
		<table>
			<tr>
				<td><span>인증번호</span></td>
				<td><input type="text" name="code" id="code" onkeyup="checkCode()" placeholder="인증번호를 입력하세요"/>
				<div id="checkCode"></div></td>
				<td><input type="hidden" readonly="readonly" name="code_check" id="code_check" 
				value="<%=request.getAttribute("code")%>"/></td>
			</tr>
		</table>
		<input id="hi" type="button" value='확인' onclick="closePopup();"/>
	</form>
	

</body>
</html>
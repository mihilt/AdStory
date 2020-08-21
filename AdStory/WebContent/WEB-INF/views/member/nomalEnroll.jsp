<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/enrollStyle.css" />
<title>일반회원가입</title>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.5.1.js"></script>


<%! public int getRandom(){
	int random = 0;
	random = (int)Math.floor((Math.random()*(99999-10000+1)))+10000;
	return random;
}%>


<link rel="icon"
    href="<%=request.getContextPath() %>/images/favicon.ico"
    type="image/x-icon">
<link rel="shortcut icon"
    href="<%=request.getContextPath() %>/images/favicon.ico"
    type="image/x-icon">
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css"
    rel="stylesheet">
<link rel="stylesheet"
    href="<%=request.getContextPath() %>/css/main_style.css" />
</head>
<body>
<form name="Frm1">
	<input type="hidden" name="receiver" />
	<input type="hidden" readonly="readonly" name="code_check" id="code_check_" 
							value="<%=getRandom()%>"/>

</form>

<form name="checkIdDuplicateFrm">
	<input type="hidden" name="memberId" />
</form>

    <div class="m-10">
		<section id=enroll-container>
			<p class = "mb-5 text-xl font-bold">회원 가입 정보 입력</p>
			<form name="nomalEnrollFrm"
				action="<%=request.getContextPath()%>/member/nomalEnroll"
				method="post">
				<table>
					<tr>
						<th>아이디</th>
						<td><input class = "border-2 m-2 p-1 px-2" type="text" placeholder="4글자이상" name="memberId"
							id="memberId_" required> &nbsp; <input type="button" class="text-xs bg-white cursor-pointer hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded text-blue-500 mx-2 p-2"
							value="아이디 중복 검사" onclick="checkIdDuplicate();" /> <!-- 아이디 중복검사 여부 : 0=미확인, 1=확인 -->
							<input type="hidden" id="idValid" value="0" /></td>
					</tr>
					<tr>
						<th>패스워드</th>
						<td><input class = "border-2 m-2 p-1 px-2" type="password" name="password" id="password_"
							required><br></td>
					</tr>
					<tr>
						<th>패스워드확인</th>
						<td><input class = "border-2 m-2 p-1 px-2" type="password" name="PWConfirm" id="password2"
							required><br></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input class = "border-2 m-2 p-1 px-2" type="tel" placeholder="(-없이)01012345678"
							name="phone" id="phone" maxlength="11" required><br>
						</td>
					</tr>
		            <tr>
		                <th>은행선택</th>
		                <td>
		                     <select class = "border-2 m-2 p-1 px-2" name="bank">
		                         <option value="기업은행">기업은행</option>
		                         <option value="국민은행">국민은행</option>
		                         <option value="신한은행">신한은행</option>
		                         <option value="하나은행">하나은행</option>
		                         <option value="우리은행">우리은행</option>
		                         <option value="새마을금고">새마을금고</option>
		                    </select>
		                </td>
		            </tr>
		            <tr>
		                <th>계좌번호</th>
		                <td>    
		                    <input class = "border-2 m-2 p-1 px-2" type="text" placeholder="계좌번호를 입력하세요" name="acountNum" id="acountNum" maxlength="11" required><br>
		                </td>
		            </tr>
					<tr>
						<th>성명</th>
						<td><input class = "border-2 m-2 p-1 px-2" type="text" name="name" id="name"><br />
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input class = "border-2 m-2 p-1 px-2" type="email" id="receiver_" name="receiver"
							placeholder="abc@xyz.com"> <input type="button" class="text-xs bg-white cursor-pointer hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded text-blue-500 mx-2 p-2"
							id="submit" value="인증번호 발송" onclick="checkEmail();" /> <input
							type="hidden" readonly="readonly" name="code_check"
							id="code_check_" value="<%=getRandom()%>" /> <input type="hidden"
							id="emailValid" value="0" /></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input class = "border-2 m-2 p-1 px-2" type="text" placeholder="" name="address"
							id="address"><br></td>
					</tr>
				</table>
				<div class = "mt-5">
					<input class="bg-white cursor-pointer hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded text-blue-500 mx-2 p-2" type="submit" value="가입"> 
					<input class="bg-white cursor-pointer hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded text-blue-500 mx-2 p-2" type="reset"	value="취소">
			    </div>
			</form>
		</section>
	</div>
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
	  "<%=request.getContextPath()%>/member/verificationCode");
	$frm.attr("method", "POST");
	$frm.attr("target", title);//폼과 팝업창 연결
	$frm.find("[name=receiver]").val($receiver.val());
	$frm.find("[name=code_check]").val($code_check.val());
	$frm.submit();
}


/**
 * 아이디 중복검사 함수
 * 팝업창에 checkIdDuplcateFrm 제출  
 */

function checkIdDuplicate(){
	//아이디 중복검사
	var $memberId = $("#memberId_");
	
	if(/^\w{4,}$/.test($memberId.val()) == false){
		alert("유효한 아이디를 입력해주세요.");
		$memberId.select();
		return;
	}
	
	//1.팝업관련
	var url = "";//checkIdDuplicateFrm의 action값이 사용되므로, 비워둠.
	var title = "checkIdDuplicatePopup";
	var spec = "left=500px, top=300px, width=300px, height=200px";
	open(url, title, spec);
	
	//2.폼관련
	var $frm = $("[name=checkIdDuplicateFrm]");
	$frm.attr("action", 
			  "<%= request.getContextPath() %>/member/checkIdDuplicate");
	$frm.attr("method", "POST");
	$frm.attr("target", title);//폼과 팝업창 연결
	$frm.find("[name=memberId]").val($memberId.val());
	$frm.submit();
}


/**
 * change이벤트는 blur시 변경사항이 있다면 발생.
 */
$("#memberId_").change(function(){
	console.log("#memberId_ changed!!!");
	
	//0 미확인 상태 -> 최종 유효성검사에서 중복검사하지 않은 상태로 제출불가
	$("#idValid").val(0);
	
});


$("[name=nomalEnrollFrm]").submit(function(){
	var $memberId = $("#memberId_");
	
	
	//1.memberId
	if(/^[\w]{4,}$/.test($memberId.val()) == false){
		alert("4글자이상 유효한 아이디를 입력하세요.");
		return false;
	}
	
	//2.password
	var $pw = $("#password_");
	var $pwconfirm = $("#password2");
	
	if($pw.val() != $pwconfirm.val()) {
		alert("비밀번호가 일치하지 않습니다");
		return false;
	}
	
	//3.아이디 중복검사 여부
	var $idValid = $("#idValid");
	if($idValid.val() == 0){
		alert("아이디 중복 검사 해주세요.");
		return false;
	}
	
	//4.이메일인증여부
	var $emailValid = $("#emailValid");
	if($emailValid.val() == 0){
		alert("이메일 인증을 진행해주세요.");
		return false;
	}
	
	return true;
} 
);



 

</script>

</body>
</html>
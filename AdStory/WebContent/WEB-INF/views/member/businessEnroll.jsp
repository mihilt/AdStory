<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/enrollStyle.css" />
<title>기업회원가입</title>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.5.1.js"></script>


</head>
<body>

<!-- 사업자번호 확인폼 -->
<form name="checkBusinessNumFrm">
	<input type="hidden" name="BusinessNum" />
</form>

<form name="checkIdDuplicateFrm">
	<input type="hidden" name="memberId" />
</form>



	<section id=enroll-container>
	<h2>회원 가입 정보 입력</h2>
	<form name="bussinessEnrollFrm" 
		  action="<%= request.getContextPath() %>/member/businessEnroll" 
		  method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" placeholder="4글자이상" name="memberId" id="memberId_" required>
					&nbsp;
					<input type="button" value="아이디 중복 검사" 
						   onclick="checkIdDuplicate();"/>
					<!-- 아이디 중복검사 여부 : 0=미확인, 1=확인 -->
					<input type="hidden" id="idValid" value="0"/>
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="password" name="password" id="password_" required><br>
				</td>
			</tr>
			<tr>
				<th>패스워드확인</th>
				<td>	
					<input type="password" id="password2" required><br>
				</td>
			</tr>  
			<tr>
				<th>대표전화</th>
				<td>	
					<input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required><br>
				</td>
			</tr>
			<tr>
				<th>계좌번호</th>
				<select name="bank">
				    <option value="기업은행">기업은행</option>
				    <option value="국민은행">국민은행</option>
				    <option value="신한은행">신한은행</option>
				    <option value="하나은행">하나은행</option>
				    <option value="우리은행">우리은행</option>
				    <option value="새마을금고">새마을금고</option>
				</select>
				<td>	
					<input type="text" placeholder="계좌번호를 입력하세요" name="acountNum" id="acountNum" maxlength="11" required><br>
				</td>
			</tr>
			<tr>
				<th>사업자번호</th>
				<td>	
				<input type="text"  name="BusinessNum" id="BusinessNum_" required>&nbsp; 
				<input type="button" value="사업자번호 인증" onclick="checkBusinessNum();" /> 
				<input type="hidden" id="BuisinessNumValid" value="0"/>
				</td>
			</tr>
			<tr>
				<th>사업자명</th>
				<td>	
				<input type="text" name="name" id="name" ><br/>
				</td>
			</tr> 
			<tr>
				<th>이메일</th>
				<td>	
					<input type="email" placeholder="abc@xyz.com" name="email" id="email">
				</td>
			</tr>
			
			<tr>
				<th>주소</th>
				<td>	
					<input type="text" placeholder="" name="address" id="address"><br>
				</td>
			</tr>
		</table>
		<input type="submit" value="가입" >
		<input type="reset" value="취소">
	</form>
</section>

<script>
/**
 * 아이디 중복검사 함수
 * 팝업창에 checkIdDuplcateFrm 제출  
 */
function checkBusinessNum(){
	console.log("test");
	var $BusinessNum = $("#BusinessNum_");
	
	
	var url = "";//checkIdDuplicateFrm의 action값이 사용되므로, 비워둠.
	var title = "checkBusinessNumPopup";
	var spec = "left=500px, top=300px, width=300px, height=200px";
	open(url, title, spec);
	//2.폼관련
	var $frm = $("[name=checkBusinessNumFrm]");
	$frm.attr("action", 
			  "<%= request.getContextPath() %>/member/checkBusinessNum");
	$frm.attr("method", "POST");
	$frm.attr("target", title);//폼과 팝업창 연결
	$frm.find("[name=BusinessNum]").val($BusinessNum.val());
	$frm.submit();
	
	
}

/* 
 * change이벤트는 blur시 변경사항이 있다면 발생.
 */
$("#BusinessNum_").change(function(){
	console.log("#BusinessNum_ changed!!!");
	
	//0 미확인 상태 -> 최종 유효성검사에서 중복검사하지 않은 상태로 제출불가
	$("#BuisinessNumValid").val(0);
	
});


$("[name=bussinessEnrollFrm]").submit(function(){
	var $BusinessNum = $("BusinessNum_");
	
	//1.memberId
	if(/^[\w]{4,}$/.test($BusinessNum.val()) == false){
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

	//3.중복검사 여부
	var $BuisinessNumValid = $("#BuisinessNumValid");
	if($BuisinessNumValid.val() == 0){
		alert("아이디 중복 검사 해주세요.");
		return false;
	}
	
	
	return true;
});

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
			  "<%= request.getContextPath() %>/member/checkBusinessIdDuplicate");
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


$("[name=bussinessEnrollFrm]").submit(function(){
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
	
	//3.중복검사 여부
	var $idValid = $("#idValid");
	if($idValid.val() == 0){ 
		alert("아이디 중복 검사 해주세요.");
		console.log($idValid.val()); 
		return false;
	}
	
	//4.사업자번호 검사여부
	var $BuisinessNumValid = $("#BuisinessNumValid");
	if($BuisinessNumValid.val() == 0){
		alert("사업자번호 중복 검사 해주세요.");
		return false;
	}
	
	
	return true;
});


</script>

</body>
</html>
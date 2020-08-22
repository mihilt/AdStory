<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기-회원정보입력</title>

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
    <div class= "m-12">

		<form name="Frm1">
			<input type="hidden" name="receiver" />
			<input type="hidden" readonly="readonly" name="code_check" id="code_check_" 
									value="<%=getRandom()%>"/>
		</form>
			
			<section id="find_container">
			<h2 class="text-center font-bold text-2xl my-4">아이디 찾기</h2>
			<h4 class="text-center text-1xl my-4">본인확인 이메일주소와 입력한 이메일주소가 같아야, 이메일인증이 가능합니다.</h4>
			<form name="findFrm" 
			  	  action="<%= request.getContextPath() %>/member/findId" 
			  	  method="post">
				<table class = "m-auto">
					<tr>
						<th class = "text-right">이름</th>
						<td>
							<input class = "border-2 m-2 p-1 px-2" type="text" name="name" id="name" required><br/>
						</td>
					</tr>
					<tr>
						<th class = "text-right">이메일</th>
						<td>
							<input class = "border-2 m-2 p-1 px-2" type="email" id="receiver_" name="receiver" placeholder="abc@xyz.com">
							<input class="text-xs bg-white cursor-pointer hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded text-blue-500 mx-2 p-2" type="button" id="submit" value="인증번호 발송" onclick = "checkEmail();"/>
							<div id="checkCode"></div>
							<input type="hidden" readonly="readonly" name="code_check" id="code_check_" 
									value="<%=getRandom()%>"/>
							<input type="hidden" id="emailValid" value="0"/>
						</td>
					</tr>
				</table>
				<div class="text-center m-4">
					<input class="bg-white cursor-pointer hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded text-blue-500 mx-2 p-2 px-4" type="submit" value="확인" />
					<button class="bg-white cursor-pointer hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded text-blue-500 mx-2 p-2 px-4" class="return" onclick="location.href='<%= request.getContextPath() %>';">취소</button>
			    </div>
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
			  "<%=request.getContextPath()%>/member/sendIdMail");
			$frm.attr("method", "POST");
			$frm.attr("target", title);//폼과 팝업창 연결
			$frm.find("[name=receiver]").val($receiver.val());
			$frm.find("[name=code_check]").val($code_check.val());
			$frm.submit();
		}
		
		//4.이메일인증여부
		
		$("[name=findFrm]").submit(function(){
			
			var $emailValid = $("#emailValid");
			if($emailValid.val() == 0){
				alert("이메일 인증을 진행해주세요.");
				return false;
			}
		});
		
		
		</script>
</div>
</body>
</html>
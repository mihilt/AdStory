<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String result = (String)request.getAttribute("result");
	String businessNum = (String)request.getAttribute("BusinessNum");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자등록번호 인증</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.js"></script>


<script>
	$(function(){
		
		$("[name=checkBusinessNumFrm]").submit(function(){
			//아이디 중복검사
			var $BusinessNum = $("#BusinessNum_");
			
			if(/^[\w]{4,}$/.test($BusinessNum.val()) == false){
				alert("유효한 사업자번호를 입력하세요.");
				return false;
			}
			
			return true;
		});
		
	});
	
	/**
	* popup창을 닫기전에 부모창(opener)의 
	* memeberEnrollFrm의 memberId, idValid값을 셋팅한다.
	*/
	function closePopup(){
		//opener : 현재팝업을 open한 window객체를 리턴
	
		var $businessNum = $("[name=BusinessNum]");
		console.log("numtest");
	
		var $frm = $(opener.document.bussinessEnrollFrm);
		$frm.find("#BusinessNum_").val("<%=businessNum%>");
		$frm.find("#BuisinessNumValid").val(1);
		
		console.log($businessNum.val());
		console.log($frm.find("#BusinessNum_"));
		
	
		self.close();
		
		
	}
	
	</script>



</head>
<body>
	<div id="checkid-container">
<% if(result.contains("사업을 하지 않고 있습니다.")){ %>
		<p>
			유효한 사업자번호가 아닙니다.<br/>
			다시 입력해주세요 <br />
		</p>
		<!-- 중복아이디 확인 폼 -->
		<form name="checkBusinessNumFrm"
			  method="POST"
			  action="<%= request.getContextPath() %>/member/checkBusinessNum">
			<input type="text" name="BusinessNum" id="BusinessNum_" 
				   placeholder="사업자번호를 입력하세요."/>
			<input type="submit" value="사업자번호 인증" />
		</form>
	<%} else {%>
		<p>
			<%= result %> <br/>
			회원가입을 진행하세요.
		</p>
		<button type="button" onclick="closePopup();">닫기</button>
	<%  } %>	
	</div>

</body>
</html>
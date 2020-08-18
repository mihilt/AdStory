<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	boolean isUsable = (boolean)request.getAttribute("isUsable");
	String memberId = request.getParameter("memberId");
%>


<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>아이디 중복 검사</title>
	<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.js"></script>
	<style>
	#checkid-container {
		text-align: center;
		padding-top: 50px;
	}
	span {
		text-weight: bold;
	}
	span#duplicate {
		color: red;
	}
	</style>
	
	<script>
	$(function(){
		
		$("[name=checkIdDuplicateFrm]").submit(function(){
			//아이디 중복검사
			var $memberId = $("#memberId");
			
			if(/^\w{4,}$/.test($memberId.val()) == false){
				alert("유효한 아이디를 입력해주세요.");
				$memberId.select();
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
		var $frm = $(opener.document.memberEnrollFrm);
		$frm.find("#memberId_").val("<%= memberId %>");
		$frm.find("#idValid").val(1);
		
		self.close();
		
	}
	
	</script>
	
</head>
<body>
	<div id="checkid-container">
<% 	if(isUsable == true){ %>
	<p>
		[ <span><%= memberId %></span> ]는 사용가능합니다.
	</p>
	<button type="button" onclick="closePopup();">닫기</button>
	
<%  } else { %>

	<p>
		[ <span class="duplicate"><%= memberId %></span> ]는 
		이미 사용중입니다.
	</p>
	
	<!-- 중복아이디 확인 폼 -->
	<form name="checkIdDuplicateFrm"
		  method="POST"
		  action="<%= request.getContextPath() %>/member/checkIdDuplicate">
		<input type="text" name="memberId" id="memberId" 
			   placeholder="아이디를 입력하세요."/>
		<input type="submit" value="아이디 중복검사" />	   
	</form>


<%  } %>		
	</div>
</body>
</html>
	
		

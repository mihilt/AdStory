<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String memberId = (String)request.getAttribute("memberId"); %>	
<% String name = (String)request.getAttribute("name"); %>	
<% String email = (String)request.getAttribute("email"); %>	
	
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>아이디 확인</title>
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
	
	
	
</head>
<body>
	<div id="checkid-container">
		<form name="idViewFrm"
			  method="POST"
			  action="<%= request.getContextPath() %>/member/idView">
			<p>
				회원님의 아이디는 [ <span><%= memberId %></span> ] 입니다.
			</p>
			<input type="hidden" name="name" value="<%=(String)request.getAttribute("name") %>" />
			<input type="hidden" name="email" value="<%=(String)request.getAttribute("email") %>" />
			<input type="hidden" name="memberId" value="<%=(String)request.getAttribute("memberId") %>"/>
			<button type="button" onclick = "location.href='<%=request.getContextPath()%>'">돌아가기</button>
			<input type="submit" value="비밀번호 찾기" />
		</form>
	
	</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form name= "selelctEnrollFrm" >
		<img onclick="location.href='<%= request.getContextPath() %>/member/BusinessMemberAgree';"
		     src="<%=request.getContextPath() %>/images/businessmember.png" alt="기업회원가입"/>
		<p>기업회원가입</p>
		<img onclick="location.href='<%= request.getContextPath() %>/member/NomalMemberAgree';"
		     src="<%=request.getContextPath() %>/images/12.jpg" alt="일반회원가입"/>
		<p>일반회원가입</p>
		  
		  
	</form>

</body>
</html>
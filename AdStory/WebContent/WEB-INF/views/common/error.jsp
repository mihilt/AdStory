<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage = "true"%>
    
<%
	int statusCode = response.getStatus();
	String msg = exception != null ? 
					exception.getMessage() : 
						String.valueOf(statusCode);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류</title>
<style>
body {
	text-align: center;
}
</style>
</head>
<body>
	<h1>오류</h1>
	<p>죄송합니다. 요청처리중 오류가 발생했습니다.</p>
	
	<hr />
	<a href="<%= request.getContextPath() %>">
		<button>홈으로 돌아가기</button>
	</a>

</body>
</html>
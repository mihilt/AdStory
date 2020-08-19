<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="icon"
    href="<%=request.getContextPath() %>/images/favicon.ico"
    type="image/x-icon">
<link rel="shortcut icon"
    href="<%=request.getContextPath() %>/images/favicon.ico"
    type="image/x-icon">
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css"
    rel="stylesheet">


<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>


	<div class="text-center m-32">
	
		<p class= "mb-12 text-2xl">회원가입 유형 선택</p>
		
		<div class="flex mb-4">
		     
	      <div class="w-1/2 h-12 text-sm">광고를 받아 수익을 창출하고 싶으신가요? 
	      <br /><br />
	      <button type="button" class="p-16  bg-white cursor-pointer hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded text-blue-500 mx-2 p-2" onclick="location.href='<%= request.getContextPath() %>/member/NomalMemberAgree';">일반회원가입</button>
	      </div>
		
		  <div class="w-1/2 h-12 text-sm">본인의 기업을 광고하고 싶으신가요?
		  <br /><br />
		  <button type="button" class="p-16  bg-white cursor-pointer hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded text-blue-500 mx-2 p-2" onclick="location.href='<%= request.getContextPath() %>/member/BusinessMemberAgree';">기업회원가입</button>
		  </div>
	
		</div>

	</div>

</body>
</html>
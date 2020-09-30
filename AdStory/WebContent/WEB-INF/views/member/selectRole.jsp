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
<link rel="stylesheet"
    href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
    integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
    crossorigin="anonymous">

<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>


	<div class="text-center m-32">
	
		<p class= "mb-6 text-3xl font-bold">회원가입 유형 선택</p>
		
		<div class="flex mb-4 max-w-screen-sm m-auto">
		     
	      <div class="w-1/2 h-12">
	      <br />
	      <i class="fas fa-user my-10 cursor-pointer text-blue-700 hover:text-blue-500" style="font-size:200px;" onclick="location.href='<%= request.getContextPath() %>/member/NomalMemberAgree';"></i>
	      <br />
	      <p class = "font-extrabold ">일반회원 회원가입</p>
	      <br />
	      <p class = "font-extrabold text-xs">광고를 받아 수익을 창출하고 싶으신가요? </p>
	      </div>
		
		  <div class="w-1/2 h-12 ">
		  <br />
		  <i class="fas fa-building my-10 cursor-pointer text-blue-700 hover:text-blue-500" style="font-size:200px;" onclick="location.href='<%= request.getContextPath() %>/member/BusinessMemberAgree';"></i>
		  <br />
		  <p class = "font-extrabold ">기업회원 회원가입</p>
		  <br />
		  <p class = "font-extrabold text-xs">본인의 기업을 광고하고 싶으신가요?</p>
		  </div>
	
		</div>

	</div>

</body>
</html>
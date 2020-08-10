<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="member.model.vo.Member"%>
<%
    Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
    boolean saveId = false;
    String memberId = "";
    Cookie[] cookies = request.getCookies();
    if(cookies != null){
        for(Cookie c : cookies){
            String key = c.getName();
            String value = c.getValue();
            if("saveId".equals(key)){
                saveId = true;
                memberId = value;
            }
        }
    }
%>	

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="icon"
	href="<%=request.getContextPath() %>/images/favicon.ico"
	type="image/x-icon">
<link rel="shortcut icon"
	href="<%=request.getContextPath() %>/images/favicon.ico"
	type="image/x-icon">



<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css"
	rel="stylesheet">

<link href="https://fonts.googleapis.com/css?family=Open+Sans:300"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">

<link href="https://fonts.googleapis.com/css?family=Open+Sans"
	rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/main_style.css" />
<title>AD STORY</title>

</head>
<body>

	<div class="all-of-div">
		<div class="main-container">
			<div class="menu-icon">
				<i class="fas fa-bars header__menu"></i>
			</div>

			<header class="header">
				<div class="logout-div">
				
<% if(memberLoggedIn == null){ %> 
                       <button
                        class="float-right bg-transparent hover:bg-blue-500 text-gray-700 font-semibold hover:text-white py-2 px-4 border border-gray-700 hover:border-transparent rounded"
                        onclick="openModal()">
                                                      로그인
                        </button>
<%} else { %>
                       <button
                        class="float-right bg-transparent hover:bg-blue-500 text-gray-700 font-semibold hover:text-white py-2 px-4 border border-gray-700 hover:border-transparent rounded"
                        onclick="location.href = '<%= request.getContextPath() %>/member/logout';"/>
                                                      로그아웃
                        </button>
<% } %>				
				    <div class="main-modal fixed w-full h-100 inset-0 z-50 overflow-hidden flex justify-center items-center animated fadeIn faster"
				        style="background: rgba(0,0,0,.7);">
				        <div
				            class="border border-teal-500 shadow-lg modal-container bg-white w-11/12 md:max-w-md mx-auto rounded shadow-lg z-50 overflow-y-auto">
				            <div class="modal-content py-4 text-left px-6">
				                <!--Title-->
				                <div class="flex justify-between items-center pb-3">
				                    <p class="text-2xl font-bold">AD Story 로그인</p>
				                    <div class="modal-close cursor-pointer z-50">
				                        <svg class="fill-current text-black" xmlns="http://www.w3.org/2000/svg" width="18" height="18"
				                            viewBox="0 0 18 18">
				                            <path
				                                d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
				                            </path>
				                        </svg>
				                    </div>
				                </div>
				                <!--Body-->
								<form action="<%= request.getContextPath() %>/member/login"
								                      method="POST" 
								                      id="loginFrm">
								  <div class="mb-4">
								    <label class="block text-md font-light mb-2" for="username">아이디</label>
								    <input class="w-full bg-drabya-gray border-gray-500 appearance-none border p-4 font-light leading-tight focus:outline-none focus:shadow-outline" type="text" name="memberId" id="" placeholder="Username">
								  </div>
								  <div class="mb-4">
								    <label class="block text-md font-light mb-2" for="password">비밀번호</label>
								    <input class="w-full bg-drabya-gray border-gray-500 appearance-none border p-4 font-light leading-tight focus:outline-none focus:shadow-outline" type="password" name="password" id="" placeholder="Password">
								  </div>
								
								  <div class="flex items-center justify-between mb-5">
								     <a class="inline-block align-baseline font-light text-sm text-indigo-600 hover:text-indigo-500" href="#">
								            비밀번호 찾기
								    </a>
								    <button class="bg-indigo-600 hover:bg-blue-700 text-white font-light py-2 px-6 rounded focus:outline-none focus:shadow-outline" type="submit">
								            로그인
								    </button>
								 
								  </div>
								  <p class="text-center text-md font-light">아이디가 없으신가요? <a href="#" class="font-light text-md text-indigo-600">회원가입</a></p>
								</form>
				            </div>
				        </div>
				    </div>
				</div>
			</header>

			<aside class="sidenav overflow-x">
				<div class="sidenav__close-icon">
					<i class="fas fa-times sidenav__brand-close"></i>
				</div>
				<div class="LOGO" onclick="location.href='<%= request.getContextPath() %>/';" >
					<b>AD STORY</b>
				</div>
				
<% if(memberLoggedIn == null){ %> 
                <div class="profile_img_div" onclick="openModal()">
                     <img class="profile_img"
                     src="<%=request.getContextPath() %>/images/profile.png"
                     alt="프로필사진"> 
                     <br> 
                                          로그인 해주세요.
                </div>
<%} else { %>

                <div class="profile_img_div"">
                     <img class="profile_img"
                     src="<%=request.getContextPath() %>/images/<%
                     if("C".equals(memberLoggedIn.getMemberRole())){
                     %>profile_C.png<%
                     }else if("A".equals(memberLoggedIn.getMemberRole())){
                     %>profile_A.png<%
                     }else{
                     %>profile_U.png<%
                     }%>"alt="프로필사진"> 
                     
                     <br> 
                <%= memberLoggedIn.getName() %>
                </div>
<% } %>				


				<ul class="sidenav__list">
					<li class="sidenav__list-item"
						onclick="location.href='<%= request.getContextPath() %>/';">홈</li>
					<li class="sidenav__list-item"
						onclick="location.href='<%= request.getContextPath() %>/board/view';">게시판</li>
					<li class="sidenav__list-item">마이페이지</li>
					<li class="sidenav__list-item">회사소개</li>
					<li class="sidenav__list-item">광고하기</li>
					<li class="sidenav__list-item">포인트랭킹</li>
					<li class="sidenav__list-item">문의게시판</li>
					<li class="sidenav__list-item">공지사항</li>
				</ul>
			</aside>

			<main class="main">
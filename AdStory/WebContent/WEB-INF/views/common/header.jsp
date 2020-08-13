<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="member.model.vo.Member"%>
<%
    DecimalFormat Commas = new DecimalFormat("#,###");

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

<link rel="stylesheet"
    href="<%=request.getContextPath() %>/css/main_style.css" />

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
			</header>

			<aside class="sidenav overflow-x">
				<div class="sidenav__close-icon">
					<i class="fas fa-times sidenav__brand-close"></i>
				</div>
				<div class="LOGO" onclick="location.href='<%= request.getContextPath() %>/';" >
					<b>AD STORY</b>
				</div>
				
<% if(memberLoggedIn == null){ %> 
                <div class="profile_img_div border-b mx-4 py-10" 
                onclick="openModal()">
                     <img class="profile_img"
                     src="<%=request.getContextPath() %>/images/profile.png"
                     alt="프로필사진"> 
                     <br> 
                     <p class="font-bold text-xl">로그인 해주세요.</p>
                </div>
<%} else { %>

                <div class="profile_img_div border-b mx-4 py-10">
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
                     <p class="font-bold text-xl"><%= memberLoggedIn.getName() %></p>
                     
                     <%if("A".equals(memberLoggedIn.getMemberRole())){%>
                     <p class = "text-sm">관리자 계정</p>
                     <%} else if("C".equals(memberLoggedIn.getMemberRole())){ %>
                     <p class = "text-sm">기업회원</p>
                     <br />
                     <p class="text-indigo-700"><%= (String)Commas.format(memberLoggedIn.getPoint()) %>P</p>
                     <% } else { %>
                     <p class = "text-sm">일반회원</p>
                     <br />
                     <p class="text-indigo-700"><%= (String)Commas.format(memberLoggedIn.getPoint()) %>P</p>
                     <% } %>
                </div>
<% } %>				


				<ul class="sidenav__list">
					<%if(memberLoggedIn != null&&"A".equals(memberLoggedIn.getMemberRole())){%>
                    <li class="font-bold text-indigo-700 sidenav__list-item"
                    onclick="location.href='<%= request.getContextPath() %>/admin/main';">관리자 페이지 <i class="fas fa-tools"></i></li>
                    <br>
                    <% } %>	
                    
					<li class="sidenav__list-item"
						onclick="location.href='<%= request.getContextPath() %>/';">홈</li>
					
					<li class="sidenav__list-item">마이페이지</li>
					
					<li class="sidenav__list-item"
						onclick="location.href='<%= request.getContextPath() %>/board/list';">광고 게시판</li>
					
					<li class="sidenav__list-item">문의게시판</li>
					
					
				</ul>
			</aside>

			<main class="main">
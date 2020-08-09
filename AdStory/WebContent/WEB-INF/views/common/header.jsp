<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="icon" href="<%=request.getContextPath() %>/images/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="<%=request.getContextPath() %>/images/favicon.ico" type="image/x-icon">



    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300" rel="stylesheet">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
        integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/main_style.css" />
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
                    <button
                        class="float-right bg-transparent hover:bg-blue-500 text-gray-700 font-semibold hover:text-white py-2 px-4 border border-gray-700 hover:border-transparent rounded">
                        로그아웃
                    </button>
                </div>
            </header>

            <aside class="sidenav">
                <div class="sidenav__close-icon">
                    <i class="fas fa-times sidenav__brand-close"></i>
                </div>
                <div class="LOGO">
                    <b>AD STORY</b>
                </div>
                <div class="profile_img_div">
                    <img class="profile_img" src="<%=request.getContextPath() %>/images/profile.png" alt="프로필사진">
                    <br>
                    회원아이디
                </div>

                <ul class="sidenav__list">
                    <li class="sidenav__list-item" onclick="location.href='<%= request.getContextPath() %>/';">홈</li>
                    <li class="sidenav__list-item" onclick="location.href='<%= request.getContextPath() %>/board/view';">게시판</li>
                    <li class="sidenav__list-item">마이페이지</li>
                    <li class="sidenav__list-item">회사소개</li>
                    <li class="sidenav__list-item">광고하기</li>
                    <li class="sidenav__list-item">포인트랭킹</li>
                    <li class="sidenav__list-item">문의게시판</li>
                    <li class="sidenav__list-item">공지사항</li>
                </ul>
            </aside>

            <main class="main">
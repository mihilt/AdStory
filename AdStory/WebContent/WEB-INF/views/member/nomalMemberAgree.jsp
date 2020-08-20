<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="icon"
    href="<%=request.getContextPath() %>/images/favicon.ico"
    type="image/x-icon">
<link rel="shortcut icon"
    href="<%=request.getContextPath() %>/images/favicon.ico"
    type="image/x-icon">

<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/enrollStyle.css" />

<title>이용약관동의(일반)</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.5.1.js"></script>

<script>

	function allCheck(a) {
		if($(a).prop("checked")) {
			$("[name=chk]").prop("checked", true);
		} else {
			$("[name=chk]").prop("checked", false);
		}
	}// 모두 체크하기

	function oneCheck(a) {
		var allChkBox = $("[name=chkAll]");
		var chkBoxName = $(a).attr("name");

		if ($(a).prop("checked")) {
			checkBoxLength = $("[name=" + chkBoxName + "]").length;
			//전체체크박스 수(모두동의하기 체크박스 제외)
			checkedLength = $("[name=" + chkBoxName + "]:checked").length;
			//체크된 체크박스 수 
			if (checkBoxLength == checkedLength) {
				allChkBox.prop("checked", true);
				//전체체크박스수 == 체크된 체크박스 수 같다면 모두체크

			} else {
				allChkBox.prop("checked", false);

			}
		} else {
			allChkBox.prop("checked", false);
		}
	}

	$(function() {
		$("[name=chkAll]").click(function() {
			allCheck(this);
			//모두동의하기 체크박스 클릭시
		});
		$("[name=chk]").each(function() {
			$(this).click(function() {
				oneCheck(this);
			});
		});
	});
	

</script>
</head>
<body>

<form action="<%= request.getContextPath() %>/member/nomalEnroll" id="joinForm" name="agreeFrm">
			
			<br>
			<br>
			<br>
			<h1>AD Story</h1>
			<h2>이용약관 동의</h2>
			<br>
			
            <ul class="join_box">
                <li class="checkBox check01">
                    <ul class="clearfix">
                        <li>이용약관, 개인정보 수집 및 이용,
                            위치정보 이용약관(선택), 프로모션 안내
                            메일 수신(선택)에 모두 동의합니다.</li>
                        <li class="checkAllBtn">
                            <input type="checkbox" name="chkAll" id="chk" class="chkAll">
                        </li>
                    </ul>
                </li>
                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li>이용약관 동의(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" required> 
                        </li>
                    </ul>
                    <textarea name="" id="">여러분을 환영합니다.
AD Story 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 AD Story 서비스의 이용과 관련하여 네이버 서비스를 제공하는 AD Story 주식회사(이하 ‘AD Story’)와 이를 이용하는 AD Story서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 AD Story 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" required>
                        </li>
                    </ul>
 
                    <textarea name="" id="">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>위치정보 이용약관 동의(선택)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk">
                        </li>
                    </ul>
 
                    <textarea name="" id="">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                </li>
                <li class="checkBox check04">
                    <ul class="clearfix">
                        <li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk">
                        </li>
                    </ul>
                </li>
            </ul>
            <ul class="footBtwrap clearfix">
                <li><button class="fpmgBt1" onclick="location.href='<%= request.getContextPath() %>';">비동의</button></li>
                <li><input class="fpmgBt2" type="submit" value="동의" id="agree"/></li>
            </ul>
        </form>


</body>
</html>
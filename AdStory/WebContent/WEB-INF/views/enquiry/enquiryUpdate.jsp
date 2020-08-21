<%@page import="enquiry.model.vo.Enquiry" %>
<%@page import="member.model.service.MemberService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	Enquiry enquiry = (Enquiry)request.getAttribute("enquiry"); %>

<!-- 상단 nav -->
    <nav class="mb-10 text-center font-bold sm:flex sm:justify-center sm:items-center mt-4">
        <div class="flex flex-col sm:flex-row">
            <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="<%= request.getContextPath() %>">회사소개</a>
            <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="<%= request.getContextPath() %>/home/notice">공지사항</a>
            <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="<%= request.getContextPath() %>/home/pointRanking/today">포인트 랭킹</a>
            <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="<%= request.getContextPath() %>/home/manual">초보자 메뉴얼</a>
            <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="<%= request.getContextPath() %>/home/FAQ">자주 묻는 질문(FAQ)</a>
        </div>
    </nav>
<img id="enquiryImg" src="<%=request.getContextPath() %>/images/enquiry.jpg" alt="공지사항" />
<style>
#enquiryImg{
	width: 100%;
	height:400px;
	padding-left: 50px;
	padding-right: 50px;
}

section#board-container{width:600px; margin:0 auto; text-align:center;}
section#board-container h2{margin:10px 0; font-size: 30px;}
table#tbl-board-view{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
table#tbl-board-view th, table#tbl-board-view td { text-align: center;  padding: 8px;} 
table#tbl-board-view tr:nth-child(even) {background-color: #f5f0f0c0;}

#backBtn{
 background-color: rgba(233, 190, 0, 0.87);
  color: white;
  padding: 10px 10px;
  border-radius: 12px;
  border: none;
  cursor: pointer;
  width: 100px;
  opacity: 0.9;
  float: right;
  font-size: 15px;
}

#menuBtn{
 background-color: rgba(106, 199, 241, 0.842);
  color: white;
  padding: 8px 8px;
  border-radius: 12px;
  border: none;
  cursor: pointer;
  width: 100px;
  opacity: 0.9;
  font-size: 15px;

}
</style>
<script>

function enquiryValidate(){
	var $content = $("[name=enquiryContent]");
	if(/^(.|\n)+$/.test($content.val()) == false){
		alert("내용을 입력하세요");
		return false;
	}
	return true;
}
function enquiryView(){
	history.go(-1);
}
</script>
<section id="board-container">
<h2>문의사항 수정</h2>

<input type="button" value="목록 보기" id="backBtn" 
		   onclick="location.href='<%= request.getContextPath() %>/enquiry/elist';" />
		   <br /><br />
		   
<form action="<%=request.getContextPath() %>/enquiry/update" 
	  method="post">
	<input type="hidden" name="enquiryNo" value="<%= enquiry.getKey() %>" />
	<table id="tbl-board-view">
	<tr>
		<th>제 목</th>
		<td><input type="text" name="enquiryTitle" value="<%= enquiry.getTitle() %>" required></td>
	</tr>
	<tr>
		<th>내 용</th>
		<td><textarea rows="5" cols="50" name="enquiryContent"><%= enquiry.getContent() %></textarea></td>
	</tr>
	
	<tr>
		<th colspan="2">
			<input type="submit" value="수정하기" id = "menuBtn" onclick="return enquiryValidate();">
			<input type="button" value="취소" id = "menuBtn" onclick="enquiryView();">
		</th>
	</tr>
	
</table>
</form>
</section>

<br />
<br />
<br />
<br />
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
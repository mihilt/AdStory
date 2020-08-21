<%@page import="java.util.*" %>
<%@page import="enquiry.model.vo.Enquiry" %>
<%@page import="member.model.service.MemberService" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- 상단 nav -->
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
<%
	Enquiry eq = (Enquiry)request.getAttribute("enquiry");

%>
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
table#tbl-board-view th, table#tbl-board-view td { text-align: left;  padding: 15px;} 
table#tbl-board-view th { border-right:1px solid black;} 
table#tbl-board-view tr:nth-child(even) {background-color: #f2f2f2;}

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
  font-size: 15px;}
  
#enquiryAnswer{
  background-color: rgba(214, 214, 214, 0.589);
  height: 100px;
  width: 600px;
}
</style>
<section id="board-container">
	<h2>문의 사항</h2>
		<input type="button" value="목록 보기" id="backBtn" 
		   onclick="location.href='<%= request.getContextPath() %>/enquiry/elist';" />
		   <br /><br />
	<table id="tbl-board-view">
		<tr>
			<th>글번호</th>
			<td><%=eq.getKey() %></td>
		</tr>
		<tr>
			<th>제 목</th>
			<td><%=eq.getTitle() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=eq.getMemberId() %></td>
		</tr>
		
		<tr>
			<th>내 용</th>
			<td style="height: 200px;"><%=eq.getContent()%></td>
		</tr>
				
		<tr>
			<th>답변내용</th>
			<td style="height: 200px;"><%=eq.getAnswer()%></td>
		</tr>
					
	</table>
	<br /><br />
	<%--글작성자/관리자인경우 게시글 수정삭제버튼 보일수 있게 함 --%>
			<% if(memberLoggedIn!=null && 
					(eq.getMemberId().equals(memberLoggedIn.getMemberId())) ) { %>
			
					<input type="button" value="수정하기" id = "menuBtn" onclick="updateEnquiry()">
					<input type="button" value="삭제하기" id = "menuBtn" onclick="deleteEnquiry()">
				
			
			<%} %>
			
			
<% if(memberLoggedIn!=null && 
(eq.getMemberId().equals(memberLoggedIn.getMemberId())
		|| MemberService.ADMIN_MEMBER_ROLE.equals(memberLoggedIn.getMemberRole())) ) { %>
<form name="enquiryDelFrm" 
	  action="<%=request.getContextPath()%>/enquiry/delete" 
	  method="post">
	<input type="hidden" name="enquiryNo" value="<%=eq.getKey() %>" />
</form>
<script>


function updateEnquiry(){
	location.href="<%=request.getContextPath()%>/enquiry/update?enquiryNo=<%=eq.getKey()%>";
}
function deleteEnquiry(){
	if(!confirm('이 게시글을 정말 삭제하시겠습니까?')) return;
	$("[name=enquiryDelFrm]").submit();
}
</script>
<%} %>
	

<br /><br />
	
	<% if(MemberService.ADMIN_MEMBER_ROLE.equals(memberLoggedIn.getMemberRole())) { %>
	
	
		<p style="text-align: left; font-size: 20px;">답변작성</p>
	<div class="answer-container">
		<div class="answer-editor">
			<form action="<%= request.getContextPath() %>/enquiry/answer"
				  method="POST"
				  name="enquiryAnswerFrm">
				<input type="hidden" name="enquiryNo" value="<%= eq.getKey() %>" />
				<input type="hidden" name="updateStatus" value="<%= eq.getStatus() %>" />
				
				<textarea name="enquiryAnswer" 
						  id="enquiryAnswer" 
						  cols="60" rows="3"></textarea>
						  <br />
						  <br />
				<button type="submit" id="menuBtn">답변등록</button>
				<input type="button" value="삭제하기" id = "menuBtn" onclick="deleteEnquiry()">					  
			</form>
		</div>
		
		
	</div>
	
		<%} %>	
	
</section>
<script>

$("[name=enquiryAnswer]").submit(function(){
		
	var $textarea = $("#enquiryAnswer");
	if(/^(.|\n)+$/.test($textarea.val()) == false){
		alert("댓글 내용을 입력하세요.");
		return false;
	}
	
	return true;
});


</script>
<br />
<br />
<br />
<br />

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

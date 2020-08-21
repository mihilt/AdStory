<%@page import="java.util.*" %>
<%@page import="enquiry.model.vo.Enquiry" %>
<%@page import="member.model.service.MemberService" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	Enquiry eq = (Enquiry)request.getAttribute("enquiry");
%>
<div class = "max-w-screen-lg m-auto my-10">
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
			<th class = "text-center w-1/5">글번호</th>
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
			<td style="height: 200px;">
			<%if(null == eq.getAnswer()){ %>
			<p class = "text-red-700">아직 관리자가 답글을 달지 않았습니다.</p>
			<% } else { %>
			<%=eq.getAnswer()%>
			<% } %>
			</td>
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
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

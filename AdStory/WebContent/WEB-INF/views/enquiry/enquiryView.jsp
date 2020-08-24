<%@page import="enquiry.model.vo.Enquiry" %>
<%@page import="member.model.service.MemberService" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	Enquiry eq = (Enquiry)request.getAttribute("enquiry");
%>
<div class = "max-w-screen-lg m-auto my-10">

<style>
#enquiryImg{
	width: 200PX;
	height:100px;
	opacity: 0.45;
}
	
	section#board-container{width:90%; margin:0 auto; text-align:center;}
	section#board-container h2{margin:10px 0; font-size: 30px; padding-left:10px; float: left;}
	table#tbl-board-view{width:90%; margin:0 auto;  border-collapse:collapse; clear:both;  }
	table#tbl-board-view th { text-align: cnenter;  padding-top: 20px; padding-bottom: 20px; width:100px;}  
	table#tbl-board-view td { text-align: left;  padding-top: 20px; padding-bottom: 20px; padding-left: 20px; width:600px;} 
	table#tbl-board-view tr:nth-child(odd) {background-color: rgba(80, 199, 109, 0.13);}
	
	#backBtn{
	 background-color: white;
  color: rgba(233, 190, 0, 0.87);
  padding: 9px 9px;
  border-radius: 12px;
  border: 3px solid rgba(233, 190, 0, 0.87);
  cursor: pointer;
  width: 100px;
  opacity: 0.9;
	float: right;
  font-size: 17px;
	}
	
	#menuBtn{
	 background-color: white;
  color: rgba(36, 124, 58, 0.781);
  padding: 10px 10px;
  border-radius: 12px;
  border: 3px solid rgba(36, 124, 58, 0.5);
  cursor: pointer;
  width: 100px;
  opacity: 0.9;

	  font-size: 17px;
	
	
	}
	
	#menuBtn:hover{
	background-color: rgba(80, 199, 109, 0.4);
	color: white;
}

#backBtn:hover{
	background-color: rgba(233, 190, 0, 0.5);
	color: white;
}
  
#enquiryAnswer{
  background-color: rgba(214, 214, 214, 0.3);
  height: 100px;
  width: 600px;
}
</style>
<section id="board-container">
<img id="enquiryImg" src="<%=request.getContextPath() %>/images/enquiry.jpg" alt="공지사항" />
	<br />
	<h2>문의 사항</h2>
	<br /><br /><hr /><br /><br />
	<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.js"></script>
		<input type="button" value="목록 보기" id="backBtn" 
		   onclick="location.href='<%= request.getContextPath() %>/enquiry/elist';" />
		  <br /><br /><br /><br />
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
			<p class = "font-bold text-red-600">답변 대기중 입니다.</p>
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
	
	
		<p style="text-align: left; padding-left:20px; font-size: 20px;">답변작성</p>
		<hr /><br /><br />
	<div class="answer-container">
		<div class="answer-editor">
			<form action="<%= request.getContextPath() %>/enquiry/answer"
				  method="POST"
				  name="enquiryAnswerFrm">
				<input type="hidden" name="enquiryNo" value="<%= eq.getKey() %>" />
				<input type="hidden" name="updateStatus" value="<%= eq.getStatus() %>" />
				
				<textarea name="enquiryAnswer" 
						  id="enquiryAnswer" 
						  cols="60" rows="3" style="width: 650px; height: 200px;"></textarea>
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

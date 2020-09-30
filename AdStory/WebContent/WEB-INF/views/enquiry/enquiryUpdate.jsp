<%@page import="enquiry.model.vo.Enquiry" %>
<%@page import="member.model.service.MemberService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	Enquiry enquiry = (Enquiry)request.getAttribute("enquiry"); %>


<div class = "max-w-screen-lg m-auto my-10">
<style>
#enquiryImg{
	width: 200PX;
	height:100px;
	opacity: 0.45;
}
	
	section#board-container{width:90%; margin:0 auto; text-align:center;}
	section#board-container h2{margin:10px 0; font-size: 30px; float: left;}
	table#tbl-board-view{width:90%; margin:0 auto;  border-collapse:collapse; clear:both; border-top: 30px solid rgba(80, 199, 109, 0.13); }
	table#tbl-board-view th { text-align: cnenter;  padding-top: 20px; padding-bottom: 20px; width:100px;}  
	table#tbl-board-view td { text-align: left;  padding-top: 20px; padding-bottom: 20px; padding-left: 20px; width:600px;} 
	table#tbl-board-view tr:nth-child(even) {background-color: rgba(80, 199, 109, 0.13);}
	
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
	
	#con{
	height : 100px;
	width: 500px;
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
<img id="enquiryImg" src="<%=request.getContextPath() %>/images/enquiry.jpg" alt="공지사항" />
	<br />
<h2>문의사항 수정</h2>
<br /><br /><hr /><br /><br />
<input type="button" value="목록 보기" id="backBtn" 
		   onclick="location.href='<%= request.getContextPath() %>/enquiry/elist';" />
		   <br /><br /><br /><br />
		   
<form action="<%=request.getContextPath() %>/enquiry/update" 
	  method="post">
	<input type="hidden" name="enquiryNo" value="<%= enquiry.getKey() %>" />
	<table id="tbl-board-view">
	<tr>
		<th>제 목</th>
		<td><input type="text" name="enquiryTitle" style="width: 200px; height: 40px; border-bottom: 1px solid black" value="<%= enquiry.getTitle() %>" required></td>
	</tr>
	<tr>
		<th>내 용</th>
		<td><textarea rows="5" cols="50" name="enquiryContent" style="width: 650px; height: 400px;"><%= enquiry.getContent() %></textarea></td>
	</tr>
	
		
</table>
<br /><br />
<input type="submit" value="수정하기" id = "menuBtn" onclick="return enquiryValidate();">
			<input type="button" value="취소" id = "menuBtn" onclick="enquiryView();">
</form>
</section>
</div>
<br />
<br />
<br />
<br />
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
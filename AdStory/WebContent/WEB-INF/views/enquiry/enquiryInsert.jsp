<%@page import="enquiry.model.vo.Enquiry" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<% Enquiry enquiry = (Enquiry)request.getAttribute("enquiry"); %>


<div class = "max-w-screen-lg m-auto my-10">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main_style.css" />
	<script>
	function enquiryValidate(){
		//내용을 작성하지 않은 경우에 대한 유효성 검사하세요.
		//공백만 작성한 경우도 폼이 제출되어서는 안됨.
		var $title = $("[name=title]");
		var $content = $("[name=content]");
	
		if(/^.+$/.test($title.val()) == false){
			alert("제목을 입력하세요.");
			return false;
		}
		if(/^(.|\n)+$/.test($content.val()) == false){
			alert("내용을 입력하세요.");
			return false;
		}
		return true;
	}
	</script>
	
<style>
#enquiryImg{
	width: 200PX;
	height:100px;
	opacity: 0.45;
}
	
	section#board-container{width:90%; margin:0 auto; text-align:center;}
	section#board-container h2{margin:10px 0; font-size: 30px; float: left;}
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
	
	<section id="board-container">
	<img id="enquiryImg" src="<%=request.getContextPath() %>/images/enquiry.jpg" alt="공지사항" />
		<br />
	<h2>문의사항 작성</h2>
	<br /><br /><br /><hr /><br /><br />
	<form action="<%=request.getContextPath() %>/enquiry/insert" 
		  method="post"
		 >
		
		<table id="tbl-board-view">
		<tr>
			<th>제 목</th>
			<td><input type="text" name="enquiryTitle" style="width: 500px; height: 40px;" required></td>
		</tr>
			<tr>
			<th>작성자</th>
			<td>
				
				<input type="hidden" name="enquiryWriter" 
					   value="<%= memberLoggedIn.getKey() %>"/>
					   			<%= memberLoggedIn.getMemberId() %>
			</td>
			</tr>
		<tr>
			<th>내 용</th>
			<td><textarea rows="5" cols="40" id = "con" name="enquiryContent" style="width: 650px; height: 400px;"></textarea></td>
		</tr>
		
	</table>
	<br /><br />
	<input type="submit" value="등록하기" id= "menuBtn"
					   onclick="return enquiryValidate();">
	<input type="button" value="취소" id="backBtn" 
			   onclick="location.href='<%= request.getContextPath() %>/enquiry/elist';" />
	</form>
	<br />
	<br />
	<br />
	
	</section>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<%@page import="java.util.List"%>
<%@page import="board.model.vo.BoardCategory"%>
<%@page import="board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Board board = (Board)request.getAttribute("board");
List<BoardCategory> categoryList = (List<BoardCategory>) request.getAttribute("categoryList");
%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>    
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css" />
<style>
span#fname {
	position: absolute;
	left: 92px;
	top: 9px;
	width: 200px;
	background: #f5f5f5; 
}

#delFile + label {
	font-size: .8em;
	position: relative; 
	top: -3px;
}


</style>
<script>
$(function(){
	$("[name=upFile]").change(function(){
		//파일을 선택한 경우
		if($(this).val() != ""){
			$("#fname").hide();
		}
		//파일선택을 취소한 경우
		else {
			$("#fname").show();
		}
	});
});


function boardValidate(){
	var $content = $("[name=content]");
	if(/^(.|\n)+$/.test($content.val()) == false){
		alert("내용을 입력하세요");
		return false;
	}
	return true;
}
function boardView(){
	history.go(-1);
}
</script>
<section id="board-container">
<h2>게시판 수정</h2>
<form action="<%=request.getContextPath() %>/board/update" 
	  method="post"
	  enctype="multipart/form-data">
	<input type="hidden" name="boardNo" value="<%= board.getKey() %>" />
	<input type="hidden" name="userKey" value="<%=board.getUserKey()%>"/>
	<table id="tbl-board-view">
	<tr>
				<th>카테고리</th>
				<td><select name="categoryKey" id="" >
						<%
							for (BoardCategory b : categoryList) {
						%>
						<option value="<%=b.getKey()%>" <%=board.getCategoryKey()==b.getKey() ? "selected" : ""%> %><%=b.getCategoryName()%></option>
						<%
							}
						%>
				</select></td>
			</tr>
			<tr>
				<th>제 목</th>
				<td><input type="text" name="title" value="<%=board.getTitle()%>" ></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="" value="<%=board.getRefMemberName()%>" readonly />
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
		<td style="position:relative;">
			<!-- 보안상 이유로 input:file의 value속성은 임의 변경할 수 없다. -->
			<input type="file" name="upFile" value="">
			<span id="fname"><%= board.getOriginalFileName() != null ? board.getOriginalFileName() : "" %></span>
			
			<% 	if(board.getOriginalFileName() != null){ %>
			<br />
			<!-- delFile=on -->
			<input type="checkbox" name="delFile" id="delFile" />
			<label for="delFile">파일삭제</label>
			<% 	} %>
		</td>
			</tr>
			<tr>
				<th>내 용</th>
				<td><textarea rows="5" cols="40" name="content" ><%=board.getContent()%></textarea></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="point" value="<%=board.getPoint()%>" readonly/></td>
			<tr>
				<th>단가</th>
				<td>
				<input type="text" name="clickPrice" value="<%=board.getClickPrice()%>" readonly/>
				<%-- <select name="clickPrice">
						<option value="10" <%=board.getClickPrice()==10 ? "selected" : "" %>>10원</option>
						<option value="20" <%=board.getClickPrice()==20 ? "selected" : "" %>>20원</option>
						<option value="30" <%=board.getClickPrice()==30 ? "selected" : "" %>>30원</option>
				</select> --%>
				</td>
			</tr>
			<tr>
				<th>url</th>
				<td><input type="text" name="url" value="<%=board.getUrl() %>" readonly/></td>
			</tr>
			<tr>
			
				
			</tr>
</table>
<input type="submit" value="수정하기" onclick="return boardValidate();">
			<input type="button" value="취소" onclick="boardView();">
</form>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

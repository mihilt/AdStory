<%@page import="board.model.vo.BoardCategory"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
	List<BoardCategory> categoryList = (List<BoardCategory>) request.getAttribute("categoryList");
%>
<script>
	function boardValidate() {
		//내용을 작성하지 않은 경우에 대한 유효성 검사하세요.
		//공백만 작성한 경우도 폼이 제출되어서는 안됨.
		var $boardTitle = $("[name=title]");
		var $boardContent = $("[name=content]");

		if (/^.+$/.test($boardTitle.val()) == false) {
			alert("제목을 입력하세요.");
			return false;
		}
		if (/^(.|\n)+$/.test($boardContent.val()) == false) {
			alert("내용을 입력하세요.");
			return false;
		}
		return true;
	}
</script>
<section id="board-container">
	<h2>게시판 작성</h2>
	<form action="<%=request.getContextPath()%>/board/insert"
		method="post" enctype="multipart/form-data">
			<input type="hidden" name="userKey" value="<%=memberLoggedIn.getKey()%>" />
			<input type="hidden" name="memberId" value="<%=memberLoggedIn.getMemberId()%>" />
			<input type="hidden" name="userPoint" value="<%=memberLoggedIn.getPoint()%>" />
		<table id="tbl-board-view">
			
			<tr>
				<th>카테고리</th>
				<td><select name="categoryKey" id="">
						<%
							for (BoardCategory b : categoryList) {
						%>
						<option value="<%=b.getKey()%>"><%=b.getCategoryName()%></option>
						<%
							}
						%>
				</select></td>
			</tr>
			<tr>
				<th>제 목</th>
				<td><input type="text" name="title" required></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="" value="<%=memberLoggedIn.getName()%>" readonly />
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="upFile"></td>
			</tr>
			<tr>
				<th>내 용</th>
				<td><textarea rows="5" cols="40" name="content"></textarea></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="point" /></td>
			<tr>
				<th>단가</th>
				<td><select name="clickPrice">
						<option value="10">10원</option>
						<option value="20">20원</option>
						<option value="30">30원</option>
				</select></td>
			</tr>
			<tr>
				<th>url</th>
				<td><input type="text" name="url" /></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="등록하기"
					onclick="return boardValidate();"></th>
			</tr>
		</table>
	</form>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
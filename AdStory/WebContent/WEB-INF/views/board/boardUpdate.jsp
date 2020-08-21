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
#drop {
	border: 10px dashed #ccc;
	/* width: 300px; */
	height: 400px;
}

#thumbnails {
	width: 100%;
	height: 100%;
}

.drag-over {
	background-color: grey;
}

.thumb {
	width: 200px;
	padding: 5px;
	float: left;
}

.thumb {
overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 300px;
            height: 300px;
}

.thumb>.close {
	position: absolute;
	background-color: red;
	cursor: pointer;
}
span#fname {
	position: absolute;
	left: 105px;
	top: 50px;
	/* width: 200px; */
	
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
<div class="m-12">

	<p class="text-3xl border-b-2 mb-10">게시글 수정</p>
<div class="px-20">

	<!-- 	<button id="btnSubmit">메인이미지 등록</button> -->

	<form id="boardInsertFrm"
		action="<%=request.getContextPath()%>/board/update" method="post"
		enctype="multipart/form-data">
<input type="hidden" name="boardNo" value="<%= board.getKey() %>" />
	<input type="hidden" name="userKey" value="<%=board.getUserKey()%>"/>





		<div class="inline-block relative w-64">

			<label
				class="block uppercase tracking-wide text-gray-700 text-xl font-bold mb-2"
				for="categoryKey"> 카테고리 </label> <select
				class="mb-6 block appearance-none w-full bg-white border border-gray-400 hover:border-gray-500 py-3 px-4 rounded shadow leading-tight focus:outline-none focus:shadow-outline"
				name="categoryKey" id="">
				<%
					for (BoardCategory b : categoryList) {
				%>
				<option value="<%=b.getKey()%>" <%=board.getCategoryKey()==b.getKey() ? "selected" : ""%> ><%=b.getCategoryName()%></option>
				<%
					}
				%>
			</select>
			<!-- <div
				class="pointer-events-none absolute inset-y-1 right-0 flex items-center px-2 text-gray-700">
				<svg class="fill-current h-8 w-8" xmlns="http://www.w3.org/2000/svg"
					viewBox="0 0 20 20">
					<path
						d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" /></svg>
			</div> -->
		</div>
		<div class="flex-mx-3 mb-6">
			<label
				class="block uppercase tracking-wide text-gray-700 text-xl font-bold mb-2"
				for="title"> 제목 </label> <input
				class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
				type="text" name="title"  value="<%=board.getTitle()%>">

		</div>
		<div class="flex-mx-3 mb-6">
			<label
				class="block uppercase tracking-wide text-gray-700 text-xl font-bold mb-2"
				for="title"> 작성자 </label> <input
				class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none "
				type="text" name="" value="<%=board.getRefMemberName()%>" readonly>

		</div>
		<div class="flex-mx-3 mb-6">
			<label
				class="block uppercase tracking-wide text-gray-700 text-xl font-bold mb-2"
				for="title"> 내용 </label>
			<textArea
				class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
				rows="10" cols="40" name="content" ><%=board.getContent()%></textArea>

		</div>

		<div class="flex flex-wrap -mx-3 mb-6">
		<div class="w-full md:w-1/2 px-3">
			<label
				class="block uppercase tracking-wide text-gray-700 text-xl font-bold mb-2"
				for="title"> 가격 </label> <input
				class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none"
				type="text" name="point" value="<%=board.getPoint()%>" readonly>

		</div>
		<div class="w-full md:w-1/2 px-3">
			<label
				class="block uppercase tracking-wide text-gray-700 text-xl font-bold mb-2"
				for="clickPrice"> 단가 </label> 
			<input type="text" name="clickPrice" 
			class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none" 
			value="<%=board.getClickPrice()%>" readonly/>
		</div>
		</div>
		
		<div class="flex-mx-3 mb-6">
			<label
				class="block uppercase tracking-wide text-gray-700 text-xl font-bold mb-2"
				for="url"> URL </label> <input
				class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
				type="text" name="url" required value="<%=board.getUrl() %>">

		</div>
		<div class="relative flex-mx-3 mb-6">
			<label
				class="block uppercase tracking-wide text-gray-700 text-xl font-bold mb-2"
				for="title"> 첨부파일 </label> <input
				class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
				type="file" name="upFile">
				<span id="fname" class=" bg-gray-200 text-gray-700 focus:bg-white"><%= board.getOriginalFileName() != null ? board.getOriginalFileName() : "" %></span>
			
			<% 	if(board.getOriginalFileName() != null){ %>
			<br />
			<!-- delFile=on -->
			<input type="checkbox" name="delFile" id="delFile" />
			<label for="delFile">파일삭제</label>
			<% 	} %>

		</div>
		<div class="text-center">
		<input class="  bg-transparent hover:bg-blue-500 text-gray-700 font-semibold hover:text-white py-2 px-4 border border-gray-700 hover:border-transparent rounded" type="submit" value="수정하기" onclick="return boardValidate();">
		<input class="  bg-transparent hover:bg-blue-500 text-gray-700 font-semibold hover:text-white py-2 px-4 border border-gray-700 hover:border-transparent rounded" type="button" value="닫기" onclick="boardView();">
</div>

	</form>
</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

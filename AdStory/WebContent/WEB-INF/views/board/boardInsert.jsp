<%@page import="oracle.net.aso.b"%>
<%@page import="board.model.vo.BoardCategory"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
<%
	List<BoardCategory> categoryList = (List<BoardCategory>) request.getAttribute("categoryList");
%>
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
</style>
<div class="m-12">

	<p class="text-3xl border-b-2 mb-10">게시글 작성</p>
<div class="px-20">

	<!-- 	<button id="btnSubmit">메인이미지 등록</button> -->

	<form id="boardInsertFrm"
		action="<%=request.getContextPath()%>/board/insert" method="post"
		enctype="multipart/form-data">

		<input type="file" name="upMainImage" id="upMainImage"
			style="display: none;"> <input type="hidden" name="userKey"
			value="<%=memberLoggedIn.getKey()%>" /> <input type="hidden"
			name="memberId" value="<%=memberLoggedIn.getMemberId()%>" /> <input
			type="hidden" name="userPoint" value="<%=memberLoggedIn.getPoint()%>" />





		<div class="inline-block relative w-64">

			<label
				class="block uppercase tracking-wide text-gray-700 text-xl font-bold mb-2"
				for="categoryKey"> 카테고리 </label> <select
				class="mb-6 block appearance-none w-full bg-white border border-gray-400 hover:border-gray-500 py-3 px-4 rounded shadow leading-tight focus:outline-none focus:shadow-outline"
				name="categoryKey" id="">
				<%
					for (BoardCategory b : categoryList) {
				%>
				<option value="<%=b.getKey()%>"><%=b.getCategoryName()%></option>
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
				type="text" name="title" required placeholder="제목을 입력해주세요">

		</div>
		<div class="flex-mx-3 mb-6">
			<label
				class="block uppercase tracking-wide text-gray-700 text-xl font-bold mb-2"
				for="title"> 작성자 </label> <input
				class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none "
				type="text" name="" value="<%=memberLoggedIn.getName()%>" readonly>

		</div>
		<div id="drop" class="flex-mx-3 mb-6">
			
				메인이미지 drag & drop
				<div id="thumbnails"></div>
			
		</div>
		<div class="flex-mx-3 mb-6">
			<label
				class="block uppercase tracking-wide text-gray-700 text-xl font-bold mb-2"
				for="title"> 내용 </label>
			<textArea
				class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
				rows="10" cols="40" name="content" required placeholder="내용을 입력해주세요"></textArea>

		</div>

		<div class="flex flex-wrap -mx-3 mb-6">
		<div class="w-full md:w-1/2 px-3">
			<label
				class="block uppercase tracking-wide text-gray-700 text-xl font-bold mb-2"
				for="title"> 가격 </label> <input
				class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
				type="text" name="point" required placeholder="가격을 입력해주세요">

		</div>
		<div class="inline-block relativew-full md:w-1/2 px-3">
			<label
				class="block uppercase tracking-wide text-gray-700 text-xl font-bold mb-2"
				for="clickPrice"> 단가 </label> <select
				class="block appearance-none w-full bg-white border border-gray-400 hover:border-gray-500 py-3 px-4 rounded shadow leading-tight focus:outline-none focus:shadow-outline"
				name="clickPrice" id="">
				<option value="10">10원</option><i class="fas fa-angle-down"></i>
				<option value="20">20원</option>
				<option value="30">30원</option>
			</select>
			<!-- <div
				class="pointer-events-none absolute inset-y-1 right-0 flex items-center px-2 text-gray-700">
				<svg class="fill-current h-8 w-8" xmlns="http://www.w3.org/2000/svg"
					viewBox="0 0 20 20">
					<path
						d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" /></svg>
			</div> -->
		</div>
		</div>
		
		<div class="flex-mx-3 mb-6">
			<label
				class="block uppercase tracking-wide text-gray-700 text-xl font-bold mb-2"
				for="url"> URL </label> <input
				class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
				type="text" name="url" required placeholder="url을 입력해주세요">

		</div>
		<div class="flex-mx-3 mb-6">
			<label
				class="block uppercase tracking-wide text-gray-700 text-xl font-bold mb-2"
				for="title"> 첨부파일 </label> <input
				class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
				type="file" name="upFile">

		</div>
		<div class="text-center">
		<input class="  bg-transparent hover:bg-blue-500 text-gray-700 font-semibold hover:text-white py-2 px-4 border border-gray-700 hover:border-transparent rounded" type="submit" value="등록하기" onclick="return boardValidate();">
</div>

	</form>
</div>
</div>
<script>
	var uploadFile;
	var $drop = $("#drop");
	console.log("droptext", $drop.html());

	$(function() {
		$drop.on("dragenter", function(e) { //드래그 요소가 들어왔을떄
			$(this).addClass('drag-over');
		}).on("dragleave", function(e) { //드래그 요소가 나갔을때
			$(this).removeClass('drag-over');
		}).on("dragover", function(e) {
			e.stopPropagation();
			e.preventDefault();
		}).on('drop', function(e) { //드래그한 항목을 떨어뜨렸을때
			e.preventDefault();
			$(this).removeClass('drag-over');
			uploadFile = e.originalEvent.dataTransfer.files; 
			var ext = uploadFile[0].name.split('.').pop().toLowerCase();
	        if ($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
	            alert('이미지 파일만 업로드 가능합니다.');
				return;
	        }
			//드래그&드랍 항목
			$("#upMainImage").prop("files", uploadFile);
			preview(uploadFile[0]); //미리보기 만들기
		});
	});

	function preview(file) {
		var reader = new FileReader();
		reader.onload = (function(f) {
			return function(e) {
				var div = '<div class="thumb"> \
<div class="close" data-idx="' + 0 + '">X</div> \
<img src="'
						+ e.target.result
						+ '" title="'
						+ escape(f.name)
						+ '"/> \
</div>';
				$("#thumbnails").html(div);
			};
		})(file);
		reader.readAsDataURL(file);
	}
	$("#thumbnails").on("click", ".close", function(e) {
		var $target = $(e.target);
		var idx = $target.attr('data-idx');
		uploadFile = [];//삭제된 항목은 업로드하지 않기 위해 플래그 생성
		$target.parent().remove(); //프리뷰 삭제
	});
	function boardValidate(e) {
		//내용을 작성하지 않은 경우에 대한 유효성 검사하세요.
		//공백만 작성한 경우도 폼이 제출되어서는 안됨.
		var $boardTitle = $("[name=title]");
		var $boardContent = $("[name=content]");
		//formData = $('#boardInsertFrm');
		//console.log($('#boardInsertFrm').serialize());

		//formData = formElement.getFormData();
		console.log($('#boardInsertFrm').serializeArray());

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
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
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
	min-height: 400px;
}


.drag-over {
	background-color: grey;
}


.thumb>.close {
	position: absolute;
	float:right;
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




<div class="max-w-screen-lg m-auto">
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
		<div id="drop" class="my-10 w-1/2">
			
				
				<div  id="thumbnails" 
				style=" width:-webkit-fill-available;">
				    <div class = "m-32 text-center">
	                    <p>메인이미지를</p>
	                    <p>Drag and Drop</p>
	                    <p>해주세요</p>
                    </div>
                </div>
			
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
				for="title"> 사용 포인트 </label> 
				<input	class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
				type="text" 
				name="point" 
				required 
				placeholder="사용 포인트를 입력해주세요">
		</div>
		<div class="inline-block relativew-full md:w-1/2 px-3">
			<label
				class="block uppercase tracking-wide text-gray-700 text-xl font-bold mb-2"
				for="clickPrice"> 클릭단가 </label>
				<input  class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                type="text" 
                name="clickPrice" 
                required 
                placeholder="클릭단가를 입력해주세요"> 

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
					<img src="'+ e.target.result+ '" title="'+ escape(f.name)+ '"/> \
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
		
	    const $point = $("[name=point]");
	    const $clickPrice = $("[name=clickPrice]");

		console.log($('#boardInsertFrm').serializeArray());
		
        if (/^.+$/.test($point.val()) == false) {
            alert("사용 포인트를 입력하세요.");
            return false;
        }
      
        if (/^(.|\n)+$/.test($clickPrice.val()) == false) {
            alert("클릭단가를 입력하세요.");
            return false;
        }
		
	    if($point.val() < 10000){
	        alert("10,000p 이상부터 게시글 등록이 가능합니다.")
	        return false;
	    }
	    
	    if($point.val() % 1000 != 0){
	        alert("1,000p 단위로 게시글 등록을 해야합니다.")
	        return false;
	    }
	    
	    if($clickPrice.val() % 100 != 0 || $clickPrice.val() == 0){
	        alert("100p 단위로 클릭단가를 설정 해야합니다.")
	        return false;
	    }

       if($point.val() % $clickPrice.val() != 0){
            alert("사용 포인트를 클릭단가로 나누었을 때 나머지가 생기면 안됩니다.")
            return false;
        }
	    
	    if($clickPrice.val() > $point.val()){
	    	alert("사용 포인트보다 클릭 단가가 더 높습니다.")
	    	return false;
	    }

	    
	    if($point.val() > <%=memberLoggedIn.getPoint() %>){
	        alert("보유하신 포인트보다 많은 포인트를 사용하실 수 없습니다.")
	        return false;
	    }
	    

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
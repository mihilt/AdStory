<%@page import="java.text.DecimalFormat"%>
<%@page import="board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
	Board b = (Board) request.getAttribute("board");
%>
<script>
function fileDownload(oName, rName){
	//ie버젼을 위한 %인코딩처리
	oName = encodeURIComponent(oName);
	
	location.href = "<%=request.getContextPath()%>/board/fileDownload?oName="+oName+"&rName="+rName;
}
function complete(){
	alert("이미 신청완료한 광고입니다!");
}
$(function(){
	<%if (memberLoggedIn != null && memberLoggedIn.getMemberRole().equals("U")) {%>
	var param = {
			userKey : '<%=memberLoggedIn.getKey()%>',
			postKey : '<%=b.getKey()%>'
		}
		
		$.ajax({
			url : "<%=request.getContextPath()%>/text/test.do",
			//data : "name=honggd&age=30",
			data : param,
			method : "GET",
			beforeSend : function() {
				//요청전 처리함수
				console.log("beforeSend!");
			},
			success : function(data) {
				console.log(data);
				//처리 성공시 호출 함수
				if (data=="1") {
					//신청완료로 바뀌고
					$("#applyBtn").text("신청완료");
					//클릭안되게
					$("#applyBtn").attr("onclick","complete();");
				}

			},
			error : function(xhr, textStatus, err) {
				//처리시 에러가 발생하면 호출되는 함수
				console.log(xhr, textStatus, err);
			},
			complete : function() {
				//처리성공/실패와 상관없이 무조건 호출되는 함수
				console.log("complete!");
			}

		});
<%}%>
	});
</script>

<nav
	class="category-menu sm:flex sm:justify-center sm:items-center mt-4">
	<div class="flex flex-col sm:flex-row">
		<a class="mt-3 text-gray-600 hover:underline sm:mx-3 sm:mt-0" href="#">전체</a>
		<a class="mt-3 text-gray-600 hover:underline sm:mx-3 sm:mt-0" href="#">건강식품</a>
		<a class="mt-3 text-gray-600 hover:underline sm:mx-3 sm:mt-0" href="#">화장품&미용</a>
		<a class="mt-3 text-gray-600 hover:underline sm:mx-3 sm:mt-0" href="#">가전제품</a>
		<a class="mt-3 text-gray-600 hover:underline sm:mx-3 sm:mt-0" href="#">생활용품</a>
		<a class="mt-3 text-gray-600 hover:underline sm:mx-3 sm:mt-0" href="#">교육</a>
		<a class="mt-3 text-gray-600 hover:underline sm:mx-3 sm:mt-0" href="#">요식업</a>
	</div>
</nav>
<section id="board-container">
	<h3>
		번호 :
		<%=b.getKey()%></h3>

	<h3>
		카테고리 :
		<%=b.getRefBoardCategoryName()%></h3>
	<h2><%=b.getTitle()%></h2>
	<h3>
		작성자 :
		<%=b.getRefMemberName()%></h3>
	<p><%=b.getContent()%></p>
	<h3>첨부파일</h3>
	<%
		if (b.getOriginalFileName() != null) {
	%>
	<a
		href="javascript:fileDownload('<%=b.getOriginalFileName()%>','<%=b.getRenamedFileName()%>');">
		<img alt="첨부파일" src="<%=request.getContextPath()%>/images/file.png"
		width=16px> <%=b.getOriginalFileName()%>
	</a>
	<%
		}
	%>
	<%
		if (memberLoggedIn != null && memberLoggedIn.getMemberRole().equals("U")) {
	%>
	<button id="applyBtn"
		class="float-right bg-transparent hover:bg-blue-500 text-gray-700 font-semibold hover:text-white py-2 px-4 border border-gray-700 hover:border-transparent rounded"
		onclick="location.href='<%=request.getContextPath()%>/board/apply?userKey=<%=memberLoggedIn.getKey()%>&postKey=<%=b.getKey()%>';">신청하기</button>

	<%
		}
	%>
</section>





<%@ include file="/WEB-INF/views/common/footer.jsp"%>
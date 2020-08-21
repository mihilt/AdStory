<%@page import="board.model.vo.BoardCategory"%>
<%@page import="board.model.vo.BoardComment"%>
<%@page import="member.model.service.MemberService"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v1.8.0/dist/alpine.js"
	defer></script>
<%
	Board b = (Board) request.getAttribute("board");
List<BoardComment> commentList 
= (List<BoardComment>)request.getAttribute("commentList"); 
List<BoardCategory> categoryList = (List<BoardCategory>)request.getAttribute("categoryList");
%>

<%-- <link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/board.css" /> --%>
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
		<a
			class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0"
			href="<%=request.getContextPath()%>/board/list">전체</a>
		<%if(categoryList != null){
		for(BoardCategory c : categoryList){
		%>
		<a
			class="<%=c.getKey()==b.getCategoryKey()?"text-blue-400 ":"text-gray-700 hover:text-blue-700 " %> mt-3 hover:underline sm:mx-3 sm:mt-0"
			href="<%=request.getContextPath()%>/board/finder?searchType=category&searchKeyword=<%=c.getKey()%>"><%= c.getCategoryName()%></a>
		<%} }%>
	</div>
</nav>
<div class="m-12">

	<p class="text-3xl border-b-2 mb-10"><%=b.getTitle()%></p>
	<p class=" font-bold text-base mb-10">
		기업명
		<%=b.getRefMemberName()%>
		<i class="fas fa-grip-lines-vertical"></i>
		<%=b.getEnrollDate()%>
		<%--관리자인경우에만 게시글 수정삭제버튼 보일수 있게 함 --%>
		<% if(memberLoggedIn!=null && 
				MemberService.ADMIN_MEMBER_ROLE.equals(memberLoggedIn.getMemberRole())){ %>
		<i class="fas fa-grip-lines-vertical"></i> <input type="button"
			value="수정" onclick="updateBoard()"> <i
			class="fas fa-grip-lines-vertical"></i> <input type="button"
			value="마감" onclick="deleteBoard()">


		<%} %>
		
	<%
		if (memberLoggedIn != null && memberLoggedIn.getMemberRole().equals("U")) {
	%>
	<button id="applyBtn"
		class="float-right bg-white hover:bg-gray-100 text-gray-800 font-semibold py-1 px-2 border border-gray-400 rounded shadow"
		onclick="location.href='<%=request.getContextPath()%>/board/apply?userKey=<%=memberLoggedIn.getKey()%>&postKey=<%=b.getKey()%>';">신청하기</button>

	<%
		}
	%>
	</p>
	<div class="px-20">
		<div class="text-center bg-gray-200">
			<%=b.getContent() %>
			<div class="bottom-of-main"></div>
		</div>

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
		<hr style="margin-top: 30px;" />


		<form action="<%= request.getContextPath() %>/board/comment/insert"
			method="POST" name="boardCommentFrm">

			<input type="hidden" name="postKey" value="<%= b.getKey() %>" /> <input
				type="hidden" name="userKey"
				value="<%= memberLoggedIn != null ? memberLoggedIn.getKey() : ""%>" />
			<input type="hidden" name="commentLevel" value="1" /> <input
				type="hidden" name="commentRef" value="0" />

			<div class="flex items-center rounded border-teal-500 py-2">
				<textArea name="content" id="boardCommentContent"
					class="mr-8 shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
					rows="3" placeholder="댓글을 입력해주세요"></textArea>
				<button
					class="flex-shrink-0 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
					type="submit" id="btn-insert">댓글달기</button>

			</div>
		</form>
		<div>
			<% 	
			if(commentList != null && !commentList.isEmpty()) {
				for(BoardComment bc : commentList) {
					if(bc.getCommentLevel() == 1){
		%>

			<div class="level1 my-4 <%=bc.getStatus().equals("A")?"bg-gray-100":"" %>" >
				<div >
					<sub class="comment-writer"> <%= bc.getRefMemberName()%> <i
						class="fas fa-grip-lines-vertical"></i>
					</sub> <sub class="comment-date"> <%= bc.getCommentDate() %>
					</sub> <br />
					<%=bc.getStatus().equals("A") ?"관리자가 가린 댓글입니다.": bc.getContent() %>
				<sub class="float-right">
					<button class="btn-reply bg-white hover:bg-gray-100 text-gray-800 font-semibold py-4 px-1 border border-gray-400 rounded shadow" value="<%= bc.getKey() %>">답글등록</button>
					<%-- 삭제버튼 추가 : 관리자 또는 작성자 본인 --%>
					<%if(memberLoggedIn!=null 
							&& (MemberService.ADMIN_MEMBER_ROLE.equals(memberLoggedIn.getMemberRole()) 
									|| bc.getUserKey()==(memberLoggedIn.getKey()) )){%>
					<button class="btn-delete bg-white hover:bg-gray-100 text-gray-800 font-semibold py-4 px-1 border border-gray-400 rounded shadow" value="<%=bc.getKey()%>">삭제</button>
					<% } %>
				</sub>
				</div>
			</div>
			<hr style="" />
			<%
					} else {
		%>

			<div class="level2 my-4 pl-8 <%=bc.getStatus().equals("A")?"bg-gray-100":"" %>">
				<div >
					<sub class="comment-writer"> <%= bc.getRefMemberName()%> <i
						class="fas fa-grip-lines-vertical"></i>
					</sub> <sub class="comment-date"> <%= bc.getCommentDate() %>
					</sub> <br />
					<%=bc.getStatus().equals("A") ?"관리자가 가린 댓글입니다.": bc.getContent() %>
				
				<sub class="float-right">
					<%-- 삭제버튼 추가 : 관리자 또는 작성자 본인 --%>
					<%if(memberLoggedIn!=null 
							&& (MemberService.ADMIN_MEMBER_ROLE.equals(memberLoggedIn.getMemberRole()) 
									|| bc.getUserKey()==(memberLoggedIn.getKey()) )){%>
					<button class="btn-delete bg-white hover:bg-gray-100 text-gray-800 font-semibold py-4 px-1 border border-gray-400 rounded shadow" value="<%=bc.getKey()%>">삭제</button>
					<% } %>
				</sub>
				</div>
			</div>
			<hr style="" />

			<%
					}
				}
			} 
		%>
		</div>


		

	</div>
</div>
<section id="board-container">




	<% if(memberLoggedIn!=null && 
			MemberService.ADMIN_MEMBER_ROLE.equals(memberLoggedIn.getMemberRole()) ){ %>
	<form name="boardDelFrm"
		action="<%=request.getContextPath()%>/board/delete" method="post">
		<input type="hidden" name="boardNo" value="<%=b.getKey() %>" />
		<input type="hidden" name="role" value="<%=memberLoggedIn.getMemberRole() %>" />
	</form>
	<script>
function updateBoard(){
	location.href="<%=request.getContextPath()%>/board/update?boardNo=<%=b.getKey()%>";
	
}
function deleteBoard(){
	if(!confirm('이 게시글을 정말 마감하시겠습니까?')) return;
	$("[name=boardDelFrm]").submit();
}
</script>
	<%} %>


</section>
<script>
$(".btn-delete").click(function(){
	
	if(!confirm("정말 삭제하시겠습니까?")) return;
	
	//GET방식 삭제요청
	//삭제할 댓글번호는 .btn-delete 에 value값으로 저장
	location.href = "<%= request.getContextPath() %>/board/comment/delete?role=<%=memberLoggedIn.getMemberRole()%>&boardNo=<%=b.getKey() %>&boardCommentNo="+$(this).val();
	
});


$(".btn-reply").click(function(){
	<% 	if(memberLoggedIn == null){ %>
	<%-- 로그인 하지 않은 경우 --%>
		loginAlert();
		
	<%  } else { %>
	<%-- 로그인 한 경우 --%>
		//동적으로 답글(대댓글) 폼을 바로 아래 tr태그에 제공
		var html = 
				  
				 "<form action='<%= request.getContextPath() %>/board/comment/insert' method='POST'>"
				 + '<input type="hidden" name="postKey" value="<%= b.getKey() %>" />'
				 + '<input type="hidden" name="userKey" value="<%= memberLoggedIn.getKey() %>" />'
								+ '<input type="hidden" name="commentLevel" value="2" />'
								+ '<input type="hidden" name="commentRef" value="'
								+ $(this).val()
								+ '" />'
								+ "<div class='replyFrm flex items-center rounded border-teal-500 py-2'>"
								+ '<textArea name="content" class="mr-8 shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"'
								+ 'rows="3" placeholder="답글을 입력해주세요"></textArea>'
								+ '<button class="flex-shrink-0 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"'
								+ 'type="submit" class="btn-insert2">답글등록</button>'
						var $tr = $(html);
						var $trFromBtn = $(this).parent().parent();
						
						$tr.insertAfter($trFromBtn).children(".form").slideDown(
								800).children("form").submit(function() {
							var $textarea = $(this).children("textarea");
							console.log($textarea);
							if (/^(.|\n)+$/.test($textarea.val()) == false) {
								alert("댓글 내용을 입력하세요.");
								return false;
							}
							return true;
						}).children("textarea").focus();

						//.btn-reply에 click 이벤트핸들러가 딱 한번만 작동하도록 함.
						$(this).off('click');
<%}%>
	});

	$("#boardCommentContent").focus(function() {
		if (
<%=memberLoggedIn == null%>
	)
			loginAlert();
	});

	$("[name=boardCommentFrm]").submit(function() {
		if (
<%=memberLoggedIn == null%>
	) {
			loginAlert();
			return false;
		}

		var $textarea = $("#boardCommentContent");
		if (/^(.|\n)+$/.test($textarea.val()) == false) {
			alert("댓글 내용을 입력하세요.");
			return false;
		}

		return true;
	});

	function loginAlert() {
		alert("로그인 후 이용할 수 있습니다.");
		$("#memberId").focus();
	}
</script>


<div class="bottom-of-main"></div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
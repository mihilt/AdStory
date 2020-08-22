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
					
					$("#applyBtn").hide();
					$("#applyText").show();
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



<div class="m-12">
	   <div class=" max-w-screen-lg m-auto">
		<div class=" font-bold  mb-10">
				<%--관리자인경우에만 게시글 수정삭제버튼 보일수 있게 함 --%>
				<% if(memberLoggedIn!=null && 
						MemberService.ADMIN_MEMBER_ROLE.equals(memberLoggedIn.getMemberRole())){ %>
				<div class = "border-t border-b py-10">
					    <div class="text-center text-xl text-red-700">
                                                     관리자 권한
                        </div>	
					<div class="m-auto text-center flex w-1/2">
					
					    <div class="px-10 m-auto my-5 cursor-pointer bg-transparent hover:bg-blue-500 text-blue-500 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
						 onclick="updateBoard()">
						   수정
						</div>
						 
						<div class="px-10 m-auto my-5 cursor-pointer bg-transparent hover:bg-blue-500 text-blue-500 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
						onclick="deleteBoard()">
						  마감
						</div>
					</div> 
				</div>
				<%} %>
				
			<%
				if (memberLoggedIn != null && memberLoggedIn.getMemberRole().equals("U")) {
			%>
			<div class="border-t border-b text-center my-5">
				<button id="applyBtn"
					class="w-1/2 m-auto my-5 cursor-pointer bg-transparent hover:bg-blue-500 text-blue-500 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
					onclick="location.href='<%=request.getContextPath()%>/board/apply?userKey=<%=memberLoggedIn.getKey()%>&postKey=<%=b.getKey()%>';">신청하기</button>
					<div class = "text-center my-5 hidden" id = "applyText">
					    <div class = "text-xl text-red-700">
					        신청이 완료된 게시글 입니다.
					    </div>
					    <div class = "w-1/2 m-auto my-5 cursor-pointer bg-transparent hover:bg-blue-500 text-blue-500 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"  
					    onclick="location.href='<%=request.getContextPath()%>/myPage/adList?memberId=<%=memberLoggedIn.getMemberId()%>'">
					                광고신청 현황으로 가기
					    </div>
					</div>
			</div>	
			<%
				}
			%>
		</div>
		<p class="text-3xl ml-2"><%=b.getRefBoardCategoryName() %> > <%=b.getTitle()%></p>
		<div class = "border-t mb-10">
			<div class = "font-bold text-sm p-5">
				<p>기업명 : <%=b.getRefMemberName()%> | 날짜 : <%=b.getEnrollDate()%></p>
			</div>
			<div>
			  <img src="<%=request.getContextPath()%>/upload/board-images/<%=b.getMainImageRename()%>" alt="" />
			</div>
			<div class="my-3 p-5">
				<%=b.getContent() %>
				<div class="bottom-of-main"></div>
			</div>
        </div>
        <div class = "m-4 text-center text-xl text-blue-700">
           <p>잔여 포인트: <%= (String)Commas.format(b.getPoint()) %>P | 단가: <%= (String)Commas.format(b.getClickPrice()) %>P</p>    
        </div>
		<%
		if (b.getOriginalFileName() != null) {
	    %>
	    <div class = "border-t py-4">
			<a
				href="javascript:fileDownload('<%=b.getOriginalFileName()%>','<%=b.getRenamedFileName()%>');">
				<img alt="첨부파일" src="<%=request.getContextPath()%>/images/file.png"
				width=16px> <%=b.getOriginalFileName()%>
			</a>
		</div>
		<%
		}
	   %>
		<hr/>


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

        <%if(memberLoggedIn.getName().equals(b.getRefMemberName())){ %>
			<button class="px-10 m-auto my-5 cursor-pointer bg-transparent hover:bg-blue-500 text-blue-500 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
			 onclick=location.href="<%=request.getContextPath()%>/board/update?boardNo=<%=b.getKey()%>";>
			   수정
			</button>
		<% } %>
		
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
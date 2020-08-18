<%@page import="board.model.vo.BoardCategory"%>
<%@page import="board.model.vo.BoardComment"%>
<%@page import="member.model.service.MemberService"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<%
    Board b = (Board) request.getAttribute("board");
List<BoardComment> commentList 
= (List<BoardComment>)request.getAttribute("commentList"); 
List<BoardCategory> categoryList = (List<BoardCategory>)request.getAttribute("categoryList");
%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/board.css" />
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

    <%--관리자인경우에만 게시글 수정삭제버튼 보일수 있게 함 --%>
    <% if(memberLoggedIn!=null && 
                MemberService.ADMIN_MEMBER_ROLE.equals(memberLoggedIn.getMemberRole())){ %>
    <tr>
        <th colspan="2">
        <input type="button" value="수정하기"onclick="updateBoard()"> 
        <input type="button" value="마감하기"onclick="deleteBoard()">
        </th>
    </tr>

    <%} %>
    <% if(memberLoggedIn!=null && 
            MemberService.ADMIN_MEMBER_ROLE.equals(memberLoggedIn.getMemberRole()) ){ %>
    <form name="boardDelFrm"
        action="<%=request.getContextPath()%>/board/delete" method="post">
        <input type="hidden" name="boardNo" value="<%=b.getKey() %>" />
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

    <hr style="margin-top: 30px;" />
<!-- <hr /> -->
<h2>여기부터 등록 칸</h2>
    <div class="comment-container">
        <div class="comment-editor">
            <form action="<%= request.getContextPath() %>/board/comment/insert"
                method="POST" name="boardCommentFrm">
                <input type="hidden" name="postKey" value="<%= b.getKey() %>" />
                <input type="hidden" name="userKey"
                    value="<%= memberLoggedIn != null ? memberLoggedIn.getKey() : ""%>" />
                <input type="hidden" name="commentLevel" value="1" /> 
                <input type="hidden" name="commentRef" value="0" />

                <textarea name="content" id="boardCommentContent"
                    cols="60" rows="3"></textarea>
                <button type="submit" id="btn-insert">등록</button>
            </form>
        </div>
        <table id="tbl-comment">
            <%  
            if(commentList != null && !commentList.isEmpty()) {
                for(BoardComment bc : commentList) {
                    if(bc.getCommentLevel() == 1){
        %>
            <tr class="level1">
                <td><sub class="comment-writer"> <%= bc.getRefMemberName()%>
                </sub> <sub class="comment-date"> <%= bc.getCommentDate() %>
                </sub> <br /> <%= bc.getContent() %></td>
                <td>
                    <button class="btn-reply" value="<%= bc.getKey() %>">답글</button>
                    <%-- 삭제버튼 추가 : 관리자 또는 작성자 본인 --%> <%if(memberLoggedIn!=null 
                            && (MemberService.ADMIN_MEMBER_ROLE.equals(memberLoggedIn.getMemberRole()) 
                                    || bc.getUserKey()==(memberLoggedIn.getKey()) )){%>
                    <button class="btn-delete" value="<%=bc.getKey()%>">삭제</button>
                    <% } %>
                </td>
            </tr>
            <%
                    } else {
        %>
            <tr class="level2">
                <td><sub class="comment-writer"> <%= bc.getRefMemberName()%>
                </sub> <sub class="comment-date"> <%= bc.getCommentDate() %>
                </sub> <br /> <%= bc.getContent() %></td>
                <td>
                    <%-- 삭제버튼 추가 : 관리자 또는 작성자 본인 --%> <%if(memberLoggedIn!=null 
                            && (MemberService.ADMIN_MEMBER_ROLE.equals(memberLoggedIn.getMemberRole()) 
                                    || bc.getUserKey()==(memberLoggedIn.getKey()) )){%>
                    <button class="btn-delete" value="<%=bc.getKey()%>">삭제</button>
                    <% } %>
                </td>
            </tr>

            <%
                    }
                }
            } 
        %>
        </table>
    </div>
</section>
<script>
$(".btn-delete").click(function(){
    
    if(!confirm("정말 삭제하시겠습니까?")) return;
    
    //GET방식 삭제요청
    //삭제할 댓글번호는 .btn-delete 에 value값으로 저장
    location.href = "<%= request.getContextPath() %>/board/comment/delete?boardNo=<%=b.getKey() %>&boardCommentNo="+$(this).val();
    
});


$(".btn-reply").click(function(){
    <%  if(memberLoggedIn == null){ %>
    <%-- 로그인 하지 않은 경우 --%>
        loginAlert();
        
    <%  } else { %>
    <%-- 로그인 한 경우 --%>
        //동적으로 답글(대댓글) 폼을 바로 아래 tr태그에 제공
        var html = "<tr>"
                 + "<td style='display:none; text-align:left' colspan='2'>"
                 + "<form action='<%= request.getContextPath() %>/board/comment/insert' method='POST'>"
                 + '<input type="hidden" name="postKey" value="<%= b.getKey() %>" />'
                 + '<input type="hidden" name="userKey" value="<%= memberLoggedIn.getKey() %>" />'
                                + '<input type="hidden" name="commentLevel" value="2" />'
                                + '<input type="hidden" name="commentRef" value="'
                                + $(this).val()
                                + '" />'
                                + '<textarea name="content" cols="60" rows="1"></textarea>'
                                + '<button type="submit" class="btn-insert2">등록</button>'
                                + "</form>" + "</td>" + "</tr>"
                        var $tr = $(html);
                        var $trFromBtn = $(this).parent().parent();
                        $tr.insertAfter($trFromBtn).children("td").slideDown(
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




<%@ include file="/WEB-INF/views/common/footer.jsp"%>
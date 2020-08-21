<%@page import="member.model.service.MemberService"%>
<%@page import="tipboard.model.vo.TipBoardComment"%>
<%@page import="java.util.List"%>
<%@page import="tipboard.model.vo.TipBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
    TipBoard b = (TipBoard)request.getAttribute("tipBoard");
	List<TipBoardComment> commentList 
	= (List<TipBoardComment>)request.getAttribute("commentList"); 
%>
<form name="boardDelFrm" 
      action="<%=request.getContextPath()%>/tipBoard/delete" 
      method="post">
    <input type="hidden" name="boardNo" value="<%=b.getKey() %>" />
</form>
<script>
function updateBoard(){
    location.href="<%=request.getContextPath()%>/tipBoard/update?boardNo=<%=b.getKey() %>";
}
function deleteBoard(){
    if(!confirm('이 게시글을 정말 삭제하시겠습니까?')) return;
    $("[name=boardDelFrm]").submit();
}
</script>

<div class = "m-12">  

    <p class = "text-3xl border-b-2 mb-10">팁 게시판</p>
    <p class = "my-5">
        <a class = "text-blue-600 hover:underline" href="<%= request.getContextPath() %>/tipBoard/list">
                    팁 게시판
        </a> 
        > <%=b.getKey() %>번 게시글
    </p>
    <div class="max-w-screen-lg m-auto">
	    <div>
	       <div class="bg-gray-200 text-xl border-t-2 border-b p-1 px-3">
              <%=b.getTitle() %>
	       </div>

	    </div>

	    <div class=" p-1 px-3 py-2">
	       <div>
              <span class="text-sm"><%=b.getMemberId() %> </span> | <span class="text-sm"> <%=b.getPostDate() %></span>
              <span class="text-sm float-right">조회수 : <%=b.getReadCount() %></span>
           </div>
	       <div class= "py-5 ">
	           <%=b.getContent() %>    
	       </div>
	       <div class= "text-center border-b">
	           <button
	               class="my-5 bg-transparent hover:bg-blue-500 text-blue-500 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
	               onclick="location.href='<%=request.getContextPath()%>/tipBoard/recommend?boardNo=<%= b.getKey() %>';">
	               <i class="far fa-thumbs-up"></i> 추천 : <%=b.getRecommend() %>
	           </button>
	       </div>
           <button
               class="my-5 bg-transparent hover:bg-blue-500 text-blue-500 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
               onclick="location.href='<%=request.getContextPath()%>/tipBoard/list';">
               뒤로
           </button>
           
           <% if(memberLoggedIn!=null && 
              (b.getMemberId().equals(memberLoggedIn.getMemberId())
                || MemberService.ADMIN_MEMBER_ROLE.equals(memberLoggedIn.getMemberRole())) ){ %>
           <button
               class="float-right my-5 bg-transparent hover:bg-blue-500 text-blue-500 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
               onclick="deleteBoard()">
                              삭제
           </button>
           <div class="float-right">　</div>
           <button
               class="float-right my-5 bg-transparent hover:bg-blue-500 text-blue-500 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
               onclick="updateBoard()">
                              수정
           </button>
            <% } %>

	    </div>
	    
	    <div>
				<%
					if (commentList != null && !commentList.isEmpty()) {
						for (TipBoardComment bc : commentList) {
							if (bc.getCommLevel() == 1) {
				%>
				<div class = "border-t">
				<% if("T".equals(bc.getStatus())){ %>
				    <div class = "py-4 text-center font-bold text-red-500">삭제된 덧글입니다.</div>
				<% } else { %>
				    <span class="text-xs text-blue-700 font-bold"> <%=bc.getMemberId()%></span> 
				    <br /> 
				    <%=bc.getContent()%>
				    <br /> 
				    <span class="text-xs"> <%=bc.getPostDate()%></span> 
				    
				    <span class="float-right">
				         <button class="btn-reply text-xs font-bold text-blue-700 hover:underline" value="<%=bc.getKey()%>">답글</button>
			         <%if(memberLoggedIn!=null 
	                          && (MemberService.ADMIN_MEMBER_ROLE.equals(memberLoggedIn.getMemberRole()) 
	                                  || bc.getMemberId().equals(memberLoggedIn.getMemberId()) )){%>        
                         <button class="btn-delete text-xs font-bold text-blue-700 hover:underline" value="<%=bc.getKey()%>">삭제</button>
                     <% } %>            
				    </span>
				<% } %>    
			    </div>
				<%
					} else {
				%>
                <div class = "pl-20 border-t">
                <% if("T".equals(bc.getStatus())){ %>
                    <div class = "text-sm py-4 text-center text-red-500 text-blue-700 hover:underline">삭제된 답글입니다.</div>
                <% } else { %>
                    <span class="text-xs text-blue-700 font-bold"> <%=bc.getMemberId()%></span> 
                    <br /> 
                    <%=bc.getContent()%>
                    <br /> 
                    <span class="text-xs"> <%=bc.getPostDate()%></span>
                     
                    <span class="float-right">
                     <%if(memberLoggedIn!=null 
                       && (MemberService.ADMIN_MEMBER_ROLE.equals(memberLoggedIn.getMemberRole()) 
                               || bc.getMemberId().equals(memberLoggedIn.getMemberId()) )){%>  
                         <button class="btn-delete text-xs font-bold text-blue-700 hover:underline" value="<%=bc.getKey()%>">삭제</button>
                     <% } %>  
                    </span>
                <% } %>
                </div>

				<%
					}
						}
					}
				%>

		</div>
		
	    <div class=" pt-4">
	       <form action="<%=request.getContextPath()%>/tipBoard/comment/insert"
                 method="POST"
                 name="boardCommentFrm">
                 
               <input type="hidden" name="userKey" value="<%=memberLoggedIn != null ? memberLoggedIn.getKey() : ""%>" />
               <input type="hidden" name="boardNo" value="<%=b.getKey()%>" />
               <input type="hidden" name="commLevel" value="1" />
               <input type="hidden" name="commRef" value="0" /> 
               
	           <textarea id="boardCommentContent" class="p-2 h-32 border w-full" name="content" placeholder="덧글을 작성해주세요."></textarea>
	           <button
	               class="mb-32 float-right bg-transparent hover:bg-blue-500 text-blue-500 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
	               type="submit">
	                              덧글 등록
               </button>
	       </form>
	    </div>
    </div>
	
 
</div>

<script>
$(".btn-delete").click(function(){
    if(!confirm("정말 삭제하시겠습니까?")) return;
    
    location.href = "<%= request.getContextPath() %>/tipBoard/comment/delete?boardNo=<%=b.getKey() %>&boardCommentNo="+$(this).val();
    
});

$(".btn-reply").click(function(){
    <%  if(memberLoggedIn == null){ %>
        loginAlert();
        
    <%  } else { %>

        var html = "<form class='pb-16' action='<%= request.getContextPath() %>/tipBoard/comment/insert' method='POST'>"
                 + '<input type="hidden" name="boardNo" value="<%= b.getKey() %>" />'
                 + '<input type="hidden" name="userKey" value="<%= memberLoggedIn.getKey() %>" />'
                 + '<input type="hidden" name="commLevel" value="2" />'
                 + '<input type="hidden" name="commRef" value="' + $(this).val() + '" />' 
                 + '<textarea id="boardCommentContent" class="p-2 h-32 border w-full" name="content" placeholder="덧글을 작성해주세요."></textarea>'
                 + '<button class="float-right bg-transparent hover:bg-blue-500 text-blue-500 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded" type="submit">답글 등록</button>'
                 + "</form>"

          var $ht = $(html);
          var $btn = $(this).parent().parent();
          $ht.insertAfter($btn)
             .submit(function(){
                var $textarea = $(this).children("textarea");
                console.log($textarea);
                if(/^(.|\n)+$/.test($textarea.val()) == false){
                    alert("댓글 내용을 입력하세요.");
                    return false;
                }
                return true;
             })
             .children("textarea")
             .focus();
 
          $(this).off('click');
    
    <%  } %>
});

function loginAlert(){
    alert("로그인 후 이용할 수 있습니다.");
}

$("[name=boardCommentFrm]").submit(function(){
    if(<%= memberLoggedIn == null %>){
        loginAlert();
        return false;
    }
    
    var $textarea = $("#boardCommentContent");
    if(/^(.|\n)+$/.test($textarea.val()) == false){
        alert("댓글 내용을 입력하세요.");
        return false;
    }
    
    return true;
});


</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
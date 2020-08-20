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
<div class = "m-12">  

    <p class = "text-3xl border-b-2 mb-10">팁 게시판</p>
    <p class = "my-5">
        <a class = "text-blue-600 hover:underline" href="<%= request.getContextPath() %>/tipBoard/list">
                    팁 게시판
        </a> 
        > <%=b.getKey() %>번 게시글
    </p>
    <div class="">
	    <div>
	       <div class="bg-gray-200 text-xl border-t-2 border-b p-1 px-3">
              <%=b.getTitle() %>
	       </div>

	    </div>

	    <div class="p-1 px-3 py-2">
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
	    </div>
	    
	    
	    
	    
	    <div>
		
				<%
					if (commentList != null && !commentList.isEmpty()) {
						for (TipBoardComment bc : commentList) {
							if (bc.getCommLevel() == 1) {
				%>
				<div class = "border-t">
				    <span class="text-xs text-blue-700 font-bold"> <%=bc.getMemberId()%></span> 
				    <br /> 
				    <%=bc.getContent()%>
				    <br /> 
				    <span class="text-xs"> <%=bc.getPostDate()%></span> 
				    <span class="float-right">
				         <button class="btn-reply text-xs" value="<%=bc.getKey()%>">답글</button>
                       <%-- 삭제버튼 추가 : 관리자 또는 작성자 본인 --%>
                         <button class="btn-delete text-xs">삭제</button>
				    </span>
			    </div>
				<%
					} else {
				%>
                <div class = "pl-10 border-t">
                    <span class="text-xs text-blue-700 font-bold"> <%=bc.getMemberId()%></span> 
                    <br /> 
                    <%=bc.getContent()%>
                    <br /> 
                    <span class="text-xs"> <%=bc.getPostDate()%></span> 
                    <span class="float-right">
                       <%-- 삭제버튼 추가 : 관리자 또는 작성자 본인 --%>
                         <button class="btn-delete text-xs">삭제</button>
                    </span>
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
	               class="float-right bg-transparent hover:bg-blue-500 text-blue-500 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
	               type="submit">
	                              등록
               </button>
	       </form>
	    </div>
    </div>
	
 
</div>

<script>

$(".btn-reply").click(function(){
    <%  if(memberLoggedIn == null){ %>
    <%-- 로그인 하지 않은 경우 --%>
        loginAlert();
        
    <%  } else { %>
    <%-- 로그인 한 경우 --%>
        //동적으로 답글(대댓글) 폼을 바로 아래 tr태그에 제공
        var html = "<form class='pb-16' action='<%= request.getContextPath() %>/tipBoard/comment/insert' method='POST'>"
                 + '<input type="hidden" name="boardNo" value="<%= b.getKey() %>" />'
                 + '<input type="hidden" name="userKey" value="<%= memberLoggedIn.getKey() %>" />'
                 + '<input type="hidden" name="commLevel" value="2" />'
                 + '<input type="hidden" name="commRef" value="' + $(this).val() + '" />' 
                 + '<textarea id="boardCommentContent" class="p-2 h-32 border w-full" name="content" placeholder="덧글을 작성해주세요."></textarea>'
                 + '<button class="float-right bg-transparent hover:bg-blue-500 text-blue-500 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded" type="submit">등록</button>'
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
             
              
          //.btn-reply에 click 이벤트핸들러가 딱 한번만 작동하도록 함.
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
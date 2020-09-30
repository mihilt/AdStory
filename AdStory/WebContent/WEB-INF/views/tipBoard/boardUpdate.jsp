<%@page import="java.util.List"%>
<%@page import="tipboard.model.vo.TipBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
    TipBoard b = (TipBoard)request.getAttribute("board");
%>

<link href="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/css/suneditor.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/suneditor.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/suneditor@latest/src/lang/ko.js"></script>
<script>
    window.onload = function() {
        window.editor = SUNEDITOR.create((document.getElementById('sample') || 'sample'), {
            lang: SUNEDITOR_LANG['ko'],
            width: '100 %',
            height: '300px',
            font: [
                'Arial', 'Comic Sans MS', 'IMPACT', 'D2Coding'
            ],
            buttonList: [
                ['font', 'fontSize', 'formatBlock'],
                ['bold', 'underline', 'italic', 'strike', 'removeFormat'],
                ['fontColor', 'hiliteColor', 'outdent', 'indent', 'align', 'horizontalRule'],
                ['fullScreen','codeView','image']
            ]
        });
    }

    function check() {
        const title = $('input[name=boardTitle').val();
    	const contents = editor.getContents();
        console.log(title);
        
        if(!title){
        	alert("제목을 입력해주세요.")
        	return false;
        }
        else if (!contents || contents == '<p><br></p>') {
            alert("내용을 입력해주세요.");
            return false;
        } else {
            var textarea = editor.getContext().element.originElement;
            textarea.value = contents;
            return true;
        }

    }
</script>


<div class = "m-12">  

    <p class = "text-3xl border-b-2 mb-5">팁 게시판 - 글쓰기</p>
    
    <p class = "my-5">
        <a class = "text-blue-600 hover:underline" href="<%= request.getContextPath() %>/tipBoard/list">
                    팁 게시판
        </a> 
        > 글쓰기
    </p>

    <div class ="max-w-screen-lg m-auto">
	    <form method="post" onsubmit="return check();"> 
	        <input name="boardTitle" class="border my-2 p-1 w-full" type="text" placeholder="제목을 입력해주세요." value = "<%=b.getTitle()%>"/>
	        <textarea name="boardContent" id="sample"><%=b.getContent() %></textarea>
	        <input class = "mt-10 float-right bg-transparent hover:bg-blue-500 text-blue-500 font-semibold hover:text-white py-3 px-6 border border-blue-500 hover:border-transparent rounded" type="submit" value="작성">
	        <input class="hidden" type="text" name="boardKey" value="<%= b.getKey() %>" readonly/>
	    </form>
    </div>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<%@page import="notice.model.vo.NoticeCategory"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<% List<NoticeCategory> categoryList = (List<NoticeCategory>)request.getAttribute("categoryList"); %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main_style.css" />

    <!-- 상단 nav -->
    <div class="m-12">
        <nav class="mb-10 text-center font-bold sm:flex sm:justify-center sm:items-center mt-4">
            <div class="flex flex-col sm:flex-row">
                <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="<%= request.getContextPath() %>">사이트 소개</a>
                <span class="mt-3 text-blue-700 sm:mx-3 sm:mt-0">공지사항</span>
                <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="<%= request.getContextPath() %>/home/pointRanking/today">포인트 랭킹</a>
            </div>
        </nav>
    </div>   

<script>
function noticeValidate(){
	
	
	var $title = $("[name=title]");
	var $content = $("[name=content]");

	if(/^.+$/.test($title.val()) == false){
		alert("제목을 입력하세요.");
		return false;
	}
	if(/^(.|\n)+$/.test($content.val()) == false){
		alert("내용을 입력하세요.");
		return false;
	}
	return true;
}
</script>

<style>
#noticeImg{
	width: 200PX;
	height:100px;
	opacity: 0.45;
}
section#board-container{width:80%; margin:0 auto; text-align:center;}
section#board-container h2{margin:10px 0; padding-left: 10px; font-size: 30px; float: left;}
table#tbl-board-view{width:90%; margin:0 auto; border-collapse:collapse; clear:both; }
table#tbl-board-view th { text-align: cnenter;  padding-top: 20px; padding-bottom: 20px; width:100px;} 
table#tbl-board-view td { text-align: left;  padding-top: 20px; padding-bottom: 20px; padding-left: 20px; width:600px;} 
table#tbl-board-view tr:nth-child(odd) {background-color: rgba(152, 209, 236, 0.2);}

#backBtn{
 background-color: white;
  color: rgba(233, 190, 0, 0.87);
  padding: 9px 9px;
  border-radius: 12px;
  border: 3px solid rgba(233, 190, 0, 0.87);
  cursor: pointer;
  width: 100px;
  opacity: 0.9;

  font-size: 17px;
}

#menuBtn{
  background-color: white;
  color: rgba(152, 209, 236, 0.849);
  padding: 10px 10px;
  border-radius: 12px;
  border: 3px solid rgba(152, 209, 236, 0.849);
  cursor: pointer;
  width: 100px;
  opacity: 0.9;
  font-size: 17px;
  font-display: center;
  
}

#menuBtn:hover{
	background-color: rgba(152, 209, 236, 0.849);
	color: white;
}

#backBtn:hover{
	background-color: rgba(233, 190, 0, 0.87);
	color: white;
}

</style>
<section id="board-container">
<img id="noticeImg" src="<%=request.getContextPath() %>/images/notice.jpg" alt="공지사항" />
		<br />
		<h2>공지사항  작성</h2>
		<br /><br /><hr /><br />
<form action="<%=request.getContextPath() %>/notice/insert" 
	  method="post">
	<table id="tbl-board-view">
	<tr>
		<th>카테고리</th>
		<td>
			<select name="categoryKey" id="" style="width: 400px;">
			<%
					for (NoticeCategory n : categoryList) {
				%>
				<option value="<%=n.getKey()%>"><%=n.getCategoryName()%></option>
				<%
					}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<th>제 목</th>
		<td>
	<!--  	 <select name="category" id="category" required>
			<option value="commonN">일반</option>
			<option value="serviceN">서비스</option>
			<option value="propertyN">지적재산권</option>
		</select>  --> 
		<input type="text" style ="border-bottom: 1px solid black; width: 500px; height: 40px; width: 400px;" name="title" required></td>
	</tr>
		
	<tr>
		<th>내 용</th>
		<td><textarea rows="5" cols="40" name="content" style="width: 700px; height: 400px;"></textarea></td>
	</tr>
	
</table>
<br />
<br />
<input type="submit" value="등록하기" id = menuBtn
				   onclick="return noticeValidate();">
				   <input type="button" value="취소" id="backBtn" 
			   onclick="location.href='<%= request.getContextPath() %>/home/notice';" />
</form>

<br />
<br />
<br />

</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

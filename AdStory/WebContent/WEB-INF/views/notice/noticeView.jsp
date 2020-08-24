<%@page import="java.util.*" %>
<%@page import="notice.model.vo.Notice" %>
<%@page import="member.model.service.MemberService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
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
<%
	Notice n = (Notice)request.getAttribute("notice");
%>
<div class = "max-w-screen-lg m-auto my-10">
<img id="noticeImg" src="<%=request.getContextPath() %>/images/notice.jpg" alt="공지사항" />
<style>
#noticeImg{
	width: 100%;
	height:400px;
	padding-left: 50px;
	padding-right: 50px;
}

section#board-container{width:600px; margin:0 auto; text-align:center;}
section#board-container h2{margin:10px 0; font-size: 30px;}
table#tbl-board-view{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
table#tbl-board-view th, table#tbl-board-view td { text-align: left;  padding: 20px;} 
table#tbl-board-view th { border-right:1px solid black;}
table#tbl-board-view tr:nth-child(even) {background-color: #f2f2f2;}

#backBtn{
 background-color: rgba(233, 190, 0, 0.87);
  color: white;
  padding: 8px 8px;
  border-radius: 12px;
  border: none;
  cursor: pointer;
  width: 100px;
  opacity: 0.9;
  float: right;
  font-size: 15px;
}

#menuBtn{
 background-color: rgba(106, 199, 241, 0.842);
  color: white;
  padding: 8px 8px;
  border-radius: 12px;
  border: none;
  cursor: pointer;
  width: 100px;
  opacity: 0.9;
  font-size: 15px;
}

</style>
<br />
<section id="board-container">
	<h2>공지사항</h2>
	<input type="button" value="목록 보기" id="backBtn" 
		   onclick="location.href='<%= request.getContextPath() %>/home/notice';" />
	<br /><br />
	<table id="tbl-board-view">
		<tr>
			<th>글번호</th>
			<td><%=n.getKey() %></td>
		</tr>
		<tr>
			<th>제 목</th>
			<td><%=n.getTitle() %></td>
		</tr>
			
		<tr >
			<th>내 용</th>
			<td style="height: 200px;"><%=n.getContent()%></td>
		</tr>	
		
		
	</table>
	
	<br />
	<br />
	
   <% if(memberLoggedIn!=null && MemberService.ADMIN_MEMBER_ROLE.equals(memberLoggedIn.getMemberRole())) { %>
      <%--관리자인경우 게시글 수정삭제버튼 보일수 있게 함 --%>
               
               <input type="button" value="수정하기"  id="menuBtn"  onclick="updateNotice()">
               <input type="button" value="삭제하기" id="menuBtn"  onclick="deleteNotice()">
                     
            
   <br />
   

<form name="noticeDelFrm" 
     action="<%=request.getContextPath()%>/notice/delete" 
     method="post">
   <input type="hidden" name="noticeNo" value="<%=n.getKey() %>" />
</form>
<br />
<br />
<br />
<script>
function updateNotice(){
   location.href="<%=request.getContextPath()%>/notice/update?noticeNo=<%=n.getKey() %>";
}
function deleteNotice(){
   if(!confirm('이 게시글을 정말 삭제하시겠습니까?')) return;
   $("[name=noticeDelFrm]").submit();
}

</script>

<%} %>
</section>
</div>
	
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

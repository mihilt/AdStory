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
	List<Notice> list = (List<Notice>)request.getAttribute("list");
%>
<div class = "max-w-screen-lg m-auto my-10">

<img id="noticeImg" src="<%=request.getContextPath() %>/images/notice.jpg" alt="공지사항" />

<style>

#noticeImg{
	width: 100%;
	height:400px;
	opacity: 0.9;

/* 	box-shadow: 0 10px 14px 0 rgba(0, 195, 255, 0.15), 0 14px 28px 0 rgba(0, 0, 0, 0.2); */
}

section#board-container{width:100%; margin:0 auto; text-align:center;}
table#tbl-board{width:100%; margin:0 auto; border-collapse:collapse; clear:both; }
table#tbl-board th, table#tbl-board td { text-align: center;  padding: 8px;} 
table#tbl-board th {
 	background-color: white; 
	border-top: 3px solid rgba(152, 209, 236, 0.7); 
	border-bottom: 3px solid rgba(152, 209, 236, 0.7); 
 	color: rgba(152, 209, 236, 0.849);}
table#tbl-board tr:nth-child(even) {background-color: rgba(152, 209, 236, 0.2); }

#btn-add{
 background-color: white;
  color: rgba(152, 209, 236, 0.849);
  padding: 10px 10px;
  border-radius: 12px;
  border: 3px solid rgba(152, 209, 236, 0.849);
  cursor: pointer;
  width: 80px;
  opacity: 0.9;
  float: right;

}
#btn-add:hover{
	background-color: rgba(152, 209, 236, 0.849);
	color: white;
}


</style>
<section id="board-container">
	
	
	<br />	
	<br />	
	<table id="tbl-board">
		<tr>
			<th>번호</th>
			<th>카테고리</th>
			<th class = "w-2/3">제목</th>
			<th>작성일</th>
		
		</tr>
<% 	if(list == null || list.isEmpty()){  %>		
		<tr>
			<th colspan="6">조회된 게시물이 없습니다.</th>
		</tr>
<% 	
	} else {
		for(Notice n : list){
%>	
	<tr class="border-b">
		<td><%= n.getKey() %></td>
		<td><%= n.getCategory_name() %></td>
		<td class="float-left"><a class = "text-blue-800 font-bold hover:underline" href="<%= request.getContextPath() %>/notice/view?noticeNo=<%= n.getKey() %>"><%= n.getTitle() %></a></td>
		<td><%= n.getEnrollDate() %></td> 
		
	</tr>
			

<%
		}
	} 
%>		
	</table>
	<br />
<% 	if(memberLoggedIn != null && MemberService.ADMIN_MEMBER_ROLE.equals(memberLoggedIn.getMemberRole())){ %>
	<input type="button" value="글쓰기" id="btn-add" 
		   onclick="location.href='<%= request.getContextPath() %>/notice/insert';" />
	<% 	} %>
	<br /><br />
	 <div class="align-middle flex justify-center">
			         <div class="flex rounded-md mt-8">
			             <%= request.getAttribute("pageBar") %>
		             </div>
			    </div>
</section>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
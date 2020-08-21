<%@page import="java.util.*" %>
<%@page import="enquiry.model.vo.Enquiry" %>
<%@page import="enquiry.model.service.EnquiryService" %>
<%@page import="member.model.service.MemberService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!-- 상단 nav -->
    <nav class="mb-10 text-center font-bold sm:flex sm:justify-center sm:items-center mt-4">
        <div class="flex flex-col sm:flex-row">
            <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="<%= request.getContextPath() %>">회사소개</a>
            <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="<%= request.getContextPath() %>/home/notice">공지사항</a>
            <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="<%= request.getContextPath() %>/home/pointRanking/today">포인트 랭킹</a>
            <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="<%= request.getContextPath() %>/home/manual">초보자 메뉴얼</a>
            <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="<%= request.getContextPath() %>/home/FAQ">자주 묻는 질문(FAQ)</a>
        </div>
    </nav>
<%
	List<Enquiry> list = (List<Enquiry>)request.getAttribute("list");
%>
<%
	Enquiry enquiry = (Enquiry)request.getAttribute("enquiry");

%>

<img id="enquiryImg" src="<%=request.getContextPath() %>/images/enquiry.jpg" alt="공지사항" />
<style>
#enquiryImg{
	width: 100%;
	height:400px;
	padding-left: 50px;
	padding-right: 50px;
}

section#board-container{width:90%; margin:0 auto; text-align:center;}
section#board-container h2{margin:10px 0; font-size: 30px;}
table#tbl-board{width:100%; margin:0 auto; border-collapse:collapse; clear:both; }
table#tbl-board th, table#tbl-board td { text-align: center;  padding: 8px;} 
table#tbl-board th  { background-color: rgba(80, 199, 109, 0.781); color: rgba(64, 68, 70, 0.932);}
table#tbl-board tr:nth-child(even) {background-color: #f5f0f0c0;}

#btn-add{
 background-color: rgba(233, 190, 0, 0.87);
  color: white;
  padding: 10px 10px;
  border-radius: 12px;
  border: none;
  cursor: pointer;
  width: 80px;
  opacity: 0.9;
  float: right;

}

</style>
<section id="board-container">
	<h2>문의 게시판 </h2>
	<% 	if(memberLoggedIn != null){ %>
	<input type="button" value="글쓰기" id="btn-add" 
		   onclick="location.href='<%= request.getContextPath() %>/enquiry/insert';" />
	<% 	} %>
	<br /><br />	
	<table id="tbl-board">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>답변여부</th>
		
		</tr>

<% 	if(list == null || list.isEmpty()){  %>		
		<tr>
			<th colspan="6">조회된 게시물이 없습니다.</th>
		</tr>
<% 	
	} else {
		for(Enquiry eq : list){
%>	
	<tr>
	<% if(memberLoggedIn!=null && 
		(eq.getMemberId().equals(memberLoggedIn.getMemberId())
		|| MemberService.ADMIN_MEMBER_ROLE.equals(memberLoggedIn.getMemberRole())) ) { %>
		<td><%= eq.getKey() %></td>
		<td>
				<a href="<%= request.getContextPath() %>/enquiry/view?enquiryNo=<%= eq.getKey() %>">
				<%= eq.getTitle() %>
				</a>
			</td>
		
		<td><%= eq.getMemberId() %></td>
		<td><%= eq.getEnrollDate() %></td> 				
		<td><% if(eq.getStatus().equals("T")) { %>
				답변완료				 			
			<%} else {%>
			답변중
			<%} %>
		</td> 
		<%} %>
	</tr>
			

<%
		}
	} 
%>		
	</table>

		 <div class="align-middle flex justify-center">
			         <div class="flex rounded-md mt-8">
			             <%= request.getAttribute("pageBar") %>
		             </div>
			    </div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
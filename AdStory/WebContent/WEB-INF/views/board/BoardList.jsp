<%@page import="board.model.vo.BoardCategory"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
   List<Board> list = (List<Board>) request.getAttribute("list");
List<BoardCategory> categoryList = (List<BoardCategory>) request.getAttribute("categoryList");
%>
<script>

$(function(){
   
console.log("start");


   <%if (memberLoggedIn != null) {%>
   $(".unlike").click(function(){
      
      $userKeyVal = $(this).prev().text();
      
      //$likeClass = $("#like").children("i").attr("class");
      console.log($userKeyVal);
   var param = {
         userKey : '<%=memberLoggedIn.getKey()%>',
         cUserKey : $userKeyVal
      }


      $.ajax({
         url : "<%=request.getContextPath()%>/text/like.do",
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
                  if (data == "1") {
                     //찜완료 전체 기업 빨간색으로
                     //$(".key"+$userKeyVal).css("color", "red");
                     //console.log($(this).attr("class"));
                     //$(".key"+$userKeyVal).parent().attr("class","like");
                     
                     alert("내가 찜한 기업에 추가되었습니다.");
                     location.reload();
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

      });
$(".like").click(function(){
      
   $userKeyVal = $(this).prev().text();
   console.log("취소하자!");
      /* $likeClass = $("#like").children("i").attr("class");
      console.log($("#like").children("i").attr("class")); */
   var param = {
         userKey : '<%=memberLoggedIn.getKey()%>',
         cUserKey : $userKeyVal
      }


            $.ajax({
               url : "<%=request.getContextPath()%>/text/unLike.do",
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
                     if ( data >0) {
                        //console.log($(this).attr("class"));
                        //찜취소 검은색으로
                        //$(".key" + $userKeyVal).css("color", "");
                        //$(".key" + $userKeyVal).parent().attr("class","unlike");

                        alert("내가 찜한 기업에서 삭제되었습니다.");
                        location.reload();
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

            });
<%}else{%>
$(".unlike").click(function(){
   alert("로그인 후 이용 가능합니다.");
   
   
});
<%}%>
   });
</script>

<!-- 상단 nav -->
<nav
   class="text-center font-bold sm:flex sm:justify-center sm:items-center mt-4">
   <div class="flex flex-col sm:flex-row">
      <a
      
         class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0"
         href="<%=request.getContextPath()%>/board/list">전체</a>
      <%
         if (categoryList != null) {
         for (BoardCategory c : categoryList) {
      %>

      <a
         class=" mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0"
         href="<%=request.getContextPath()%>/board/finder?searchType=category&searchKeyword=<%=c.getKey()%>"><%=c.getCategoryName()%></a>
      <%
         }
      }
      %>

   </div>
</nav>



<div class="container my-12 mx-auto px-4 md:px-12">

   <div class="flex flex-wrap -mx-1 lg:-mx-4">


      <%
         if (list == null || list.isEmpty()) {
      %>

      <div class="m-auto text-xl">조회된 게시물이 없습니다.</div>

      <%
         } else {

      for (Board b : list) {
      %>

      <!-- Column -->
      <div
         class="relative my-1 px-1 w-full md:w-1/2 lg:my-4 lg:px-4 lg:w-1/3
         xl:w-1/4">

         <!-- Article -->
         <article class="rounded-lg shadow-lg">

<%if (b.getMainImageOrigin() == null) {%>
<div class = "cursor-pointer" style="min-height:243.25px; max-height:243.25px; background-image: url(<%=request.getContextPath()%>/images/defaultImg.png); background-size:cover;"
onclick="location.href='<%=request.getContextPath()%>/board/view?boardNo=<%=b.getKey()%>'">

</div>
<% } else {  %> 
<div class = "cursor-pointer" style="min-height:243.25px; max-height:243.25px; background-image: url(<%=request.getContextPath()%>/upload/board-images/<%=b.getMainImageRename()%>); background-size:cover;"
onclick="location.href='<%=request.getContextPath()%>/board/view?boardNo=<%=b.getKey()%>'">

</div>
<% } %>



        <div class = "">
            <header
               class="items-center justify-between leading-tight p-2 md:p-4">
               <h1 class="text-lg">
                  <a class="no-underline hover:underline text-black"
                     href="<%=request.getContextPath()%>/board/view?boardNo=<%=b.getKey()%>">
                     <%=b.getTitle()%>
                  </a>
               </h1>
            </header>

            <div
               class="flex items-center justify-between leading-tight p-2 md:px-4">
               <a class="no-underline hover:underline text-black" href="#"> <%=b.getRefBoardCategoryName()%>
               </a>
               <p class="text-grey-darker text-sm">
                  <%=b.getEnrollDate()%>
               </p>
            </div>

            <div class="text-sm leading-none p-2 md:px-4">
               <p>
                  잔여 :
                  <%=(String) Commas.format(b.getPoint())%>P
               </p>
               <p>
                  단가 :
                  <%=(String) Commas.format(b.getClickPrice())%>P
               </p>
               <p>
                  참여인원 :
                  <%=b.getApplyNum()%></p>
            </div>

            <footer
               class="flex items-center justify-between leading-none p-2 md:p-4">
               <a
                  class="flex items-center no-underline hover:underline text-black"
                  href="/adstory/board/finder?searchType=memberName&searchKeyword=<%=b.getRefMemberName()%>">
                  <p class="text-sm">
                     <%=b.getRefMemberName()%>
                  </p>
               </a> 
               <%if(memberLoggedIn != null && memberLoggedIn.getMemberRole().equals("U")){ %>
                  <div class="hidden" class="likeKey"><%=b.getUserKey()%></div>
                  <button class='<%=b.getIsLike() == 1 ? "like" : "unlike"%>'
                     class="no-underline text-grey-darker hover:text-red-dark">
                     <span class="hidden">Like</span> <i id="likeIcon"
                        class="fa fa-heart key<%=b.getUserKey()%>"
                        style='color:<%=b.getIsLike() == 1 ? "red" : ""%>;'></i>
                  </button>
                  <%} %>
            </footer>
            </div>
         </article>
         <!-- END Article -->
      </div>
      <!-- END Column -->
      

      <%}%>


   </div>


</div>
   <%
      if (memberLoggedIn != null && !memberLoggedIn.getMemberRole().equals("U")) {
   %>
   <div class="flow-root my-10">
         <button
            class="mx-12 float-right bg-transparent hover:bg-blue-500 text-blue-500 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
            onclick="location.href='<%=request.getContextPath()%>/board/insert';">
                        글쓰기
         </button>
   </div>
   <%
      }
   %>

<div id="search-memberId" class="flex m-auto mt-10">

   <form class="m-auto"
      action="<%=request.getContextPath()%>/board/finder">
      <select name="searchType"
         class="border text-grey-darker py-1 px-2 pr-8 rounded leading-tight focus:outline-none"
         id="searchType">
         <option value="title">제목</option>
         <option value="memberName">기업명</option>
      </select> <input class="px-5 py-1 text-gray-700 bg-gray-200 rounded"
         type="text" name="searchKeyword" size="25" placeholder="" />
      <button
         class="px-4 py-1 text-blue-500 font-light tracking-wider hover:bg-blue-500 hover:text-white border border-solid border-blue-500 font-bold rounded"
         type="submit">검색</button>
   </form>
</div>
    <%}%>


<!-- pageBar -->
<div class="align-middle flex justify-center">
   <div class="flex rounded-md mt-8">
      <%=request.getAttribute("pageBar")%>
   </div>
</div>
<!-- 밑에 여백 -->
<div class="bottom-of-main"></div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>

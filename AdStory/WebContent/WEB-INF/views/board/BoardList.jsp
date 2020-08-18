<%@page import="java.text.DecimalFormat"%>
<%@page import="board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- 상단 nav -->
<nav
    class="text-center font-bold sm:flex sm:justify-center sm:items-center mt-4">
    <div class="flex flex-col sm:flex-row">
        <a
            class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0"
            href="#">전체</a> <a
            class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0"
            href="#">건강식품</a> <a
            class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0"
            href="#">화장품&미용</a> <a
            class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0"
            href="#">가전제품</a> <a
            class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0"
            href="#">생활용품</a> <a
            class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0"
            href="#">교육</a> <a
            class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0"
            href="#">요식업</a>
    </div>
</nav>

<%
    List<Board> list = (List<Board>) request.getAttribute("list");
%>

<div class="container my-12 mx-auto px-4 md:px-12">
<%
        if (memberLoggedIn != null && !memberLoggedIn.getMemberRole().equals("U")) {
    %>
    <div class="flex m-auto mt-10">
        <div>
            <button
                class="float-right bg-transparent hover:bg-blue-500 text-gray-700 font-semibold hover:text-white py-2 px-4 border border-gray-700 hover:border-transparent rounded"
                onclick="location.href='<%=request.getContextPath()%>/board/insert';">
                글쓰기</button>
        </div>
    </div>
    <%
        }
    %>
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
            class="my-1 px-1 w-full md:w-1/2 lg:my-4 lg:px-4 lg:w-1/3 xl:w-1/4">

            <!-- Article -->
            <article class="overflow-hidden rounded-lg shadow-lg">

                <a
                    href="<%=request.getContextPath()%>/board/view?boardNo=<%=b.getKey()%>">
                    <img alt="Placeholder" class="block h-auto w-full"
                    <%if (b.getMainImageOrigin() == null) {%>
                    src="<%=request.getContextPath()%>/images/defaultImg.png"
                    alt="홍보 사진" /> <%
    } else {
 %> src="<%=request.getContextPath()%>/upload/board-images/<%=b.getMainImageOrigin()%>"/>
                    <%
    }
 %>

                </a>

                <header
                    class="flex items-center justify-between leading-tight p-2 md:p-4">
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
                        href="#">
                        <p class="text-sm">
                            <%=b.getRefMemberName()%>
                        </p>
                    </a> <a id="like"
                        class="no-underline text-grey-darker hover:text-red-dark" href="#">
                        <span class="hidden">Like</span> <i class="fa fa-heart"></i>
                    </a>
                </footer>
            </article>
            <!-- END Article -->
        </div>
        <!-- END Column -->

        <%
            }

        }
        %>

    </div>


</div>

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

<!-- pageBar -->
<div class="align-middle flex justify-center">
    <div class="flex rounded-md mt-8">
        <%=request.getAttribute("pageBar")%>
    </div>
</div>
<!-- 밑에 여백 -->
<div class="bottom-of-main"></div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>

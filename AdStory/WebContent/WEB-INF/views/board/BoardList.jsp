<%@page import="java.text.DecimalFormat"%>
<%@page import="board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
                
                <!-- 상단 nav -->
                <nav class="text-center font-bold sm:flex sm:justify-center sm:items-center mt-4">
                    <div class="flex flex-col sm:flex-row">
                        <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="#">전체</a>
                        <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="#">건강식품</a>
                        <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="#">화장품&미용</a>
                        <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="#">가전제품</a>
                        <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="#">생활용품</a>
                        <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="#">교육</a>
                        <a class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0" href="#">요식업</a>
                    </div>
                </nav>
                
<%
    List<Board> list = (List<Board>)request.getAttribute("list");
%>    

    <div class="container my-12 mx-auto px-4 md:px-12">
        <div class="flex flex-wrap -mx-1 lg:-mx-4">
            <%  if(list == null || list.isEmpty()){  %>     
      
                <div class = "m-auto text-xl">조회된 게시물이 없습니다.</div>

            <%  
                } else {
                	
                    for(Board b : list){
            %>      

                   <!-- Column -->
                    <div class="my-1 px-1 w-full md:w-1/2 lg:my-4 lg:px-4 lg:w-1/3 xl:w-1/4">
            
                        <!-- Article -->
                        <article class="overflow-hidden rounded-lg shadow-lg">
            
                            <a href="<%=request.getContextPath()%>/board/view?boardNo=<%=b.getKey()%>">
                                <img alt="Placeholder" class="block h-auto w-full"
                                
                                <% if (b.getMainImageRename() == null){ %>
                                     src="<%= request.getContextPath() %>/images/defaultImg.png" alt="홍보 사진"/>
                                <% } else {%>
                                     src="<%=request.getContextPath() %>/upload/board-images/<%=b.getMainImageRename()%>"/>
                                <% } %>
                                
                            </a>
            
                            <header class="flex items-center justify-between leading-tight p-2 md:p-4">
                                <h1 class="text-lg">
                                    <a class="no-underline hover:underline text-black" href="<%=request.getContextPath()%>/board/view?boardNo=<%=b.getKey()%>">
                                      <%= b.getTitle() %>
                                    </a>
                                </h1>
                            </header>
                            
                            <div class="flex items-center justify-between leading-tight p-2 md:px-4">
                                <a class="no-underline hover:underline text-black" href="#">
                                  <%= b.getRefBoardCategoryName() %>
                                </a>
                                <p class="text-grey-darker text-sm">
                                    <%= b.getEnrollDate() %>
                                </p>
                            </div>
                            
                            <div class="text-sm leading-none p-2 md:px-4">
                                <p>잔여 : <%=(String)Commas.format(b.getPoint())%>P</p>
                                <p>단가 : <%=(String)Commas.format(b.getClickPrice())%>P</p>
                                <p>참여인원 : <%=b.getApplyNum() %></p>
                            </div>

                            <footer class="flex items-center justify-between leading-none p-2 md:p-4">
                                <a class="flex items-center no-underline hover:underline text-black" href="#">
                                    <p class="text-sm">
                                      <%= b.getRefMemberName() %>   
                                    </p>
                                </a>
                                <a class="no-underline text-grey-darker hover:text-red-dark" href="#">
                                    <span class="hidden">Like</span>
                                    <i class="fa fa-heart"></i>
                                </a>
                            </footer>
                        </article>
                        <!-- END Article -->
                    </div>
                    <!-- END Column -->
            
               <% } %> 
        
        </div>
           
               <% if(memberLoggedIn != null&& !memberLoggedIn.getMemberRole().equals("U")){ %>
               <div class = "flow-root mt-5">               
                   <div>
	                    <button
	                    class="float-right bg-transparent hover:bg-blue-500 text-gray-700 font-semibold hover:text-white py-2 px-4 border border-gray-700 hover:border-transparent rounded"
	                    onclick="location.href='<%= request.getContextPath() %>/board/insert';">
	                                                  글쓰기
	                    </button>
                   </div>
               </div>
               <% } %> 
    </div>         

    

                <div class="search-bar-div">
                    <div class="search-bar relative text-lg bg-transparent text-gray-800">
                        <div class="flex items-center border-b border-b-2 border-gray-500 py-2">
                            <input class="bg-transparent border-none mr-3 px-2 leading-tight focus:outline-none"
                                type="text" placeholder="검색">
                            <button type="submit" class="absolute right-0 top-0 mt-3 mr-4">
                                <svg class="h-4 w-4 fill-current" xmlns="http://www.w3.org/2000/svg"
                                    xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px"
                                    viewBox="0 0 56.966 56.966" style="enable-background:new 0 0 56.966 56.966;"
                                    xml:space="preserve" width="512px" height="512px">
                                    <path
                                        d="M55.146,51.887L41.588,37.786c3.486-4.144,5.396-9.358,5.396-14.786c0-12.682-10.318-23-23-23s-23,10.318-23,23  s10.318,23,23,23c4.761,0,9.298-1.436,13.177-4.162l13.661,14.208c0.571,0.593,1.339,0.92,2.162,0.92  c0.779,0,1.518-0.297,2.079-0.837C56.255,54.982,56.293,53.08,55.146,51.887z M23.984,6c9.374,0,17,7.626,17,17s-7.626,17-17,17  s-17-7.626-17-17S14.61,6,23.984,6z" />
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
                
                <!-- pageBar -->
			    <div class="align-middle flex justify-center">
			         <div class="flex rounded-md mt-8">
			             <%= request.getAttribute("pageBar") %>
		             </div>
			    </div>
                <!-- 밑에 여백 -->
                <div class="bottom-of-main"></div>
           <% } %>     
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

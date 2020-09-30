<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            </main>
    </div>
    
    <!-- 로그인 모달 -->
	<div class="hidden main-modal fixed w-full h-100 inset-0 z-50 overflow-hidden flex justify-center items-center animated fadeIn faster"
	style="background: rgba(0,0,0,.7);">
	<div
	    class="border border-teal-500 shadow-lg modal-container bg-white w-11/12 md:max-w-md mx-auto rounded shadow-lg z-50 overflow-y-auto">
	    <div class="modal-content py-4 text-left px-6">
	        <!--Title-->
	        <div class="flex justify-between items-center pb-3">
	            <p class="text-2xl font-bold">AD Story 로그인</p>
	            <div class="modal-close cursor-pointer z-50">
	                <svg class="fill-current text-black" xmlns="http://www.w3.org/2000/svg" width="18" height="18"
	                    viewBox="0 0 18 18">
	                    <path
	                        d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
	                    </path>
	                </svg>
	            </div>
	        </div>
	        <!--Body-->
	        <form action="<%= request.getContextPath() %>/member/login"
	                                      method="POST" 
	                                      id="loginFrm">
	                  <div class="mb-4">
	                    <label class="block text-md font-light mb-2" for="username">아이디</label>
	                    <input class="w-full bg-drabya-gray border-gray-500 appearance-none border p-4 font-light leading-tight focus:outline-none focus:shadow-outline" type="text" name="memberId" id="" placeholder="아이디">
	                  </div>
	                  <div class="mb-4">
	                    <label class="block text-md font-light mb-2" for="password">비밀번호</label>
	                    <input class="w-full bg-drabya-gray border-gray-500 appearance-none border p-4 font-light leading-tight focus:outline-none focus:shadow-outline" type="password" name="password" id="" placeholder="비밀번호">
	                  </div>
	                
	                  <div class="flex items-center justify-between mb-5">
	                  <span class="inline-block align-baseline font-light text-sm text-blue-800">
                      
						<a class="mx-1 hover:text-blue-500" href="<%= request.getContextPath() %>/member/findIdInput">
	                       아이디 찾기
	                    </a>
	                    <a class="mx-1 hover:text-blue-500" href="<%= request.getContextPath() %>/member/findPasswordInput">
                        
	                       비밀번호 찾기
	                    </a>
	                  </span> 
	                    <button class="bg-blue-600 hover:bg-blue-700 text-white font-light py-2 px-6 rounded focus:outline-none focus:shadow-outline" type="submit">
	                       로그인
	                    </button>
	                 
	                  </div>
	                  <p class="text-center text-md font-light">아이디가 없으신가요? <a href="<%= request.getContextPath() %>/member/SelectRole" class="font-light text-md text-blue-600">회원가입</a></p>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>

    <script src="<%=request.getContextPath() %>/js/script.js"></script>
    <script src="https://kit.fontawesome.com/e65a97b364.js" crossorigin="anonymous"></script>
</body>

</html>
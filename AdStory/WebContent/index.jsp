<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="m-12">

	<!-- 상단 nav -->
	<nav
		class="mb-10 text-center font-bold sm:flex sm:justify-center sm:items-center mt-4">
		<div class="flex flex-col sm:flex-row">
			<span class="mt-3 text-blue-700 sm:mx-3 sm:mt-0">사이트 소개</span> <a
				class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0"
				href="<%= request.getContextPath() %>/home/notice">공지사항</a> <a
				class="mt-3 text-gray-700 hover:text-blue-700 hover:underline sm:mx-3 sm:mt-0"
				href="<%= request.getContextPath() %>/home/pointRanking/today">포인트
				랭킹</a>
		</div>
	</nav>



	<div class="container mx-auto">
		<div
			class="bg-cover bg-top  h-auto text-white py-24 px-10 object-fill"
			style="background-image: url(<%=request.getContextPath() %>/images/carousel_1.jpg)">
			<p class="font-bold text-sm uppercase">JHT그룹의 혁신 서비스</p>
			<p class="text-3xl font-bold">바이럴마케팅 선도 기업</p>
			<p class="text-2xl mb-10 leading-none">AD STORY는 올바른 광고문화 형성을 위해
				노력합니다.</p>
			<a href="<%= request.getContextPath() %>/member/SelectRole"
				class="bg-blue-700 py-4 px-8 text-white font-bold uppercase text-xs rounded hover:bg-gray-200 hover:text-gray-800">회원가입
				하러가기</a>
		</div>
		<br>
	</div>

    <div class = "m-auto"style='max-width:1280px;'>
		<div class="relative pt-16 pb-32 flex content-center items-center justify-center">
			<div class="container relative mx-auto">
				<div class="items-center flex flex-wrap">
					<div class="w-full lg:w-6/12 px-4 ml-auto mr-auto text-center">
						<div class="pr-12">
							<h1 class="text-black font-semibold text-5xl">AD Story</h1>
							<p class="mt-4 text-lg text-black">바이럴마케팅을 통해 니 인생을 바꿔보세요</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="pb-20 bg-gray-200 -mt-24">
			<div class="container mx-auto px-4">
				<div class="flex flex-wrap"></div>
				<div class="flex flex-wrap items-center mt-16">
					<div class="w-full md:w-5/12 px-4 mr-auto ml-auto">
	                    <div
	                        class="text-blue-600 p-3 text-center inline-flex items-center justify-center w-16 h-16 mb-6 shadow-lg rounded-full bg-blue-300">
	                        <i class="fas fa-user text-xl"></i>
	                    </div>
						<h3 class="text-3xl mb-2 font-semibold leading-normal">일반회원 - 누구든지 쉽게 돈벌기</h3>
						<p
							class="text-lg font-light leading-relaxed mt-4 mb-4 text-gray-700">
							니들ㄷ 가능함 ㅇ니들ㄷ 가능함 ㅇ니들ㄷ 가능함 ㅇ니들ㄷ 가능함 ㅇ니들ㄷ 가능함 ㅇ니들ㄷ 가능함 ㅇ니들ㄷ 가능함 ㅇ니들ㄷ
							가능함 ㅇ니들ㄷ 가능함 ㅇ니들ㄷ 가능함 ㅇ니들ㄷ 가능함 ㅇ니들ㄷ 가능함 ㅇ니들ㄷ 가능함 ㅇ</p>
						<p
							class="text-lg font-light leading-relaxed mt-0 mb-4 text-gray-700">
							열심히 해보삼 가이드도 읽고 ㅇㅇ</p>
						<br />
						<a href="<%= request.getContextPath() %>/home/manual"
							class="font-bold text-blue-700 mt-8 text-2xl hover:underline" >초보자 가이드 읽으러 가기!</a>
					</div>
					<div class="w-full md:w-4/12 px-4 mr-auto ml-auto">
						<div
							class="relative flex flex-col min-w-0 break-words bg-white w-full mb-6 shadow-lg rounded-lg bg-blue-600">
							<img alt="..."
								src="<%=request.getContextPath() %>/images/12.jpg"
								class="w-full align-middle rounded-t-lg" />
							<blockquote class="relative p-8 mb-4">
								<h4 class="text-xl font-bold text-white">부업 최강 AD Story</h4>
								<p class="text-md font-light mt-2 text-white">
									대한민국 천만백수시대 정년퇴직한 중장년층사이에서 유행하는 AD Story! 통계청 오피셜 퇴직자 70%가 이거 쓰면서 입에
									풀칠하며 산다더라 그만큼 쉽고 좋음 어쩌구 <br />
									<br /> 위사진이 옆집 순자 할머니인데 이분도 이거 하더라고
								</p>
							</blockquote>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="relative py-32">
			<div
				class="bottom-auto top-0 left-0 right-0 w-full absolute pointer-events-none overflow-hidden -mt-20"
				style="height: 80px; transform: translateZ(0px);">
				<svg class="absolute bottom-0 overflow-hidden"
					xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none"
					version="1.1" viewBox="0 0 2560 100" x="0" y="0">
	            <polygon class="text-white fill-current"
						points="2560 0 2560 100 0 100"></polygon>
	            </svg>
			</div>
			<div class="container mx-auto px-4">
				<div class="items-center flex flex-wrap">
					<div class="w-full md:w-4/12 ml-auto mr-auto px-4">
						<img alt="..." class="max-w-full rounded-lg shadow-lg"
							src="<%=request.getContextPath() %>/images/bad_man.png" />
					</div>
					<div class="w-full md:w-5/12 ml-auto mr-auto px-4">
						<div class="md:pr-12">
							<div
								class="text-blue-600 p-3 text-center inline-flex items-center justify-center w-16 h-16 mb-6 shadow-lg rounded-full bg-blue-300">
								<i class="fas fa-building text-xl"></i>
							</div>
							<h3 class="text-3xl font-semibold">기업회원 - 안전한 기업 광고</h3>
							<p class="mt-4 text-lg leading-relaxed text-gray-600">
	                                                    채신 부정클릭 방지 JHT Shild 기술을 사용하여 악의적인 클릭 하는 나쁜친구들을 혼내드림
	                          <br /><br />
	                                                    나쁜짓 하는놈들 로그 까서 걸리면 다 죽어
	                        </p>
	                        <p class="mt-4 text-sm leading-relaxed text-red-600">
	                         * 부정클릭 방지 상세 기술은 내부 보안을 위해 공개하지 않습니다
	                        </p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="pb-20 relative block bg-gray-900">
			<div
				class="bottom-auto top-0 left-0 right-0 w-full absolute pointer-events-none overflow-hidden -mt-20"
				style="height: 80px; transform: translateZ(0px);">
				<svg class="absolute bottom-0 overflow-hidden"
					xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none"
					version="1.1" viewBox="0 0 2560 100" x="0" y="0">
	            <polygon class="text-gray-900 fill-current"
						points="2560 0 2560 100 0 100"></polygon>
	          </svg>
			</div>
			<div class="container mx-auto px-4 lg:pt-12 lg:pb-2">
				<div class="flex flex-wrap text-center justify-center">
					<div class="w-full lg:w-6/12 px-4">
						<h2 class="text-4xl font-semibold text-white">안녕? 우리 사이트에데헤알려드림</h2>
						<p class="text-lg leading-relaxed mt-4 mb-4 text-gray-500">
                             
                        </p>
					</div>
				</div>
				<div class="flex flex-wrap mt-12 justify-center">
					<div class="w-full lg:w-3/12 px-4 text-center">
						<div
							class="text-gray-900 p-3 w-12 h-12 shadow-lg rounded-full bg-white inline-flex items-center justify-center">
							<i class="fas fa-medal text-xl"></i>
						</div>
						<h6 class="text-xl mt-5 font-semibold text-white">온갖 장관상 다 휩쓸고다님</h6>
						<p class="mt-2 mb-4 text-gray-500">가나다상(2002년), 라마상(2015년), 가나다상(2002년), 라마상(2015년) </p>
					</div>
					<div class="w-full lg:w-3/12 px-4 text-center">
						<div
							class="text-gray-900 p-3 w-12 h-12 shadow-lg rounded-full bg-white inline-flex items-center justify-center">
							<i class="fas fa-poll text-xl"></i>
						</div>
						<h5 class="text-xl mt-5 font-semibold text-white">성장하는 서비스</h5>
						<p class="mt-2 mb-4 text-gray-500">
						 서비스 시작 이후 2020년 기준 매해 평균 신규 가입자수 12만명, 광고게시글 20만개 늘어나는중임ㅇㅇ 
						</p>
					
					</div>
					<div class="w-full lg:w-3/12 px-4 text-center">
						<div
							class="text-gray-900 p-3 w-12 h-12 shadow-lg rounded-full bg-white inline-flex items-center justify-center">
							<i class="fas fa-lightbulb text-xl"></i>
						</div>
						<h5 class="text-xl mt-5 font-semibold text-white">좋은 아이디어를 통한 주기적인 사이트 업데이트</h5>
						<p class="mt-2 mb-4 text-gray-500">JHT 그룹 직원은들의 빠른 회원 피드백과 자체 아이디어 회의를 통해 사이트를 자주 바꿈니다 막 방치해놓지 않스빈다</p>
					</div>
				</div>
			</div>
		</div>
		
    </div>
    
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

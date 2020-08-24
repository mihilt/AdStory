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
						<h3 class="text-3xl mb-2 font-semibold leading-normal">일반회원 </h3>
						<p
							class="text-lg font-light leading-relaxed mt-4 mb-4 text-gray-700">
							빠르고 편한 마케팅서비스 AD Story <br/>
							
							광고주들과의 미팅 또는 계약절차없이 간편하고 빠른 컨텍으로 자신의 마케팅을 선보일 수 있으며, 뛰어난 역량을 가진 1인 퍼포먼스 마케터들이 탄탄한 사회적 기반 위에서 지속적으로 성장할 수 있도록 지원합니다.
							<br/><br/> 본인에게 맞는 광고에 지원하여 차별화 된 마케터혜택을 누릴수 있도록 최선의 서비스를 제공받을 수 있습니다.
							
							</p>
						<p
							class="text-lg font-light leading-relaxed mt-0 mb-4 text-gray-700">
							</p>
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
									디지털채널 전략기획, 디지털마케팅 성과측정관리 등 마케팅운영 가이드라인 등 실무에 필요한 모든것을 체계적으로 학습할 수 있는 가이드라인 서비르 제공! <br />
									<br /> 당신도 손쉽게 최고의 전문 프로마케터로 거듭날 수 있습니다! 
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
						<h2 class="text-4xl font-semibold text-white">결과를 만드는<br> 퍼포먼스마케팅 플랫폼 <br>AD Story</h2>
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
						<h6 class="text-xl mt-5 font-semibold text-white">AD Story 보유기술<br><br></h6>
						<p class="mt-2 mb-4 text-gray-500">1. 바이럴마케팅서비스를 제공하는 시스템 및 방법 <br>
														      2. 실시간 분석시스템<br> 
														      3. 마케터별 광고비 배분서비스 제공<br>
														      4. 광고 실시간 유지시스템 및 그 방법 </p>
					</div>
					<div class="w-full lg:w-3/12 px-4 text-center">
						<div
							class="text-gray-900 p-3 w-12 h-12 shadow-lg rounded-full bg-white inline-flex items-center justify-center">
							<i class="fas fa-poll text-xl"></i>
						</div>
						<h5 class="text-xl mt-5 font-semibold text-white">국내 마케팅시장현황 분석 및 선도</h5>
						<p class="mt-2 mb-4 text-gray-500">
						 서비스 시작 이후 2020년 기준 매해 평균 신규 마케터 증가 수 12만명, 마케팅투자 130억원 증대로 마케팅시장의 중요성이 확대대고 있는 가운데, AD Story는 발빠르게 시장의 흐름을 파악하여 마케팅시장을 선도할 것입니다.
						</p>
					
					</div>
					<div class="w-full lg:w-3/12 px-4 text-center">
						<div
							class="text-gray-900 p-3 w-12 h-12 shadow-lg rounded-full bg-white inline-flex items-center justify-center">
							<i class="fas fa-lightbulb text-xl"></i>
						</div>
						<h5 class="text-xl mt-5 font-semibold text-white">광고주와 1인 마케터를 연결하는 애드테크 플랫폼</h5>
						<p class="mt-2 mb-4 text-gray-500">AD Stoty는 SNS의 발달과 함께 누구나 퍼포먼스마케팅을 수행할 수 있는 1인 마케팅시대에 광고주와 1인 마케터를 이어주는 퍼포먼스 마케팅플랫폼입니다.</p>
					</div>
				</div>
			</div>
		</div>
		
    </div>
    
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

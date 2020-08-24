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
							<p class="mt-4 text-lg text-black">광고주와 1인 마케터를 연결하는 애드테크 플랫폼</p>
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
   
                        <br />
                        <h3 class="text-3xl mb-2 font-semibold leading-normal text-blue-700"> AD Story - <br /> 당신을 광고주로 모십니다.</h3>
                        <p
                            class="text-lg font-light leading-relaxed mt-4 mb-4 text-gray-700">
                            제품을 광고하는 일 어려울 거라고 생각하던 당신! <br />
                            이제 <strong>AD Story</strong>를 통해 쉽게 광고하고, 수익도 얻을 수 있습니다.<br />
                            SNS 활동 만으로도 당신에게 큰 수익으로 다가 옵니다.</p>
                        <p
                            class="text-xl  font-bold font-light leading-relaxed mt-0 mb-4 text-blue-700">
                            스쳐가는 기회를 잡으세요</p>
                        <br />
                    </div>
                    <div class="w-full md:w-4/12 px-4 mr-auto ml-auto">
                        <div
                            class="relative flex flex-col min-w-0 break-words bg-white w-full mb-6 shadow-lg rounded-lg bg-blue-600">
                            <img alt="..."
                                src="<%=request.getContextPath() %>/images/social.jpg"
                                class="w-full align-middle rounded-t-lg" />
                            <blockquote class="relative p-8 mb-4">
                                <h4 class="text-xl font-bold text-white"> 최강 바이럴 마케팅 AD Story</h4>
                                <p class="text-md font-light mt-2 text-white">
                                    티비를 통한 광고의 시대는 더 이상 발전이 없다.
                                    많은 세대들이 이제는 인터넷 방송 플랫폼, 소셜 미디어로 옮겨 가고 있습니다.
                                    AD story를 통하여 적응 비용으로 당신의 기업에 큰 이득을 가져다 드립니다. <br />
                                    <br /> <strong>바이럴 마케팅 아직도 모른다면 지금  AD Story를 통해 시작 하십시요.</strong>
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
							<h3 class="text-3xl font-semibold">기업회원</h3>
							<p class="mt-4 text-lg leading-relaxed text-gray-600">
	                                                    역마진 위험 없는 AD Story
	                          <br /><br />
	                                                    광고 부정클릭 방지 기술과 관리자의 로그 모니터링을 통해 일반회원들이 악의적으로 수익을 창출하지 않도록 합니다.
	                                                    이를 통해 기업회원의 광고료 지불 대비 수익을 극대화 시킵니다.
	                          <br /><br />
	                                                    실력있는 일반회원들이 포털 및 SNS 내 브랜드 콘텐츠 커버리지 확보를 위한 다양한 바이럴 마케팅을 기획 및 진행합니다.
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

<%@page import="vo.ReportVO"%>
<%@page import="vo.ReviewVO"%>
<%@page import="vo.ClassVO"%>
<%@page import="vo.ClassPicVO"%>
<%@page import="vo.ClassInfoVO"%>
<%@page import="vo.QuestionVO"%>
<%@page import="vo.UserVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!-- /////////////// 헤더 시작 //////////////////////////////// -->
<jsp:include page="/include/header.jsp"></jsp:include>
<!-- /////////////// 헤더 끝 //////////////////////////////// -->

<!-- jQuery 스크립트 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- 부트스트랩 JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.10.2/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<%
	ClassInfoVO classInfoVO = (ClassInfoVO) request.getAttribute("classInfoVO");
String classname = classInfoVO.getClassName();

ClassPicVO classPicVO = (ClassPicVO) request.getAttribute("classPicVO");

List<QuestionVO> queList = (List<QuestionVO>) request.getAttribute("queList");

List<ReviewVO> reviewList = (List<ReviewVO>) request.getAttribute("reviewList");

String loginCd = (String) session.getAttribute("loginCode");

UserVO userVO = (UserVO) request.getAttribute("userVO");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" href="img/중프 아이콘.png">
<title>클래스 조회</title>
<meta charset="utf-8" />
<meta name="mypage"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="./css/mypage.css" />

<style>


#menu01 {
/* 	height: 50px; */
	width: 800px;
	background-color: #fff;
	display: inline-block;
	align-items: center;
/* 	margin-top: 80px */
}

ul li {
	list-style-type: none;
	margin-left: 20px;
	float: left;
}
</style>
</head>
<body>
	<div class="is-preload">

		<!-- Wrapper -->
		<div id="wrapper">

			<!-- Main -->
			<div id="main">
				<div class="inner">

					<!-------------------------------------------- Header ------------------------------------------------>

				


					<header id="header">
						<div style="display: flex; align-items: center; margin-left: 0px;">
<!-- 						<img src="/img/classAD/인기.png" style="width: 25px"> -->
					</div>
						<h3 align="center" style="margin-left: -800px; color: #EDA60F"><%= "["+ " "+ classInfoVO.getClassName() + " "+"]"%>
						</h3>
						<ul class="icons">
							<li><a href="#" class="icon brands fa-medium-m"><span
									class="label">Medium</span></a></li>
						</ul>
					</header>



					<!-------------------------------------------- Banner ------------------------------------------------->
					<section id="banner">
						<div class="content">
							<header>
										<div style=" align-items: center;">
									<img src="/img/classAD/하트2.png" style="width: 25px;">
								<h3>클래스 상세보기</h3>
								<p>일상의 따뜻한 휴식과 새로운 경험!</p>
								<img
									src="<%=request.getContextPath()%><%=classPicVO != null ? classPicVO.getFileStreCours() : ""%>"
									class="d71" style="width: 400px; height: auto;">
								<div style="display: flex; justify-content: flex-start;">
								</div>
							</header>

							<br>
							<section>
								<div style="display: flex; align-items: center;">
									<img src="/img/classAD/리뷰.png" style="width: 25px;">
									<h3 style="margin-left: 10px;">메뉴 선택</h3>
								</div>

								<div id="menu01">
									<ul>
										<li><a href="#01">클래스 소개</a></li>
										<li><a href="#02">커리큘럼</a></li>
										<li><a href="#03">호스트 소개</a></li>
										<li><a href="#04">위치</a></li>
										<li><a href="#05">후기</a></li>
										<li><a href="#06">문의</a></li>
									</ul>
								</div>
							</section>

							<hr
								style="border-color: #f56a6a; border-width: 2px; border-style: double;">
							<br>
							<section id="01">
								<div style="align-items: center;">
									<img src="/img/classAD/유령.png" style="width: 25px;">
									&emsp;
								<h4>클래스 소개</h4>&emsp;
									
								<input type="text" id="className" name="className"
									style="padding: 0 10px; width: 1000px; height: 200px;"
									placeholder="<%=classInfoVO != null ? classInfoVO.getClassName() : ""%>"
									value="<%=classInfoVO.getClassName()%>" disabled> <br>
							</section>
							
							<br>
							<button type="button"
								onclick="location.href='/paymentBeforeInfo?classId=${classInfoVO.classId}'">예약
								및 결제하기</button>
								<br><br>
								<hr
								style="border-color: #f56a6a; border-width: 2px; border-style: double;">
								
							<section id="02">
								<div style="align-items: center;">
									<img src="/img/classAD/공부2.png" style="width: 25px;">
								<br>
								<h4>커리큘럼</h4>
								<img
									src="<%=request.getContextPath()%><%=classPicVO != null ? classPicVO.getFileStreCours() : ""%>"
									class="d71" style="width: 400px; height: auto;">
								<div style="display: flex; justify-content: flex-start;">
								</div>
								<br>
								<div 
									style="background-color: #f8f9fa; width: 100%; text-align: left; padding: 10px; line-height: 1.5;">
									<%=classInfoVO != null ? classInfoVO.getClassCurr().replaceAll("\n", "<br>") : ""%>
								</div>
							
							<hr
								style="border-color: #f56a6a; border-width: 2px; border-style: double;">

								<br>
							</section>


							<section id="03">
								<div style="align-items: center;">
									<img src="/img/classAD/인기2.png" style="width: 25px;">
									<br>
								<h4>강사소개</h4><br>
								<img
									src="<%=request.getContextPath()%><%=classInfoVO != null ? classInfoVO.getHostPic() : ""%>"
									class="profile" style="width: 200px; height: 200px;"> <input
									type="text" id="classHost" name="classHost"
									style="padding: 0 10px; width: 400px;"
									placeholder="<%=classInfoVO.getClassHost()%>"
									value="<%=classInfoVO.getClassHost()%>" disabled> <br>
							</section>

							<hr
								style="border-color: #f56a6a; border-width: 2px; border-style: double;">
							<br>


							<section id="04">
								<div style="align-items: center;">
									<img src="/img/classAD/검색해보기.png" style="width: 25px;">
									<br>
								<h4>위치</h4>
								<input type="text" id="classAddr" name="classAddr"
									placeholder="<%=classInfoVO != null ? classInfoVO.getClassAddr() : ""%>"
									style="padding: 0 10px; width: 400px;"
									value="<%=classInfoVO.getClassAddr()%>" disabled> <br>
							</section>

							<div id="map" style="width: 500px; height: 400px;"></div>

							<script type="text/javascript"
								src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=bb3bd142edeaf0631883498c5b3cc1e9&libraries=services"></script>
							<script>
    function showMapWithAddress() {
        var address = "<%=classInfoVO.getClassAddr()%>";

									if (kakao.maps.services
											&& kakao.maps.services.Geocoder) {
										var geocoder = new kakao.maps.services.Geocoder();

										geocoder
												.addressSearch(
														address,
														function(result, status) {
															if (status === kakao.maps.services.Status.OK) {
																var container = document
																		.getElementById('map');
																var options = {
																	center : new kakao.maps.LatLng(
																			result[0].y,
																			result[0].x),
																	level : 3
																};
																var map = new kakao.maps.Map(
																		container,
																		options);

																var markerPosition = new kakao.maps.LatLng(
																		result[0].y,
																		result[0].x);
																var marker = new kakao.maps.Marker(
																		{
																			position : markerPosition
																		});

																marker
																		.setMap(map);
															} else {
																alert('주소를 찾을 수 없습니다.');
															}
														});
									}
								}

								window.onload = showMapWithAddress;
							</script>


								<hr
								style="border-color: #f56a6a; border-width: 2px; border-style: double;">
							
							<section id="05">
								<h4>후기</h4><br>
								<div
									style="display: flex; justify-content: center; align-items: left; height: 80px; margin: 20px">
									<div
										style="background-color: #E6E6E6; width: 100%; text-align: center;">
										<!-- 후기 목록 출력 -->
										<%
											if (reviewList == null || reviewList.isEmpty()) {
										%>
										<br> 아직 등록된 후기가 없어요 
										<%
											} else {
										for (ReviewVO review : reviewList) {
										%>
										<p>
											별점:
											<%=review.getReviewStar()%>
											<br>내용:
											<%=review.getReviewContent()%>
											<br>작성일자:
											<%=review.getReviewDate()%></p>
										<%
											}
										}
										%>
									</div>
								</div>
								<br>
								<hr
								style="border-color: #f56a6a; border-width: 2px; border-style: double;">
							<br>

							</section>


							<section id="06">
								<br>
								<h4>문의</h4>
								<div
									style="display: flex; justify-content: center; align-items: center; height: 120px; margin: 20px">
									<div
										style="background-color: #E6E6E6; width: 100%; text-align: center;">
										<!-- 문의 목록 출력 -->
										<%
											if (queList == null || queList.isEmpty()) {
										%>
										<br> 아직 등록된 문의가 없어요 <br> <br>
										<%
											} else {
										for (QuestionVO question : queList) {
										%>
										<p>
											문의 번호:
											<%=question.getQueId()%>
											<br>문의 내용:
											<%=question.getQueContent()%>
											<br>작성 일자:
											<%=question.getQueDate()%></p>
										<!-- 신고 모달 버튼 -->
										<%--   									<button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#reportModal<%= question.getQueId() %>">신고</button> --%>



										<%
											}
										}
										%>
									</div>
									<br>
								</div>
								<hr
									style="border: none; height: 1px; background-color: black; margin-top: 100px;">
						


								<!-- 모달 창 -->
								<%-- <% for (QuestionVO question : queList) { %>
						  <div class="modal fade" id="reportModal<%= question.getQueId() %>" tabindex="-1" role="dialog" aria-labelledby="reportModalLabel<%= question.getQueId() %>" aria-hidden="true">
						    <div class="modal-dialog" role="document">
						      <div class="modal-content">
						        <div class="modal-header">
						          <h5 class="modal-title" id="reportModalLabel<%=question.getQueId() %>">신고하기</h5>
						          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						            <span aria-hidden="true">&times;</span>
						          </button>
						        </div>
						        <div class="modal-body">
						          <!-- 신고 내용 입력 폼 -->
						          <form id="" action="/report" method="post">
						            <input type="hidden" name="questionId" value="<%= question.getQueId() %>">
						            <div class="form-group">
						              <label for="reportReason">신고 사유</label>
						              <textarea class="form-control" id="reportReason" name="reportReason" rows="3" required></textarea>
						            </div>
						            <button type="submit" class="btn btn-primary">신고하기</button>
						          </form>
						        </div>
						      </div>
						    </div>
						  </div>
						<% } %> --%>


								<!-- <script>
								// AJAX 요청을 보내고 질문을 가져와서 HTML을 업데이트하는 함수
								function getQuestions() {
								  // AJAX 요청을 생성합니다.
								  var xhr = new XMLHttpRequest();
								  xhr.open('post', '/report', true);

								 
                          // AJAX 요청이 완료되었을 때 실행되는 콜백 함수
                          xhr.onload = function () {
                            if (xhr.status === 200) {
                              // 요청이 성공하면 가져온 HTML을 출력할 요소를 선택합니다.
                              var questionListDiv = document.getElementById('questionList');

								      // 가져온 HTML을 출력할 요소의 내부 HTML로 설정합니다.
								      //questionListDiv.innerHTML = xhr.responseText;
								    }
								  };

								  // AJAX 요청을 보냅니다.
								  xhr.send();
								}

								// 페이지가 로드되면 getQuestions 함수를 호출하여 초기 질문 목록을 가져옵니다.
								//window.onload = getQuestions;

								</script> -->


<!-- 								문의 등록 폼 -->
<!-- 								<h5>문의하기</h5> -->
<!-- 								<form action="/question" method="post" -->
<!-- 									onsubmit="addQuestion(event)"> -->
<!-- 									<input type="hidden" name="action" value="addQuestion"> -->
<%-- 									<input type="hidden" name="classId" value="${classId}"> --%>
<!-- 									<textarea name="queContent" placeholder="문의 내용을 적어주세요" required></textarea> -->
<!-- 									<br> <input type="submit" value="등록하기"> -->
<!-- 								</form> -->

<!-- 								<script> -->
<!-- // 									// 문의 등록 폼을 처리하는 함수 -->
<!-- // 									function addQuestion(event) { -->
<!-- // 										event.preventDefault(); -->

<!-- // 										// 폼 데이터를 가져옵니다. -->
<!-- // 										var form = event.target; -->
<!-- // 										var formData = new FormData(form); -->

<!-- // 										// AJAX 요청을 생성합니다. -->
<!-- // 										var xhr = new XMLHttpRequest(); -->
<!-- // 										xhr.open(form.method, form.action); -->
<!-- // 										xhr.setRequestHeader( -->
<!-- // 												'X-Requested-With', -->
<!-- // 												'XMLHttpRequest'); -->

<!-- // 										// AJAX 요청이 완료되었을 때의 처리 로직을 설정합니다. -->
<!-- // 										xhr.onload = function() { -->
<!-- // 											if (xhr.status === 200) { -->
<!-- // 												// 성공적으로 요청이 완료되었을 때의 처리를 수행합니다. -->
<!-- // 												location.reload(); -->
<!-- // 											} else { -->
<!-- // 												// 요청이 실패하였을 때의 처리를 수행합니다. -->
<!-- // 												console.error(xhr.statusText); -->
<!-- // 											} -->
<!-- // 										}; -->

<!-- // 										// AJAX 요청을 보냅니다. -->
<!-- // 										xhr.send(formData); -->
<!-- // 									} -->
<!-- 								</script> -->



							</section>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>

	<!-- End #main -->




</body>

<!-- /////////////// 푸터 시작 //////////////////////////////// -->
<jsp:include page="/include/footer.jsp"></jsp:include>
<!-- /////////////// 푸터 끝 //////////////////////////////// -->
<!----------------------------------------------- Scripts -------------------------------------------------------------->
<script src="js/jquery.min.js"></script>
<script src="js/browser.min.js"></script>
<script src="js/breakpoints.min.js"></script>
<script src="js/main.js"></script>
</html>



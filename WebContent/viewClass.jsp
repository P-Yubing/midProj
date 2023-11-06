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

<%
ClassInfoVO classInfoVO = (ClassInfoVO) request.getAttribute("classInfoVO");
ClassPicVO classPicVO = (ClassPicVO) request.getAttribute("classPicVO");

QuestionVO questionVO = (QuestionVO) request.getAttribute("questionVO");

String loginCd = (String) session.getAttribute("loginCode");
UserVO uv = (UserVO) request.getAttribute("uv");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- j쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="icon" href="img/중프 아이콘.png">
<title>클래스 상세</title>
<meta charset="utf-8" />
<meta name="mypage"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="css/classview.css" />

<style>
#menu01 {
	height: 30px;
	width: 500px;
	background-color: #EFEFEF;
	display: inline-block;
	align-items: center;
	margin-top: 40px
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

					<!-- Header -->
					<header id="header">
						<h3>
							<%=classInfoVO.getClassName()%></h3>
						<ul class="icons">
							<li><a href="#" class="icon brands fa-medium-m"><span
									class="label">Medium</span></a></li>
						</ul>
					</header>

					<!-- Banner -->
					<section id="banner">
						<div class="content">

							<header>
								<h3>클래스 상세보기</h3>
								<p>일상의 따뜻한 휴식과 새로운 경험!</p>
								<img
									src="<%=request.getContextPath()%><%=classPicVO != null ? classPicVO.getFileStreCours() : ""%>"
									class="d71" style="width: 400px; height: auto;">
								<div style="display: flex; justify-content: flex-start;">
									<div>
										<img
											src="<%=request.getContextPath()%><%=classPicVO != null ? classPicVO.getFileStreCours() : ""%>"
											class="d71"
											style="width: 150px; height: auto; margin-right: 20px;">
									</div>
									<div>
										<img
											src="<%=request.getContextPath()%><%=classPicVO != null ? classPicVO.getFileStreCours() : ""%>"
											class="d71"
											style="width: 150px; height: auto; margin-right: 20px;">
									</div>
									<div>
										<img
											src="<%=request.getContextPath()%><%=classPicVO != null ? classPicVO.getFileStreCours() : ""%>"
											class="d71" style="width: 150px; height: auto;">
									</div>
								</div>
							</header>

							<form action="<%=request.getContextPath()%>/view.html"
								method="post">
								<section>
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


								<section id="01">
									<br>
									<h4>클래스 소개</h4>
									<input type="text" id="className" name="className"
										style="padding: 0 10px; width: 400px;"
										placeholder="<%=classInfoVO.getClassName()%>"
										value="<%=classInfoVO.getClassName()%>" disabled> <br>
								</section>


								<section id="02">
									<br>
									<h4>커리큘럼</h4>
									<img
										src="<%=request.getContextPath()%><%=classPicVO != null ? classPicVO.getFileStreCours() : ""%>"
										class="d71" style="width: 400px; height: auto;">
									<div style="display: flex; justify-content: flex-start;">
									</div>
									<div
										style="background-color: #E6E6E6; width: 100%; text-align: left; padding: 10px; line-height: 1.5;">
										<%=classInfoVO != null ? classInfoVO.getClassCurr().replaceAll("\n", "<br>") : ""%>
									</div>
									<hr
										style="border: none; height: 1px; background-color: black; margin-top: 20px;">
									<br>
								</section>



								<section id="03">
									<h4>강사소개</h4>
									<img
										src="<%=request.getContextPath()%><%=classInfoVO != null ? classInfoVO.getHostPic() : ""%>"
										class="profile" style="width: 200px; height: 200px;"> <input
										type="text" id="classHost" name="classHost"
										style="padding: 0 10px; width: 400px;"
										placeholder="<%=classInfoVO.getClassHost()%>"
										value="<%=classInfoVO.getClassHost()%>" disabled> <br>
								</section>

								<section id="04">
									<h4>위치</h4>
									<input type="text" id="classAddr" name="classAddr"
										placeholder="<%=classInfoVO.getClassAddr()%>"
										style="padding: 0 10px; width: 400px;"
										value="<%=classInfoVO.getClassAddr()%>" disabled> <br>
								</section>

								<div id="map" style="width: 500px; height: 400px;"></div>

								<script type="text/javascript"
									src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=bb3bd142edeaf0631883498c5b3cc1e9&libraries=services"></script>
							<script>
    function showMapWithAddress() {
        var address = "<%=classInfoVO.getClassAddr()%>";
        
        if (kakao.maps.services && kakao.maps.services.Geocoder) {
            var geocoder = new kakao.maps.services.Geocoder();

            geocoder.addressSearch(address, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var container = document.getElementById('map');
                    var options = {
                        center: new kakao.maps.LatLng(result[0].y, result[0].x),
                        level: 3
                    };
                    var map = new kakao.maps.Map(container, options);
                    
                    var markerPosition = new kakao.maps.LatLng(result[0].y, result[0].x);
                    var marker = new kakao.maps.Marker({
                        position: markerPosition
                    });
                    
                    marker.setMap(map);
                } else {
                    alert('주소를 찾을 수 없습니다.');
                }
            });
        }
    }

    window.onload = showMapWithAddress;
</script>


								<section id="05">
									<h4>후기</h4>
									<div
										style="display: flex; justify-content: center; align-items: center; height: 300px; margin: 20px">
										<div
											style="background-color: #E6E6E6; width: 1000px; height: 110px; text-align: center;">
											<br> <br> 아직 등록된 후기가 없어요 <br> <br>
										</div>
									</div>
									<hr
										style="border: none; height: 1px; background-color: black; margin-top: 100px;">
									<br>
								</section>


								<section id="06">
									<br>
									<h4>문의</h4>
									<!-- 문의 목록 출력 -->
									<c:forEach var="question" items="${questionList}">
										<p>Question ID: ${question.queId}</p>
										<p>Question Content: ${question.queContent}</p>
										<p>Question Date: ${question.queDate}</p>
										<!-- 문의에 대한 답변 목록 출력 -->
										<h5>Answers:</h5>
										<c:forEach var="answer" items="${answerMap[question.queId]}">
											<p>Answer ID: ${answer.queId}</p>
											<p>Answer Content: ${answer.ansContent}</p>
											<p>Answer Date: ${answer.ansDate}</p>
										</c:forEach>
										<hr>
									</c:forEach>

									<!-- 문의 등록 폼 -->
									<h5>Add Question:</h5>
									<form action="<%=request.getContextPath()%>/view.html" method="post">
										<input type="hidden" name="action" value="addQuestion">
										<input type="hidden" name="classId" value="${classId}">
										<textarea name="queContent" placeholder="Question Content" required></textarea><br>
<!-- 										<input type="text" name="queDate" placeholder="Question Date" required> -->
<!-- 날짜 선택이나 적게 하지 말고 달력에 기본값으로 오늘 설정해서 sysdate말고 그냥 날려주자 hidden으로 -->
										<input type="date" id="date" onchange="showSelectedDate(this.value)">
										<br>
										<input type="submit" value="Submit">
									</form>

									<!-- 답변 등록 폼 -->
									<h5>Add Answer:</h5>
									<form action="<%=request.getContextPath()%>/view.html" method="post">
										<input type="hidden" name="action" value="addAnswer">
										<input type="hidden" name="classId" value="${classId}">
										<input type="text" name="queId" placeholder="Question ID" required><br>
										<!-- 받아와야함 queId -->
										<textarea name="ansContent" placeholder="Answer Content" required></textarea><br>
										<input type="text" name="ansDate" placeholder="Answer Date" required><br>
										<input type="submit" value="Submit">
									</form>
								</section>
							</form>
						</div>
				</div>
			</div>
		</div>

	</div>


</body>

</html>

<!-- End #main -->

<!-- /////////////// 푸터 시작 //////////////////////////////// -->
<jsp:include page="/include/footer.jsp"></jsp:include>
<!-- /////////////// 푸터 끝 //////////////////////////////// -->

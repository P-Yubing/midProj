<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String loginCd = (String) session.getAttribute("loginCode");
	UserVO uv = (UserVO) session.getAttribute("userVO");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" href="img/중프 아이콘.png">
<title>마이페이지</title>
<meta charset="utf-8" />
<meta name="mypage"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="css/mypage.css" />
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
						<ul class="icons">
							<li><a href="#" class="icon brands fa-medium-m"><span
									class="label">Medium</span></a></li>
						</ul>
					</header>

					<!-- Banner -->
					<section id="banner">
						<div class="content">
							<header>
								<h3>비밀번호 찾기 결과</h3>
								<p>입력하신 이메일 주소로 메일을 전송하였습니다.</p>

							</header>

							<ul class="actions">
								<li><a href="/login.jsp" class="button big">로그인 하기</a></li>
								<li><a href="/index.jsp" class="button big">메인으로</a></li>
							</ul>
						</div>

					</section>

				</div>
			</div>

			<!-- Sidebar -->
			<div id="sidebar">
				<div class="inner">

					<!-- Search -->
					<a><br>
					<h3>로그인해주세요.</h3> <br>원하시는 메뉴를 선택해주세요 <br></a> <br>
					<br>

					<!-- Menu -->
					<nav id="menu">
						<header class="major">
							<br>
							<h2>메뉴</h2>
						</header>
						<ul>
							<li><a href="">홈페이지</a></li>
							<li><a href="usermypage.html">프로필 수정하기</a></li>
							<li><a href="">수강 클래스 이력</a></li>
							<li><a href="">내가 등록한 클래스</a></li>
							<li><a href="">예약 정보 조회</a></li>
							<li><a href="">관심클래스</a></li>
						</ul>
					</nav>


					<section>
						<header class="major">
							<h2>Today? Do day!</h2>
						</header>
						<h3>일상의 따뜻한 휴식과 새로운 경험!</h3>
						<p>Let’s make more chance with Today? Do day! Class</p>
						<ul class="contact">
							<li class="icon solid fa-envelope"><a href="#">beewldus0213@naver.com</a></li>
							<li class="icon solid fa-phone">(042) 222-8202(평일 10:00 ~
								20:00)</li>
							<li class="icon solid fa-home">대전광역시 중구 계룡로 846, 3-4층<br />
							</li>
						</ul>
					</section>

					<!-- Footer -->
					<footer id="footer">
						<p class="copyright">
							&nbsp; &copy; 주식회사 いくぞ <br>대표: 박유빈 <br>팀원: 최미키코, 김재용,
							김지연, 이혜린
						</p>
					</footer>

				</div>
			</div>

		</div>

		<!-- Scripts -->
		<script src="js/jquery.min.js"></script>
		<script src="js/browser.min.js"></script>
		<script src="js/breakpoints.min.js"></script>
		<script src="js/main.js"></script>

	</div>
</body>

</html>


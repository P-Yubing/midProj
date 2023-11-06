<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%

String loginCd = (String)session.getAttribute("loginCode");
UserVO uv = (UserVO)session.getAttribute("userVO");

	
%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" href="img/중프 아이콘.png">
<title>마이페이지</title>
<meta charset="utf-8" />
<meta name="adminpage"
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
                            <h3>환영합니다~ '<%=uv.getUserName() %>' 관리자 님!! <br> ID: <%=uv.getUserId() %> </h3>

						<ul class="icons">
							<li><a href="#" class="icon brands fa-medium-m"><span
									class="label">Medium</span></a></li>
						</ul>
					</header>

					<!-- Section -->
					<section>
						<header class="major">
							<h2>내역 조회</h2>
						</header>
						<div class="posts">
							<article>
								<a href="" class="image"><img src="" alt="" /></a>
								<h3>회원정보 내역 조회</h3>
								<ul class="actions">
									<li><a href="/UserList" class="button">More</a></li>
								</ul>
							</article>
							<article>
								<a href="#" class="image"><img src="" alt="" /></a>
								<h3>예약 내역 조회</h3>
								<ul class="actions">
									<li><a href="/AllUserOrderClassInfo" class="button">More</a></li>
								</ul>
							</article>
							<article>
								<a href="#" class="image"><img src="" alt="" /></a>
								<h3>클래스 내역 조회</h3>
								<ul class="actions">
									<li><a href="/AllUserClassInfo" class="button">More</a></li>
								</ul>
							</article>
							<article>
								<a href="#" class="image"><img src="" alt="" /></a>
								<h3>정산 내역 조회</h3>
								<ul class="actions">
									<li><a href="/SettleInfo" class="button">More</a></li>
								</ul>
							</article>
							<article>
								<a href="#" class="image"><img src="" alt="" /></a>
								<h3>클래스 승인 대기 관리</h3>
								<ul class="actions">
									<li><a href="/ClassConfirm" class="button">More</a></li>
								</ul>
							</article>
							<article>
								<a href="" class="image"><img src="" alt="" /></a>
                                    <ul class="actions">
                                        <li><a href="/Logout" class="button">로그아웃</a></li>
							</article>
						</div>
					</section>

				</div>
			</div>

			<!-- Sidebar -->
			<div id="sidebar">
				<div class="inner">

					<!-- Search -->
					 <a><br><h3>(안녕하세요 '<%=uv.getUserName() %>' 관리자 님) <br> 오늘도 좋은하루 되세요♥^^♥ 
                       <br> ID: <%=uv.getUserId() %> </h3>
                       <br>원하시는 메뉴를 선택해주세요 <br></a>

                       <br><br>

					<!-- Menu -->
					<nav id="menu">
						<header class="major">
							<br>
							<h2>메뉴</h2>
						</header>
						<ul>
							<li><a href="/index.jsp">홈페이지</a></li>
							<li><a href="/UserList">회원정보 내역 조회</a></li>
							<li><a href="/AllUserOrderClassInfo">예약 내역 조회</a></li>
							<li><a href="/AllUserClassInfo">클래스 내역 조회</a></li>
							<li><a href="/SettleInfo">정산 내역 조회</a></li>
							<li><a href="/ClassConfirm">클래스 승인 대기 관리</a></li>
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
							&copy; 주식회사 いくぞ <br>대표: 박유빈 <br>팀원: 최미키코, 김재용, 김지연, 이혜린
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

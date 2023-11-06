<%@page import="vo.UserVO"%>
<%@page import="service.UserServiceImpl"%>
<%@page import="service.IUserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript" src="/js/jquery.js"></script>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Today?DoDay! 운영페이지 - Index</title>
<meta content="" name="description">
<meta content="" name="keywords">
<!-- Favicons -->
<link href="img/중프 아이콘.png" rel="icon">
<link href="../zenblog/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">



<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Spoqa+Han+Sans&display=swap"
	rel="stylesheet">


<!-- Vendor CSS Files -->
<link href="./zenblog/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="./zenblog/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="./zenblog/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">
<link href="./zenblog/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="./zenblog/assets/vendor/aos/aos.css" rel="stylesheet">

<!-- Template Main CSS Files -->
<link href="./zenblog/assets/css/variables.css" rel="stylesheet">
<link href="./zenblog/assets/css/main.css" rel="stylesheet">



<!-- =======================================================
  * Template Name: ZenBlog
  * Updated: May 30 2023 with Bootstrap v5.3.0
  * Template URL: https://bootstrapmade.com./zenblog-bootstrap-blog-template/
  * Author: BootstrapMade.com
  * License: https:///bootstrapmade.com/license/
  ======================================================== -->

<style>
@import url('https://fonts.googleapis.com/icon?family=Material+Icons');

#header {
	background-color: #FFFFFF;
	font-family: 'Spoqa Han Sans', sans-serif;
	/*      margin: 10px;   */
}

#footer {
	background-color: #F2820F;
	font-family: 'Spoqa Han Sans', sans-serif;
}

 .form-wrapper {
    /* 필요한 스타일을 추가하세요 (예: 너비, 정렬 등) */
  }

 #header .form-wrapper button {
/*  버튼수정 */
    margin-left: 10px;
    margin-bottom: 30px;
    padding: 0px;
    background: transparent; /* 버튼 배경 투명하게 설정 */
    border: transparent; /* 버튼 테두리 제거 */
    cursor: pointer; /* 커서 모양을 포인터로 변경 */
    border-style: transparent;
    height: 0px;
  }

  #header .form-wrapper button img {
    width: 30px;
    height: 30px;
/*     display: block; /* 이미지를 블록 요소로 설정하여 버튼 박스 안에 들어가도록 함 */ */
  }

#header .mk-2 {
	display: inline-block;
	padding: 2px 20px;
	background-color: #FFF;
	border: 2px solid #f56a6a;
	color: #f56a6a;
	border-radius: 35px;
	text-decoration: none;
	position: relative;
	left: 100px;
	font-family: 'Spoqa Han Sans', sans-serif;
}

#header .search-form-wrap {
	position: absolute;
	top: 100%;
	right: 0;
}

#header .dropdown-label {
	font-size: 13px;
	margin: 10px;
	font-weight: bold;
	color: rgb(50, 50, 50);
}

#header .dropdown {
	position: relative;
	display: inline-block;
}

#header .dropbtn_icon {
	font-family: 'Material Icons';
}

#header .dropbtn {
	display: block;
	border: 2px solid rgb(94, 94, 94);
	border-radius: 4px;
	background-color: #fcfcfc;
	font-weight: 400;
	color: rgb(124, 124, 124);
	padding: 12px;
	width: 240px;
	text-align: left;
	cursor: pointer;
	font-size: 12px;
	z-index: 1;
	position: relative;
}

#header .dropdown-content {
	display: none;
	font-weight: 400;
	background-color: #fcfcfc;
	min-width: 240px;
	border-radius: 8px;
	height: 160px;
	overflow: scroll;
	box-shadow: 0px 0px 10px 3px rgba(190, 190, 190, 0.6);
}

#header .dropdown-content::-webkit-scrollbar {
	width: 5px;
	height: 10px;
}

#header .dropdown-content::-webkit-scrollbar-thumb {
	border-radius: 2px;
	background-color: rgb(194, 194, 194)
}

#header .dropdown-content div {
	display: block;
	text-decoration: none;
	color: rgb(37, 37, 37);
	font-size: 12px;
	padding: 12px 20px;
}

#header .dropdown-content div:hover {
	background-color: rgb(226, 226, 226);
}

#header .dropdown-content.show {
	display: block;
}

  /* 스타일 추가 */
 #header .form-wrapper {
    padding: 20px;
    margin-bottom: -40px; /* 원하는 간격 설정 */
  }
  
  
  


/* img { */
/* 	width: 300px; */

/* } */
</style>


</head>

<body>

	<!-- ======= Header ======= -->
	<div id="header"
		class="container-fluid d-flex align-items-center sticky-top">
		
		<!-- 		<div -->
		<!-- 			class="container-xl d-flex align-items-center justify-content-between"> -->
		<div
			class="container-xl d-flex align-items-center justify-content-start">
			&emsp; &emsp;
			<a href="/index.jsp" class="logo d-flex align-items-center">
			<img src="/img/classAD/로고2.png" style="width: 400px; margin-left: -100px">
				 <!-- Uncomment the line below if you also wish to use an image logo -->
<!-- 								<h1>Today?DoDay!</h1> -->
			</a> 


<!-- <div class="form-wrapper"> -->
<!--   <form action="/search" method="post"> -->
<!--     <div style="display: flex; align-items: center;"> -->
<!--       <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요" style="flex: 1;"> -->
<!--       <button type="submit" style="margin-left: 10px;">검색</button> -->
<!--     </div> -->
<!--   </form> -->
<!-- </div> -->

	&emsp; &emsp;
<div class="form-wrapper">
  <form action="/search" method="post">
    <div style="display: flex; align-items: center;">
      <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요" >
      <button type="submit">
        <img src="img/classAD/검색.png" alt="검색">
      </button>
    </div>
  </form>
</div>



			
<!-- 			 </form> -->
<!--         <form action="/search" method="post" style="padding: 20px;"> -->
<!--         	<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요"> -->
        	
<!--         <button type="submit">검색</button> -->
<!--     </form> -->
    
			<nav id="navbar" class="navbar">
				<ul>
					<li class="dropdown"><a href="#" class="dropdown-link">카테고리</a>
						<ul class="subCategory">
							<li class="dropdown">
								<ul class="subCategory">
								</ul>
							</li>
							<li><a href="#" onclick="navigateToCategory('카페')">카페</a></li>
							<li><a href="#" onclick="navigateToCategory('요리')">요리</a></li>
							<li><a href="#" onclick="navigateToCategory('베이커리')">베이커리</a></li>
							<li><a href="#" onclick="navigateToCategory('공예')">공예</a></li>
							<li><a href="#" onclick="navigateToCategory('드로잉')">드로잉</a></li>
							<li><a href="#" onclick="navigateToCategory('반려동물')">반려동물</a></li>
							<li><a href="#" onclick="navigateToCategory('키즈')">키즈</a></li>
							<li><a href="#" onclick="navigateToCategory('스포츠')">스포츠</a></li>
							<li><a href="#" onclick="navigateToCategory('플라워')">플라워</a></li>
						</ul></li>
				</ul>
			</nav>
			&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;

			<div class="position-relative">

				<%
					//세션은 하나의 브라우저(=창) 내에서 정보와 값을 공유한다(주로 로그인 상태 유지시 사용됨)
				String loginCd = (String) session.getAttribute("loginCode");

				UserVO userVO = (UserVO) session.getAttribute("userVO");

				if (loginCd != null) {
					//관리자 로그인시 보이는 헤더
					if (userVO != null && "A".equals(userVO.getUserType().trim())) {
				%>
				<a href="/adminMypage.jsp" class="mk-2"><i
					class="bi bi-person-vcard">관리자 페이지</i></a> <span class="mx-2"></span> <a
					href="/Logout" class="mk-2"><i class="bi bi-door-open">로그아웃</i></a>
				<%
					} else {
				//로그인 코드가 존재할 때 보여줄 헤더영역 배치
				%>
				<a href="/classcreate" class="mk-2">클래스 등록</a> <span class="mx-2"></span>
				<a href="/UpdateUserServlet" class="mk-2"><i
					class="bi bi-person-vcard">마이페이지</i></a> <span class="mx-2"></span> <a
					href="/Logout" class="mk-2"><i class="bi bi-door-open">로그아웃</i></a>

				<%
					}
				} else {
				//로그인 코드가 존재하지 않을때 보여줄 헤더영역 배치
				%>
				<a href="login.jsp" class="mk-2"><i class="bi bi-person-circle">로그인</i></a>
				<span class="mx-2"></span>
				<%
					}
				%>


				<!-- ======= Search Form ======= -->
				<div class="search-form-wrap js-search-form-wrap">
					<form action="search-result.html" class="search-form">
						<span class="icon bi-search"></span> <input type="text"
							placeholder="Search" class="form-control">
						<button class="btn js-search-close">
							<span class="bi-x"></span>
						</button>
					</form>
				</div>
				<!-- End Search Form -->

			</div>

		</div>
	</div>
	<!-- End Header -->
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var category = document.querySelector('.category');
			var subCategory = document.querySelector('.subCategory');

			category.addEventListener('click', function(e) {
				e.preventDefault();
				subCategory.classList.toggle('show');
			});

			document.addEventListener('click', function(e) {
				if (!category.contains(e.target)) {
					subCategory.classList.remove('show');
				}
			});
		});

		function navigateToCategory(category) {
			window.location.href = "/CategoryClass?classCategory=" + category;
		}
	</script>
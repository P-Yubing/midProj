<%@page import="vo.ClassPicVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ClassPicDaoImpl"%>
<%@page import="dao.IClassPicDao"%>
<%@page import="dao.IClassInfoDao"%>
<%@page import="dao.ClassInfoDaoImpl"%>
<%@page import="vo.ClassInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- /////////////// 헤더 시작 //////////////////////////////// -->
<jsp:include page="/include/header.jsp"></jsp:include>
<link rel="stylesheet" href="css/mypage.css" />
<!-- Bootstrap CSS -->
<head>
<body>
<link rel="stylesheet" href="/resource/css/bootstrap.css">
<script type="text/javascript" src="/resource/js/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap.js"></script>
<!-- 아울 캐러셀 라이브러리 임포트 -->
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.theme.default.min.css">
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
<!-- /////////////// 헤더 끝 //////////////////////////////// -->
<style>
/* .category-box { */
/*         display: inline-block; */
/*         margin-right: 10px; */
/*         border: 1px solid green; */
/*         background-color: skyblue; */
/*         border-radius: 10px; */
/*         padding: 5px; */
/*     } */



body, ul, li, p, h1, h2, h3, h4 {
    margin:0;
    padding:0;
    list-style:none;
}
 .slider-1 .owl-carousel img {
    width: 20px; /* 이미지 너비 설정 */
    height: 20px; /* 이미지 높이 설정 */
  }




.slider-1 {
     min-width:1850px; 
}

.slider-1 > .owl-carousel > .owl-stage-outer > .owl-stage > .owl-item > .item {
    height: 500px;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
  	margin: auto;
}

.slider-1 > .owl-carousel > .owl-nav > .owl-prev, .slider-1 > .owl-carousel > .owl-nav > .owl-next {
    position:absolute;
    top:50%;
    left:50%;
    transform:translateX(-50%) translateY(-50%);
    margin-left:-600px;
    background-color:transparent;
}

.slider-1 > .owl-carousel > .owl-nav > .owl-prev:hover, .slider-1 > .owl-carousel > .owl-nav > .owl-next:hover {
    background-color:transparent;
}

.slider-1 > .owl-carousel > .owl-nav > .owl-next {
    margin-left:600px;
}

.slider-1 > .owl-carousel > .owl-dots {
    margin:0;
    position:absolute;
    bottom:0;
    left:50%;
    transform:translateX(-50%);
}

/* .slider-1 > .owl-carousel > .owl-dots > .owl-dot > span { */
/*     margin:0; */
/*     padding:0; */
/*     border-radius:0; */
/*     width:100px; */
/*     margin:0 10px; */
/*     position:relative; */
/* } */

/* .slider-1 > .owl-carousel > .owl-dots > .owl-dot > span::after { */
/*     content:""; */
/*     display:block; */
/*     position:absolute; */
/*     top:0; */
/*     left:0; */
/*     width:0; */
/*      width: 50%; /* 원하는 크기로 설정 */ */
/*     height:100%; */
/*     background-color:black; */
/* } */

.slider-1 > .owl-carousel > .owl-dots > .owl-dot.active > span, .slider-1 > .owl-carousel > .owl-dots > .owl-dot:hover > span {
    background-color:#D6D6D6;
}

.slider-1 > .owl-carousel > .owl-dots > .owl-dot.active > span::after {
    width:100%;
    transition:width 5s 0.2s;
}

.slider-1 > .owl-carousel > .owl-stage-outer > .owl-stage > .owl-item > .item > .txt-box {
    position:absolute;
    top:50%;
    left:10%;
    transform:translateY(-50%);
}

.slider-1 > .owl-carousel > .owl-stage-outer > .owl-stage > .owl-item > .item.text-color-white {
    color:white;
}

.slider-1 > .owl-carousel > .owl-stage-outer > .owl-stage > .owl-item > .item > .txt-box > h1 {
    font-size:5rem;
    transition:opacity 1s 0.5s, transform 1s 0.5s;
    transform:translateY(500px);
    opacity:0;
}

.slider-1 > .owl-carousel > .owl-stage-outer > .owl-stage > .owl-item > .item > .txt-box > h2 {
    font-size:3rem;
    transition:opacity 1s 1s, transform 1s 1s;
    transform:translateY(200px);
    opacity:0;
}

.slider-1 > .owl-carousel > .owl-stage-outer > .owl-stage > .owl-item > .item > .txt-box > div {
    font-size:2rem;
    transition:opacity 1s 1.5s, transform 1s 1.5s;
    transform:translateY(200px);
    opacity:0;
}

.slider-1 > .owl-carousel > .owl-stage-outer > .owl-stage > .owl-item.active > .item > .txt-box > * {
    transform:translateY(0);
    opacity:1;
}
 .category-list {
    display: flex;
    justify-content: flex-start; /* Updated: Align the starting point */
    align-items: center; /* Optional: Align items vertically */
    flex-wrap: wrap;
    list-style: none;
    padding-left: 10px; 
  }
  
  .category-list li {
  margin-right: 10px;
  margin-bottom: 10px;
}
  
  .category-list li a {
    margin: -5px;
    color: rgb(242, 131, 22);
    text-decoration: none;
    box-sizing: border-box;
    min-width: fit-content;
    height: 40px;
    display: flex;
    -webkit-box-flex: 0;
    flex-grow: 0;
    flex-direction: row;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    padding: 8px 16px;
    gap: 8px;
    border: 1px solid rgb(242, 131, 22);
    border-radius: 20px;
    background-color: rgb(254, 249, 243);
    white-space: nowrap;
}
  }
  
  .category-list li a:hover {
    background-color: rgb(254, 249, 243);
  }
	.category-list__item-break {
  margin-top: 20px;
  flex-basis: 100%;
}

.card-container {
    display: flex;
    flex-direction: column;
    overflow: hidden;
    justify-content: center;
    padding: 10px;
    max-width: 1300px;
    margin: 0 auto;
}

.card-slide-container {
    display: flex;
    max-width: 100%;
    overflow: hidden;
    justify-content: center;
}

.he1, .he2, .he3, .he4, .he5, .he6, .he7 {
    flex: 1 0 200px;
    max-width: 400px;
    padding: 10px;
    border: 1px solid #ccc;
    text-align: center;
    margin-right: 5px;
}

.he7 {
    margin-right: 0;
}

@media screen and (min-width: 1650px) {
    .card-slide-container {
        max-width: 1230px;
    }
    .he1, .he2, .he3, .he4, .he5, .he6, .he7 {
        flex: 1 0 180px;
        max-width: 600px;
        margin-right: 20px;
    }
}

.owl-nav {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    width: 100%;
    z-index: 2;
    display: flex;
    justify-content: space-between;
}

.owl-nav .owl-prev {
    font-size: 30px;
    color: #000;
    background-color: rgba(255, 255, 255, 0.8);
    padding: 10px;
    border-radius: 50%;
    cursor: pointer;
    transition: background-color 0.3s ease;
    position: absolute;
    left: 10px; /* Adjust this value to position the left button */
}

.owl-nav .owl-next {
    font-size: 30px;
    color: #000;
    background-color: rgba(255, 255, 255, 0.8);
    padding: 10px;
    border-radius: 50%;
    cursor: pointer;
    transition: background-color 0.3s ease;
    position: absolute;
    right: 10px; /* Adjust this value to position the right button */
}
</style>
<main id="main">
<!-- /////////////////////////////// 내용 시작 ////////////////////////////////////////////////////////// -->
<%-- [<%=request.getAttribute("joinCode") %>] --%>
<%-- [<%=session.getAttribute("loginCode") %>] --%>
<%-- <% //로그인 잘 되는지 보려고 넣어둔 코드입니다 %> --%>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 아울 캐러셀 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.theme.default.min.css">

<div class="slider-1">
    <div class="owl-carousel owl-theme">
	<div class="item" style="background-image: url(../img/classAD/원데이5.png)">
            <div class="txt-box">
<!--               <h1>1 DAY</h1> -->
<!--                 <h2>키즈 유투버 체험 클래스</h2> -->

            </div>
        </div>
        <div class="item text-color-white"  style="background-image: url(../img/classAD/원데이1.png)">
            <div class="txt-box">
<!--                <h1>Macaron</h1> -->
<!--                 <h2>한 마카롱 하실래예?</h2>  -->

            </div>
        </div>
        <div class="item text-color-white" style="background-image: url(../img/classAD/원데이6.png)">
            <div class="txt-box">
<!--                 <h1></h1> -->
<!--                 <h2></h2> -->

            </div>
        </div>
        <div class="item text-color-white" style="background-image: url(../img/classAD/원데이3.png)">
            <div class="txt-box">
<!--                 <h1>스포츠 클래스</h1> -->
<!--                 <h2>스포츠 클래스를 개설 이벤트~!</h2> -->

            </div>
        </div>
        <div class="item" style="background-image: url(../img/classAD/원데이4.png)">
            <div class="txt-box">
<!--                 <h1>극복 프로젝트</h1> -->
<!--                 <h2>디지털 원데이 클래스</h2> -->
            </div>
        </div>
    </div>
</div>
 <script>
 $('.slider-1 > .owl-carousel').owlCarousel({
	    autoplay:true, // 오토 플레이
	    autoplayTimeout:6000, // 오토 플레이 시에 다음 슬라이드로 넘어가는 주기, 2초
	    loop:true,
	    margin:0,
	    nav:true,
		navText: ['<img src="/img/classAD/왼쪽.png">', '<img src="/img/classAD/오른쪽.png">'],
			responsive:{
	        0:{
	            items:1
	        }
	    }
	});

	var $firstDot = $('.slider-1 > .owl-carousel > .owl-dots > .owl-dot.active');

	$firstDot.removeClass('active');

	setTimeout(function() {
	    $firstDot.addClass('active');
	}, 100);
	
	
 </script>

<%
	String joinCd = (String)request.getAttribute("joinCode");
	if(joinCd == "yes"){
		//회원가입(join.jsp)페이지를 include하기
%>
		<%@include file="login.jsp" %>
<%	
	}else{
		//원래 메인페이지 본문 보이게 하기
%>

	<!-- ======= Hero Slider Section ======= -->
	<!-- End Hero Slider Section -->
	<!-- ////////////////////////검색페이지 시작//////////////////////////// -->
		<jsp:include page="/include/search.jsp"></jsp:include>
	<!-- /////////////////////////검색페이지 끝//////////////////////////// -->

<br><br>
	<hr style="border-color: #F2820F; border-width: 2px; border-style: double;">
		<div style="display: flex; align-items: center;">
  		<img src="/img/classAD/좋아요.png" style="width: 25px;">
 		 <h3 style="margin-left: 10px;"> 다양한 클래스를 즐겨보세요!</h3>
		</div>

<br>
	<ul class="category-list">
	  <li><a href="#" onclick="navigateToCategory('카페')">☕ 카페</a></li>
	  <li><a href="#" onclick="navigateToCategory('요리')">🧑🏻‍🍳 요리</a></li>
	  <li><a href="#" onclick="navigateToCategory('베이커리')">🍰 베이커리</a></li>
	  <li><a href="#" onclick="navigateToCategory('공예')">🏺 공예</a></li>
	  <li><a href="#" onclick="navigateToCategory('드로잉')">🎨 드로잉</a></li>
	  <li><a href="#" onclick="navigateToCategory('반려동물')">🐶 반려동물</a></li>
	  <li><a href="#" onclick="navigateToCategory('키즈')">👶🏻 키즈</a></li>
	  <li><a href="#" onclick="navigateToCategory('스포츠')">🏃‍♀️ 스포츠</a></li>
	  <li><a href="#" onclick="navigateToCategory('플라워')">🌸 플라워</a></li>
	  <li><a href="#" onclick="navigateToCategory('캔들')">🕯️ 캔들</a></li>
	  <li class="category-list__item-break"></li>
	  <li><a href="#" onclick="navigateToCategory('음악')">🎵 음악</a></li>
	  <li><a href="#" onclick="navigateToCategory('뷰티')">💄 뷰티</a></li>
	  <li><a href="#" onclick="navigateToCategory('언어')">🗣️ 언어</a></li>
	  <li><a href="#" onclick="navigateToCategory('운동')">🏋️‍♂️ 운동</a></li>
	  <li><a href="#" onclick="navigateToCategory('데이트')">🌹 데이트</a></li>
	  <li><a href="#" onclick="navigateToCategory('뜨개')">🧶 뜨개</a></li>
	  <li><a href="#" onclick="navigateToCategory('여행')">✈️ 여행</a></li>
<!-- 	  <li><a href="#" onclick="navigateToCategory('목공')">🪚 목공</a></li> -->
	  <li><a href="#" onclick="navigateToCategory('건축')">🏛️ 건축</a></li>
	  <li><a href="#" onclick="navigateToCategory('게임')">🎮 게임</a></li>
	  <li><a href="#" onclick="navigateToCategory('다이빙')">🤿 다이빙</a></li>
<!-- 	  <li class="category-list__item-break"></li> -->
	</ul>
	
			<br><br>
			<div style="display: flex; align-items: center;">
  		<img src="/img/classAD/검색해보기.png" style="width: 25px;">
 		 <h3 style="margin-left: 10px;"> 등록순으로 살펴보기!</h3>
		</div>

	<br>
	

	<!-- /////////////////////인기(관심수업등록수)정렬//////////////////////// -->
		<button> <a href="/WishClass">관심등록순</a></button>&emsp;
	<!-- /////////////////////인기(최신등록수)정렬//////////////////////// -->
		<button> <a href="/RecentClass">최신등록순</a></button>
	<!-- ////////////////////////카테고리///////////////////////////////// -->
	
	
			<br><br>
	<hr style="border-color: #f56a6a; border-width: 2px; border-style: double;">
			<div style="display: flex; align-items: center;">
  		<img src="/img/classAD/인기.png" style="width: 25px;">
 		 <h3 style="margin-left: 10px;"> 인기 클래스 </h3>
		</div>
	
	
		<!-- /////////////////////메인화면에 클래스 몇개 띄우기 시작///////////////////// -->
<%-- 	<jsp:include page="/include/classList.jsp"></jsp:include> --%>
<%
IClassInfoDao classInfoDao = ClassInfoDaoImpl.getInstance();
IClassPicDao classPicDao = ClassPicDaoImpl.getInstance();

List<ClassInfoVO> classInfoVOList =  classInfoDao.favoClass();

List<ClassInfoVO> filterClassInfo = new ArrayList<>();

for(ClassInfoVO classInfo : classInfoVOList) {
	String classId = classInfo.getClassId();
	ClassPicVO pic = classPicDao.getClassPic(classId);
	if(pic != null) {
		classInfo.setClassPicId(pic.getClassPicId());
		classInfo.setClassCours(pic.getFileStreCours());
	}else{
		System.out.println("사진을 찾을수 없습니다.");
	}
	if(pic != null && classId.equals(pic.getClassId())) {
		filterClassInfo.add(classInfo);
	}
}

// out.print("classInfoVOList : " + classInfoVOList);
%>
<c:set var="classInfoVOList" value="<%=classInfoVOList%>" />
		<div class="card-container">
	        <!-- 이미지 슬라이드를 위한 추가 -->
	        <div class="card-slide-container owl-carousel owl-theme">
		       	<c:forEach var="classInfoVO" items="${classInfoVOList}" varStatus="stat">
	            <div class="he1">
	                <img src="${classInfoVO.classCours}" alt="수업 이미지">
	                <p><a href="/ClassDetailInfo?classId=${classInfoVO.classId}">${classInfoVO.className}</a></p>
	                <p>수업 소개: ${classInfoVO.classIntro}</p>
	                <p>카테고리: ${classInfoVO.classCategory}</p>
	<!--                 <p>클래스 번호: 1</p> -->
	<!--                 <p>관심등록 수: 15</p> -->
	            </div>
		        </c:forEach>
	        </div>
	    </div>

<script>
        $(document).ready(function () {
            $('.card-slide-container').owlCarousel({
                items: 5, // Show five items at a time
                margin: 10, // Set the spacing between the items
                nav: true, // Show navigation buttons (prev/next)
                navText: ['<span class="prev-btn">&#10094;</span>', '<span class="next-btn">&#10095;</span>'], // Custom navigation buttons
                responsive: {
                    0: {
                        items: 1 // Show one item on smaller screens
                    },
                    768: {
                        items: 2 // Show two items on screens with a width of 768px or larger
                    },
                    992: {
                        items: 5 // Show five items on screens with a width of 992px or larger
                    },
                    1650: {
                        items: 5 // Show five items on screens with a width of 1650px or larger
                    }
                }
            });
        });
    </script>
		<!-- /////////////////////메인화면에 클래스 몇개 띄우기 끝///////////////////// -->
<!-- 	<form id= "#" action="/viewClass" method="post"> -->


	<hr style="border-color: #f56a6a; border-width: 2px; border-style: double;">
			<div style="display: flex; align-items: center;">
  		<img src="/img/classAD/리뷰.png" style="width: 25px;">
 		 <h3 style="margin-left: 10px;"> 후기 알아보기 </h3>
		</div>
	
	
		<!-- /////////////////////메인화면에 후기 몇개 띄우기///////////////////// -->
	<jsp:include page="/include/classList2.jsp"></jsp:include>
<!-- 	<form id= "#" action="/viewClass" method="post"> -->


<!-- 	<hr style="border-color: #F2820F; border-width: 2px; border-style: double;"> -->
	
	</form>
			<!-- End .row -->

	
	<!-- End Lifestyle Category Section -->
<%
	}
%>
<!-- /////////////////////////////// 내용 끝 ////////////////////////////////////////////////////////// -->

</main>
</body>
</head>

<!-- End #main -->

<!-- /////////////// 푸터 시작 //////////////////////////////// -->
<jsp:include page="/include/footer.jsp"></jsp:include>
<!-- /////////////// 푸터 끝 //////////////////////////////// -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
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
<!-- 아울 캐러셀 라이브러리 임포트 -->
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.theme.default.min.css">
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
</head>
<body>

    <div class="card-container">
        <!-- 이미지 슬라이드를 위한 추가 -->
        <div class="card-slide-container owl-carousel owl-theme">
            <div class="he1">
                <img src="./ClassPic/1.jpg" alt="수업 이미지">
                <p>베이킹클래스</p>
                <p>수업 소개: 안녕하세요, <br>나우쿠킹입니다 :)</p>
                <p>카테고리: 베이커리</p>
<!--                 <p>클래스 번호: 1</p> -->
<!--                 <p>관심등록 수: 15</p> -->
            </div>
            <div class="he2" onclick="location.href='/ClassDetailInfo';">
                <img src="./ClassPic/2.jpg" alt="수업 이미지">
                <p>쿠킹 클래스</p>
                <p>수업 소개: 쿠킹 클래스에서  <br>배우는 유익한 시간</p>
                <p>카테고리: 베이커리</p>
<!--                 <p>클래스 번호: 2</p> -->
<!--                 <p>관심등록 수: 12</p> -->
            </div>
            <div class="he3">
                <img src="./ClassPic/3.jpg" alt="수업 이미지">
                <p>쿠키볶아</p>
                <p>수업 소개: 내가만든 쿠키  <br> 쿠진스 배워봐요!</p>
                <p>카테고리: 쿠킹</p>
<!--                 <p>클래스 번호: 3</p> -->
<!--                 <p>관심등록 수: 10</p> -->
            </div>
            <div class="he4">
                <img src="./ClassPic/14.jpg" alt="수업 이미지">
                <p>영혼을 담아</p>
                <p>수업 소개: 도자기 공예  <br> 매력에 빠져봐요</p>
                <p>카테고리: 도자기</p>
<!--                 <p>클래스 번호: 4</p> -->
<!--                 <p>관심등록 수: 8</p> -->
            </div>
            <div class="he5">
                <img src="./ClassPic/7.jpg" alt="수업 이미지">
                <p>짱구친구 유리공예</p>
                <p>수업 소개: 깨질듯 안깨지는  <br>우리 사이</p>
                <p>카테고리: 유리 공예</p>
<!--                 <p>클래스 번호: 5</p> -->
<!--                 <p>관심등록 수: 6</p> -->
            </div>
            <div class="he6">
                <img src="./ClassPic/12.jpg" alt="수업 이미지">
                <p>아이와 함께</p>
                <p>수업 소개: 아이와 함께하는  <br> 토이 클래스</p>
                <p>카테고리: 클래스 </p>
<!--                 <p>클래스 번호: 6</p> -->
<!--                 <p>관심등록 수: 4</p> -->
            </div>
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
</body>
</html>
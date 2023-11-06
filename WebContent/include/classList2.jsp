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
				<img src="./ClassPic/29.jpg" alt="수업 이미지"> <br> <img
					src="./ClassPic/하트.png"
					style="width: 20px; display: inline; margin-left: 2px;"> <img
					src="./ClassPic/하트.png" style="width: 20px; display: inline;">
				<p> ogp** 님의 후기</p>
				<p>: 정말 재미있어요:) <br> 다시 하고 싶어요!<br> 추천 꾸욱!</p>
			</div>
			<div class="he2">
				<img src="./ClassPic/28.jpg" alt="수업 이미지"> <br> 
				<img src="./ClassPic/하트.png" style="width: 20px; display: inline; margin-left: 2px;"> 
				<img src="./ClassPic/하트.png" style="width: 20px; display: inline;">
				<img src="./ClassPic/하트.png" style="width: 20px; display: inline; margin-left: 2px;">
				<img src="./ClassPic/하트.png" style="width: 20px; display: inline;">
				<p> a12** 님의 후기</p>
				<p>: 오늘 선생님이  <br> 너무 친절하셨어요  <br> 즐거운 시간이었습니다!</p>
			</div>
			<div class="he3">
				<img src="./ClassPic/4.jpg" alt="수업 이미지"><br>
				<img src="./ClassPic/하트.png" style="width: 20px; display: inline; margin-left: 2px;"><br>
				<p> ds*** 님의 후기</p>
				<p>: 재밌는 하루였습니다! <br> 또 좋은 기회로 다시  <br> 꼭 만나고 싶어요!</p>
			</div>
			<div class="he4">
				<img src="./ClassPic/31.jpg" alt="수업 이미지"><br>
				<img src="./ClassPic/하트.png" style="width: 20px; display: inline; margin-left: 2px;"> 
				<img src="./ClassPic/하트.png" style="width: 20px; display: inline;">
				<img src="./ClassPic/하트.png" style="width: 20px; display: inline; margin-left: 2px;">
				<img src="./ClassPic/하트.png" style="width: 20px; display: inline;">
				<p> fsd** 님의 후기</p>
				<p>다시 체험하고싶어요 <br> 긍정적인 시간이었습니다!  <br> 다음에 또 할께용</p>
			</div>
			<div class="he5">
				<img src="./ClassPic/32.jpg" alt="수업 이미지"><br>
				<img src="./ClassPic/하트.png" style="width: 20px; display: inline; margin-left: 2px;"> 
				<img src="./ClassPic/하트.png" style="width: 20px; display: inline;">
				<img src="./ClassPic/하트.png" style="width: 20px; display: inline; margin-left: 2px;">
				<img src="./ClassPic/하트.png" style="width: 20px; display: inline;">
				<p> sd*** 님의 후기</p>
				<p>언제 이런 경험을 <br> 해보나 싶어요!  <br> 완전 추천</p>
			</div>
			<div class="he6">
				<img src="./ClassPic/15.jpg" alt="수업 이미지"><br>
				<img src="./ClassPic/하트.png" style="width: 20px; display: inline; margin-left: 2px;"> 
				<img src="./ClassPic/하트.png" style="width: 20px; display: inline;">
				<img src="./ClassPic/하트.png" style="width: 20px; display: inline; margin-left: 2px;">
				<img src="./ClassPic/하트.png" style="width: 20px; display: inline;">
				<p>dsd** 님의 후기</p>
				<p>전문적인 느낌이 <br>  너무 좋았어요! <br></p>
			</div>
		</div>
	</div>
	<script>
		$(document)
				.ready(
						function() {
							$('.card-slide-container')
									.owlCarousel(
											{
												items : 5, // Show five items at a time
												margin : 10, // Set the spacing between the items
												nav : true, // Show navigation buttons (prev/next)
												navText : [
														'<span class="prev-btn">&#10094;</span>',
														'<span class="next-btn">&#10095;</span>' ], // Custom navigation buttons
												responsive : {
													0 : {
														items : 1
													// Show one item on smaller screens
													},
													768 : {
														items : 2
													// Show two items on screens with a width of 768px or larger
													},
													992 : {
														items : 5
													// Show five items on screens with a width of 992px or larger
													},
													1650 : {
														items : 5
													// Show five items on screens with a width of 1650px or larger
													}
												}
											});
						});
	</script>
</body>
</html>

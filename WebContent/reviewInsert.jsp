<%@page import="java.util.List"%>
<%@page import="vo.UserIdReviewInfoVO"%>
<%@ page import="vo.UserVO"%>
<%@ page import="vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- JSP 코드 내부에서 사용할 변수 및 객체 선언 --%>
<%

// String payId = (String) session.getAttribute("payId");
String payId = (String) request.getAttribute("payId");
ReviewVO rv = (ReviewVO) request.getAttribute("rv");
	
%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="img/중프 아이콘.png">
<link rel="stylesheet" href="css/review.css">
<script type="text/javascript" src="/js/jquery.min.js"></script>
<meta charset="UTF-8">
<title>리뷰 작성 하기</title>
</head>
<body>
	<div class="wrap">
		<h1>후기</h1>
		<br>
		<form id="reviewform" action="<%=request.getContextPath()%>/reviewInsert.html"
			method="post" onsubmit="return validateForm()">
			
				<!-- 히든 필드로 payId 추가 -->
      <input type="hidden" id="payId" name="payId" value="<%=payId %>"/>
<%--       <input type="hidden" id="payId" name="payId" value="<%=rv.getPayId() %>"/> --%>
		
				<p class="title_star">별점과 리뷰를 남겨주세요.</p>
				<br>
			<div class="review_rating">
				<div class="warning_msg">별점을 선택해 주세요.</div>
					<div class="starpoint_wrap">
				<div class="star-rating">
			  <input type="radio" id="5-stars" name="rating" value="5" />
			  <label for="5-stars" class="star">★</label>
			  <input type="radio" id="4-stars" name="rating" value="4" />
			  <label for="4-stars" class="star">★</label>
			  <input type="radio" id="3-stars" name="rating" value="3" />
			  <label for="3-stars" class="star">★</label>
			  <input type="radio" id="2-stars" name="rating" value="2" />
			  <label for="2-stars" class="star">★</label>
			  <input type="radio" id="1-star" name="rating" value="1" />
			  <label for="1-star" class="star">★</label>
			</div>
		</div>
		</div>
		<br> <br>
		<!-- 숨겨진 input 요소로 값을 저장 -->
			<input type="hidden" id="reviewStar" name="reviewStar" value="" />
			
			<script>
			  // 폼 제출 처리 함수
			  function submitForm() {
			    // 별점 선택 여부 확인
			    var rating = document.querySelector('input[name="rating"]:checked');
			    if (!rating) {
			      document.querySelector('.warning_msg').style.display = 'block';
			      return;
			    }
			    // 평가 점수를 히든 필드에 설정
			    document.getElementById('rate').value = rating.value;
			    // 여기서 다른 작업 수행 (폼 제출 등)
			    // ...
			  }
			</script>

			
			<div class="review_contents">
				<br><br>
				<h2>후기를 입력해주세요.</h2>
				<br>
				<!-- 제목 입력란 -->
				<dl>
			
					<dd>
						<input type="text" name="reviewContent" placeholder="내용을 입력해 주세요"
							style="width: 500px; height: 500px;">
					</dd>
				</dl>

				
			</div>

			<div class="bt_wrap">
				<!-- 등록 버튼과 취소 버튼 -->
				<button type="submit" onclick="insert()" class="submit_btn"
					style="background-color: #fccc5c; color: black; 
					padding: 15px 35px; border: none; cursor: pointer;">등록</button>
				<button type="button"
					onclick="location.href='<%=request.getContextPath()%>/UserIdReviewInfo'"
					class="cancel_btn"
					style="background-color: #fccc5c; color: black; margin: 10px;
					 padding: 15px 35px; border: none; cursor: pointer;">취소</button>
			</div>
	<!-- 폼 제출 처리를 위한 JavaScript 코드 -->
<script>
$(function(){
	$("input[name='rating']").on("click",function(){
		console.log("rating : " + $(this).val());
		$("#reviewStar").val($(this).val());
	});
});
// 	function validateForm() {
// 		var inputreviewStar = document.getElementById("reviewStar");
// 		var inputreviewContent = document.getElementById("reviewContent");
// 	    if (inputreviewStar.value === null || inputreviewStar.value === "") {
// 	      alert("별점을 매겨주세요.");
// 	      return false; 
// 	    } else if(inputreviewContent.value === null || inputreviewContent.value === "") {
// 		      alert("내용을 입력해주세요.");
// 		      return false;
// 	    } else {
// 	      alert("정상적으로 리뷰가 등록되었습니다. 이용해 주셔서 감사합니다*^^*");
// 	      return true; 
// 	    }
// 	  }
	function insert() {
		alert("정상적으로 리뷰가 등록되었습니다. 이용해 주셔서 감사합니다*^^*");
	}
</script>			
		</form>
	</div>
</body>
</html>

<%@page import="vo.ClassPicVO"%>
<%@page import="java.util.List"%>
<%@page import="vo.OrdersVO"%>
<%@page import="vo.ClassInfoVO"%>
<%@page import="vo.UserVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<%
	String loginCd = (String)session.getAttribute("loginCode");
	UserVO uv = (UserVO)request.getAttribute("uv");
	

	ClassInfoVO civ = (ClassInfoVO) request.getAttribute("getClass");
	String classId = (String) session.getAttribute("classId");

	
	
	ClassPicVO cpv = (ClassPicVO) request.getAttribute("getClassPic");
%>

<!-- /////////////// 헤더 시작 //////////////////////////////// -->
<jsp:include page="/include/header.jsp"></jsp:include>
<!-- /////////////// 헤더 끝 //////////////////////////////// -->
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">


<link rel="stylesheet" href="./css/payment.css">

</head>

<body>

	

	<!-- -------------------------------------클레스정보를 조회---------------------------------------------- -->

	
		<form action="PaymentAmount" method="post">
			<input type="hidden" name="classId" value="<%=civ.getClassId()%>">
			<div class="d1">
				<div class="d2">
					<a class="bi bi-arrow-left d21" onclick="history.back()"></a>
					<div class="d22">클래스 결제 페이지</div>
				</div>
				<div class="d3">

					<div class="d4">
						<div class="d5">
							<div class="d6">클래스 정보</div>
							<div class="d7">
								<img
									src="<%=request.getContextPath()%><%=cpv != null ? cpv.getFileStreCours() : ""%>"
									class="d71">
								<div class="d8">

									<p class="d72">Class Name</p>
									<p class="d73"><%=civ != null ? civ.getClassName() : ""%></p>
									<hr>
									<p class="d72">Address</p>
									<p class="d73"><%=civ != null ? civ.getClassAddr() : ""%></p>
									<hr>


									<p class="d72">Date</p>

									<label for="date">날짜를 선택하세요: <input type="date"
										id="date" onchange="showSelectedDate(this.value)">
									</label>

									<div id="selectedDate" class="d73"></div>

									<input type="hidden" name="ordersDate" id="ordersDate">

									<script>
										const dateInput = document
												.getElementById('date');
										const selectedDate = document
												.getElementById('selectedDate');
										const ordersDateInput = document
												.getElementById('ordersDate');

										// 현재 날짜를 가져오기
										const currentDate = new Date()
												.toISOString().split('T')[0];

										// 최소값을 설정
										dateInput.setAttribute('min',
												currentDate);

										function showSelectedDate(date) {
											selectedDate.textContent = '선택한 날짜: '
													+ date;
											ordersDateInput.value = date; // ordersDate hiddenフィールドに日付を設定
										}
									</script>



									<input type="hidden" name="ordersDate" value="">
									<hr>


								</div>
							</div>
						</div>
					</div>


					<div class="d15">
						<div class="d9">
							<div class="d10">
								<div class="d11">예약자 정보</div>
								<div class="d12">
									<div class="d13">
										<p class="d72">계정 ID</p>
										<p class="d73"><%=uv != null ? uv.getUserId() : ""%></p>
										<hr>

										<p class="d72">이름</p>
										<p class="d73"><%=uv != null ? uv.getUserName() : ""%></p>
										<hr>

										<p class="d72">전화번호</p>
										<p class="d73"><%=uv != null ? uv.getUserTel() : ""%></p>
										<hr>

									</div>
								</div>
							</div>
						</div>

					<!-- -------------------------------------클레스정보를 조회하고 수량 넣기---------------------------------------------- -->
					
					
						<div class="d9">
							<div class="d10">
								<div class="d11">결제 정보</div>
								<div class="d12">
									<div class="d13">
										<p class="d74">원데이 클래스 수강권 1매</p>
										<div style="text-align: right;">
											<p class="d73"><%=civ != null ? civ.getClassPrice() : ""%>
												원
											</p>
	
	
											<div class="d73">
												<button class="countbtn" type="button"
													onclick="count('minus')">-</button>
												<input type="text" name="ordersQty" id="ordersQtyInput" value="" readonly>
												<button class="countbtn" type="button"
													onclick="count('plus')">+</button>
												명
											</div>
											 <span id="result1" style="margin: 0 5px;"><input type="text" name="ordersAmount" readonly></span>원
											</div>
											
											<hr>
											<input class="paybtn" type="submit" value="결제하기">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

		</div>
	</div>
	

		</form>



		<script>
			function count(type) {
				const resultElement = document.getElementById('ordersQtyInput');
				let number = parseInt(resultElement.value);

				if (isNaN(number)) { // 입력값이가 숫자가 아닐 때 0르오 설정
					number = 0;
				}

				if (type === 'plus') {
					number += 1;
				} else if (type === 'minus') {
					if (number <= 0) {
						return;
					}
					number -= 1;
				}

				resultElement.value = number;
				calculatePrice();
			}

			function calculatePrice() {
			    const resultElement = document.getElementById('result1');
			    const countElement = document.getElementById('ordersQtyInput');
			    let count = parseInt(countElement.value);

			    if (isNaN(count)) {
			        count = 0;
			    }

			    let classPrice = <%= civ != null ? civ.getClassPrice() : 0 %>;
			    let total = classPrice * count;
			    
			    resultElement.querySelector('input').value = isNaN(total) ? "" : total;
			}



				
		</script>

		


	



	
	

	<!-- /////////////// 푸터 시작 //////////////////////////////// -->
	<jsp:include page="/include/footer.jsp"></jsp:include>
	<!-- /////////////// 푸터 끝 //////////////////////////////// -->

</body>
</html>


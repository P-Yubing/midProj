<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%

	String loginCd = (String)session.getAttribute("loginCode");
	UserVO uv = (UserVO)request.getAttribute("uv");
	
	
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="icon" href="img/중프 아이콘.png">
    <title>마이페이지</title>
    <meta charset="utf-8" />
    <meta name="mypage" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="/css/mypage.css" />
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
                            <h3>환영합니다~ '<%=uv.getUserName() %>' 님!! <br> ID: <%=uv.getUserId() %> </h3>
                            <ul class="icons">
                                <li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
                            </ul>
                        </header>
    
                        <!-- Banner -->
                        <section id="banner">
                            <div class="content">
                                <header>
                                    <h3>프로필 수정하기</h3>
                                    <p> 프로필을 수정을 원하시면  아래 내용을 작성하시고 '프로필 수정'버튼을 눌러주세요</p>
                                </header>

							<form action="<%=request.getContextPath() %>/UpdateUserServlet"
								method="post" onsubmit="return validateForm()">
								<h4></h4>
								<h4>이름</h4>
								<input type="text" id="userName" name="userName"
									placeholder="<%=uv.getUserName() %>"
									value="<%=uv.getUserName()%>"> <br>
								<h4>닉네임</h4>
								<input type="text" id="userNName" name="userNName"
									placeholder="<%=uv.getUserNName()%>"
									value="<%=uv.getUserNName() %>"> <br>
								<h4>전화번호</h4>
								<input type="text" id="userTel" name="userTel"
									placeholder="<%=uv.getUserTel()%>"
									value="<%=uv.getUserTel() %>"> <br>
								<h4>이메일</h4>
								<input type="text" id="userEmail" name="userEmail"
									placeholder="<%=uv.getUserEmail()%>"
									value="<%=uv.getUserEmail() %>"> <br> <br>
									
									<h4>비밀번호 입력 (필수)</h4>
									<h5>(변경하실 비밀번호를 입력해주세요)</h5>
								<a><input type="text" id="userPw" name="userPw"
									placeholder="" value=""></a> <br> <br>
								<ul class="actions">
									<li><input type="submit" value="회원정보 수정"
										onclick="update()"></li>
								</ul>

							</form>
							<script>
							 function validateForm() {
								    var inputElement = document.getElementById("userPw");
								    if (inputElement.value === null || inputElement.value === "") {
								      alert("비밀번호를 입력하세요!");
								      return false; 
								    } else {
								      alert("정상적으로 회원정보가 수정되었습니다.");
								      return true; 
								    }
								  }
							</script>

						</div>
                        </section>
    
                        <!-- Section -->
                        <section>
                            <header class="major">
                                <h2>내역 조회</h2>
                            </header>
                            <div class="posts">
                                <article>
                                    <a href="#" class="image"><img src="" alt="" /></a>
                                    <h3>수강 클래스 이력</h3>
                                    <ul class="actions">
                                        <li><a href="/UserIdReviewInfo" class="button">More</a></li>
                                    </ul>
                                </article>
                                <article>
                                    <a href="/SettleInfoUser" class="image"><img src="" alt="" /></a>
                                    <h3>나의 클래스 매출 내역</h3>
                                    <ul class="actions">
                                        <li><a href="/SettleInfoUser" class="button">More</a></li>
                                    </ul>
                                </article>
                                <article>
                                    <a href="#" class="image"><img src="" alt="" /></a>
                                    <h3>예약 정보 조회</h3>
                                    <ul class="actions">
                                        <li><a href="/UserIdOrderClassInfo" class="button">More</a></li>
                                    </ul>
                                </article>
                                <article>
                                    <a href="#" class="image"><img src="" alt="" /></a>
                                    <h3>홈 바로가기</h3>
                                    <ul class="actions">
                                        <li><a href="/index.jsp" class="button">홈페이지</a></li>
                                    </ul>
                                </article>
                                
                                
                                <article>
                                    <a href="" class="image"><img src="" alt="" /></a>
                                    <h3>로그아웃 하기</h3>
                                    <ul class="actions">
                                        <li><a href="/Logout" class="button">로그아웃</a></li>
                                    </ul>
                                </article>
                                <article>
                                    <form action="<%=request.getContextPath() %>/changeUserServlet" method="post">
                                    <a href="#" class="image"><img src="" alt="" /></a>
                                    <h3>탈퇴하기</h3>
                                    <ul class="actions">
                                        <li><a style="text-decoration:none"  type="submit" onclick="confirmWithdrawal()">탈퇴하기</a>
                                            </li>
                                    </ul>     
                                    </form>
                                </article>
       						 		<script>
       						 		
       						 	function confirmWithdrawal() {
       						     var result = confirm("정말로 'Today? Do Day!' 클래스를 탈퇴하시겠습니까?");
       						     if (result) {
       						     var redirectUrl = "/changeUserServlet";
       						 		window.location.href = redirectUrl;
       						       alert(" 정상적으로 탈퇴되었습니다. 이용해 주셔서 감사합니다.");
       						     } else {
       						       alert("탈퇴가 취소되었습니다.");
       						    var redirectUrl = "/UpdateUserServlet";
       						     }
       						   }
       						</script>
                            </div>
                        </section>
    
                    </div>
                </div>
    
                <!-- Sidebar -->
                <div id="sidebar">
                    <div class="inner">
    
                        <!-- Search -->
                       <a><br><h3>(안녕하세요 '<%=uv.getUserName() %>' 님) <br> 오늘도 좋은하루 되세요♥^^♥ 
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
                                <li><a href="/UpdateUserServlet">프로필 수정하기</a></li>
                                <li><a href="/UserIdReviewInfo">수강 클래스 이력</a></li>
                                <li><a href="/SettleInfoUser">나의 클래스 매출 내역</a></li>
                                <li><a href="/UserIdOrderClassInfo">예약 정보 조회</a></li>
                                <li><a href="/Logout">로그아웃</a></li>
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
                                <li class="icon solid fa-phone">(042) 222-8202(평일 10:00 ~ 20:00)</li>
                                <li class="icon solid fa-home">대전광역시 중구 계룡로 846, 3-4층<br></li>
                            </ul>
                        </section>
    
                        <!-- Footer -->
                        <footer id="footer">
                            <p class="copyright"> &nbsp; &copy; 주식회사 いくぞ <br>대표: 박유빈 <br>팀원: 최미키코, 김재용, 김지연, 이혜린 </p>
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

    
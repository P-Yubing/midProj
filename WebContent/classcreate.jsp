<%@page import="vo.UserVO"%>
<%@page import="vo.ClassInfoVO"%>
<%@page import="java.util.ArrayList" %>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%

	String loginCd = (String)session.getAttribute("loginCode");
	UserVO uv = (UserVO)session.getAttribute("userVO");
	ArrayList<ClassInfoVO> classList = (ArrayList<ClassInfoVO>) request.getAttribute("classList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="icon" href="img/중프 아이콘.png">
    <title>ClassCreate</title>
    <meta charset="utf-8" />
    <meta name="createClass" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="css/class2.css" />
</head>
    
<body>



    <form action="<%=request.getContextPath() %>/create" method="post" enctype="multipart/form-data">
        <div class="is-preload">
    
            <!-- Wrapper -->
            <div id="wrapper">
    
                <!-- Main -->
                <div id="main">
                    <div class="inner">
    
                        <!-- Header -->
                        <header id="header">
                            <h3>환영합니다~ <%=uv.getUserName() %>님!! <br> ID: <%=uv.getUserId() %> </h3>
                            <ul class="icons">
                                <li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
                            </ul>
                        </header>
    
                        <!-- Banner -->
                        <section id="banner">
                            <div class="content" >
                                <header>
                                    <h3>클래스 등록하기</h3>
                                    <p>클래스 등록을 원하시면 아래 내용을 작성하시고 '클래스 등록' 버튼을 눌러주세요</p>
                                </header>
                                <h4>class Name</h4>
                                <input type="text" name="className" placeholder="등록하실 클래스의 이름을 정해주세요">
                                <br>
                                <h4>Category</h4>
                                <select name="classCategory">
						            <option value="카페">카페</option>
						            <option value="요리">요리</option>
						            <option value="베이커리">베이커리</option>
						            <option value="공예">공예</option>
						            <option value="드로잉">드로잉</option>
						            <option value="반려동물">반려동물</option>
						            <option value="키즈">키즈</option>
						            <option value="스포츠">스포츠</option>
						            <option value="플라워">플라워</option>
						            </select>
                                <br>
                                <h4>소개</h4>
                                <input type="text" name="classIntro" placeholder="클래스의 소개를 적어주세요">
                                <br>
                                <h4>Price</h4>
                                <input type="text" name="classPrice" placeholder="당신의 클래스는 얼마일까요">
                                <br>
                                <h4>주중? 주말?</h4>
                                <select name="classDay">
						            <option value="주중">주중</option>
						            <option value="주말">주말</option> 
						        </select>                              
                                <br>
                                <h4>강사사진</h4>
                                	<input type="file" name="file" placeholder="강사의 사진을 업로드해주세요" />
                                <br>
                                <br>
                                <h4>Host</h4>
                                <input type="text" name="classHost" placeholder="클래스를 등록하는 당신의 이름을 입력해주세요">
                                <br>
                                <h4>Class 과정</h4>
                                <input type="text" name="classCurr" placeholder="클래스의 진행과정을 간략히 설명해주세요">
                                <br>
                                <h4>Address</h4>
                                <input type="text" name="classAddr" placeholder="클래스가 진행되는 장소의 주소를 입력해주세요">
                                <br>
                                <h4>클래스사진</h4>
                                	<input type="file" name="file2" placeholder="클래스의 사진을 업로드해주세요" />
                                <br><br>
                                <ul class="actions">
                                    <!-- <li><button  type="submit" class="button big">클래스 등록</button></li> -->
<!--                                     <li><a href="/classcreate.jsp" type="submit" class="button big">클래스 등록</a></li> -->
                                    <li><input type="submit" value="클래스 등록" class="button big" onclick="create()" ></li>
                                </ul>
                                <script>
                                function create() {
                                	alert("정상적으로 클래스 등록이 완료되었습니다.");
                                	
                                }
                                
                                </script>
                            </div>
                        </section>
    
                        <!-- Section -->
                        <section>
                            <header class="major">
                                <h2>바로가기</h2>
                            </header>
                            <div class="posts">
                                <article>
                                    <a href="#" class="image"><img src="" alt="" /></a>
                                    <h3>홈 바로가기</h3>
                                    <ul class="actions">
                                        <li><a href="/index.jsp" class="button">홈페이지</a></li>
                                    </ul>
                                </article>
                                <article>
                                    <a href="#" class="image"><img src="" alt="" /></a>
                                    <h3>마이페이지</h3>
                                    <ul class="actions">
                                        <li><a href="/UpdateUserServlet" class="button">More</a></li>
                                    </ul>
                                </article>
                                <article>
                                    <a href="#" class="image"><img src="" alt="" /></a>
                                    <h3>수강 클래스 이력</h3>
                                    <ul class="actions">
                                        <li><a href="/UserIdReviewInfo" class="button">More</a></li>
                                    </ul>
                                </article>
                                <article>
                                    <a href="#" class="image"><img src="" alt="" /></a>
                                    <h3>나의 클래스 매출 내역</h3>
                                    <ul class="actions">
                                        <li><a href="/SettleInfoUser" class="button">More</a></li>
                                    </ul>
                                </article>
                                <article>
                                    <a href="" class="image"><img src="" alt="" /></a>
                                    <ul class="actions">
                                        <li><a href="/Logout" class="button">로그아웃</a></li>
                                    </ul>
                                </article>
                                <article>
                                    <a href="#" class="image"><img src="" alt="" /></a>
                                    <h3></h3>
                                    <ul class="actions">
                                        <li><a href="#" style="text-decoration:none" type="text/javascript" ></a></li>
                                    </ul>
                                </article>
                            </div>
                        </section>
    
                    </div>
                </div>
    
                <!-- Sidebar -->
                <div id="sidebar">
                    <div class="inner">
    
                        <!-- Search -->
                       <a><br><h3>안녕하세요 <%=uv.getUserName() %>님 &nbsp; | &nbsp;ID: <%=uv.getUserId() %> </h3>
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
                                <li><a href="/UpdateUserServlet">마이페이지</a></li>
                                <li><a href="/UserIdReviewInfo">수강 클래스 이력</a></li>
                                <li><a href="/SettleInfoUser">나의 클래스 매출 내역</a></li>
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
                                <li class="icon solid fa-home">대전광역시 중구 계룡로 846, 3-4층<br /></li>
                            </ul>
                        </section>
    
                        <!-- Footer -->
                        <footer id="footer">
                            <p class="copyright">
                                &nbsp; &copy; 주식회사 いくぞ <br>
                               	 대표: 박유빈 <br>
                                	팀원: 최미키코, 김재용, 김지연, 이혜린
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
    </form>
</body>
</html>

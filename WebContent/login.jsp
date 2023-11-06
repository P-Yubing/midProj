<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- /////////////// 헤더 시작 //////////////////////////////// -->
<jsp:include page="/include/header.jsp"></jsp:include>
<!-- /////////////// 헤더 끝 //////////////////////////////// -->
<%
	String msg = session.getAttribute("msg") == null ? 
			"" : (String) session.getAttribute("msg");
	
	session.removeAttribute("msg");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
:root {
    --primary-color: #ffc654;
    --secondary-color: #ffd875;
    --black: #000000;
    --white: #ffffff;
    --gray: #efefef;
    --gray-2: #757575;

    --facebook-color: #4267B2;
    --google-color: #DB4437;
    --twitter-color: #1DA1F2;
    --insta-color: #E1306C;
}

@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600&display=swap');

* {
    font-family: 'Poppins', sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html,
body {
    height: 100vh;
    overflow: hidden;
}

.container {
    position: relative;
    min-height: 100vh;
    overflow: hidden;
}

.row {
    display: flex;
    flex-wrap: wrap;
    height: 100vh;
}

.col {
    width: 50%;
}

.align-items-center {
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
}

.form-wrapper {
    width: 100%;
    max-width: 28rem;
}

.form {
    padding: 1rem;
    background-color: var(--white);
    border-radius: 1.5rem;
    width: 100%;
    box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
    transform: scale(0);
    transition: .5s ease-in-out;
    transition-delay: 1s;
}

.input-group {
    position: relative;
    width: 100%;
    margin: 1rem 0;
}

.input-group i {
    position: absolute;
    top: 50%;
    left: 1rem;
    transform: translateY(-50%);
    font-size: 1.4rem;
    color: var(--gray-2);
}

.input-group input {
    width: 100%;
    padding: 1rem 3rem;
    font-size: 1rem;
    background-color: var(--gray);
    border-radius: .5rem;
    border: 0.125rem solid var(--white);
    outline: none;
}

.input-group input:focus {
    border: 0.125rem solid var(--primary-color);
}

.form button {
    cursor: pointer;
    width: 100%;
    padding: .6rem 0;
    border-radius: .5rem;
    border: none;
    background-color: var(--primary-color);
    color: var(--white);
    font-size: 1.2rem;
    outline: none;
    display: flex;
    justify-content: center;
    align-items: center;
}


.form p {
    margin: 1rem 0;
    font-size: .7rem;
}

.flex-col {
    flex-direction: column;
}

.social-list {
    margin: 2rem 0;
    padding: 1rem;
    border-radius: 1.5rem;
    width: 100%;
    box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
    transform: scale(0);
    transition: .5s ease-in-out;
    transition-delay: 1.2s;
}

.social-list>div {
    color: var(--white);
    margin: 0 .5rem;
    padding: .7rem;
    cursor: pointer;
    border-radius: .5rem;
    cursor: pointer;
    transform: scale(0);
    transition: .5s ease-in-out;
}

.social-list>div:nth-child(1) {
    transition-delay: 1.4s;
}

.social-list>div:nth-child(2) {
    transition-delay: 1.6s;
}

.social-list>div:nth-child(3) {
    transition-delay: 1.8s;
}

.social-list>div:nth-child(4) {
    transition-delay: 2s;
}

.social-list>div>i {
    font-size: 1.5rem;
    transition: .4s ease-in-out;
}

.social-list>div:hover i {
    transform: scale(1.5);
}

.facebook-bg {
    background-color: var(--facebook-color);
}

.google-bg {
    background-color: var(--google-color);
}

.twitter-bg {
    background-color: var(--twitter-color);
}

.insta-bg {
    background-color: var(--insta-color);
}

.pointer {
    cursor: pointer;
}

.container.sign-in .form.sign-in,
.container.sign-in .social-list.sign-in,
.container.sign-in .social-list.sign-in>div,
.container.sign-up .form.sign-up,
.container.sign-up .social-list.sign-up,
.container.sign-up .social-list.sign-up>div {
    transform: scale(1);
}

.content-row {
    position: absolute;
    top: 0;
    left: 0;
    pointer-events: none;
    z-index: 6;
    width: 100%;
}

.text {
    margin: 4rem;
    color: var(--white);
}

.text h2 {
    font-size: 3.5rem;
    font-weight: 800;
    margin: 2rem 0;
    transition: 1s ease-in-out;
}

.text p {
    font-weight: 600;
    transition: 1s ease-in-out;
    transition-delay: .2s;
}

.img img {
    width: 30vw;
    transition: 1s ease-in-out;
    transition-delay: .4s;
}

.text.sign-in h2,
.text.sign-in p,
.img.sign-in img {
    transform: translateX(-250%);
}

.text.sign-up h2,
.text.sign-up p,
.img.sign-up img {
    transform: translateX(250%);
}

.container.sign-in .text.sign-in h2,
.container.sign-in .text.sign-in p,
.container.sign-in .img.sign-in img,
.container.sign-up .text.sign-up h2,
.container.sign-up .text.sign-up p,
.container.sign-up .img.sign-up img {
    transform: translateX(0);
}

/* BACKGROUND */

.container::before {
    content: "";
    position: absolute;
    top: 0;
    right: 0;
    height: 100vh;
    width: 300vw;
    transform: translate(35%, 0);
    background-image: linear-gradient(-45deg, var(--primary-color) 0%, var(--secondary-color) 100%);
    transition: 1s ease-in-out;
    z-index: 6;
    box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
    border-bottom-right-radius: max(50vw, 50vh);
    border-top-left-radius: max(50vw, 50vh);
}

.container.sign-in::before {
    transform: translate(0, 0);
    right: 50%;
}

.container.sign-up::before {
    transform: translate(100%, 0);
    right: 50%;
}

/* RESPONSIVE */

@media only screen and (max-width: 425px) {

    .container::before,
    .container.sign-in::before,
    .container.sign-up::before {
        height: 100vh;
        border-bottom-right-radius: 0;
        border-top-left-radius: 0;
        z-index: 0;
        transform: none;
        right: 0;
    }

    /* .container.sign-in .col.sign-up {
        transform: translateY(100%);
    } */

    .container.sign-in .col.sign-in,
    .container.sign-up .col.sign-up {
        transform: translateY(0);
    }

    .content-row {
        align-items: flex-start !important;
    }

    .content-row .col {
        transform: translateY(0);
        background-color: unset;
    }

    .col {
        width: 100%;
        position: absolute;
        padding: 2rem;
        background-color: var(--white);
        border-top-left-radius: 2rem;
        border-top-right-radius: 2rem;
        transform: translateY(100%);
        transition: 1s ease-in-out;
    }

    .row {
        align-items: flex-end;
        justify-content: flex-end;
    }

    .form,
    .social-list {
        box-shadow: none;
        margin: 0;
        padding: 0;
    }

    .text {
        margin: 0;
    }

    .text p {
        display: none;
    }

    .text h2 {
        margin: .5rem;
        font-size: 2rem;
    }
}
</style>
</head>


<body>
<div id="container" class="container">
<!------------------ FORM SECTION ------------------------------------------------------->
    <div class="row">
    
<!---------------------- 회원가입 ---------------------------------------------------------------------->
      <div class="col align-items-center flex-col sign-up">
      <form action="/Join" method="post">
        <div class="form-wrapper align-items-center">
          <div class="form sign-up">
            
            <div class="input-group">
              <i class='bx bxs-user'></i>
              <input type="text" id="id" name="userId" placeholder="Id"
	        required pattern="[a-zA-Z][a-zA-Z0-9]{3,7}">
	        <span id="disp"></span>
            </div>
            
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
<!--               <input type="password" placeholder="Password"> 인풋타입 텍스트? -->
              <input type="password" class="form-control" id="pass" name="userPw" placeholder="Password"
	        required pattern="(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}">
			<!-- 대소 영문, 숫자, 영문자와 숫자가 아닌 모든 문자가 6~20자 -->
			<!-- 임의의 문자(.)를 대상으로 최소 개수(*,?)의 지정 패턴을 찾아라 -->
			<!-- ?= 전방탐색 - 일치 영역을 찾고 값은 반환하지 않는 패턴 =(equal)다음 일치하는 패턴을 찾음 -->
			<!-- * 0개 이상 반복 / + 1개 이상 반복 / ? 0 또는 1개 이상 반복 -->
            </div>
            
            <div class="input-group">
              <i class='bx bxs-user'></i>
              <input type="text" class="form-control" id="name" name="userName" placeholder="Username"
	        required pattern="[가-힣]{2,5}">
            </div>
            
            <div class="input-group">
              <i class='bx bxs-user'></i>
              <input type="text" class="form-control" id="n_name" name="userNName" placeholder="닉네임 :한글 최대 15글자"
	        required pattern="[가-힣]{2,15}">
	        <br>
	        <span id="nickName"></span>
            </div>
            
            <div class="input-group">
              <i class='bx bx-mail-send'></i>
              <input type="email" id="mail" name="userEmail" placeholder="Email"
	        pattern="[0-9a-zA-Z]+@[0-9a-zA-Z]+(\.[a-z]+){1,2}">
<!-- 	        영문숫자조합의 문자가 최소 1회(+)반복, @발생, 문자 최소 1회 반복, dot으로 시작하는 영문자 1~2회 발생 -->
            </div>
            
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
               <input type="date" class="form-control" id="bir" name="userBirth" placeholder="생년월일">
            </div>

            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
                <input type="text" class="form-control" id="hp" name="userTel" placeholder="010-0000-0000"
	        required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}">
            </div>

            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
               <input type="hidden" class="form-control" id="type" name="userType" value="G" readonly>
            </div>
            
            <button type="submit">
              	회원가입하기
            </button>
            
            <p>
              <span>
                	이미 계정이 있으신가요?
              </span>
              <b onclick="toggle()" class="pointer">
                 	로그인하기
              </b>
            </p>
          </div>
        </div>
      </form>
      </div>
<!---------------------------회원가입 끝-------------------------------------------------------->






<!-- -------------------로그인 ---------------------------------------------------------------->
      <div class="col align-items-center flex-col sign-in">
      <form action="/Login" method="post">
        <div class="form-wrapper align-items-center">
          <div class="form sign-in">
            <div class="input-group">
              <i class='bx bxs-user'></i>
              <input id="userId" type="text" name="userId" placeholder="UserId">
            </div>
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <input id="userPw" type="password" name="userPw" placeholder="Password">
            </div>
            
            <button type="submit">
              	로그인하기
            </button>
            
            <p>
              <a href="/FindId">
                	아이디 찾기
              </a>
              <br>
              <a href="/findPw.jsp">
                	비밀번호 찾기
              </a>
            </p>
            <p>
              <span>
                	아직 계정이 없으신가요?
              </span>
              <b onclick="toggle()" class="pointer">
                	회원가입하기
              </b>
            </p>
          </div>
        </div>
        <div class="form-wrapper">
    
        </div>
      </form>
      </div>
<!-- -------------------로그인 끝 ---------------------------------------------------------------->
    </div>
    <!-- END FORM SECTION -->
    
    <!-- CONTENT SECTION -->
    <div class="row content-row">
      <!-- SIGN IN CONTENT -->
      <div class="col align-items-center flex-col">
        <div class="text sign-in">
          <h2>
            Welcome
          </h2>
<!-- 	<img src="/img/classAD/로그인.png" style="width: 350px; margin-left: -60px;"> -->
  
        </div>
        <div class="img sign-in">
    
        </div>
      </div>
      <!-- END SIGN IN CONTENT -->
      <!-- SIGN UP CONTENT -->
      <div class="col align-items-center flex-col">
        <div class="img sign-up">
        
        </div>
        <div class="text sign-up">
          <h2>
            Join with <br> &nbsp;Today? Do Day!
          </h2>
  
        </div>
      </div>
      <!-- END SIGN UP CONTENT -->
    </div>
    <!-- END CONTENT SECTION -->
  </div>


<script>
let container = document.getElementById('container')

const toggle = () => {
  container.classList.toggle('sign-in')
  container.classList.toggle('sign-up')
};

setTimeout(() => {
  container.classList.add('sign-in')
}, 200)
</script>


<script>
	$('#loginAjax').on('click', function(){
		
		let uId = $('#userId').val();
		let uPw = $('#userPw').val();
		
		$.ajax({
			type: 'post',
			url: './loadTest.jsp',
			data: {userId : uId, userPw : uPw}, //객체형태로 데이터를 작성해도 자동으로 urlEncode형식으로 넘김
			success: function(rst){
				console.log("응답확인>>", rst);
				location.href="/Login";
			},
			dataType: function(xhr){
				alert(xhr.status);
			},
			dataType: 'json',
		});
	});

</script>	

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	
	$('#id').on('keyup', function(){
// 	$('#idChk').on('click',function(){
		
		let idVal = $('#id').val();
		
		//AJAX로 ID 중복검사 결과 얻기
		$.ajax({
			type:'post',
			url:'idChk.jsp',
			data:{uId: idVal}, //post, 제이쿼리는 객체의 형태도 url encode형식도 key=value로 자동변환하여 넘김
			success:function(rst){
// 				console.log(typeof rst);
// 				console.log(rst.msg);
				if(rst.rst == "ok"){
					$('#disp').text(rst.msg).css('color','green');
				}else{
					$('#disp').text(rst.msg).css('color','red');
				}
			},
			error:function(xhr){
				alert(xhr.status);
			}
			,dataType:'json' //제이쿼리는 넘어오는 데이터 타입에 맞게 자동 형변환 해주므로 생략 가능
		});
		
	});


	$('#n_name').on('keyup', function(){
		
		let nNameVal = $('#n_name').val();
		
		//AJAX로 닉네임 중복검사 결과 얻기
		$.ajax({
			type:'post',
			url:'nickNameChk.jsp',
			data:{nName: nNameVal}, //post, 제이쿼리는 객체의 형태도 url encode형식도 key=value로 자동변환하여 넘김
			success:function(rst){
// 				console.log(typeof rst);
// 				console.log(rst.msg);
				if(rst.rst == "ok"){
					$('#nickName').text(rst.msg).css('color','green');
				}else{
					$('#nickName').text(rst.msg).css('color','red');
				}
			},
			error:function(xhr){
				alert(xhr.status);
			}
			,dataType:'json' //제이쿼리는 넘어오는 데이터 타입에 맞게 자동 형변환 해주므로 생략 가능
		});
		
	});
	
</script>
<%
	if(msg.equals("성공")){
%>
<script>
	alert('정상적으로 가입되었습니다.');
</script>
<%
	}
%>

<%
    String error = request.getParameter("error");
    if (error != null) {
        if (error.equals("E")) {
%>
<script>
    alert("이미 탈퇴한 회원입니다. 로그인 화면으로 돌아갑니다.");
</script>
<%
        } else if (error.equals("invalid")) {
%>
<script>
    alert("회원 정보가 올바르지 않습니다.");
</script>
<%
        }
    }
%>

</body>
</html>
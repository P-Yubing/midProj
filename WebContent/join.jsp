<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- /////////////// 헤더 시작 //////////////////////////////// -->
<jsp:include page="/include/header.jsp"></jsp:include>
<!-- /////////////// 헤더 끝 //////////////////////////////// -->

<main id="main">
<!-- /////////////////////////////// 내용 시작 ////////////////////////////////////////////////////////// -->
	
<div class="col-sm-8">
	
<%
	String msg = session.getAttribute("msg") == null ? 
			"" : (String) session.getAttribute("msg");
	
	session.removeAttribute("msg");

%>
	  <h4>회원가입</h4>
	  <hr>
	  <form class="form-horizontal" action="Join" method="post">
	    <div class="form-group">
	      <label for="id" class="control-label col-sm-2">아이디<span class="rq"> *</span></label>
	      <span class="sp"></span>
	      <div class="col-sm-4">
	        <input type="text" class="form-control" id="id" name="userId" placeholder="Enter id"
	        required pattern="[a-zA-Z][a-zA-Z0-9]{3,7}">
	      </div>
	      <div class="col-sm-6" style="text-align: left;">
<!--             <button type="button" class="btn btn-success btn-sm" id="idChk">중복검사</button> -->
            <span id="disp"></span>
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="pass" class="control-label col-sm-2">비밀번호<span class="rq"> *</span></label>
	      <div class="col-sm-4">
	        <input type="text" class="form-control" id="pass" name="userPw"
	        required pattern="(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}">
			<!-- 대소 영문, 숫자, 영문자와 숫자가 아닌 모든 문자가 6~20자 -->
			<!-- 임의의 문자(.)를 대상으로 최소 개수(*,?)의 지정 패턴을 찾아라 -->
			<!-- ?= 전방탐색 - 일치 영역을 찾고 값은 반환하지 않는 패턴 =(equal)다음 일치하는 패턴을 찾음 -->
			<!-- * 0개 이상 반복 / + 1개 이상 반복 / ? 0 또는 1개 이상 반복 -->
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="name" class="control-label col-sm-2">이름<span class="rq"> *</span></label>
	      <span class="sp"></span>
	      <div class="col-sm-4">
	        <input type="text" class="form-control" id="name" name="userName"
	        required pattern="[가-힣]{2,5}">
	      </div>
	    </div>

		<div class="form-group">
	      <label for="name" class="control-label col-sm-2">닉네임<span class="rq"> *</span></label>
	      <span class="sp"></span>
	      <div class="col-sm-4">
	         <input type="text" class="form-control" id="n_name" name="userNName"  placeholder="공백포함 한글 최대 15글자"
	        required pattern="[가-힣]{2,15}">
	      </div>
	      <div class="col-sm-6" style="text-align: left;">
<!--             <button type="button" class="btn btn-success btn-sm" id="idChk">중복검사</button> -->
            <span id="nickName"></span>
	      </div>
	    </div>

	    <div class="form-group">
	      <label for="bir" class="control-label col-sm-2">생년월일<span class="rq"> *</span></label>
	      <div class="col-sm-4">
	        <input type="date" class="form-control" id="bir" name="userBirth">
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="hp" class="control-label col-sm-2">전화번호<span class="rq"> *</span></label>
	      <div class="col-sm-4">
	        <input type="text" class="form-control" id="hp" name="userTel" placeholder="010-0000-0000"
	        required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}">
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="mail" class="control-label col-sm-2">이메일<span class="rq"> *</span></label>
	      <div class="col-sm-4">
	        <input type="email" class="form-control" id="mail" name="userEmail"
	        pattern="[0-9a-zA-Z]+@[0-9a-zA-Z]+(\.[a-z]+){1,2}">
<!-- 	        영문숫자조합의 문자가 최소 1회(+)반복, @발생, 문자 최소 1회 반복, dot으로 시작하는 영문자 1~2회 발생 -->
	      </div>
	    </div>
	    
	     
	     <!-- 회원상태 기본G인 것 화면에는 표현되지 않게 함 -->
	    <div class="form-group">
	      <label for="type" class="control-label col-sm-2"><span class="rq"> *</span></label>
	      <div class="col-sm-4">
	        <input type="hidden" class="form-control" id="type" name="userType" value="G" readonly>
	      </div>
	      
	    </div>
	    
	    <div class="form-group">
	      <div class="col-sm-offset-2 col-sm-6">
<!-- 	      form안에 존재하는 button요소는 submit기능을 갖는다. -->
	        <button class="btn btn-default">가입하기</button>
	        <span id="joinspan"></span>
	      </div>
	    </div>
	  </form>
	  
	</div>
	
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
<!-- /////////////////////////////// 내용 끝 ////////////////////////////////////////////////////////// -->

</main>
<!-- End #main -->

<!-- /////////////// 푸터 시작 //////////////////////////////// -->
<jsp:include page="/include/footer.jsp"></jsp:include>
<!-- /////////////// 푸터 끝 //////////////////////////////// -->
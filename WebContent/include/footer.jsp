<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!-- ======= Footer ======= -->
  <footer id="footer" class="footer">

    <div class="footer-content">
      <div class="container">

        <div class="row g-5">
          <div class="col-lg-4">
            <h3 class="footer-heading">Today? Do day!</h3>
            <h4 class="h" style="color: #fff;">이용해주셔서 감사합니다</h4>
            <p><a href="todaydodayInfo.jsp" class="footer-link-more">더 보기</a></p>
          </div>
          <div class="col-6 col-lg-2">
          <%
	//세션은 하나의 브라우저(=창) 내에서 정보와 값을 공유한다(주로 로그인 상태 유지시 사용됨)
   String loginCd = (String)session.getAttribute("loginCode");

   UserVO userVO = (UserVO)session.getAttribute("userVO");

 
   if(loginCd != null){
	   if(userVO != null && "A".equals(userVO.getUserType().trim())){
%>
            <h3 class="footer-heading">서비스소개</h3>
            <ul class="footer-links list-unstyled">
              <li><a href="index.jsp"><i class="bi bi-chevron-right"></i> Home</a></li>
              <li><a href="/adminMypage.jsp"><i class="bi bi-chevron-right"></i> 관리자 마이페이지</a></li>
              <li><a href="list.html"><i class="bi bi-chevron-right"></i> 고객센터</a></li>
              <li><a href="/Logout"><i class="bi bi-chevron-right"></i> 로그아웃</a></li>
            </ul>
<%		   
	   }else if(userVO != null && "G".equals(userVO.getUserType().trim())){
%>  

             <h3 class="footer-heading">서비스소개</h3>
            <ul class="footer-links list-unstyled">
              <li><a href="index.jsp"><i class="bi bi-chevron-right"></i> Home</a></li>
              <li><a href="/UpdateUserServlet"><i class="bi bi-chevron-right"></i> 마이페이지</a></li>
              <li><a href="list.html"><i class="bi bi-chevron-right"></i> 고객센터</a></li>
              <li><a href="/Logout"><i class="bi bi-chevron-right"></i> 로그아웃</a></li>
            </ul>
            
            
<%      
	   }else if(userVO != null && "B".equals(userVO.getUserType().trim())){
%>  

             <h3 class="footer-heading">서비스소개</h3>
            <ul class="footer-links list-unstyled">
              <li><a href="index.jsp"><i class="bi bi-chevron-right"></i> Home</a></li>
              <li><a href="/UpdateUserServlet"><i class="bi bi-chevron-right"></i> 마이페이지</a></li>
              <li><a href="list.html"><i class="bi bi-chevron-right"></i> 고객센터</a></li>
              <li><a href="/Logout"><i class="bi bi-chevron-right"></i> 로그아웃</a></li>
            </ul>
            
            
<%      
	  
	   }else{
%>            
           <h3 class="footer-heading">서비스소개</h3>
            <ul class="footer-links list-unstyled">
              <li><a href="index.jsp"><i class="bi bi-chevron-right"></i> Home</a></li> 
              <li><a href="login.jsp"><i class="bi bi-chevron-right"></i> 로그인</a></li>
              <li><a href="list.html"><i class="bi bi-chevron-right"></i> 고객센터</a></li>
            </ul>
            
<%   
   }
   }
%>           
            
          </div>
          <div class="col-6 col-lg-2">
            <h3 class="footer-heading">카테고리</h3>
            <ul class="footer-links list-unstyled">
              <li><a href="CategoryClass?classCategory=카페"><i class="bi bi-chevron-right"></i> 카페</a></li>
              <li><a href="CategoryClass?classCategory=요리"><i class="bi bi-chevron-right"></i> 요리</a></li>
              <li><a href="CategoryClass?classCategory=베이커리"><i class="bi bi-chevron-right"></i> 베이커리</a></li>
              <li><a href="CategoryClass?classCategory=공예"><i class="bi bi-chevron-right"></i> 공예</a></li>
              <li><a href="CategoryClass?classCategory=드로잉"><i class="bi bi-chevron-right"></i> 드로잉</a></li>
              <li><a href="CategoryClass?classCategory=반려동물"><i class="bi bi-chevron-right"></i> 반려동물</a></li>
              <li><a href="CategoryClass?classCategory=키즈"><i class="bi bi-chevron-right"></i> 키즈</a></li>
              <li><a href="CategoryClass?classCategory=스포츠"><i class="bi bi-chevron-right"></i> 스포츠</a></li>
              <li><a href="CategoryClass?classCategory=플라워"><i class="bi bi-chevron-right"></i> 플라워</a></li>

            </ul>
          </div>

          </div>
        </div>
  </div>
    <div class="footer-legal">
      <div class="container">

        <div class="row justify-content-between">
          <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
            <div class="copyright">
              &nbsp; &copy; 주식회사 いくぞ 
            </div>

            <div class="credits"> 
            <h3>일상의 따뜻한 휴식과 새로운 경험!</h3>
            <br>
              <p>Let’s make more chance with Today? Do day! Class</p>
              Designed by  &nbsp; &copy; 주식회사 いくぞ  대표: 박유빈 <br>팀원: 최미키코, 김재용, 김지연, 이혜린
            </div>

          </div>
          <div class="col-md-6" style="font-size: 14px">
            <div class="social-links mb-3 mb-lg-0 text-center text-md-end">
<br><br><br>
               <p>beewldus0213@naver.com</p>
               <p>(042) 222-8202(평일 10:00 ~ 20:00)</p>
               <p>대전광역시 중구 계룡로 846, 3-4층</p>
            </div>

          </div>

        </div>

      </div>
    </div>
   
   
<!----------------------------챗봇 스크립트--------------------------------------------------------> 
<script>
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

  ChannelIO('boot', {
    "pluginKey": "68590c08-46db-4c92-8209-b8c94b999b29"
  });
</script>
<!----------------------------챗봇 스크립트--------------------------------------------------------> 

  </footer>

  <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>


  <!-- Template Main JS File -->
  <script src="./zenblog/assets/js/main.js"></script>

</body>

</html>
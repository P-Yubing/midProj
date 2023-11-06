<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 
  String ordersId = request.getParameter("ordersId");
  String classId = request.getParameter("classId");
 %>   
<!-- /////////////// 헤더 시작 //////////////////////////////// -->
<jsp:include page="/include/header.jsp"></jsp:include>
<!-- /////////////// 헤더 끝 //////////////////////////////// -->    
    
    
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>ZenBlog Bootstrap Template - Index</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="./zenblog/assets/img/favicon.png" rel="icon">
  <link href="./zenblog/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

 

  <!-- Vendor CSS Files -->
  <link href="./zenblog/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="./zenblog/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="./zenblog/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="./zenblog/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="./zenblog/assets/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS Files -->
  <link href="./zenblog/assets/css/variables.css" rel="stylesheet">
  <link href="./zenblog/assets/css/main.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: ZenBlog
  * Updated: May 30 2023 with Bootstrap v5.3.0
  * Template URL: https://bootstrapmade.com/zenblog-bootstrap-blog-template/
  * Author: BootstrapMade.com
  * License: https:///bootstrapmade.com/license/
  ======================================================== -->


<link rel="stylesheet" href="./css/payment.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">





</head>
<body>
<!-- ------------------------------------------------------------------------------------------------- -->
  
  <main id="main">
  

              
              <div class="a4">
                    <div class="a5">
                       <div class="a6">결제 방법</div>
                          <div class="a7">
                             <div class="a8">
                              <form>
                                    <fieldset class="a9">
                                    
                                       <div class="a81">
                                        <input class="a41" type="radio" name=way value="bank" checked />
                                        <img src="/img/bank.jpg" width="99" height="90"> (계좌이체)
                                      </div>
                                      <div class="a81">
                                        <input class="a41"  type="radio" name="way" value="kakaopay" />
                                        <img src="/img/kakao_payment_icon.png"> (Kakao Pay)
                                       </div>
                                      <div class="a81">
                                        <input class="a41"  type="radio" name="way" value="card" />
                                        <img src="/img/card.png" width="99" height="90"> (카드)
                                       </div>
                                       
                                  </fieldset>
                                  
                               </form>
                                  <hr>
                                  <!-- <input class="paybtn" type="submit" onclick="if(confirm('결제 하시겠습니까?')) { location.href = '/kakaopay.jsp'; }" value="선택 완료"> -->
                          <input class="paybtn" type="submit" onclick="processPayment()" value="선택 완료">
                               
                           </div>
                          </div>
                    </div>
                 </div>
              
            
   </main><!-- End #main -->
   
   <script>
   function processPayment() {
     var selectedWay = document.querySelector('input[name="way"]:checked').value;
     
     if (selectedWay === "kakaopay") {
        location.href = '/KakaoPay?ordersId=<%=ordersId %>&classId=<%=classId %>&selectedWay=' + encodeURIComponent(selectedWay);
     } else if(selectedWay === "bank"){
       
        location.href = '/PaymentSuccessView?ordersId=<%=ordersId %>&classId=<%=classId %>&selectedWay=' + encodeURIComponent(selectedWay);

     } else if(selectedWay === "card"){
       location.href = '/PaymentSuccessView?ordersId=<%=ordersId %>&classId=<%=classId %>&selectedWay=' + encodeURIComponent(selectedWay);
     }
   }
   </script>
   
   
   
</body>

<!-- /////////////// 푸터 시작 //////////////////////////////// -->
<jsp:include page="/include/footer.jsp"></jsp:include>
<!-- /////////////// 푸터 끝 //////////////////////////////// -->

</html>
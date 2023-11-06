<%@page import="vo.UserVO"%>
<%@page import="vo.ClassInfoVO"%>
<%@page import="vo.OrdersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

   UserVO uv = (UserVO) request.getAttribute("getUser");
   ClassInfoVO civ = (ClassInfoVO) request.getAttribute("getClass");
   OrdersVO ov = (OrdersVO) request.getAttribute("getOrder");
   String ordersId = request.getParameter("ordersId");
   String classId = request.getParameter("classId");
   String selectedWay = request.getParameter("selectedWay");

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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">


<style>
   .center {
      display: flex;
      justify-content: center;
      align-items: center;
      margin-top: 40px;
      font-weight: 700;
      
   }
</style>
</head>

<body>


	     
	   <div class="center">
	      <h3>결제가 완료되었습니다.</h3>
	   </div>
   
      <form id="ssForm" name="ssForm" action="PaymentSuccess" method="post">
      <input type="hidden" name="classId" value="<%=civ.getClassId()%>">
      <input type="hidden" name="ordersId" value="<%=ov.getOrdersId()%>">
      <input type="hidden" id="opt" name="opt" value="">
         <div class="d1">
         <div class="d2">
         </div>
            <div class="d3">
               <div class="d9">
                  <div class="d10">
                     <div class="d11">클래스 정보</div>
                     <div class="d12">
                        <div class="d13">
                           <p class="d72">Class Name</p>
                           <p class="d73"><%=civ != null ? civ.getClassName() : ""%></p>
                           <hr>
                           <p class="d72">Address</p>
                           <p class="d73"><%=civ != null ? civ.getClassAddr() : ""%></p>
                           <hr>

                           <p class="d72">Date</p>
                           <p class="d73"><%=ov != null ? ov.getOrdersDate() : ""%></p>
                           <hr>
                           
      
                        </div>
                     </div>
                  </div>
               </div>

               
                  <div class="d9">
                     <div class="d10">
                        <div class="d11">결제 내역</div>
                        <div class="d12">
                           <div class="d13">
                              <p class="d72">결제날짜</p>
                              <p id="payDate"><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %></p>
                              <hr>
                              
                              <p class="d72">수량</p>
                              <p class="d73"><%=ov != null ? ov.getOrdersQty() : ""%>명</p>
                              <hr>

                              <p class="d72">결제금액</p>
                              <input type="text" id="payAmount" name="payAmount" value="<%= ov != null ? ov.getOrdersAmount() : "" %>" readonly>원
                              <hr>

                              <p class="d72">결제 방법</p>
                              <input type="text" id="payName" name="payName" value="<%= selectedWay %>" readonly>

                              <hr>
                              <input class="paybtn" type="button" value="결제 내역 확인" onclick="submitFunc(1)">
                              <input class="paybtn" type="button" value="HOME" onclick="submitFunc(2)">

                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
               
            </form>
            
            <script>
              function submitFunc(opt) {
            	  
            	  document.querySelector("#opt").value = opt;
            	  
            	  document.forms['ssForm'].submit();
            	  
             
              }
            </script>
    
   
      

   <!-- /////////////// 푸터 시작 //////////////////////////////// -->
   <jsp:include page="/include/footer.jsp"></jsp:include>
   <!-- /////////////// 푸터 끝 //////////////////////////////// -->

</body>
</html>
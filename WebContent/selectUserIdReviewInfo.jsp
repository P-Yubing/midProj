<%@page import="vo.UserIdReviewInfoVO"%>
<%@page import="vo.UserVO"%>
<%@page import="vo.UserOrderClassInfoVO"%>
<%@page import="java.util.List"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/include/header.jsp"></jsp:include>

<%

	String loginCd = (String)session.getAttribute("loginCode");
	UserVO uv = (UserVO)request.getAttribute("uv");
	
	List<UserIdReviewInfoVO> srInfo =(List<UserIdReviewInfoVO>) request.getAttribute("srInfo");
	

	
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/mypage.css" />
<meta charset="UTF-8">
<title>회원 예약 정보 조회 페이지</title>
</head>
<style>
h2 { 
 	text-align: center; 
 } 

table, tr, th {
	align: center;
	background-color: #f8f9fa;
/* 	border: 1px solid; */
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
</style>
<body>
	<br>
	<br>
	<h2>내가 수강한 클래스</h2>
	<br>

	<table border=1 style="width: 800px; align: center">
		<tr>
			<th> 클래스이름 </th>
			<th> 수강날짜 </th>
			<th> 주문번호 </th>
			<th> 결제날짜</th>
			<th> 후기 작성 하기</th>
		</tr>
		<%
			int userOderClassSize = srInfo.size();
			if(userOderClassSize == 0){
		%>
		<tr>
			<td colspan="5">예약 내역이 존재하지 않습니다.</td>
		</tr>

		<%
			}else {
				for(UserIdReviewInfoVO urv : srInfo) {	
		%>
		<tr align="center">
    <td><%= urv.getClassName() %></td>
    <td><%= urv.getOrderDate() %></td>
    <td><%= urv.getPayId() %></td>
    <td><%= urv.getPayDate() %></td>
    <td>
        <a href="/reviewInsert.html?payId=<%= urv.getPayId() %>" class="button">후기 작성</a>
    </td>
</tr>
		
<!-- 		<tr align="center"> -->
<%-- 		        <td><%= urv.getClassName() %></td> --%>
<%-- 		        <td><%= urv.getOrderDate() %></td> --%>
<%-- 		        <td><%= urv.getPayId() %></td> --%>
<%-- 		        <td><%= urv.getPayDate()%></td> --%>
<!-- 		    <td><a href="/reviewInsert.html" class="button">후기 작성</a></td> -->
<!-- 		</tr> -->
		<%
		}
	}
		%>
	</table>
	<br>
	<br>
</body>
</html>


<jsp:include page="/include/footer.jsp"></jsp:include>

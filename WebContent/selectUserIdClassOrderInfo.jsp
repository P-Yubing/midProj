<%@page import="vo.UserVO"%>
<%@page import="vo.UserOrderClassInfoVO"%>
<%@page import="java.util.List"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/include/header.jsp"></jsp:include>

<%

	String loginCd = (String)session.getAttribute("loginCode");
	UserVO uv = (UserVO)request.getAttribute("uv");
	
 	List<UserOrderClassInfoVO>  userIdOderClassuserList = (List<UserOrderClassInfoVO>) request.getAttribute("uocv");

	String msg = session.getAttribute("msg") == null ? 
			"" : (String) session.getAttribute("msg");

	session.removeAttribute("msg");
	
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
	<h2>예약 정보 조회</h2>
	<br>

	<table border=1 style="width: 800px; align: center">
		<tr>
			<th> 클래스 이름 </th>
			<th> 클래스 호스트 </th>
			<th> 결제 수량</th>
			<th> 수강 예정 일</th>
			<th> 결제 가격</th>
		</tr>
		<%
			int userOderClassSize = userIdOderClassuserList.size();
			if(userOderClassSize == 0){
		%>
		<tr>
			<td colspan="5">예약 내역이 존재하지 않습니다.</td>
		</tr>

		<%
			}else {
				for(int i=0; i<userIdOderClassuserList.size(); i++) {
					UserOrderClassInfoVO auocList =(UserOrderClassInfoVO) userIdOderClassuserList.get(i);
					String className = auocList.getClassName();
					String classHost = auocList.getClassHost();
					String ordersQty = auocList.getOrdersQty();
					String ordersDate = auocList.getOrdersDate();
					int ordersAmount = auocList.getOrdersAmount();

				
				
		%>

		<tr align="center">
		        <td><%= className %></td>
		        <td><%= classHost %></td>
		        <td><%= ordersQty %></td>
		        <td><%= ordersDate %></td>
		        <td><%= ordersAmount %></td>
		</tr>
		<%
		}
	}
		  
			msg.equals("성공");
		%>
	</table>
	<br>
	<br>
</body>
</html>


<jsp:include page="/include/footer.jsp"></jsp:include>

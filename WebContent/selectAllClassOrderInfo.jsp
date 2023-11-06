<%@page import="vo.UserOrderClassInfoVO"%>
<%@page import="java.util.List"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/include/header.jsp"></jsp:include>

<%
 	List<UserOrderClassInfoVO>  alluserOderClassuserList = (List<UserOrderClassInfoVO>) request.getAttribute("userOderClassList");

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
h1 {
	text-align: center;
}

table, tr, th {
	align: center;
	background-color: #FFFEE0;
	border: 1px solid;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
</style>
<body>
	<br>
	<br>
	<h1>예약 내역 조회</h1>
	<br>

	<table border=1 style="width: 800px; align: center">
		<tr>
			<th> 회원 아이디 </th>
			<th> 클래스 부여 아이디 </th>
			<th> 클래스 이름</th>
			<th> 클래스 호스트</th>
			<th>&nbsp &nbsp 주문수량</th>
			<th>&nbsp &nbsp 수강 예정 일</th>
			<th>&nbsp &nbsp 결제 금액</th>
		</tr>
		<%
			int userOderClassSize = alluserOderClassuserList.size();
			if(userOderClassSize == 0){
		%>
		<tr>
			<td colspan="5">회원 정보가 존재하지 않습니다.</td>
		</tr>

		<%
			}else {
				for(int i=0; i<alluserOderClassuserList.size(); i++) {
					UserOrderClassInfoVO auocList =(UserOrderClassInfoVO) alluserOderClassuserList.get(i);
					String userId = auocList.getUserId();
					String classId = auocList.getClassId();
					String className = auocList.getClassName();
					String classHost = auocList.getClassHost();
					String ordersQty = auocList.getOrdersQty();
					String ordersDate = auocList.getOrdersDate();
					int ordersAmount = auocList.getOrdersAmount();

				
				
		%>

		<tr align="center">
		        <td><%= userId %></td>
		        <td><%= classId %></td>
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

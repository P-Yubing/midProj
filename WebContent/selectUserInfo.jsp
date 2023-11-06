<%@page import="java.util.List"%>
<%@page import="vo.UserVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/include/header.jsp"></jsp:include>

<%
 	List<UserVO> userList = (List<UserVO>) request.getAttribute("userList");

	String msg = session.getAttribute("msg") == null ? 
			"" : (String) session.getAttribute("msg");

	session.removeAttribute("msg");
	
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/mypage.css" />
<meta charset="UTF-8">
<title>회원 정보 조회 페이지</title>
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
	<h2>회원정보 내역 조회</h2>
	<br>

	<table border=1 style="width: 800px; align: center">
		<tr>
			<th>아이디 </th>
			<th>비밀번호 </th>
			<th>이름</th>
			<th>닉네임  </th>
			<th>&nbsp &nbsp &nbsp &nbsp 전화번호</th>
			<th>&nbsp &nbsp &nbsp &nbsp 이메일 </th>
			<th>&nbsp &nbsp 생년월일</th>
			<th>&nbsp 회원 상태  </th>
		</tr>
		<%
			int userSize = userList.size();
			if(userSize == 0){
		%>
		<tr>
			<td colspan="5">회원 정보가 존재하지 않습니다.</td>
		</tr>

		<%
			}else {
				for(int i=0; i<userList.size(); i++) {
					UserVO uv =(UserVO) userList.get(i);
					String id = uv.getUserId();
					String pw = uv.getUserPw();
					String name = uv.getUserName();
					String nname = uv.getUserNName();
					String tel = uv.getUserTel();
					String email = uv.getUserEmail();
					String bir = uv.getUserBirth();
					String type = uv.getUserType();
				
				
		%>

		<tr align="center">
		        <td><%= id %></td>
		        <td><%= pw %></td>
		        <td><%= name %></td>
		        <td><%= nname %></td>
		        <td><%= tel %></td>
		        <td><%= email %></td>
		        <td><%= bir %></td>
		        <td><%= type %></td>
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

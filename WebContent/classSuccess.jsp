<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.UserVO"%>
<%
	String loginCd = (String)session.getAttribute("loginCode");
	UserVO uv = (UserVO)session.getAttribute("userVO");
%>

<!DOCTYPE html>
<html>
<head>
<!-- /////////////// 헤더 시작 //////////////////////////////// -->
<jsp:include page="/include/header.jsp"></jsp:include>
<!-- /////////////// 헤더 끝 //////////////////////////////// -->
</head>
<body>
<p>
<p>
<p>
<p>
<p>
<p>
<p>
<p>
<p>
<p>
<p>
<p>

	<h3>축하합니다! <%=uv.getUserName() %>님!! <br> ID: <%=uv.getUserId() %> </h3>
		클래스 생성이 완료되었습니다!!!
		<br>
		<a href="/index.jsp">홈페이지로 돌아가기</a>
		
</body>
<!-- /////////////// 푸터 시작 //////////////////////////////// -->
<jsp:include page="/include/footer.jsp"></jsp:include>
<!-- /////////////// 푸터 끝 //////////////////////////////// -->
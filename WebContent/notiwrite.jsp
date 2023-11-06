<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/include/header.jsp"></jsp:include>

<%

	String loginCd = (String)session.getAttribute("loginCode");
	UserVO uv = (UserVO)request.getAttribute("uv");
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<link rel="stylesheet" href="css/css.css">
<link rel="stylesheet" href="css/media.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div class="board_wrap">
		<div class="board_title">
			<strong>공지사항</strong>
			<p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
		</div>
		<div class="board_write_wrap">
			<form id="writeForm" action="<%=request.getContextPath() %>/write.html" method="post" enctype="multipart/form-data">
				<div class="board_write">
					<div class="title">
						<dl>
							<dt>제목</dt>
							<dd><input type="text" name="notiTitle" placeholder="제목 입력"></dd>
						</dl>
						<dl>
							<dt>작성자ID</dt>
							<dd><input type="text" name="userId" value="<%=uv.getUserId() %>"></dd>
						</dl>
					</div>
					<div class="cont">
						<textarea name="notiContent" placeholder="내용 입력"></textarea>
					</div>
				</div>
				<div class="bt_wrap">
<!-- 					<button type="submit" class="submit_btn">등록</button> -->
<!-- 					<button type="button" onclick="location.href='list.html'" class="cancel_btn">취소</button> -->
<!-- 				<button type="submit" class="submit_btn" style="background-color: #fccc5c; color: black; padding: 20px 45px; border: none; cursor: pointer;">등록</button> -->
<!-- 					<button type="button" onclick="location.href='list.html'" class="cancel_btn" style="background-color: #fccc5c; color: black; margin: 10px; padding: 20px 45px; border: none; cursor: pointer;">취소</button> -->
	<button type="submit" class="submit_btn" style="background-color: #fccc5c; color: white; padding: 10px 35px; border: none; cursor: pointer; font-size: 16px;">등록</button>
<button type="button" onclick="location.href='list.html'" class="cancel_btn" style="background-color: #fccc5c; color: white; margin: 10px; padding: 10px 35px; border: none; cursor: pointer; font-size: 16px;">취소</button>

				</div>
			</form>
		</div>
	</div>
</body>
</html>
<jsp:include page="/include/footer.jsp"></jsp:include>

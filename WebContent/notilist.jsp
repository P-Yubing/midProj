<%@page import="vo.UserVO"%>
<%@ page import="vo.NoticeVO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/include/header.jsp"></jsp:include>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>공지사항</title>
<link rel="stylesheet" href="css/css.css">
<link rel="stylesheet" href="css/mypage.css">
<!-- <link rel="stylesheet" href="css/media.css"> -->
<!-- <link rel="stylesheet" href="css/style.css"> -->
</head>
<body>
	<%-- JSP 코드 내부에서 사용할 변수 및 객체 선언 --%>
	<%
	//세션은 하나의 브라우저(=창) 내에서 정보와 값을 공유한다(주로 로그인 상태 유지시 사용됨)
	   String loginCd = (String)session.getAttribute("loginCode");

	   UserVO userVO = (UserVO)session.getAttribute("userVO");

		List<NoticeVO> noticeList = (List<NoticeVO>) request.getAttribute("noticeList");
		if (noticeList == null) {
			noticeList = new ArrayList<>();
		}

		String msg = (String) session.getAttribute("msg");
		session.removeAttribute("msg");
	%>
	<div class="board_wrap">
		<div class="board_title">
			<strong>공지사항</strong>
			<p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
		</div>
		<div class="board_view_wrap">
			<table class="board_list">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>글쓴이</th>
					</tr>
				</thead>
				<tbody>
					<%
						int noticeSize = noticeList.size();
						if (noticeSize == 0) {
					%>
					<tr>
						<td colspan="4">공지사항이 존재하지 않습니다.</td>
					</tr>
					<%
						} else {
							for (NoticeVO notice : noticeList) {
					%>
					<tr>
						<td><%= notice.getNotiId() %></td>
						<td><a href="/read.html?notiId=<%= notice.getNotiId() %>"><%= notice.getNotiTitle() %></a></td>
						<td><%= notice.getNotiDate() %></td>
						<td><%= notice.getUserId() %></td>
					</tr>
					<%
						}
					}
					%>


					<%

 
   if(loginCd != null){
	   //관리자 로그인시 보이는 헤더
	   if(userVO != null && "A".equals(userVO.getUserType().trim())){
%>
					<tr align="center">
						<td colspan="4"><a href="/write.html" class="button" >공지사항 등록</a></td>
						<%		   
	   }else{ } }
      //로그인 코드가 존재할 때 보여줄 헤더영역 배치
%>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<%
		if (msg != null && msg.equals("성공")) {
	%>
	<script>
		alert('정상적으로 처리되었습니다.');
	</script>
	<%
		}
	%>
</body>
</html>

<jsp:include page="/include/footer.jsp"></jsp:include>


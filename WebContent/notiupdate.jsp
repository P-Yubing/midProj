<%@page import="vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/include/header.jsp"></jsp:include>
<!DOCTYPE html>
    <head>
    
<title>공지사항 수정</title>
	<p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
	
	<link rel="stylesheet" href="css/css.css">
<link rel="stylesheet" href="css/mypage.css">
</head>
<body>
    <%
	NoticeVO notice = (NoticeVO) request.getAttribute("notice");

%>
    
	<form action="<%=request.getContextPath()%>/update.html" method="post" enctype="multipart/form-data">
		<input type="hidden" name="notiId" value="<%=notice.getNotiId()%>">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="notiTitle"
					value="<%=notice.getNotiTitle()%>"></td>
			</tr> 
			<tr>
				<td>내용:</td>
				<td><input type="text" name="notiContent"
					value="<%=notice.getNotiContent()%>"></td>
			</tr>
		</table>
		<input type="submit" value="회원정보 수정">
	</form>
</body>
</html>

<jsp:include page="/include/footer.jsp"></jsp:include>
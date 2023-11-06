<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 좋아요 ajax -->
			<form id="like_form">
	<table id="list">
		<input type="hidden" name="command" value="wishLike">
		<input type="hidden" name="class_Id" value="${classId}">
		<tr>
			<td><input type="button" value="좋아요!" onclick="return like()"></td>
		</tr>
		<tr>
			<td><div id="like_result">${board.like_it}</div></td>
		</tr>
	</table>
</form>


</body>
</html>
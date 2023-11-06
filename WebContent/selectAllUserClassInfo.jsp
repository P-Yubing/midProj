<%@page import="vo.UserClassInfoVO"%>
<%@page import="java.util.List"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/include/header.jsp"></jsp:include>

<%
 	List<UserClassInfoVO>  alluserClassuserList = (List<UserClassInfoVO>) request.getAttribute("userClassList");
	
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
	<h1>클래스 내역 조회</h1>
	<br>

	<table border=1 style="width: 800px; align: center">
		<tr>
			<th> 회원 아이디 </th>
			<th> 클래스 부여 아이디 </th>
			<th> 클래스 이름</th>
			<th> 커리큘럼 </th>
			<th> 클래스 소개</th>
			<th> 강사소개</th>
			<th> 카테고리</th>
			<th> 수강 가격</th>
			<th> 클래스 요일</th>
			<th> 사업자 등록증</th>
			<th> 관심수업 개수</th>
			<th> 클래스 주소</th>
			<th> 클래스 상태</th>
			<th> 반려사유</th>
			
		</tr>
		<%
			int userClassSize = alluserClassuserList.size();
			if(userClassSize == 0){
		%>
		<tr>
			<td colspan="5">회원 정보가 존재하지 않습니다.</td>
		</tr>

		<%
			}else {
				for(int i=0; i<alluserClassuserList.size(); i++) {
					UserClassInfoVO aucList =(UserClassInfoVO) alluserClassuserList.get(i);
					String userId = aucList.getUserId();
					String classId = aucList.getClassId();
					String className = aucList.getClassName();
					String classCurr = aucList.getClassCurr();
					String classIntro = aucList.getClassIntro();
					String classHost = aucList.getClassHost();
					String classCategory = aucList.getClassCategory();
					int classPrice = aucList.getClassPrice();
					String classDay = aucList.getClassDay();
					String classCertificate = aucList.getClassCertificate();
					int classWishCount = aucList.getClassWishCount();
					String classAddr = aucList.getClassAddr();
					String classStatus = aucList.getClassStatus();
					String rejectReason = aucList.getRejectReason();
					

				
				
		%>

		<tr align="center">
		        <td><%= userId %></td>
		        <td><%= classId %></td>
		        <td><%= className %></td>
		        <td><%= classCurr %></td>
		        <td><%= classIntro %></td>
		        <td><%= classHost %></td>
		        <td><%= classCategory %></td>
		        <td><%= classPrice %></td>
		        <td><%= classDay %></td>
		        <td><%= classCertificate %></td>
		        <td><%= classWishCount %></td>
		        <td><%= classAddr %></td>
		        <td><%= classStatus %></td>
		        <td><%= rejectReason %></td>
		   
		</tr>
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

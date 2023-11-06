<%@ page import="vo.UserVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="vo.SettleVO"%>
<%@ page import="vo.PaymentVO"%>
<%@ page import="vo.UserClassInfoVO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/include/header.jsp"></jsp:include>

<%
	String loginCd = (String)session.getAttribute("loginCode");
	UserVO uv = (UserVO) request.getAttribute("uv");
			

	List<SettleVO> settleList = (List<SettleVO>) request.getAttribute("settleList");
	if (settleList == null) {
		settleList = new ArrayList<SettleVO>();
	}
	
	int settleSize = settleList.size();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/mypage.css" />
<meta charset="UTF-8">
<title>정산 관리 페이지</title>
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
	<h2>나의 클래스 매출 내역</h2>
	<br>

	<table border=1 style="width: 800px; align: center">
		<tr>
			<th> 클래스 이름</th>
			<th> 카테고리</th>
			<th> 매출</th>
			<th> 정산액</th>
			
		</tr>
		<%
			
			if(settleSize == 0){
		%>
		<tr>
			<td colspan="5">등록한 클래스가 존재하지 않습니다.</td>
		</tr>

		<%
			}else {
				for(SettleVO sv : settleList) {
					String payAmountStr = sv.getPayAmount();
					int payAmount = Integer.parseInt(payAmountStr);
		%>
		<tr align="center">
		        <td><%=sv.getClassName() %></td>
 		        <td><%=sv.getClassCategory() %></td>
		        <td><%=sv.getPayAmount() %></td>
		        <td id="result1">
		         <fmt:formatNumber value="<%=payAmount*0.9%>" pattern="#,###" /> 
		        </td>	       
		</tr>
		<%
			}
		}
		%>
		
		
		<script>
		    // JavaScript로 계산
// 		    var settleAmountA = ;
// 		    var resultElement = document.getElementById('result1');
// 		    var calculatePrice = settleAmountA * 0.9;
		
		    // 결과를 설정
// 		    resultElement.innerHTML = calculatePrice;
		</script>
	</table>
	<br>
	<br>

	
	
</body>
</html>


<jsp:include page="/include/footer.jsp"></jsp:include>

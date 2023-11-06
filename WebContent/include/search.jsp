<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색화면</title>
<style type="text/css">
h3 {
font-size: 16px;
	font-family: 'Spoqa Han Sans', sans-serif;
}

h4 {
font-size: 16px;
	font-family: 'Spoqa Han Sans', sans-serif;
}


</style>


</head>
<body>

    	<form action="/search" method="POST" style="padding: 20px;">
    	<div style="display: flex; align-items: center;">
  <img src="/img/classAD/알아보기.png" style="width: 25px;">
  <h3 style="margin-left: 10px;">클래스 알아보기!</h3>
</div>

		
		<br>
        <h4>카테고리</h4>
        <select name="searchType">
            <option value="">선택</option>
            <option value="카페">카페</option>
            <option value="요리">요리</option>
            <option value="베이커리">베이커리</option>
            <option value="공예">공예</option>
            <option value="드로잉">드로잉</option>
            <option value="반려동물">반려동물</option>
            <option value="키즈">키즈</option>
            <option value="스포츠">스포츠</option>
            <option value="플라워">플라워</option>
            <!-- 다른 카테고리 옵션들 추가 -->
        </select>
        
        <br>

        <h4>지역</h4>
        <select name="searchAddr">
            <option value="">선택</option>
            <option value="서울">서울</option>
            <option value="대전">대전</option>
            <option value="부산">부산</option>
            <option value="인천">인천</option>
            <option value="대구">대구</option>
            <option value="울산">울산</option>
            <option value="광주">광주</option>
            <option value="세종">세종</option>
            <!-- 다른 지역 옵션들 추가 -->
        </select>
        	<br>
        <input type="submit" value="검색">
        
  
</body>
</html>
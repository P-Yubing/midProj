<%@ page import="vo.ClassPicVO" %>
<%@ page import="vo.ClassInfoVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Comparator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <jsp:include page="/include/header.jsp"></jsp:include>
  <title>classCategory</title>
  <style>
     body {
      font-family: Arial, sans-serif;
      font-size: 16px;
      background-color: #FFFFFF;
      margin: 0;
      padding: 20px;
    }

    h3 {
      text-align: center;
      margin-top: 20px;
      color: #FF9F40;
    }

    .card-container {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      align-items: flex-start;
      margin-top: 20px;
    }

    .card {
      display: flex;
      align-items: center;
      width: 400px;
      margin: 10px;
      padding: 20px;
      border: 1px solid #FF9F40;
      border-radius: 10px;
      background-color: #FFFFFF;
      text-align: left;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .card img {
      width: 150px;
      height: auto;
      object-fit: cover;
      border-radius: 5px;
      margin-right: 20px;
    }

    .card-info {
      flex-grow: 1;
    }

    .card p {
      margin-bottom: 5px;
      font-size: 14px;
      color: #333333;
    }

    .card a {
      text-decoration: none;
      color: #FF9F40;
      transition: color 0.3s ease;
    }

    .card a:hover {
      color: #FF773D;
    }

    .no-class-msg {
      text-align: center;
      margin-top: 20px;
      color: #666666;
    }

    .back-btn {
      display: flex;
      justify-content: center;
      margin-top: 20px;
    }

    .back-btn a {
      padding: 10px 20px;
      background-color: #FF9F40;
      color: #FFFFFF;
      text-decoration: none;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }

    .back-btn a:hover {
      background-color: #FF773D;
    }
  </style>
</head>
<body>
  <h3>🎨카테고리🎨</h3>

  <div class="card-container">
  <% 
  	List<ClassInfoVO> classCategory = (List<ClassInfoVO>) request.getAttribute("categoryClass");
	ClassPicVO cpv = (ClassPicVO) request.getAttribute("getClassPic");
  
    if (classCategory != null && !classCategory.isEmpty()) {
      for (ClassInfoVO classInfo : classCategory) {
  %>
      <div class="card">
        <img src="<%= request.getContextPath() + (cpv != null ? cpv.getFileStreCours() : "") %>" alt="수업 이미지">
        <p><%= "[  " + classInfo != null ? classInfo.getClassName() : "" +"  ]"%></p>
        <p>수업 소개: <%= classInfo != null ? classInfo.getClassIntro() : "" %></p>
        <p>카테고리: <%= classInfo != null ? classInfo.getClassCategory() : "" %></p>
<%--         <p>클래스 번호: <%= classInfo != null ? classInfo.getClassId() : "" %></p> --%>
<%--         <p>관심등록 수: <%= classInfo != null ? classInfo.getClassWishCount() : "" %></p> --%>
      </div>
  <% 
      }
    } else {
  %>
      <p class="no-class-msg">인기 수업이 없습니다.</p>
  <% 
    }
  %>
  </div>
  <div style="display: flex; align-items: center;">
  		<img src="/img/classAD/HOME아이콘.png" style="width: 60px;">
 		 <h3 style="margin-left: 10px;"></h3>
		 <div class="back-btn">
		   <a href="index.jsp">홈페이지로 돌아가기</a>
		 </div>
		</div>

  <jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>

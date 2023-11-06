<%@ page import="vo.ClassPicVO" %>
<%@ page import="vo.ClassInfoVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Comparator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <title>Main Classes</title>
  <style>
    .container {
      display: flex;
      justify-content: center;
      align-items: center;
      flex-wrap: wrap;
      gap: 20px;
      height: 100vh;
    }

    h1 {
      text-align: center;
    }

    .card {
      display: flex;
      flex-direction: column;
      align-items: center;
      width: 300px;
      margin: 10px;
      padding: 20px;
      border: 2px solid green;
      border-radius: 5px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      background-color: #FFFFFF;
    }

    .card img {
      width: 50%;
      height: 20px;
      margin-bottom: 10px;
    }

    .card p {
      margin-bottom: 5px;
    }

    button {
      display: block;
      margin-top: 20px;
      text-align: center;
    }
  </style>
</head>
<body>
  <h1>메인</h1>
  <div class="container">
    <% 
      List<ClassInfoVO> filteredClass = (List<ClassInfoVO>) request.getAttribute("filteredClass");
  
      if (filteredClass != null && !filteredClass.isEmpty()) {
        for (ClassInfoVO classInfo : filteredClass) {
    %>
          <div class="card">
            <img src="<%= request.getContextPath() %><%= classInfo.getClassPicId() %>" alt="Class Image">
            <p><%= classInfo.getClassName() %></p>
            <p>Class Introduction: <%= classInfo.getClassIntro() %></p>
            <p>Category: <%= classInfo.getClassCategory() %></p>
            <p>Class Number: <%= classInfo.getClassId() %></p>
            <p>Wish Count: <%= classInfo.getClassWishCount() %></p>
          </div>
    <% 
        }
      } else {
    %>
        <p>등록된 클래스가 없습니다</p>
    <% 
      }
    %>
  </div>

</body>
</html>

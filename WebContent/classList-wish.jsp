<%@ page import="vo.ClassPicVO" %>
<%@ page import="vo.ClassInfoVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Comparator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <jsp:include page="/include/header.jsp"></jsp:include>
  <title>Popular Classes</title>
  <style>
/*        .container { */
/*       display: flex; */
/* 	  justify-content: center; */
/* 	  align-items: center; */
/* 	  flex-wrap: wrap; */
/* 	  gap: 20px; */
/*   	  height: 100vh; /* 필요에 따라 뷰포트 높이를 조정하세요 */ */
/*     } */
 h3{
  	text-align: center; 
 }
.card {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 100vh;
  margin: 20px auto;
  padding: 20px;
  border: 1px solid #f56a6a;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  background-color: #FFFFFF;
}

.card img {
  width: 20%;
  height: auto;
  margin-bottom: 10px;
}

.card p {
  margin-bottom: 5px;
}
  </style>
</head>
<body>
  <h3>인기별 조회</h3>
  <% 
    List<ClassInfoVO> filteredWishClass = (List<ClassInfoVO>) request.getAttribute("filteredWishClass");
  
  
  	ClassPicVO cpv = (ClassPicVO) request.getAttribute("getClassPic");
  
    if (filteredWishClass != null && !filteredWishClass.isEmpty()) {
      // classWishCount 기준으로 내림차순 정렬

      for (ClassInfoVO classInfo : filteredWishClass) {
  %>
        <div class="card">
         <img src="<%= request.getContextPath() + (classInfo.getPicVO() != null ? classInfo.getPicVO().getFileStreCours() : "") %>" alt="수업 이미지">
          <p><%= classInfo != null ? classInfo.getClassName() : "" %></p>
          <p>수업 소개: <%= classInfo != null ? classInfo.getClassIntro() : "" %></p>
          <p>카테고리: <%= classInfo != null ? classInfo.getClassCategory() : "" %></p>
<%--           <p>클래스 번호: <%= classInfo != null ? classInfo.getClassId() : "" %></p> --%>
<%--           <p>관심등록 수: <%= classInfo != null ? classInfo.getClassWishCount() : "" %></p> --%>
        </div>
  <% 
      }
    } else {
  %>
      <p>인기 수업이 없습니다.</p>
  <% 
    }
  %>
  
<!--  <button> <a href="index.jsp">홈페이지로 돌아가기</a></button> -->
  <jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>

<%@page import="vo.ClassPicVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="vo.ClassInfoVO"%>
<%@ page import="java.util.ArrayList"%>

<style>
   .col-12 {
      width: 100%;
      margin: 0 auto;
      padding: 20px;
   }

   h1 {
      margin-top: 0;
      text-align: center;
      color: #FF9F40;
   }

   .class-section {
      border: 1px solid #00ADB5;
      background-color: #FDF5EE;
      padding: 20px; /* Increased padding */
      margin-top: 20px;
   }

   .class-info {
      display: flex;
      align-items: center;
      margin-bottom: 20px; /* Increased margin */
      padding: 10px; /* Added padding */
      border: 1px solid #ccc; /* Added border */
      border-radius: 10px; /* Added border-radius */
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Added box-shadow for a subtle shadow effect */
   }

   .class-info img {
      width: 100px;
      height: auto;
      object-fit: cover;
      border-radius: 5px;
      margin-right: 10px;
   }

   .class-info h5 {
      color: #FF9F40;
      margin-bottom: 5px; /* Added margin-bottom to give some space between elements */
   }

   .no-result-msg {
      border: 1px solid #00ADB5;
      background-color: #FDF5EE;
      padding: 10px;
      margin-top: 20px;
      text-align: center;
      color: #00ADB5;
   }
</style>

<jsp:include page="/include/header.jsp"></jsp:include>

<%
   ArrayList<ClassInfoVO> classList = (ArrayList<ClassInfoVO>) request.getAttribute("classList");

   ClassPicVO cpv = (ClassPicVO) request.getAttribute("getClassPic");
   
   if (classList != null && !classList.isEmpty()) {
	   
   		for (ClassInfoVO classinfo : classList) {
%>
   <tr>
      <td colspan="2">
         <section class="class-section">
            <c:forEach var="classInfo" items="${classList}">
               <div class="class-info">
                  <img src="<%= request.getContextPath() + (classinfo.getPicVO() != null ? classinfo.getPicVO().getFileStreCours() : "") %>" alt="수업 이미지">
                  <div>
                     <h5>클래스이름: <%= classinfo != null ? classinfo.getClassName() : "" %> </h5>
                     <p>강사: <%= classinfo != null ? classinfo.getClassIntro() : "" %></p>
                     <p>클래스소개: <%= classinfo != null ? classinfo.getClassCategory() : "" %></p>
                     <!-- 추가적인 클래스 정보 출력을 여기에 추가할 수 있습니다 -->
                  </div>
               </div>
               <hr>
            </c:forEach>
         </section>
      </td>
   </tr>
<%
         }
      }
%>

<c:if test="${empty classList}">
   <p class="no-result-msg">값을 찾을 수 없습니다....</p>
</c:if>

<jsp:include page="/include/footer.jsp"></jsp:include>

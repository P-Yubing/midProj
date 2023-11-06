<%@ page import="vo.UserVO"%>
<%@ page import="vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/include/header.jsp"></jsp:include>

<%-- JSP 코드 내부에서 사용할 변수 및 객체 선언 --%>
<%
	String loginCd = (String) session.getAttribute("loginCode");
	UserVO userVO = (UserVO) session.getAttribute("userVO");

	NoticeVO notice = (NoticeVO) request.getAttribute("notice");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/css.css">
<link rel="stylesheet" href="css/mypage.css">

<meta charset="UTF-8">
<title>공지사항 정보 상세</title>
</head>
<style>
  td {
    font-size: 20px;
      text-align: center; 
  }
  
  th{
  	margin-left:12px;
    padding: 10px; /* Adjust the padding to reduce vertical height */
    line-height: 1.5; /* Adjust the line height to reduce vertical height */
    background-color: #f8f9fa;
    font-size: 20px;
    font-weight: bold;
    text-align: center;
  
  }

  a {
    display: inline-block;
    text-align: center;
    width: 100%;
  }

  .board_wrap {
    width: 1200px;
    margin: 0 auto;
  }

  .board_view_wrap {
    margin-top: 20px;
  }

  .board_list {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
  }

  .board_list th, .board_list td {
    padding: 2px;
/*     border: 1px solid black; */
  }

  .board_list thead th {
    background-color: #FFE8D4; /* 주황색 */
    font-size: 20px;
    font-weight: bold;
    text-align: center;
  }

  .button {
    display: inline-block;
    text-align: center;
    width: 100px;
    padding: 0px;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    margin-right: 0px;
  }
  
  .board_list td[colspan="3"] {
    width: 75%;
  }

  .board_list td[colspan="3"] p {
    line-height: 4;
  }

  .board_view_wrap {
    text-align: center;
  }

  .board_list th:nth-child(1),
  .board_list td:nth-child(1),
  .board_list th:nth-child(3),
  .board_list td:nth-child(3) {
    font-size: 16px;
  }
</style>
<body>
  <div class="board_wrap">
    <div class="board_title">
      <strong>공지사항</strong>
      <p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
    </div>
    <div class="board_view_wrap">
      <table class="board_list">
<!--         <thead> -->
<!--           <tr> -->
<!--             <th>게시판 번호</th> -->
<%--             <td><%=notice.getNotiId()%></td> --%>
<!--             <th>날짜</th> -->
<%--             <td><%=notice.getNotiDate()%></td> --%>
<!--           </tr> -->
<!--         </thead> -->
<!--         <tbody> -->
          <tr>
<!--            &emsp;   <th>제목</th> -->
           &emsp;   <td colspan="3"><%=notice.getNotiTitle()%></td>
          </tr>
          <tr>
<!--             &emsp;  <th>내용</th> -->
            <td colspan="3">
             &emsp;   <p><%=notice.getNotiContent()%></p>
            </td>
          </tr>
          <tr>
            <td colspan="4">
              <a href="/list.html" class="button">목록</a>
              <% if (loginCd != null) {
                  // 관리자 로그인시 보이는 헤더
                  if (userVO != null && "A".equals(userVO.getUserType().trim())) {
              %>
                <a href="/update.html?notiId=<%=notice.getNotiId()%>">[회원정보 수정]</a>
                <a href="/delete.html?notiId=<%=notice.getNotiId()%>">[회원정보 삭제]</a>
              <% } } %>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>

<jsp:include page="/include/footer.jsp"></jsp:include>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:include page="/include/header.jsp"></jsp:include>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/mypage.css" />
<meta charset="UTF-8">
<title>회원 정보 조회 페이지</title>
</head>
<style>
h2{
    text-align: center;
    font-size: 37px;
}
table{
align: center;
background-color: #FFFEE0;
border:1px solid; 
margin-left:auto;
margin-right:auto;
}
 
</style>
<body>
<br>
<br>
<h2>회원 정보 출력</h2>
<br>
<%
//     request.setCharacterEncoding("utf-8");
//     String name_1 = request.getParameter("name");
//     MemberVO memberVO = new MemberVO();
//     memberVO.setName(name_1);
//     MemberDAO dao = new MemberDAO();
//     List membersList = dao.listmembers(memberVO);
%>
<table border=1  style="width:800px; align:center">
    <tr>
        <th>&nbsp &nbsp 아이디</th>
        <th>&nbsp &nbsp &nbsp 비밀번호</th>
        <th>&nbsp &nbsp &nbsp 이름</th>
        <th>&nbsp &nbsp &nbsp &nbsp 이메일</th>
        <th>&nbsp &nbsp &nbsp &nbsp 가입일자</th>
    </tr>
    <%
//         for(int i=0; i<membersList.size(); i++){
//             MemberVO vo = (MemberVO) membersList.get(i);
//             String id=vo.getId();
//             String pwd = vo.getPwd();
//             String name = vo.getName();
//             String email = vo.getEmail();
//             Date joinDate = vo.getJoinDate();
        
    %>
    
    <tr align="center">
        <td>지여닝</td>
        <td>뀨이뀨이</td>
        <td>ㅂㅁㅋ789</td>
        <td>101-1245-7845</td>
        <td>GDFE@NAASDAS.COM</td>
      </tr>
         <tr align="center">
        <td>지dasd</td>
        <td>뀨dasd이</td>
        <td>ㅂㅁ7das89</td>
        <td>101-75676-7845</td>
        <td>grfhE@NAASDAS.COM</td>
        </tr>
<%--         <td><%= id %></td> --%>
<%--         <td><%= pwd %></td> --%>
<%--         <td><%= name %></td> --%>
<%--         <td><%= email %></td> --%>
<%--         <td><%= joinDate %></td> --%>
    </tr>
    <%    
//         }
    %>
</table>
 <br><br>
</body>
</html>


<jsp:include page="/include/footer.jsp"></jsp:include>

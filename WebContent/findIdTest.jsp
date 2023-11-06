<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

		String uName = request.getParameter("userName");
		String uTel = request.getParameter("userTel");
	
		Class.forName("oracle.jdbc.driver.OracleDriver");
	
		String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
		Connection conn = DriverManager.getConnection(url, "team3_202304M", "java");
		
		Statement stmt = conn.createStatement();
		String sql = "select user_id from users"
				+ "	where user_name = '" + uName + "' and user_tel = '" + uTel + "'";
		ResultSet rs = stmt.executeQuery(sql); //실행결과를 ResultSet객체로 받음
		
		if(rs.next()){
			//회원일치 결과 응답데이터 (json형식으로) 작성
%>
			{"rst":"ok"}
<%
		}else{
			//회원 불일치 결과 응답데이터(json형식으로) 작성
%>
			{"rst":"fail"}
<%
		}

%>
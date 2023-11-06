<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String nName = request.getParameter("nName");
	
		Class.forName("oracle.jdbc.driver.OracleDriver");
	
		String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
		Connection conn = DriverManager.getConnection(url, "team3_202304M", "java");
		
		Statement stmt = conn.createStatement();
		String sql = "select user_n_name from users"
				+ "	where user_n_name = '" + nName + "'";
		ResultSet rs = stmt.executeQuery(sql); //실행결과를 ResultSet객체로 받음
		
		if(rs.next()){
%>
			{
				"rst":"fail",
				"msg":"사용불가"
			}
<%
		}else{
%>
			{
				"rst":"ok",
				"msg":"사용가능"
			}
<%
		}
%>
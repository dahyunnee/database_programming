<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" media="screen" href="../Main/DBdesign.css"/>
	<meta charset="UTF-8">
	<title>수강신청 입력</title>
</head>
<body>
	<a href="../Main/main.jsp"><img id = "homeimage" src="../image/sym_rec.png"></a>
<%@ include file="../Main/top.jsp" %>
<% 	
	request.setCharacterEncoding("UTF-8");
	if (session_id==null) response.sendRedirect("../Main/login.jsp");  
%>
<table width="75%" align="center" border>
<br>
<tr><th>과목번호</th><th>분반</th><th>과목명</th><th>학점</th>
	<th>강의종류</th><th>수강신청</th></tr>
<%
	Connection myConn = null;      Statement stmt = null;	
	ResultSet myResultSet = null;   String mySQL = "";
	String dburl  = "jdbc:oracle:thin:@localhost:1521:xe";
	String user="1813467학번";     String passwd="ss2";
     String dbdriver = "oracle.jdbc.driver.OracleDriver";    
	try {
		Class.forName(dbdriver);
	         myConn =  DriverManager.getConnection (dburl, user, passwd);
		stmt = myConn.createStatement();	
    } catch(SQLException ex) {
	     System.err.println("SQLException: " + ex.getMessage());
    }
mySQL = "select c_id,c_id_no,c_name,c_unit,c_class from course";
	
myResultSet = stmt.executeQuery(mySQL);
if (myResultSet != null) {
	while (myResultSet.next()) {	
		String c_id = myResultSet.getString("c_id");
		int c_id_no = myResultSet.getInt("c_id_no");			
		String c_name = myResultSet.getString("c_name");
		int c_unit = myResultSet.getInt("c_unit");
		String c_class = myResultSet.getString("c_class");
%>
<tr>
  <td align="center"><%= c_id %></td> <td align="center"><%= c_id_no %></td> 
  <td align="center"><%= c_name %></td><td align="center"><%= c_unit %></td><td align="center"><%= c_class %></td>
  <td align="center"><a href="insert_verify.jsp?c_id=<%= c_id %>&c_id_no=<%= c_id_no %>">신청</a></td>
</tr>
<%
		}
	}
	stmt.close();  myConn.close();
%>
</table><br><br></body></html>
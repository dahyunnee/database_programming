<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String session_id = (String)session.getAttribute("userID");
	String log;
	
	if (session_id == null) log = "<a href='login.jsp'>로그인</a>";
	else log = "<a href='logout.jsp'>로그아웃</a>";
%>

<table width="75%" align="center" bgcolor="#FFFF99" border>
	<tr>
		<td align="center"><b><%=log %></b></td>
		<td align="center"><b><a href="../Update/update.jsp">사용자 정보 수정</a></b></td>
		<td align="center"><b><a href="../Insert/insert.jsp">수강신청 입력</a></b></td>
		<td align="center"><b><a href="../Delete/delete.jsp">수강신청 삭제</a></b></td>
		<td align="center"><b><a href="../Select/select.jsp">수강신청 조회</a></b></td>
	</tr>
</table>
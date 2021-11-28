<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.crud.dao.MemberDAO, com.crud.bean.MemberVO, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>View Form</title>
</head>
<body>
	<%
	
	MemberDAO memberDAO = new MemberDAO();
	String id = request.getParameter("id");
	int sidValue = Integer.parseInt(id);
	MemberVO u = memberDAO.getMember(sidValue);
	
	%>

	<h1>View Form</h1>

	<span>User ID : <%= u.getUserid() %></span>
	<span>User Name : <%= u.getUsername() %></span>
	<span>Email : <%= u.getEmail() %></span>
	<span>Photo : <img alt="" src="${pageContext.request.contextPath}/upload/<%=u.getPhoto()%>"></span>
	<span>Info</span>
	<p><%= u.getDetail() %></p>
	
	<button type = "button" value = "back to list" onclick = "history.back()">go back</button>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.crud.dao.MemberDAO, com.crud.bean.MemberVO, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Form</title>
</head>
<body>

<%
	MemberDAO memberDAO = new MemberDAO();
	String id = request.getParameter("id");	
	
	int sidValue = Integer.parseInt(id);
	System.out.println("sid value : "+ sidValue);
	MemberVO u = memberDAO.getMember(sidValue);
	
%>


<h1>Edit Form</h1>
<form action="editpost.jsp" method="post">
<input type="hidden" name="seq" value="<%=u.getSid() %>"/>
<table>
<tr><td>Title:</td><td><input type="text" name="title" value="<%= u.getSid()%> readonly" /></td></tr>
<tr><td>Writer:</td><td><input type="text" name="writer" value="<%= u.getUserid()%>" /></td></tr>
<tr><td>Content:</td><td><textarea cols="50" rows="5" name="content"><%= u.getUsername()%></textarea></td></tr>

<tr><td colspan="2"><input type="submit" value="Edit Post"/>
<input type="button" value="Cancel" onclick="history.back()"/></td></tr>
</table>
</form>

</body>
</html>
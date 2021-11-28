<%@page import="com.crud.dao.MemberDAO, com.crud.bean.MemberVO, java.util.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>
	function delete_ok(id){
		var a = confirm("정말로 삭제하겠습니까?");
		if(a) location.href='deletepost.jsp?id=' + id;
	}
</script>
</head>
<body>
<h1>자유게시판</h1>
<%
	MemberDAO memberDAO = new MemberDAO();
	List<MemberVO> list = memberDAO.getBoardList();
	request.setAttribute("list",list);
%>
<table id="list" width="90%">
<a href="addpostform.jsp">Add New Post</a>
<tr>
	<th>Id</th>
	<th>Title</th>
	<th>Writer</th>
	<th>Content</th>
	<th>Regdate</th>
	<th>Edit</th>
	<th>Delete</th>
</tr>
 
<!--  <*list 라는 객체에 받아온 boardDao.getBoardList() */>-->
<c:forEach items="${list}" var="u">
	<tr>
		<td>${u.getSid()}</td>
		<td>${u.getUserid()}</td>
		<td>${u.getUsername()}</td>
		<td>${u.getPassword()}</td>
		<td>${u.getEmail()}</td>
		<td>${u.getBlogurl()}</td>
		<td>${u.getPhoto()}</td>
		<td>${u.getDetail()}</td>		
		<td>${u.getTimestamp()}</td>
		<td><a href ="viewpost.jsp?id=${u.getSid()}">View</a></td>
		<td><a href="editform.jsp?id=${u.getSid()}">Edit</a></td>
		<td><a href="delete_ok.jsp?id=${u.getSid()}">Delete</a></td>
		
	</tr>
</c:forEach>
</table>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.MemberDAO"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="com.crud.bean.MemberVO" />
<jsp:setProperty property="*" name="u"/>

<%
	MemberDAO boardDAO = new MemberDAO();
	int i=boardDAO.updateMember(u);
	response.sendRedirect("post.jsp");
%>
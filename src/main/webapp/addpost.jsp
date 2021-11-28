<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.crud.dao.MemberDAO"%>
<%@page import = "org.apache.tomcat.util.http.fileupload.FileUpload" %>
<% request.setCharacterEncoding("utf-8"); %>

<%--addpostForm 에서 post한 data를 받아온다.  --%>
<%--u의 이름으로 BoardVO에 접근한다. --%>
<jsp:useBean id="u" class="com.crud.bean.MemberVO" />
 
<jsp:setProperty property="*" name="u"/>

<%

	
	MemberDAO boardDAO = new MemberDAO();
	//u 의 id를 가진 값을 insert 한다
	
	int i = boardDAO.insertMember(u);
	String msg = "데이터 추가 성공 !";
	if(i == 0) msg = "[에러] 데이터 추가 ";
%>

<script>
	alert('<%=msg%>');
	location.href='./post.jsp';
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.MemberDAO, com.crud.bean.MemberVO"%>
<%
String sid = request.getParameter("id");
String msg = "데이터 삭제 성공";
if (sid != "") {
	int id = Integer.parseInt(sid);
	MemberVO u = new MemberVO();
	u.getSid();
	MemberDAO boardDAO = new MemberDAO();
	int deleteOk = boardDAO.deleteMember(u);

	if (deleteOk == 0)
		msg = "[에러] 데이터 삭제 실패";

	response.sendRedirect("post.jsp");
}
%>
<script>
	alert('<%=msg%>');
</script>
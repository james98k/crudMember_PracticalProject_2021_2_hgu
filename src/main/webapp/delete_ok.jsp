<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.MemberDAO, com.crud.bean.MemberVO"%>
<%
String sid = request.getParameter("id");
System.out.println("sid value : " +sid);
String msg = "데이터 삭제 성공";
if (sid != "") {
	int id = Integer.parseInt(sid);
	MemberVO u = new MemberVO();
	u.setSid(id);
	MemberDAO memberDAO = new MemberDAO();
	int deleteOk = memberDAO.deleteMember(u);

	if (deleteOk == 0)
		msg = "[에러] 데이터 삭제 실패";

	response.sendRedirect("post.jsp");
}
%>
<script>
	alert('<%=msg%>');
</script>
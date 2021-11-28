<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import = "com.oreilly.servlet.*" %>
<%@page import = "java.io.File" %>
<%@page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String filename = "";
int sizeLimit = 15 * 1024 * 1024;
String realPath = request.getServletContext().getRealPath("upload");
File dir = new File(realPath);
if(!dir.exists()) dir.mkdir();

MultipartRequest multipartRequest = null;
multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

filename = multipartRequest.getFilesystemName("photo");

%>
</body>
</html>
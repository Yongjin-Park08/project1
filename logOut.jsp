<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
session.invalidate(); //세션 초기화 메서드
out.println("<script>alert('로그아웃 합니다.');</script>");
response.sendRedirect("loginForm.jsp");
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
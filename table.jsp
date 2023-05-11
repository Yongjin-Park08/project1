<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
 
<!DOCTYPE html>
<html>
<head>
 
<style>
table,th,td {
        border:1px solid black;
        border-collapse:collapse;
        text-align: center;
}
</style>
 
<meta charset="UTF-8">
<title>select title here</title>
</head>
<body>
<%
        //mariaDB 준비
        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("mariadb 사용가능");
 
        // mariaDB 연결
        Connection conn = DriverManager.getConnection("jdbc:mysql://db.9zicza.com/userlist", "root", "qwer");
        System.out.println(conn + "<-- conn");
 
        // 쿼리
        PreparedStatement stmt = conn.prepareStatement("select * from Users");
        System.out.println(stmt + "<-- stmt");
 
        // 쿼리 실행
        ResultSet rs = stmt.executeQuery();
%>
 
 
<table style="width:600px">
<tr>
        <td>ID</td>
        <td>E-MAIL</td>
        <td>COUNTRY</td>
        <td>PASSWORD</td>
</tr>
<%
                while(rs.next()){
%>
        <tr>
                                        <td><%=rs.getString("name") %></td>
                                        <td><%=rs.getString("email") %></td>
                                        <td><%=rs.getString("country") %></td>
                                        <td><%=rs.getString("password") %></td>
                                </tr>
 
<%
                }
%>
 
</table>
</body>
</html>

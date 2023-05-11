<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("var");
	String sql="SELECT * FROM user_info WHERE id=?"; //쿼리문

    Class.forName("com.mysql.jdbc.Driver");

	try{
		Context init = new InitialContext();
		Connection conn = DriverManager.getConnection("jdbc:mysql://db.9zicza.com/userlist", "root", "qwer");
        System.out.println(conn + "<-- conn");
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);

		ResultSet rs = pstmt.executeQuery();
		out.println("<h3>회원 상세 정보</h3>");
		while(rs.next()){			
			out.println("ID : "+rs.getString(1)+"<br>");
			out.println("PW : "+rs.getString(2)+"<br>");
			out.println("EMAIL : "+rs.getString(3)+"<br>");
			out.println("NAME : "+rs.getString(4)+"<br>");
			out.println("BIRTH : "+rs.getString(5)+"<br>");
			out.println("HOBBY : "+rs.getString(6)+"<br>");
			out.println("INTRO : "+rs.getString(7)+"<br>");
		}
		
	} catch(Exception e){
		e.printStackTrace();
	}
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
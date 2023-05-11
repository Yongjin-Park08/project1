<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("var");
	String sql="DELETE FROM user_info where id = ?"; //쿼리문

    Class.forName("com.mysql.jdbc.Driver");
	
	try{
		Context init = new InitialContext();
		Connection conn = DriverManager.getConnection("jdbc:mysql://db.9zicza.com/userlist", "root", "qwer");
        System.out.println(conn + "<-- conn");
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		if(pstmt.executeUpdate()!=0){
            out.println("<script>alert('삭제 성공');</script>");
            out.println("<script>location.href = 'Member_list.jsp'</script>");
        }

	} catch(Exception e){
		e.printStackTrace();
        out.println("<script>alert('삭제 실패');</script>");
        out.println("<script>location.href = 'Member_list.jsp'</script>");
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

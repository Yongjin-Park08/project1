<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	String sql="SELECT * FROM user_info"; //쿼리문
	ArrayList<String> arr = new ArrayList<String>(); //결과 담을 변수

    Class.forName("com.mysql.jdbc.Driver");

	try{
		Context init = new InitialContext();
		Connection conn = DriverManager.getConnection("jdbc:mysql://db.9zicza.com/userlist", "root", "qwer");
        System.out.println(conn + "<-- conn");
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){			
			arr.add(rs.getString(1));
		}
		
		//어드민은 리스트에서 제거
		arr.remove("admin");
		
	} catch(Exception e){
		e.printStackTrace();
	}
%>

<%
out.print("<h3>회원 리스트</h3>");

for(String id : arr){
	out.print("<a href=Member_info.jsp?var="+id+">" + id + "</a>&nbsp;&nbsp;&nbsp;&nbsp;");
	out.print("<a href=Member_delete.jsp?var="+id+">" + "삭제</a><br>");
};
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
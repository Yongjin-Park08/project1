<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	//파라미터 받아오기
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String email = request.getParameter("mail");
	String name = request.getParameter("name");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String intro = request.getParameter("intro");
	
	//생년월일
	String birth = ""+year+"-"+month+"-"+day;

	//체크박스
	String[] temp = request.getParameterValues("hobby");
	String hobby = Arrays.toString(temp);

	String sql = "INSERT INTO user_info values(?, ?, ?, ?, ?, ?, ?)"; //쿼리문
	
	//성공 확인용
	int result = 0;
    
    Class.forName("com.mysql.jdbc.Driver");

	try{
		Context init = new InitialContext();
		Connection conn = DriverManager.getConnection("jdbc:mysql://db.9zicza.com/userlist", "root", "qwer");
        System.out.println(conn + "<-- conn");
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, email);
		pstmt.setString(4, name);
		pstmt.setString(5, birth);
		pstmt.setString(6, hobby);
		pstmt.setString(7, intro);

		if(pstmt.executeUpdate() != 0){
			result += 1;
		}
		
	} catch(Exception e){
		e.printStackTrace();
	}	
%>   

<%
if(result == 1){
	out.println("<script>alert('회원가입이 완료되었습니다.');</script>");
	out.println("<script>location.href='loginForm.jsp'</script>");
} else {
	out.println("<script>alert('회원가입에 실패했습니다.');</script>");
	out.println("<script>location.href='joinForm.jsp'</script>");
}
%>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
</body>
</html>
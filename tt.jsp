<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%
         String DB_URL = "jdbc:mysql://192.168.255.40/userlist";
         String DB_USER = "root";
         String DB_PASSWORD= "qwer";
         Connection conn;
         Statement stmt;

         try {
              Class.forName("com.mysql.jdbc.Driver");
              Connection conn = DriverManager.getConnection("jdbc:mysql://db.9zicza.com/userlist", "root", "qwer");
              stmt = conn.createStatement();
              conn.close();
              out.println("MySQL Connection Success!");
         }
         catch(Exception e){
              out.println(e);
         }
%>

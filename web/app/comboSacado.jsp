<%--
    Document   : conn MySql JSP
    Created on : 20/10/2010, 01:12:51
    Author     : admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.sql.Connection.*" %>
<%@page import="java.sql.DriverManager.*" %>
<%@page import="java.sql.Statement.*" %>
<%@page import="java.sql.ResultSet.*" %>
<%@page import="java.sql.SQLException.*" %>
<%
    Connection conn;
    Statement stmt;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection("jdbc:mysql://localhost/javascript","root","");
        stmt=conn.createStatement();
        ResultSet rss = stmt.executeQuery("select id,descricao from financas.sacado");
        out.println("<option value=''></option>");
        while(rss.next()){
                 out.println("<option value='"+rss.getInt("id")+"'>"+rss.getString("descricao")+"</option>");
        }
        rss.close();
        stmt.close();
        conn.close();
    }catch(SQLException e){
        out.println(e.getMessage()+" err jdbc");
    }
%>

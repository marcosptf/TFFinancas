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
    Connection c;
    Statement s;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        c=DriverManager.getConnection("jdbc:mysql://localhost/javascript","root","");
        s=c.createStatement();
        ResultSet r = s.executeQuery("select id,descricao from financas.mes");
        out.println("<option value=''></option>");
        while(r.next()){
            out.println("<option value='"+r.getInt("id")+"'>"+r.getString("descricao")+"</option>");
        }
        r.close();
        s.close();
        c.close();
    }catch(SQLException e){
        out.println(e.getMessage()+" err jdbc");
    }
%>

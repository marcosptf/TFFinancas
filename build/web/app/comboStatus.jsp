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
    Connection con;
    Statement stm;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost/javascript","root","");
        stm=con.createStatement();
        ResultSet rs = stm.executeQuery("select id,descricao from financas.status");
        out.println("<option value=''></option>");
        while(rs.next()){
                 out.println("<option value='"+rs.getInt("id")+"'>"+rs.getString("descricao")+"</option>");
        }
        rs.close();
        stm.close();
        con.close();
    }catch(SQLException e){
        out.println(e.getMessage()+" err jdbc");
    }
%>

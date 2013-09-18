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
    Connection co;
    Statement st;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        co=DriverManager.getConnection("jdbc:mysql://localhost/javascript","root","");
        st=co.createStatement();
        ResultSet rs = st.executeQuery("select id,descricao from financas.ano");
        out.println("<option value=''></option>");
        while(rs.next()){
                 out.println("<option value='"+rs.getInt("id")+"'>"+rs.getString("descricao")+"</option>");
        }
        rs.close();
        st.close();
        co.close();
    }catch(SQLException e){
        out.println(e.getMessage()+" err jdbc");
    }
%>

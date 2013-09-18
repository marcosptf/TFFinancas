<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.IOException.*" %>
<%@page import="java.io.PrintWriter.*" %>
<%@page import="javax.servlet.ServletException.*" %>
<%@page import="javax.servlet.http.HttpServlet.*" %>
<%@page import="javax.servlet.http.HttpServletRequest.*" %>
<%@page import="javax.servlet.http.HttpServletResponse.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.sql.Connection.*" %>
<%@page import="java.sql.DriverManager.*" %>
<%@page import="java.sql.Statement.*" %>
<%@page import="java.sql.ResultSet.*" %>
<%@page import="java.sql.SQLException.*" %>
<%@include file="app/functions.jsp"%>

<%
String strID,queryDel;
Integer intID;

try{
    strID=request.getParameter("id");
    if((isStringVazia(strID))){
        intID=Integer.parseInt(strID);
        Connection cnctDel;
        Statement  sttmDel;
        Class.forName("com.mysql.jdbc.Driver");
        cnctDel=DriverManager.getConnection("jdbc:mysql://localhost/javascript","root","");
        sttmDel=cnctDel.createStatement();
        queryDel=" "+
        " delete              from financas.conta"+
        " where               id="+intID;
        sttmDel.execute(queryDel);
        out.println("<script>window.location='../relatorio.jsp';</script>");
    }
}catch(Exception e){
    e.getMessage();
}
%>
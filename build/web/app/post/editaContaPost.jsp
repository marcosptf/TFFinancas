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
<%@include file="../functions.jsp"%>

<%
String txtNomeConta,txtValorConta,txtValorContaString,txtVencimentoConta,
txtVencimentoContaString,txtObservacoes,txtVencimentoContaString2,cmbSacado,
cmbStatus,cmbContaMes,cmbContaAno;
String strID,queryDel;
Integer intID;

try{

    strID=request.getParameter("id");
    intID=Integer.parseInt(strID);
    txtNomeConta=request.getParameter("txtNomeConta");
    txtValorConta=request.getParameter("txtValorConta");
    txtVencimentoConta=request.getParameter("txtVencimentoConta");
    txtObservacoes=request.getParameter("txtObservacoes");
    cmbSacado=request.getParameter("cmbSacado");
    cmbStatus=request.getParameter("cmbStatus");
    cmbContaMes=request.getParameter("cmbContaMes");
    cmbContaAno=request.getParameter("cmbContaAno");

        Connection cnctDel;
        Statement  sttmDel;
        Class.forName("com.mysql.jdbc.Driver");
        cnctDel=DriverManager.getConnection("jdbc:mysql://localhost/javascript","root","");
        sttmDel=cnctDel.createStatement();
        txtNomeConta=((txtNomeConta!="") ? (txtNomeConta) : (""));
        txtValorConta=((txtValorConta!="") ? (txtValorConta) : (""));
        txtVencimentoConta=((txtVencimentoConta!="") ? (txtVencimentoConta) : (""));
        cmbSacado=((cmbSacado!="") ? (cmbSacado) : (""));
        cmbStatus=((cmbStatus!="") ? (cmbStatus) : (""));
        cmbContaMes=((cmbContaMes!="") ? (cmbContaMes) : (""));
        cmbContaAno=((cmbContaAno!="") ? (cmbContaAno) : (""));
        txtObservacoes=((txtObservacoes!="") ? (txtObservacoes) : (""));
        queryDel=" "+
        " update             financas.conta "+
        " set               nome='"+txtNomeConta+"'"+
        "                   ,valor="+toValorHtmlPGsql(txtValorConta)+
        "                   ,vencimento='"+toDataHtmlPGsql(txtVencimentoConta)+"'"+
        "                   ,sacado="+cmbSacado+
        "                   ,status="+cmbStatus+
        "                   ,contames="+cmbContaMes+
        "                   ,contaano="+cmbContaAno+
        "                   ,observacoes='"+txtObservacoes+"'"+
        " where             id="+intID;
        sttmDel.execute(queryDel);
        out.println("<script>alert('conta atualizada com sucesso!');</script>");
        out.println("<script>window.location='../../editaConta.jsp?id="+intID+"';</script>");
}catch(Exception e){
    e.getMessage();
}
%>
<%@page import="java.io.PrintWriter" %>
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


        response.setContentType("text/html;charset=UTF-8");
        PrintWriter output = response.getWriter();
        String txtNomeConta,txtValorConta,txtValorContaString,txtVencimentoConta,
        txtVencimentoContaString,txtObservacoes,txtVencimentoContaString2,cmbSacado,
        cmbStatus,cmbContaMes,cmbContaAno;
        Double dblValorConta=0.0;

        try {
            txtNomeConta=request.getParameter("txtNomeConta");
            txtValorConta=request.getParameter("txtValorConta");
            txtVencimentoConta=request.getParameter("txtVencimentoConta");
            txtObservacoes=request.getParameter("txtObservacoes");
            cmbSacado=request.getParameter("cmbSacado");
            cmbStatus=request.getParameter("cmbStatus");
            cmbContaMes=request.getParameter("cmbContaMes");
            cmbContaAno=request.getParameter("cmbContaAno");

            if(
                    (isStringVazia(txtNomeConta)) && (isStringVazia(txtValorConta)) &&
                    (isStringVazia(txtVencimentoConta)) && (isStringVazia(cmbSacado)) &&
                    (isStringVazia(cmbContaMes)) && (isStringVazia(cmbStatus))
                    && (isStringVazia(cmbContaAno))
              ){
              dblValorConta=toValorHtmlPGsql(txtValorConta);
              txtVencimentoConta=toDataHtmlPGsql(txtVencimentoConta);

                String query;
                Connection co;
                Statement st;
                Class.forName("com.mysql.jdbc.Driver");
                co=DriverManager.getConnection("jdbc:mysql://localhost/javascript","root","");
                st=co.createStatement();
                query=" insert into financas.conta "+
                " (nome,valor,vencimento,sacado,status,contames,contaano,observacoes) "+
                " values "+
                " ('"+txtNomeConta+"',"+dblValorConta+",'"+txtVencimentoConta+"',"+
                cmbSacado+","+cmbStatus+","+cmbContaMes+","+cmbContaAno+",'"+txtObservacoes+"')";

                if(!st.execute(query)){
                    out.println("<script>alert('conta inserida com sucesso!');</script>");
                    out.println("<script>window.location='../../insereConta.jsp';</script>");
                }else{
                    out.println("<script>alert('erros ao inserir dados!');</script>");
                    out.println("<script>window.location='../../insereConta.jsp';</script>");
                }

            }else{
                out.println("<script>alert('favor preencher os dados corretamente!');</script>");
                out.println("<script>window.location='../../insereConta.jsp';</script>");
            }
        } catch(Exception e){
            out.println(e.getMessage());
        }
%>
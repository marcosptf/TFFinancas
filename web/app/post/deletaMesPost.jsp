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
        cmbStatus,txtContaMes,txtContaAno,cmbContaMes,cmbContaAno,txtContaMesDuplica,
        txtContaAnoDuplica;
        Double dblValorConta=0.0;

        try {
            txtContaMes        = request.getParameter("cmbContaMes");
            txtContaAno        = request.getParameter("cmbContaAno");

            if((isStringVazia(txtContaMes)) && (isStringVazia(txtContaAno))){

                String query;
                Connection co;
                Statement st;
                Class.forName("com.mysql.jdbc.Driver");
                co=DriverManager.getConnection("jdbc:mysql://localhost/javascript","root","");
                st=co.createStatement();
                query=" delete from financas.conta "+
                " where contames='"+txtContaMes+"' and contaano='"+txtContaAno+"';";

                //out.println("debug=>"+query);

                if(!st.execute(query)){
                    out.println("<script>alert('mes "+txtContaMes+"/"+txtContaAno+" deletado com sucesso!');</script>");
                    out.println("<script>window.location='../../deletaConta.jsp';</script>");
                }else{
                    out.println("<script>alert('erros ao deletar dados!');</script>");
                    out.println("<script>window.location='../../deletaConta.jsp';</script>");
                }

            }else{
                out.println("<script>alert('favor preencher os dados corretamente!');</script>");
                out.println("<script>window.location='../../deletaConta.jsp';</script>");
            }
        } catch(Exception e){
            out.println(e.getMessage());
        }
%>
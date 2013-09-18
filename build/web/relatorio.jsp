<html>
    <head>
        <title>TFSystems Sistema Financeiro - Relatório de contas</title>
        <link rel="stylesheet" type="text/css" href="app/css/estilos.css" />
    </head>
    <body>
        <center>
            <fieldset>
                <legend>TFSystems Sistema Financeiro - Relatório de contas</legend>
                <%@include  file="app/menu.jsp" %>
                <p>
                     <h2><b>Relatório de contas</b></h2>
                </p>
                <form action="relatorio.jsp" name="frmInsereContas" id="frmInsereContas"  method="post">
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <label for="txtNomeConta">nome conta:</label>
                            </td>
                            <td>
                                <input type="text" name="txtNomeConta" id="txtNomeConta" maxlength="250" value="" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtVencimentoConta">vencimento conta:</label>
                            </td>
                            <td>
                                <input type="text" name="txtVencimentoConta" id="txtVencimentoConta" maxlength="250" value="" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="cmbSacado">sacado:</label>
                            </td>
                            <td>
                                <select name="cmbSacado"><%@include file="app/comboSacado.jsp" %></select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="cmbStatus">status:</label>
                            </td>
                            <td>
                                <select name="cmbStatus"><%@include file="app/comboStatus.jsp" %></select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="cmbContaMes">Conta relacionada ao mes:</label>
                            </td>
                            <td>
                                <select name="cmbContaMes"><%@include file="app/comboMes.jsp" %></select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="cmbContaAno">Ano relacionado a conta:</label>
                            </td>
                            <td>
                                <select name="cmbContaAno"><%@include file="app/comboAno.jsp" %></select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="reset" value="limpar" />
                            </td>
                            <td>
                                <input type="submit" name="sbmGravar" value="visualizar" />
                            </td>
                        </tr>
                    </table>
                </form>
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter output = response.getWriter();
        String txtNomeConta,sbmGravar,txtValorConta,txtValorContaString,txtVencimentoConta,
        txtVencimentoContaString,txtObservacoes,txtVencimentoContaString2,cmbSacado,
        cmbStatus,cmbContaMes,cmbContaAno;
        Double dblValorConta=0.0;
        String query,querySum,respHtml,strWhere="";
        Connection cnct;
        Statement sttm,sttmSum;
        //ResultSet rsResp;

    try{
            sbmGravar=request.getParameter("sbmGravar");

            if((isStringVazia(sbmGravar))){

                txtNomeConta=request.getParameter("txtNomeConta");
                txtValorConta=request.getParameter("txtValorConta");
                txtVencimentoConta=request.getParameter("txtVencimentoConta");
                txtObservacoes=request.getParameter("txtObservacoes");
                cmbSacado=request.getParameter("cmbSacado");
                cmbStatus=request.getParameter("cmbStatus");
                cmbContaMes=request.getParameter("cmbContaMes");
                cmbContaAno=request.getParameter("cmbContaAno");
                if((isStringVazia(txtNomeConta))){strWhere+=" and fc.nome like '%"+txtNomeConta+"%' ";}
                if(isStringVazia(txtValorConta)){strWhere+=" and fc.valor like '%"+txtValorConta+"%'";}
                if(isStringVazia(txtVencimentoConta)){strWhere+=" and fc.vencimento like '%"+txtVencimentoConta+"%'";}
                if(isStringVazia(cmbSacado)){strWhere+=" and sacado="+cmbSacado;}
                if(isStringVazia(cmbContaMes)){strWhere+=" and contames="+cmbContaMes;}
                if(isStringVazia(cmbStatus)){strWhere+=" and status="+cmbStatus;}
                if(isStringVazia(cmbContaAno)){strWhere+=" and contaano="+cmbContaAno;}
                if(isStringVazia(strWhere)){strWhere=" where true "+strWhere;}

                Class.forName("com.mysql.jdbc.Driver");
                cnct=DriverManager.getConnection("jdbc:mysql://localhost/javascript","root","");
                sttm=cnct.createStatement();
                sttmSum=cnct.createStatement();
                query=" "+
                " select              fc.id,nome,valor,vencimento,fs.descricao as sacado,"+
                "                     fst.descricao as status,                      "+
                "                     fm.descricao as contames,fa.descricao as contaano,"+
                "                     fc.observacoes as obs                         "+
                " from                financas.conta as fc                         "+
                " left join           financas.sacado as fs on fc.sacado=fs.id     "+
                " left join           financas.status as fst on fc.status=fst.id   "+
                " left join           financas.mes as fm on fc.contames=fm.id      "+
                " left join           financas.ano as fa on fc.contaano=fa.id      "+
                strWhere;
                querySum=" "+
                " select              sum(valor) as valortotal "+
                " from                financas.conta as fc                         "+
                " left join           financas.sacado as fs on fc.sacado=fs.id     "+
                " left join           financas.status as fst on fc.status=fst.id   "+
                " left join           financas.mes as fm on fc.contames=fm.id      "+
                " left join           financas.ano as fa on fc.contaano=fa.id      "+
                strWhere;
                //out.println(query);
                    respHtml="<table border='1' cellpadding='0' cellspacing='0' >";
                    respHtml+="<tr>";
                    respHtml+="<td>nome</td>";
                    respHtml+="<td>valor</td>";
                    respHtml+="<td>vencimento</td>";
                    respHtml+="<td>sacado</td>";
                    respHtml+="<td>status</td>";
                    respHtml+="<td>conta do mês</td>";
                    respHtml+="<td>conta do ano</td>";
                    respHtml+="<td>observações</td>";
                    respHtml+="<td>editar</td>";
                    respHtml+="<td>deletar</td>";
                    respHtml+="</tr>";
                    ResultSet rsResp=sttm.executeQuery(query);
                    ResultSet rsRespSum=sttmSum.executeQuery(querySum);
                while(rsResp.next()){
                    respHtml+="<tr>";
                    respHtml+="<td>"+(isStringVazia((rsResp.getString("nome"))) ? (rsResp.getString("nome")) : ("&nbsp;"))+"</td>";
                    respHtml+="<td>"+(toValorPGsqlHtml(rsResp.getDouble("valor")))+"</td>";
                    respHtml+="<td>"+((isStringVazia(toDataPGsqlHtml(rsResp.getString("vencimento")))) ? (toDataPGsqlHtml(rsResp.getString("vencimento"))) : ("&nbsp;"))+"</td>";
                    respHtml+="<td>"+((isStringVazia(rsResp.getString("sacado"))) ? (rsResp.getString("sacado")) : ("&nbsp;"))+"</td>";
                    respHtml+="<td>"+((isStringVazia(rsResp.getString("status"))) ? (rsResp.getString("status")) : ("&nbsp;"))+"</td>";
                    respHtml+="<td>"+((isStringVazia(rsResp.getString("contames"))) ? (rsResp.getString("contames")) : ("&nbsp;"))+"</td>";
                    respHtml+="<td>"+((isStringVazia(rsResp.getString("contaano"))) ? (rsResp.getString("contaano")) : ("&nbsp;"))+"</td>";
                    respHtml+="<td>"+((isStringVazia(rsResp.getString("obs"))) ? (rsResp.getString("obs")) : ("&nbsp;"))+"</td>";
                    respHtml+="<td> <a href='editaConta.jsp?id="+rsResp.getInt("id")+"'>edit</a></td>";
                    respHtml+="<td> <a href='deletaConta.jsp?id="+rsResp.getInt("id")+"'>del</a></td>";
                    respHtml+="</tr>";
                }
                    if(rsRespSum.next()){
                        respHtml+="<tr>";
                        respHtml+="<td>valor total:</td>";
                        respHtml+="<td>"+(toValorPGsqlHtml(rsRespSum.getDouble("valortotal")))+"</td>";
                        respHtml+="<td>&nbsp;</td>";
                        respHtml+="<td>&nbsp;</td>";
                        respHtml+="<td>&nbsp;</td>";
                        respHtml+="<td>&nbsp;</td>";
                        respHtml+="<td>&nbsp;</td>";
                        respHtml+="<td>&nbsp;</td>";
                        respHtml+="<td>&nbsp;</td>";
                        respHtml+="<td>&nbsp;</td>";
                        respHtml+="</tr>";
                    }

                respHtml+="</table>";
                out.println(respHtml);
            }
    }catch(SQLException e){
        e.getMessage();
    }

%>
            </fieldset>
        </center>
    </body>
</html>
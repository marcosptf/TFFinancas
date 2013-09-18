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
        String strID,respNome,respValor,txtNomeConta,txtValorConta,txtValorContaString,txtVencimentoConta,
        respStatus,respSacado,respVencimento,txtVencimentoContaString,txtObservacoes,txtVencimentoContaString2,cmbSacado,
        respID,respObs,respContaano,respContames,cmbStatus,cmbContaMes,cmbContaAno;
        respNome="";respValor="";respVencimento="";respSacado="";respStatus="";
        respContames="";respContaano="";respObs="";respID="";
        Double dblValorConta=0.0;
        Integer intID,idDescSacado=0,idDescStatus=0,idContaMes=0,idContaAno=0;
        String query,respHtml,strWhere="";
        Connection cnct;
        Statement sttm;
        //ResultSet rsResp;

    try{
        strID=request.getParameter("id");
        if((isStringVazia(strID))){
        intID=Integer.parseInt(strID);
        Class.forName("com.mysql.jdbc.Driver");
        cnct=DriverManager.getConnection("jdbc:mysql://localhost/javascript","root","");
        sttm=cnct.createStatement();
        query=" "+
        " select              fc.id,nome,valor,vencimento,fs.id as idDescSacado,fs.descricao as sacado,"+
        "                     fst.id as idDescStatus,fst.descricao as status,                     "+
        "                     fm.id as idContaMes,fm.descricao as contames,fa.id as idContaAno, fa.descricao as contaano,"+
        "                     fc.observacoes as obs                         "+
        " from                financas.conta as fc                         "+
        " left join           financas.sacado as fs on fc.sacado=fs.id     "+
        " left join           financas.status as fst on fc.status=fst.id   "+
        " left join           financas.mes as fm on fc.contames=fm.id      "+
        " left join           financas.ano as fa on fc.contaano=fa.id      "+
        " where               fc.id="+intID;
        //out.println(query);
         ResultSet rsResp=sttm.executeQuery(query);
         if(rsResp.next()){
            respID=rsResp.getString("id");
            respNome=rsResp.getString("nome");
            respValor=toValorPGsqlHtml(rsResp.getDouble("valor"));
            respVencimento=toDataPGsqlHtml(rsResp.getString("vencimento"));
            respSacado=rsResp.getString("sacado");
            respStatus=rsResp.getString("status");
            respContames=rsResp.getString("contames");
            respContaano=rsResp.getString("contaano");
            respObs=rsResp.getString("obs");
            idDescSacado=rsResp.getInt("idDescSacado");
            idDescStatus=rsResp.getInt("idDescStatus");
            idContaMes=rsResp.getInt("idContaMes");
            idContaAno=rsResp.getInt("idContaAno");
        }
     }
    }catch(SQLException e){
        e.getMessage();
    }

%>
<html>
    <head>
        <title>TFSystems Sistema Financeiro - Editar contas</title>
    </head>
    <body>
        <center>
            <fieldset>
                <legend>TFSystems Sistema Financeiro - Editar contas</legend>
                <%@include  file="app/menu.jsp" %>
                <p>
                      Editar contas
                </p>
                <form action="app/post/editaContaPost.jsp" name="frmInsereContas" id="frmInsereContas"  method="post">
                    <table border="1">
                        <tr>
                            <td>
                                <label for="txtNomeConta">nome conta:</label>
                                <input type="text" name="txtNomeConta" id="txtNomeConta" maxlength="250" value="<%=respNome%>" />
                            </td>
                            <td>
                                <label for="txtValorConta">valor conta:</label>
                                <input type="text" name="txtValorConta" id="txtValorConta" maxlength="15" value="<%=respValor%>" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtVencimentoConta">vencimento conta:</label>
                                <input type="text" name="txtVencimentoConta" id="txtVencimentoConta" maxlength="250" value="<%=respVencimento%>" />
                            </td>
                            <td>
                                <label for="cmbSacado">sacado:</label>
                                <select name="cmbSacado">
                                    <option value="<%=idDescSacado%>" selected="selected"><%=respSacado%></option>
                                    <%@include file="app/comboSacado.jsp" %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="cmbStatus">status:</label>
                                <select name="cmbStatus">
                                    <option value="<%=idDescStatus%>" selected="selected"><%=respStatus%></option>
                                    <%@include file="app/comboStatus.jsp" %>
                                </select>
                            </td>
                            <td>
                                <label for="cmbContaMes">Conta relacionada ao mes:</label>
                                <select name="cmbContaMes">
                                    <option value="<%=idContaMes%>" selected="selected"><%=respContames%></option>
                                    <%@include file="app/comboMes.jsp" %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="cmbContaAno">Ano relacionado a conta:</label>
                                <select name="cmbContaAno">
                                    <option value="<%=idContaAno%>" selected="selected"><%=respContaano%></option>
                                    <%@include file="app/comboAno.jsp" %>
                                </select>
                            </td>
                            <td>
                                <label for="txtObservacoes">observações:</label>
                                <input type="text" name="txtObservacoes" id="txtObservacoes" maxlength="250" value="<%=respObs%>" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="reset" value="limpar" />
                            </td>
                            <td>
                                <input type="submit" name="sbmGravar" value="Edita Conta" />
                                <input type="hidden" name="id" value="<%=respID%>" />
                            </td>
                        </tr>
                    </table>
                </form>
            </fieldset>
        </center>
    </body>
</html>
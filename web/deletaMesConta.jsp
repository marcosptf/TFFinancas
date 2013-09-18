<html>
    <head>
        <title>TFSystems Sistema Financeiro</title>
        <link rel="stylesheet" type="text/css" href="app/css/estilos.css" />
        <script type="text/javascript" src="app/js/insereConta.js"></script>
    </head>
    <body>
        <center>
            <fieldset>
                <legend>TFSystems Sistema Financeiro</legend>
                <%@include  file="app/menu.jsp" %>
                <p>
                    <h2><b>Deleta Mes Conta</b></h2>
                </p>
                <form action="app/post/deletaMesPost.jsp" name="frmContas" id="frmContas"  method="post" target="">
                    <table cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td>
                                <label for="cmbContaMes">Deleta contas do mes:</label>
                            </td>
                            <td>
                                <select name="cmbContaMes" id="cmbContaMes">
                                    <%@include file="app/comboMes.jsp" %>
                                </select>&nbsp;/&nbsp;<select name="cmbContaAno" id="cmbContaAno">
                                    <%@include file="app/comboAno.jsp" %>
                                </select>
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
                                <input type="reset" value="limpar" id="btnLimpar" />
                            </td>
                            <td>
                                <input type="submit" name="sbmGravar" id="sbmGravar" value="Deleta conta mes" />
                            </td>
                        </tr>
                    </table>
                </form>
            </fieldset>
        </center>
    </body>
</html>
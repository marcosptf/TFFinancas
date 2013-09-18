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
                    <h2><b>Inserção de contas</b></h2>
                </p>
                <form action="app/post/insereContaPost.jsp" name="frmInsereContas" id="frmInsereContas"  method="post" target="">
                    <table cellpadding="0" cellspacing="0" border="0">
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
                                <label for="txtValorConta">valor conta:</label>
                            </td>
                            <td>
                                <input type="text" name="txtValorConta" id="txtValorConta" maxlength="10" value="" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtVencimentoConta">vencimento conta:</label>
                            </td>
                            <td>
                                <input type="text" name="txtVencimentoConta" id="txtVencimentoConta" maxlength="10" value="" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="cmbSacado">sacado:</label>
                            </td>
                            <td>
                                <select name="cmbSacado" id="cmbSacado"><%@include file="app/comboSacado.jsp" %></select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="cmbStatus">status:</label>
                            </td>
                            <td>
                                <select name="cmbStatus" id="cmbStatus"><%@include file="app/comboStatus.jsp" %></select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="cmbContaMes">Conta relacionada ao mes:</label>
                            </td>
                            <td>
                                <select name="cmbContaMes" id="cmbContaMes"><%@include file="app/comboMes.jsp" %></select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="cmbContaAno">Ano relacionado a conta:</label>
                            </td>
                            <td>
                                <select name="cmbContaAno" id="cmbContaAno"><%@include file="app/comboAno.jsp" %></select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtObservacoes">observações:</label>
                            </td>
                            <td>
                                <input type="text" name="txtObservacoes" id="txtObservacoes" maxlength="250" value="" />
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
                                <input type="button" name="sbmGravar" id="sbmGravar" value="grava conta" />
                            </td>
                        </tr>
                    </table>
                </form>
            </fieldset>
        </center>
    </body>
</html>
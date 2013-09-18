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
                    <h2><b>Duplica contas</b></h2>
                </p>
                <form action="app/post/duplicaContaPost.jsp" name="frmDuplicaContas" id="frmDuplicaContas"  method="post" target="">
                    <table cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td>
                                <label for="cmbContaMes">Duplicar contas do mes:</label>
                            </td>
                            <td>
                                <select name="cmbContaMes" id="cmbContaMes"><%@include file="app/comboMes.jsp" %></select>&nbsp;/&nbsp;
                                <select name="cmbContaAno" id="cmbContaAno">
                                            <option value=''></option>
                                    <option value='2010'>2010</option>
                                    <option value='2011'>2011</option>
                                    <option value='2012'>2012</option>
                                    <option value='2013'>2013</option>
                                    <option value='2014'>2014</option>
                                    <option value='2015'>2015</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="cmbContaMes">para o mes:</label>
                            </td>
                            <td>
                                <select name="cmbContaMesDuplica" id="cmbContaMesDuplica">
                                    <option value=''></option>
                                    <option value='1'>Janeiro</option>
                                    <option value='2'>Fevereiro</option>
                                    <option value='3'>Março</option>
                                    <option value='4'>Abril</option>
                                    <option value='5'>Maio</option>
                                    <option value='6'>Junho</option>
                                    <option value='7'>Julho</option>
                                    <option value='8'>Agosto</option>
                                    <option value='9'>Setembro</option>
                                    <option value='10'>outubro</option>
                                    <option value='11'>Novembro</option>
                                    <option value='12'>Dezembro</option>
                                </select>&nbsp;/&nbsp;<select name="cmbContaAnoDuplica" id="cmbContaAnoDuplica">
                                    <option value=''></option>
                                    <option value='2010'>2010</option>
                                    <option value='2011'>2011</option>
                                    <option value='2012'>2012</option>
                                    <option value='2013'>2013</option>
                                    <option value='2014'>2014</option>
                                    <option value='2015'>2015</option>
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
                                <input type="submit" name="sbmGravar" id="sbmGravar" value="Duplica conta" />
                            </td>
                        </tr>
                    </table>
                </form>
            </fieldset>
        </center>
    </body>
</html>
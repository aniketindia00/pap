<%--
    Document   : index
    Created on : 13/02/2012, 17:04:15
    Author     : 129526
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/custom-theme/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css">
        <link href="css/main.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/ajax.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.21.custom.min.js"></script>
        <title>JSP Page</title>
        <script type="text/javascript">
            $(function() {
                $( "#nome" ).autocomplete({
                    source: "clientes.jsp",
                    minLength: 2,
                    select:function( event, ui ) {

                        $("#telefone").val(ui.item.telefone);
                        refreshPage('carros','carros.jsp?id='+ui.item.id);
                    }
                });

                $("a").button();
            });
        </script>

    </head>
    <body>
        <div class="container">
            <div class="header">
                <table class="fill" border="1">
                    <tr>
                        <td colspan="2">
                            <%@include file="banner.jsp" %>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="content fillall">
                <table class="fillall" border="1">
                    <tr>
                        <td width="15%" height="100%" valign="top">
                            <%@include file="menu.jsp" %>
                        </td>
                        <td width="80%" height="100%" valign="top">
                            <table align="center" border="1" class="fill">
                                <tr>
                                    <td>
                                        <div id="cliente" class="min200height" >
                                            <table align="center">
                                                <tr>
                                                    <td colspan="2"><h3 align="center" >Dados do Cliente</h3></td>
                                                </tr>
                                                <tr>
                                                    <td><label for="nome">Nome: </label></td>
                                                    <td><input id="nome" name="nome" size="30%" ><td>
                                                </tr>
                                                <tr>
                                                    <td><label for="telefone">Telefone: </label></td>
                                                    <td><input id="telefone" name="telefone" size="30%"></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td>
                                        <div id="carros" class="min200height" >
                                            <table align="center">
                                                <tr>
                                                    <td colspan="2"><h3 align="center" >Dados do Carro</h3></td>
                                                </tr>
                                                <tr>
                                                    <td><label for="modelo">Modelo: </label></td>
                                                    <td><input id="modelo" name="modelo" size="30%"></td>
                                                </tr>
                                                <tr>
                                                    <td><label for="marca">Marca: </label></td>
                                                    <td><input id="marca" name="marca" size="30%"></td>
                                                </tr>
                                                <tr>
                                                    <td><label for="ano">Ano: </label></td>
                                                    <td><input id="ano" name="ano" size="30%"></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center" >
                                        <table align="center" class="fill">
                                            <tr>
                                                <td class="minStdHeight" colspan="2">
                                                    <h4>Ola</h4>
                                                    <div class="box fillall" id="produtos2">
                                                        <%@include file="produtos_orcamento.jsp" %>
                                                    </div></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <select id="coluna"  >
                                                        <option value="nome" >Nome</option>
                                                        <option value="cod_barras">Codigo de Barras</option>
                                                        <option value="preco">Preço</option>
                                                        <option value="id">Id</option>
                                                    </select>
                                                </td>
                                                <td><input type="text" onkeyup="refreshPage('produtos','produtos_nao_orcamento.jsp?coluna='+document.getElementById('coluna').value+'&query='+this.value);" >
                                                </td>
                                            </tr>
                                            <tr class="fill">
                                                <td colspan="2" class="minStdHeight" ><div class="box fillall" id="produtos">
                                                        Não há nenhum produto
                                                    </div></td>

                                            </tr>

                                        </table>
                                    </td></tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="footer">
                <button id="button" value="listar_perfil.jsp">ASD</button>
            </div>
        </div>
    </body>
</html>

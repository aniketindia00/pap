<%--
    Document   : index
    Created on : 13/02/2012, 17:04:15
    Author     : 129526
--%>

<%@page import="modelo.Orcamento"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.TimeZone"%>
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
            <div class="header box ui-corner-all">
                <table class="fill" >
                    <tr>
                        <td colspan="2">
                            <%@include file="banner.jsp" %>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="content fillall">
                <table class="fillall" >
                    <tr>
                        <td class="box ui-corner-all" width="15%" height="100%" valign="top">
                            <%@include file="menu.jsp" %>
                        </td>
                        <td width="80%" height="100%" valign="top">
                            <form action="form_inserir_orcamento.jsp" method="POST">
                            <table align="center" class="fill">
                                <tr>
                                    <td width="50%">
                                        <div id="cliente" class="min200height box ui-corner-all" >
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
                                    <td width="50%">
                                        <div id="carros" class="min200height box ui-corner-all" >
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
                                                <td class="" colspan="2">
                                                    <font class="subTitle">Produtos Adicionados:</font>
                                                    <div class="box minStdHeight ui-corner-all" id="produtos2">
                                                        <%@include file="produtos_orcamento.jsp" %>
                                                    </div></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <font class="subTitle">Procurar Produtos:</font>
                                                </td>
                                                <td>
                                                    <select id="coluna"  >
                                                        <option value="nome" >Nome</option>
                                                        <option value="cod_barras">Codigo de Barras</option>
                                                        <option value="preco">Preço</option>
                                                        <option value="id">Id</option>
                                                    </select>

                                                    <input type="text" onkeyup="refreshPage('produtos','produtos_nao_orcamento.jsp?coluna='+document.getElementById('coluna').value+'&query='+this.value);" >
                                                </td>
                                            </tr>
                                            <tr class="fill">
                                                <td colspan="2"><div class="box minStdHeight ui-corner-all" id="produtos">
                                                        Não há nenhum produto
                                                    </div></td>

                                            </tr>
                                        </table>
                                    </td></tr>
                                <tr>
                                    <td><input type="reset" value="Limpar"><input type="submit" value="Salvar e Imprimir" ></td>
                                </tr>
                            </table>
                                                    </form>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="footer">
                <%@include file="rodape.jsp" %>
            </div>
        </div>
    </body>
</html>

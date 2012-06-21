<%--
    Document   : form_inserir_requisicao
    Created on : 18/06/2012, 16:15:37
    Author     : Daniel
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
        <script type="text/javascript" src="js/teste.js"></script>
        <title>Formulátio de Insersão - Requisição</title>
        <script type="text/javascript">
            $(function() {

                $( "#nome" ).autocomplete({
                    source: "mecanicos.jsp",
                    minLength: 2,
                    select:function( event, ui ) {

                        $("#telefone").val(ui.item.telefone);
                        $("#oficina").val(ui.item.oficina);
                        $("#cpf").val(ui.item.cpf);


                    }
                });
            });


            function validaForm(){

            var form_inserir_requisicao=document.form_inserir_requisicao;
                var campo_nome=form_inserir_requisicao.nome;
                var campo_cpf=form_inserir_requisicao.cpf;
                var campo_oficina=form_inserir_requisicao.oficina;
                var campo_telefone=form_inserir_requisicao.telefone;

                if(campo_nome.value==""){
                    alert("Todos os campos devem ser preenchidos!");
                    campo_nome.focus();
                    return false;
                }
                if(campo_cpf.value==""){
                    alert("Todos os campos devem ser preenchidos!");
                    campo_cpf.focus();
                    return false;
                }
                if(campo_oficina.value==""){
                    alert("Todos os campos devem ser preenchidos!");
                    campo_oficina.focus();
                    return false;
                }
                if(campo_telefone.value==""){
                    alert("Todos os campos devem ser preenchidos!");
                    campo_telefone.focus();
                    return false;
                }


                return true;
        }
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
                        <td class="box ui-corner-all" valign="top">
                            <%@include file="menu.jsp" %>
                        </td>
                        <td class="fill" valign="top">
                            <form name="form_inserir_requisicao" action="inserir_requisicao.do" method="POST" onsubmit="return validaForm()">
                            <table align="center" class="fill">
                                <tr>
                                    <td class="fill">
                                        <div id="mecanico" class="min200height fill box ui-corner-all" >
                                            <table class="fill" align="center">
                                                <tr>
                                                    <td colspan="4"><h3 align="center" >Dados do Mecânico</h3></td>
                                                </tr>
                                                <tr>
                                                    <td><label for="cpf">CPF: </label></td>
                                                    <td><input id="cpf" name="cpf" size="30%" ></td>
                                                    <td><label for="nome">Nome: </label></td>
                                                    <td><input id="nome" name="nome" size="30%"></td>
                                                </tr>
                                                <tr>
                                                    <td><label for="oficina">Oficina: </label></td>
                                                    <td><input id="oficina" name="oficina" size="30%"></td>
                                                    <td><label for="telefone">Telefone: </label></td>
                                                    <td><input id="telefone" name="telefone" size="30%"></td>
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

                                                    <input type="text" onkeyup="refreshPage('produtos','produtos.jsp?coluna='+document.getElementById('coluna').value+'&query='+this.value);" >
                                                </td>
                                            </tr>
                                            <tr class="fill">
                                                <td colspan="2"><div class="box minStdHeight ui-corner-all" id="produtos">
                                                        <%@include file="produtos.jsp" %>
                                                    </div></td>

                                            </tr>
                                        </table>
                                    </td></tr>
                                <tr>
                                    <td><input class="button" type="reset" value="Limpar"><input class="button" type="submit" value="Salvar e Imprimir" ></td>
                                    <td align="right"><div id="valor" ><%@include file="valor_total.jsp" %></div></td>
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
            <%

    if(logged){
        if(session.getAttribute("requisicao") == null){
       response.sendRedirect("index.jsp?erro=1");
    }
    }

%>
        </div>
    </body>
</html>

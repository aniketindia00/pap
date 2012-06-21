<%--
    Document   : index
    Created on : 13/02/2012, 17:04:15
    Author     : 129526
--%>

<%@page import="modelo.Carro"%>
<%@page import="modelo.OrcamentoDAO"%>
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
        <script type="text/javascript" src="js/teste.js"></script>
        <title>Formulário de Alteração - Orçamento</title>
        <script type="text/javascript">
            $(function() {

                $( "#nome" ).autocomplete({
                    source: "clientes.jsp",
                    minLength: 2,
                    select:function( event, ui ) {
                        $("#id").val(ui.item.id);
                        $("#telefone").val(ui.item.telefone);
                        refreshPage('carros','carros.jsp?id='+ui.item.id);
                    }
                });
            });

            function validaForm(){

                var form_alterar_orcamento=document.form_alterar_orcamento;
                var campo_nome=form_alterar_orcamento.nome;
                var campo_telefone=form_alterar_orcamento.telefone;

                if(campo_nome.value==""){
                    alert("Todos os campos devem ser preenchidos!");
                    campo_nome.focus();
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
                        <td class="box ui-corner-all" height="100%" valign="top">
                            <%@include file="menu.jsp" %>
                        </td>
                        <td class="fill" height="100%" valign="top">
                            <%
                                        int id = 0;
                                        Orcamento o = new Orcamento();
                                        try {
                                            id = Integer.parseInt(request.getParameter("id"));
                                            session.setAttribute("id_orcamento", id);

                                            OrcamentoDAO oDB = new OrcamentoDAO();

                                            ArrayList<Carro> carros1 = new ArrayList<Carro>();
                                            oDB.conectar();
                                            o = oDB.carregaPorId(id);
                                            ArrayList<Carro> carros = o.getCliente().getCarros();
                                            session.setAttribute("produtos", o.getProdutos());
                            %>
                            <form name="form_alterar_orcamento" action="alterar_orcamento.do" method="POST" onsubmit="return validaForm()">
                                <input type="text" value="<%=id%>" id="id" name="id" hidden />
                                <table align="center" class="fill">
                                    <tr>
                                        <td width="50%">
                                            <div id="cliente" class="min200height box ui-corner-all" >
                                                <table align="center">
                                                    <tr>
                                                        <td colspan="2"><h3 align="center" >Dados do Cliente<input type="text" value="0" id="id_cliente" name="id_cliente" hidden /></h3></td>
                                                    </tr>
                                                    <tr>
                                                        <td><label for="nome">Nome: </label></td>
                                                        <td><input id="nome" name="nome" size="30%" value="<%=o.getCliente().getNome()%>"><td>
                                                    </tr>
                                                    <tr>
                                                        <td><label for="telefone">Telefone: </label></td>
                                                        <td><input id="telefone" name="telefone" size="30%" value="<%=o.getCliente().getTelefone()%>"></td>
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
                                                        <td><select name="id_carro" size="1">

                                                                <%for (Carro c : carros) {%>
                                                                <%if (c.getId() == o.getIdCarro()) {%>
                                                                <option value="<%=c.getId() %>">
                                                                    <%=c.getMarca()+" "+c.getModelo()+", "+c.getAno() %>
                                                                </option>
                                                                <%} else { carros1.add(c);}
                                                                                        }
                                                                                        for (Carro c1 : carros1) {%>
                                                                <option value="<%=c1.getId() %>">
                                                                    <%=c1.getMarca()+" "+c1.getModelo()+", "+c1.getAno() %>
                                                                </option>
                                                                <%}%>
                                                            </select>
                                                        </td>
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
                                                            <%@include file="produtos_adicionados.jsp" %>
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
                                        <td><input type="reset" class="button" value="Limpar"><input class="button" type="submit" value="Salvar e Imprimir" ></td>
                                        
                                    </tr>
                                </table>
                            </form>
                        </td>
                    </tr>
                </table>
            </div>
            <%
                            oDB.desconectar();

                        } catch (Exception e) {

                            out.println(e);

                        }
            %>
            <div class="footer fill">
                <%@include file="rodape.jsp" %>
            </div>
        </div>
    </body>
</html>

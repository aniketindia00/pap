<%--
    Document   : listar_mecanico
    Created on : 17/06/2012, 22:45:17
    Author     : Daniel
--%>

<%@page import="modelo.Orcamento"%>
<%@page import="modelo.OrcamentoDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Requisicao"%>
<%@page import="modelo.RequisicaoDAO"%>
<%@page import="modelo.Mecanico"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.MecanicoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Orçamentos</title>
        <link href="css/custom-theme/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css">
        <link href="css/main.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/ajax.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.21.custom.min.js"></script>
        <script type="text/javascript" src="js/teste.js"></script>
        <script type="text/javascript" language="JavaScript">
            function confirma(id){
                var url="excluir_cliente.do?id="+id;
                var resposta=confirm("Tem certeza que deseja excluir?\nclique em ok para confirmar ou em cancelar para desistir");
                if(resposta){
                    window.open(url,"_parent");
                }
            }
            function confirmaOrc(id){
                var url="excluir_orcamento.do?id="+id;
                var resposta=confirm("Tem certeza que deseja excluir?\nclique em ok para confirmar ou em cancelar para desistir");
                if(resposta){
                    window.open(url,"_parent");
                }
            }

            $(function() {
                $( ".accordion" ).accordion();
            });
        </script>
    </head>
    <body>
        <div class="container" align="center">
            <div class="header">
                <table class="fill box ui-corner-all" align="center" >
                    <tr>
                        <td colspan="2">
                            <%@include file="banner.jsp" %>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="content">
                <table class="fill tableMin" >
                    <tr>
                        <td class="menu box ui-corner-all"  valign="top">
                            <%@include file="menu.jsp" %>
                        </td>
                        <td class="fill" valign="top">
                            <table class="tableDist" align="center" >
                                <tr>
                                    <td align="left"><h1>Lista de Orçamentos</h1></td>
                                    <td align="right"><a class="button" href="form_inserir_orcamento.jsp">Inserir Orçamento</a></td>
                                </tr>
                            </table>

                            <table class="fill box ui-corner-all tablePad" align="center" >
                                <tr>
                                    <td width="25%">Id</td>
                                    <td width="25%">Nome</td>
                                    <td width="25%">Telefone</td>
                                    <td width="25%">Opções</td>
                                </tr>
                            </table>
                            <div class="accordion">
                                <%
                                            try {
                                                ClienteDAO cDB = new ClienteDAO();
                                                cDB.conectar();
                                                ArrayList<Cliente> lista = cDB.listar();
                                                OrcamentoDAO oDB = new OrcamentoDAO();
                                                oDB.conectar();


                                                for (Cliente c : lista) {%>



                                <h3><a href="#">
                                        <table  class="fill" align="center" >
                                            <tr>
                                                <td width="25%"><%out.print(c.getId());%></td>
                                                <td width="25%"><%out.print(c.getNome());%></td>
                                                <td width="25%"><%out.print(c.getTelefone());%></td>
                                                <td width="25%">
                                                    <button class="button" href="form_alterar_cliente.jsp?id=<%=c.getId()%>" onclick="window.open('form_alterar_cliente.jsp?id=<%=c.getId()%>','_parent');"><img src="imagens/edit.png"></button>
                                                    <button class="button" onclick="confirma(<%=c.getId()%>)"><img src="imagens/delete.png"></button>

                                                </td>
                                            </tr>
                                        </table></a></h3>
                                <div>
                                    <table  class="fill box ui-corner-all" align="center" >
                                        <tr bgcolor="#aaa" >
                                            <td>Id</td>
                                            <td>Id Cliente</td>
                                            <td>Data Emissão</td>
                                            <td>Hora Emissão</td>
                                            <td>Valor</td>
                                            <td>Opções</td>
                                        </tr>
                                        <%ArrayList<Orcamento> listaC = oDB.orcamentosCliente(c.getId());
                                                                                for (Orcamento o : listaC) {%>


                                        <tr>
                                            <td ><%out.print(o.getId());%></td>
                                            <td ><%out.print(o.getIdCliente());%></td>
                                            <td ><%out.print(o.getDataEmissao());%></td>
                                            <td ><%out.print(o.getHoraEmissao());%></td>
                                            <td ><%out.print(o.getValor());%></td>
                                            <td >
                                                <button class="button" href="form_alterar_orcamento.jsp?id=<%=o.getId()%>" onclick="window.open('form_alterar_orcamento.jsp?id=<%=o.getId()%>','_parent');"><img src="imagens/edit.png"></button>
                                                <button class="button" onclick="confirmaOrc(<%=o.getId()%>)"><img src="imagens/delete.png"></button>
                                                <button class="button" href="imprimir_orcamento.jsp?id=<%=o.getId()%>" onclick="window.open('imprimir_orcamento.jsp?id=<%=o.getId()%>','_parent');"><img src="imagens/print.png"></button>
                                            </td>
                                        </tr>


                                        <%}%>
                                    </table>
                                </div>


                                <% }
                                                cDB.desconectar();
                                                oDB.desconectar();
                                            } catch (Exception e) {
                                                out.println(e);
                                            }
                                %>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <%

                        if (logged) {
                            Usuario uP = new Usuario();
                            if (!uP.temPermissao(request.getRequestURI(), request.getContextPath(), user)) {
                                response.sendRedirect("index.jsp?erro=1");
                            } else {
                                session.setAttribute("orcamento", true);
                            }
                        }

            %>
            <div class="footer fill">
                <%@include file="rodape.jsp" %>
            </div>
        </div>
    </body>
</html>

<%-- 
    Document   : form_alterar_produto
    Created on : 17/06/2012, 18:05:22
    Author     : Daniel
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="modelo.ProdutoDAO"%>
<%@page import="modelo.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulátio de Alteração - Produto</title>
        <link href="css/custom-theme/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css">
        <link href="css/main.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/ajax.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.21.custom.min.js"></script>
        <script type="text/javascript" src="js/teste.js"></script>
        <script type="text/javascript">
            function validaForm(){

            var form_alterar_perfil=document.form_alterar_perfil;
                var campo_perfil=form_alterar_perfil.perfil;

                if(campo_perfil.value==""){
                    alert("Todos os campos devem ser preenchidos!");
                    campo_perfil.focus();
                    return false;
                }
                return true;
        }
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
                    <table class="fill tableMin">
                <tr>
                    <td class="box ui-corner-all" valign="top">
                        <%@include file="menu.jsp" %>
                    </td>
                    <td class="fill box ui-corner-all" valign="top">
                        <table  align="center" >
                            <tr>
                                <td align="left" ><h1>Alterar Produto</h1></td>
                            </tr>
                        </table>
                        <%

                                        try {

                                            int id = Integer.parseInt(request.getParameter("id"));

                                            ProdutoDAO pDB = new ProdutoDAO();

                                            pDB.conectar();

                                            Produto p = pDB.carregaPorId(id);

                                            pDB.desconectar();

                        if(p.getId()>0){%>
                        <table align="center">
                            <form name="form_alterar_produto" action="alterar_produto.do" method="POST">
                                <tr>
                                    <td>Id</td>
                                    <td><input type="text" name="id" readonly value="<%out.print(p.getId());%>"/> </td>
                                </tr>
                                <tr>
                                    <td>Nome</td>
                                    <td><input type="text" name="nome" value="<%out.print(p.getNome());%>"/> </td>
                                </tr>
                                <tr>
                                    <td>Código de barras</td>
                                    <td><input type="text" name="cod_barras" value="<%out.print(p.getCodBarras());%>"/> </td>
                                </tr>
                                <tr>
                                    <td>Preço</td>
                                    <td>R$<input type="text" name="preco" value="<%out.print(p.getPreco());%>"/> </td>
                                </tr>
                                <tr>
                                    <td><input class="button" type="reset" value="Limpar"/> </td>
                                    <td><input class="button" type="submit" value="Alterar" /></td>
                                </tr>
                            </form>
                        </table>
                                <%}

                                }catch(SQLException e){

                                        out.println(e);

                                        }

%>
                    </td>
                </tr>
            </table>
        </div>
                    <div class="footer fill">
                <%@include file="rodape.jsp" %>
            </div>
      </div>
            <%

    if(logged){
    if(session.getAttribute("produto") == null){
       response.sendRedirect("index.jsp?erro=1");
    }
    }

%>
    </body>
</html>

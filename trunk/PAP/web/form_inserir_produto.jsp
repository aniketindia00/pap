<%-- 
    Document   : form_inserir_produto
    Created on : 17/06/2012, 17:13:26
    Author     : Daniel
--%>

<%@page import="modelo.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Produto</title>
        <link href="css/custom-theme/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css">
        <link href="css/main.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/ajax.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.21.custom.min.js"></script>
        <script type="text/javascript" src="js/teste.js"></script>
    </head>
    <body>
        <div align="center">
            <table width="760" height="660" border="1">
                <tr>
                    <td colspan="2">
                        <%@include file="banner.jsp" %>
                    </td>
                </tr>
                <tr>
                    <td width="150" height="510" valign="top">
                        <%@include file="menu.jsp" %>
                    </td>
                    <td width="610" height="510" valign="top">
                        <h1>Inserir Produto</h1>
                        <table align="center" width="500">
                            <form action="inserir_produto.do" method="POST" >
                                <%

                                            try {
                                                ProdutoDAO pDB = new ProdutoDAO();
                                                pDB.conectar();
                                                ArrayList<Produto> lista = pDB.listar();

                                %>

                                <tr>
                                    <td>Nome:</td>
                                    <td><input type="text" size="45" name="nome"/> </td>
                                </tr>
                                <tr>
                                    <td>
                                        Código de barras:
                                    </td>
                                    <td><input type="text" name="cod_barras" size="40"></td>
                                </tr>
                                <tr>
                                    <td>Preço: </td>
                                    <td>R$<input type="text" size="30" name="preco"/> </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input class="button" type="submit" value="Inserir"/> </td>
                                </tr>
                            </form>
                        </table>
                        <%
                                        pDB.desconectar();
                                    } catch (Exception e) {
                                        out.println(e);

                                    }


                        %>
                    </td>
                </tr>
            </table>
        </div>
<%

    /*if(logged){
    if(session.getAttribute("usuario") == null){
       response.sendRedirect("index.jsp?erro=1");
    }
    }*/

%>
    </body>
</html>

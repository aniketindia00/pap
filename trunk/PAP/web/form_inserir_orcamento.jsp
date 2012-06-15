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
        <link href="css/projeto.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/ajax.js"></script>
        <title>JSP Page</title>
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
                        <div id="produtos2">
                            <%@include file="produtos_orcamento.jsp" %>
                        </div>
                        <select id="coluna" >
                            <option value="nome" >Nome</option>
                            <option value="cod_barras">Codigo de Barras</option>
                            <option value="preco">Preço</option>
                            <option value="id">Id</option>
                        </select>
                        <input type="text" onkeyup="refreshPage('produtos','produtos_nao_orcamento.jsp?coluna='+document.getElementById('coluna').value+'&query='+this.value); refreshPage('produtos2', 'produtos_orcamento.jsp');" >
                        <div id="produtos">
                            Não há nenhum produto
                        </div>
                        Principal
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>

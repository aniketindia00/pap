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
                            $('#telefone').val(ui.item.telefone);
                        }
		});
	});
</script>

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
                        <div>
                            <label for="nome">Nome: </label>
                            <input id="nome" name="nome" size="45">
                            <input id="telefone" name="telefone" size="45">
                        </div>
                        <br>
                        <br>
                        <br>
                        <div id="produtos2">
                            <%@include file="produtos_orcamento.jsp" %>
                        </div>
                        <select id="coluna" >
                            <option value="nome" >Nome</option>
                            <option value="cod_barras">Codigo de Barras</option>
                            <option value="preco">Preço</option>
                            <option value="id">Id</option>
                        </select>
                        <input type="text" onkeyup="refreshPage('produtos','produtos_nao_orcamento.jsp?coluna='+document.getElementById('coluna').value+'&query='+this.value);" >
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

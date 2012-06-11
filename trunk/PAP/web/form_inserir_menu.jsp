<%-- 
    Document   : form_inserir_menu
    Created on : 19/03/2012, 16:49:04
    Author     : André
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulário de Insersão - Menus</title>
        <script type="text/javascript" src="js/ajax.js"></script>
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
                        <h1>Novo Menu</h1>
                        <form action="inserir_menu.do" method="POST" >
                            <table width="500">
                                <tr>
                                    <td>Menu:</td>
                                    <td><input type="text" size="45" name="menu"/> </td>
                                </tr>
                                <tr>
                                    <td>Icone URL:</td>
                                    <td><input type="text" size="45" name="icone" onblur="refreshPage('thumb','thumb.jsp?link='+this.value)"/> </td>
                                    <td><div align="center" id="thumb"></div></td>
                                </tr>
                                <tr>
                                    <td>Link:</td>
                                    <td><input type="text" size="45" name="link"/> </td>
                                </tr>
                                
                                <tr>
                                    <td></td>
                                    <td><input type="submit" value="inserir"/> </td>
                                </tr>
                            </table>

                        </form>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
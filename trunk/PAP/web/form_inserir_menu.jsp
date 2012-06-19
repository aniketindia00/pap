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
        <link href="css/custom-theme/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css">
        <link href="css/main.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/ajax.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.21.custom.min.js"></script>
        <script type="text/javascript" src="js/teste.js"></script>
        <script language="javascript" >
            function validaForm(){

                var form_inserir_menu=document.form_inserir_menu;
                var campo_menu=form_inserir_menu.menu;
                var campo_icone=form_inserir_menu.icone;
                var campo_link=form_inserir_menu.link;


                if(campo_menu.value==""){
                    alert("Todos os campos devem ser preenchidos!");
                    campo_menu.focus();
                    return false;
                }
                if(campo_icone.value==""){
                    alert("Todos os campos devem ser preenchidos!");
                    campo_icone.focus();
                    return false;
                }
                if(campo_link.value==""){
                    alert("Todos os campos devem ser preenchidos!");
                    campo_link.focus();
                    return false;
                }
                return true;
            }
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

                        <h1>Novo Menu</h1>
                        <form name="form_inserir_menu" action="inserir_menu.do" method="POST" onsubmit="return validaForm();">
                            <table width="500">
                                <tr>
                                    <td>Nome:</td>
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
                                    <td><input class="button" type="submit" value="inserir"/> </td>
                                </tr>
                            </table>

                        </form>
                    </td>
                </tr>
            </table>
        </div>
<%
    if(logged){
    if(session.getAttribute("menu") == null){
       response.sendRedirect("index.jsp?erro=1");
    }
    }

%>
    </body>
</html>
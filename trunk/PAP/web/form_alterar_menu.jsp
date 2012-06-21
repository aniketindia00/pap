<%-- 
    Document   : form_alterar_menu
    Created on : 02/04/2012, 16:57:32
    Author     : André
--%>
<%@page import="modelo.Perfil"%>
<%@page import="modelo.MenuDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulário de Alteração - Menus</title>
        <link href="css/custom-theme/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css">
        <link href="css/main.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/ajax.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.21.custom.min.js"></script>
        <script type="text/javascript" src="js/teste.js"></script>
        <script language="javascript" >
            function validaForm(){

                var form_alterar_menu=document.form_alterar_menu;
                var campo_menu=form_alterar_menu.menu;
                var campo_icone=form_alterar_menu.icone;
                var campo_link=form_alterar_menu.link;


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
                                <td align="left" ><h1>Alterar Menu</h1></td>
                            </tr>
                        </table>
                        <form name="form_alterar_menu" action="alterar_menu.do" method="POST" onsubmit="return validaForm()">
                            <table width="500" align="center">
                                <%
                                    int id = 0;
                                    Menu m = null;

                                        try {

                                        if (request.getParameter("id") != null) {
                                        id = Integer.parseInt(request.getParameter("id"));
                                        }

                                        MenuDAO mDB = new MenuDAO();

                                        mDB.conectar();
                                        m = mDB.carregaPorId(id);
                                        mDB.desconectar();
                                            
                                        } catch(SQLException e){

                                        out.println(e);

                                        }

                        %>
                                <tr>
                                    <td>Id:</td>
                                    <td><input readonly type="text" size="10" name="id" value="<%=m.getId() %>" /> </td>
                                </tr>
                                <tr>
                                    <td>Menu:</td>
                                    <td><input type="text" size="45" name="menu" value="<%=m.getMenu() %>" /> </td>
                                </tr>
                                <tr>
                                    <td>Icone URL:</td>
                                    <td><input type="text" size="45" name="icone" value="<%=m.getIcone() %>" onblur="refreshPage('thumb','thumb.jsp?link='+this.value)" /> </td>
                                    <td ><div align="rigth" id="thumb"><img width="32" height="32" src="<%=m.getIcone()%>"/></div></td>
                                </tr>
                                <tr>
                                    <td>Link:</td>
                                    <td><input type="text" size="45" name="link" value="<%=m.getLink() %>" /> </td>
                                </tr>

                                <tr>
                                    <td></td>
                                    <td><input class="button" type="submit" value="Alterar"/> </td>
                                </tr>
                            </table>

                        </form>
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
    if(session.getAttribute("menu") == null){
       response.sendRedirect("index.jsp?erro=1");
    }
    }

%>
    </body>
</html>

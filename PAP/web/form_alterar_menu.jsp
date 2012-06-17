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

                        <h1>Alterar Menu</h1>
                        <form action="alterar_menu.do" method="POST" >
                            <table width="500">
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
                                    <td><div align="center" id="thumb"><img width="32" height="32" src="<%=m.getIcone()%>"/></div></td>
                                </tr>
                                <tr>
                                    <td>Link:</td>
                                    <td><input type="text" size="45" name="link" value="<%=m.getLink() %>" /> </td>
                                </tr>

                                <tr>
                                    <td></td>
                                    <td><input type="submit" value="Alterar"/> </td>
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

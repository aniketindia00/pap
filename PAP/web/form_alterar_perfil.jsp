<%-- 
    Document   : index
    Created on : 13/02/2012, 17:04:15
    Author     : 129526
--%>


<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
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
        <title>JSP Page</title>
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

                        <h1 align="center" > Alterar Dados </h1>
                        <%

                                        try {

                                            int id = Integer.parseInt(request.getParameter("id"));

                                            PerfilDAO pDB = new PerfilDAO();

                                            pDB.conectar();

                                            Perfil p = pDB.carregaPorId(id);

                                            pDB.desconectar();

                        if(p.getId()>0){%>
                        <table align="center">
                            <form name="form_alterar_perfil" action="alterar_perfil.do" method="POST">
                                <tr>
                                    <td>Id</td>
                                    <td><input type="text" name="id" readonly value="<%out.print(p.getId());%>"/> </td>
                                </tr>
                                <tr>
                                    <td>Perfil</td>
                                    <td><input type="text" name="perfil" value="<%out.print(p.getPerfil());%>"/> </td>
                                </tr>
                                <tr>
                                    <td><input type="reset" value="Limpar"/> </td>
                                    <td><input type="submit" value="Alterar" /></td>
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
<%

    if(logged){
    if(session.getAttribute("perfil") == null){
       response.sendRedirect("index.jsp?erro=1");
    }
    }

%>
    </body>
</html>

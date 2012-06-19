<%-- 
    Document   : index
    Created on : 13/02/2012, 17:04:15
    Author     : 129526
--%>


<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClienteDAO"%>
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
        <script language="javascript" >
            function validaForm(){

                var form_alterar_cliente=document.form_alterar_cliente;
                var campo_perfil=form_alterar_cliente.perfil;
                var campo_telefone=form_alterar_cliente.telefone;

                if(campo_perfil.value==""){
                    alert("Todos os campos devem ser preenchidos!");
                    campo_perfil.focus();
                    return false;
                }
                if(campo_telefone.value==""){
                    alert("Todos os campos devem ser preenchidos!");
                    campo_telefone.focus();
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
                                <td align="left" ><h1>Alterar Cliente</h1></td>
                            </tr>
                        </table>
                        <%

                                        try {

                                            int id = Integer.parseInt(request.getParameter("id"));

                                            ClienteDAO cDB = new ClienteDAO();

                                            cDB.conectar();

                                            Cliente c = cDB.carregaPorId(id);

                                            cDB.desconectar();

                        if(c.getId()>0){%>
                        <table align="center">
                            <form name="form_alterar_cliente" action="alterar_cliente.do" method="POST" onsubmit="return validaForm();">
                                <tr>
                                    <td>Id</td>
                                    <td><input type="text" name="id" readonly value="<%out.print(c.getId());%>"/> </td>
                                </tr>
                                <tr>
                                    <td>Perfil</td>
                                    <td><input type="text" name="nome" value="<%out.print(c.getNome());%>"/> </td>
                                </tr>
                                 <tr>
                                    <td>Telefone</td>
                                    <td><input type="text" name="id" readonly value="<%out.print(c.getTelefone());%>"/> </td>
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

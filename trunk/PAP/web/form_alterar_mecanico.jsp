<%-- 
    Document   : form_alterar_mecanico
    Created on : 17/06/2012, 23:05:57
    Author     : Daniel
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="modelo.Mecanico"%>
<%@page import="modelo.MecanicoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulário de Alteração - Mecânico</title>
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
                        <table align="center">
                            <form name="form_alterar_mecanico" action="alterar_mecanico.do" method="POST">
                                <%
                    try{
                    String cpf = request.getParameter("cpf");

                    MecanicoDAO pDB = new MecanicoDAO();

                    pDB.conectar();

                    Mecanico m = pDB.carregaPorCpf(cpf);

                    pDB.desconectar();

                    %>
                                <tr>
                                    <td>CPF: </td>
                                    <td><input type="text" name="cpf" value="<%out.print(m.getCpf());%>"/> </td>
                                </tr>
                                <tr>
                                    <td>Nome: </td>
                                    <td><input type="text" name="nome" value="<%out.print(m.getNome());%>"/> </td>
                                </tr>
                                <tr>
                                    <td>Oficina: </td>
                                    <td><input type="text" name="oficina" value="<%out.print(m.getOficina());%>"/> </td>
                                </tr>
                                <tr>
                                    <td>Telefone: </td>
                                    <td><input type="text" name="telefone" value="<%out.print(m.getTelefone());%>"/> </td>
                                </tr>
                                <tr>
                                    <td><input type="reset" value="Limpar"/> </td>
                                    <td><input type="submit" value="Alterar" /></td>
                                </tr>
                            </form>
                        </table>
                                <%

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

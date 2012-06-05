<%-- 
    Document   : form_inserir_usuario
    Created on : 14/05/2012, 16:33:22
    Author     : André
--%>

<%@page import="modelo.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PerfilDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                        <h1>Inserir Usuario</h1>

                        <table align="center" width="500">
                            <form action="inserir_usuario.do" method="POST" >
                                <%

                                            try {
                                                PerfilDAO pDB = new PerfilDAO();
                                                pDB.conectar();
                                                ArrayList<Perfil> lista = pDB.listar();

                                %>

                                <tr>
                                    <td>Nome:</td>
                                    <td><input type="text" size="45" name="nome"/> </td>
                                </tr>
                                <tr>
                                    <td>
                                        Perfil:
                                    </td>
                                    <td><select name="id_perfil" size="1">
                                            <option value="0">
                                                Selecione um perfil
                                            </option>

                                            <%for (Perfil p : lista) {%>

                                            <option value="<%=p.getId()%>">
                                                <%=p.getPerfil()%>
                                            </option>
                                            <%}%>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Telefone:</td>
                                    <td><input type="text" size="45" name="telefone"/> </td>
                                </tr>
                                <tr>
                                    <td>Login:</td>
                                    <td><input type="text" size="45" name="login"/> </td>
                                </tr>
                                <tr>
                                    <td>Senha:</td>
                                    <td><input type="password" size="45" name="senha"/> </td>
                                </tr>

                                <tr>
                                    <td></td>
                                    <td><input type="submit" value="Inserir"/> </td>
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
    </body>
</html>

<%-- 
    Document   : form_inserir_usuario
    Created on : 14/05/2012, 16:33:22
    Author     : André
--%>

<%@page import="modelo.UsuarioDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
        <link href="css/custom-theme/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css">
        <link href="css/main.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/ajax.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.21.custom.min.js"></script>
        <script type="text/javascript" src="js/teste.js"></script>
        <script type="text/javascript">
            function validaForm(){

            var form_alterar_perfil=document.form_alterar_perfil;
                var campo_perfil=form_alterar_perfil.perfil;

                if(campo_perfil.value==""){
                    alert("Todos os campos devem ser preenchidos!");
                    campo_perfil.focus();
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
                                <td align="left" ><h1>Alterar Usuário</h1></td>
                            </tr>
                        </table>
                        <table align="center" width="500">
                                                            <%

                                        try {
                                            int id = Integer.parseInt(request.getParameter("id"));
                                            ArrayList<Perfil> lista1 = new ArrayList<Perfil>();

                                            UsuarioDAO uDB = new UsuarioDAO();
                                            uDB.conectar();
                                            Usuario u = uDB.carregaPorId(id);
                                            uDB.desconectar();

 
                                                PerfilDAO pDB = new PerfilDAO();
                                                pDB.conectar();
                                                ArrayList<Perfil> lista = pDB.listar();

                                %>
                                <form action="alterar_usuario.do" method="POST" >
                                    <tr>
                                    <td>Id:</td>
                                    <td><input type="text" readonly size="45" name="id" value="<%=u.getId()%>"/> </td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td><input type="text" size="45" name="nome" value="<%=u.getNome()%>"/> </td>
                                </tr>
                                <tr>
                                    <td>
                                        Perfil:
                                    </td>
                                    <td><select name="id_perfil" size="1">
                                            
                                            <%for (Perfil p : lista) {%>
                                            <%if(u.getIdPerfil() == p.getId()) {%>
                                            <option value="<%=p.getId()%>">
                                                <%=p.getPerfil()%>
                                            </option>
                                            <%}else {lista1.add(p);}
                                            }
                                            for (Perfil p1 : lista1) {%>
                                            <option value="<%=p1.getId()%>">
                                                <%=p1.getPerfil()%>
                                            </option>
                                            <%}%>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Telefone:</td>
                                    <td><input type="text" size="45" name="telefone" value="<%=u.getTelefone()%>"/> </td>
                                </tr>
                                <tr>
                                    <td>Login:</td>
                                    <td><input type="text" size="45" name="login" value="<%=u.getLogin()%>"/> </td>
                                </tr>
                                <tr>
                                    <td>Senha:</td>
                                    <td><input type="password" size="45" name="senha" value=""/> </td>
                                </tr>

                                <tr>
                                    <td></td>
                                    <td><input class="button" type="submit" value="Alterar"/> </td>
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
                        <div class="footer fill">
                <%@include file="rodape.jsp" %>
            </div>
</div>
<%

    if(logged){
    if(session.getAttribute("usuario") == null){
       response.sendRedirect("index.jsp?erro=1");
    }
    }

%>
    </body>
</html>

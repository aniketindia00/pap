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
        <title>Inserir Usuário</title>
        <link href="css/custom-theme/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css">
        <link href="css/main.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/ajax.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.21.custom.min.js"></script>
        <script type="text/javascript" src="js/teste.js"></script>
        <script type="text/javascript">
            function validar(){
            if(document.nome.value=="")
            {
                alert( "Preencha campo Nome corretamente!" );
                document.nome.focus();
                return false;
            }
            if (document.telefone.value=="")
            {
                alert( "Preencha o campo Telefone corretamente!" );
                document.telefone.focus();
                return false;
            }
            if (document.id_perfil.value=="")
            {
                alert( "Selecione o Perfil para o Usuario!" );
                document.id_perfil.focus();
                return false;
            }
            if (document.senha.value=="")
            {
                alert( "Digite uma senha." );
                document.senha.focus();
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
                        <h1>Inserir Usuário</h1>
                        <table align="center" width="500">
                            <form action="inserir_usuario.do" method="POST" onsubmit="return validar()" >
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
<%

    if(logged){
    if(session.getAttribute("usuario") == null){
       response.sendRedirect("index.jsp?erro=1");
    }
    }

%>
    </body>
</html>

<%-- 
    Document   : index
    Created on : 13/02/2012, 17:04:15
    Author     : 129526
--%>

<%@page import="modelo.UsuarioDAO"%>
<%@page import="modelo.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.MenuDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" language="JavaScript">
            function confirma(id){
                var url="deletar_usuario.do?id="+id;
                var resposta=confirm("Tem certeza que deseja excluir?\nclique em ok para confirmar ou em cancelar para desistir");
                if(resposta){
                    window.open(url,"_parent");
                }
            }
        </script>
    </head>
    <body>
        <div align="center">
            <table width="760" height="660" border="1" align="center" >
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
                        <h1>Lista de Usuários</h1>
                        <table border="1" align="center" >
                            <tr>
                                <td>Id</td>
                                <td>Nome</td>
                                <td>Telefone</td>
                                <td>Login</td>
                                <td>Senha</td>
                                <td>Opções</td>
                            </tr>


                            <%
                            try{
                                UsuarioDAO uDB = new UsuarioDAO();
                                uDB.conectar();
                                ArrayList<Usuario> lista = uDB.listar();
                            for(Usuario u:lista){%>

                            <tr>
                                <td>
                                    <%=u.getId()%>
                                </td>
                                <td>
                                    <%=u.getNome()%>
                                </td>
                                <td>
                                    <%=u.getTelefone()%>
                                </td>
                                <td>
                                    <%=u.getLogin()%>
                                </td>
                                <td>
                                    <%=u.getSenha()%>
                                </td>
                                <td>
                                    <a href="form_alterar_usuario.jsp?id=<%=u.getId()%>"><img src="imagens/edit.png"></a>
                                    <a href="#" onclick="confirma(<%=u.getId()%>)" ><img src="imagens/delete.png"></a>
                                </td>
                            </tr>

                            <% }
                            uDB.desconectar();
         }catch (Exception e) {
               out.println(e);
}
                            %>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>

<%-- 
    Document   : index
    Created on : 13/02/2012, 17:04:15
    Author     : 129526
--%>


<%@page import="modelo.UsuarioDAO"%>
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
        <script type="text/javascript" language="JavaScript">
            function confirma(id){
                var url="deletar_perfil.do?id="+id;
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
                        <h1>Lista dos Perfis</h1>
                        <table border="1" align="center" >
                            <tr>
                                <td>Id</td>
                                <td>Perfil</td>
                                <td>Opções</td>
                            </tr>


                            <%

                                        try {
                                            PerfilDAO pDB = new PerfilDAO();

                                            pDB.conectar();

                                            ArrayList<Perfil> lista = pDB.listar();

                                            for(Perfil p:lista){%>

                            <tr>
                                <td>
                                    <%out.print(p.getId());%>
                                </td>
                                <td>
                                    <%out.print(p.getPerfil());%>
                                </td>
                                <td>
                                    <a href="form_gerenciar_menu_perfil.jsp?id=<%out.print(p.getId());%>"><img src="imagens/edit.png"></a>
                                    <a href="form_alterar_perfil.jsp?id=<%out.print(p.getId());%>&perfil=<%out.print(p.getPerfil());%>"><img src="imagens/edit.png"></a>
                                    <a href="#" onclick="confirma(<%out.print(p.getId());%>)"><img src="imagens/delete.png"></a>
                                </td>
                            </tr>

                            <% }


                                        } catch (Exception e) {
                                            out.println(e);

                                        }






                            %>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
<%

    if(logged){
    Usuario uP = new Usuario();
    if(!uP.temPermissao(request.getRequestURI(),request.getContextPath(), user)){
       response.sendRedirect("index.jsp?erro=1");
    }else{
    session.setAttribute("perfil",true);
    }
    }

%>
    </body>
</html>

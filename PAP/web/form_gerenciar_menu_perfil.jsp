<%-- 
    Document   : form_gerenciar_menu_perfil
    Created on : 07/05/2012, 14:42:42
    Author     : André
--%>

<%@page import="modelo.Menu"%>
<%@page import="modelo.MenuDAO"%>
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
            function confirma(id_menu,id_perfil,op){
                var url="gerenciar_menu_perfil.do?id_menu="+id_menu+"&id_perfil="+id_perfil+"&op="+op;
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

                        <h1>Vincular Menus</h1>
                        <br>
                        <form name="form_gerenciar_menu" action="gerenciar_menu_perfil.do">

                            <%
                            
                                        try {
                                            int id_perfil = Integer.parseInt(request.getParameter("id"));
                                            MenuDAO mDB = new MenuDAO();
                                            mDB.conectar();
                                            ArrayList<Menu> listaN = mDB.menusNaoPerfil(id_perfil);
                                            ArrayList<Menu> lista = mDB.menusPerfil(id_perfil);
                                            PerfilDAO pDB = new PerfilDAO();

                                            pDB.conectar();

                                            Perfil p = pDB.carregaPorId(id_perfil);

                                            %>
                                            <table align="center">
                                                <tr>
                                                    <td>
                                                        ID: <%=p.getId()%>
                                                    </td>
                                                    <td>
                                                        Perfil: <%=p.getPerfil()%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    Menu:
                                                    </td>
                                                    <td><select name="id_menu" size="1">
                                                    <option value="0">
                                                        Selecione um menu
                                                    </option>

                                                    <%for(Menu m1:listaN){%>

                                                    <option value="<%=m1.getId()%>">
                                                        <%=m1.getMenu()%>
                                                    </option>
                                                    <%}%>
                                                </select>
                                                    </td>
                                                    <td>
                                                        <input type="text" hidden="true" value="<%=p.getId()%>" name="id_perfil">
                                                        <input type="text" hidden="true" value="1" name="op">
                                                        <input type="submit" value="Vincular">
                                                    </td>
                                                </tr>


                                            </table>
                                          </form>
                                                <br>
                            <h1>Menus Vinculados</h1>
                            <br>
                            <table border="1" align="center" >
                            <tr>
                                <td>Id</td>
                                <td>Menu</td>
                                <td>Desvincular</td>
                            </tr>

                            <% for(Menu m:lista){%>

                            <tr>
                                <td>
                                    <%out.print(m.getId());%>
                                </td>
                                <td>
                                    <%out.print(m.getMenu());%>
                                </td>
                                <td align="center">
                                    <a href="#" onclick="confirma(<%out.print(m.getId());%>,<%out.print(p.getId());%>,2)"><img src="imagens/delete.png"></a>
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
    if(session.getAttribute("perfil") == null){
       response.sendRedirect("index.jsp?erro=1");
    }
    }

%>
    </body>
</html>


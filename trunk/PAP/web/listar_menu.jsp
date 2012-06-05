<%-- 
    Document   : index
    Created on : 13/02/2012, 17:04:15
    Author     : 129526
--%>

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
                var url="deletar_menu.do?id="+id;
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
                        <h1>Lista de Menus</h1>
                        <table border="1" align="center" >
                            <tr>
                                <td>Id</td>
                                <td>Menu</td>
                                <td>Link</td>
                                <td>Icone</td>
                                <td>Opções</td>
                            </tr>


                            <%
                            try{
                                MenuDAO mDB = new MenuDAO();
                                mDB.conectar();    
                                ArrayList<Menu> lista = mDB.listar();
                            for(Menu m:lista){%>

                            <tr>
                                <td>
                                    <%out.print(m.getId());%>
                                </td>
                                <td>
                                    <%out.print(m.getMenu());%>
                                </td>
                                <td>
                                    <%out.print(m.getLink());%>
                                </td>
                                <td>
                                    <img width="16" height="16" src="<%out.print(m.getIcone());%>">
                                </td>
                                <td>
                                    <a href="form_alterar_menu.jsp?id=<%out.print(m.getId());%>"><img src="imagens/edit.png"></a>
                                    <a href="#" onclick="confirma(<%out.print(m.getId());%>)" ><img src="imagens/delete.png"></a>
                                </td>
                            </tr>

                            <% }

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

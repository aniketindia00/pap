<%-- 
    Document   : form_inserir_perfil
    Created on : 13/02/2012, 17:04:15
    Author     : 129526
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulário de Insersão - Perfis</title>
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
                        <h1>Novo Perfil</h1>
        <%
        int perm = 0;
        try{
        for(Menu m:user.getPerfil().getMenus()){
        if(m.getId() == 6){
            perm = 1;
        }
        }
        } catch(Exception e){
            out.print(e);
        }
        if(perm == 0){
            out.print("<script language='JavaScript'>");
            out.print("window.open('index.jsp','_parent');");
            out.print("</script>");
        }

%>
                        <form action="inserir_perfil.do" method="GET" >
                            <table width="500">
                                <tr>
                                    <td>Perfil:</td>
                                    <td><input type="text" size="45" name="perfil"/> </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input type="submit" value="inserir"/> </td>
                                </tr>
                            </table>

                        </form>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>

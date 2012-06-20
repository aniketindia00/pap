<%-- 
    Document   : index
    Created on : 13/02/2012, 17:04:15
    Author     : 129526
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="css/custom-theme/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css">
        <link href="css/main.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/ajax.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.21.custom.min.js"></script>
        <script type="text/javascript" src="js/teste.js"></script>
    </head>
    <body>
        <div class="container" align="center">
            <div class="header">
            <table class="fill box ui-corner-all">
                <tr>
                    <td colspan="2">
                        <%@include file="banner.jsp" %>
                    </td>
                </tr>
                </table>
            </div>
                    <div class="content">
                <table class="fill">
                <tr>
                    <td class="box ui-corner-all tableMin" valign="top">
                        <%@include file="menu.jsp" %>
                    </td>
                    <td class="fill box ui-corner-all" valign="top">
                        <%
                        try{
                        if(request.getParameter("erro").equalsIgnoreCase("1")){
                            out.print("<script language='JavaScript'>");
                            out.print("alert('Você não tem permissão para acessar a área!');");
                            out.print("</script>");
                        }
                        }catch (Exception e){
                        }
                        %>
                        <center><img width="540" heigth="380" src="imagens/middle.png"></center>
                    </td>
                </tr>
            </table>
        </div>
                        <div class="footer fill">
                <%@include file="rodape.jsp" %>
            </div>
        </div>
    </body>
</html>

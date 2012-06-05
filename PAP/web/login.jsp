<%-- 
    Document   : login
    Created on : 28/05/2012, 16:30:26
    Author     : André
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center" >
                        <form action="efetuar_login.do" method="POST">
                            <table align="center" border="1" >
                    <tr>
                        <td>Usuário: </td>
                        <td><input type="text" name="user"/></td>
                    </tr>
                    <tr>
                        <td>Senha: </td>
                        <td><input type="password" name="pass"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Login" </td>
                    </tr>
                    
                </table>
                </form>
            </div>
    </body>
</html>

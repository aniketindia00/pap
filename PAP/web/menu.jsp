<%@page import="modelo.Menu"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<table>
<%
boolean logged = false;
Usuario user = null;
try{

    user = (Usuario) session.getAttribute("user");

    out.print("Bem Vindo "+user.getNome()+"<br>");
    out.print("<a href='sair.jsp'>(Sair)</a>");
    for(Menu mp:user.getPerfil().getMenus()){

    out.print("<tr><td>"
            + "<a href='"+mp.getLink()+"'>"
            + "<img src='"+mp.getIcone()+"'>"+mp.getMenu()+"</a></td></tr>" );
    }
    logged = true;

}catch(Exception e){
response.sendRedirect("login.jsp");
}

%>
</table>
    </body>
</html>
<%@page import="modelo.Menu"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<table class="menu" >
<%
boolean logged = false;
Usuario user = null;
try{

    user = (Usuario) session.getAttribute("user");
    out.print("Bem Vindo "+user.getNome());
    for(Menu mp:user.getPerfil().getMenus()){

    out.print("<tr><td >"
            + "<a class='button' href='"+mp.getLink()+"'><div align='justify' class=\"minButtonWidth\">"
            + "<img src='"+mp.getIcone()+"'>"+mp.getMenu()+"</div></a></td></tr>" );
    }

    out.print("<a class='button' href='sair.jsp'>(Sair)</a>");

    logged = true;

}catch(Exception e){
response.sendRedirect("login.jsp");
}

%>
</table>

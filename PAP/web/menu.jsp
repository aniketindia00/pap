<%@page import="modelo.Menu"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<table class="fillall">
<%
boolean logged = false;
Usuario user = null;
try{

    user = (Usuario) session.getAttribute("user");
    for(Menu mp:user.getPerfil().getMenus()){

    out.print("<tr><td class=\"fill\">"
            + "<a href='"+mp.getLink()+"'><div align='justify' class=\"minButtonWidth\">"
            + "<img src='"+mp.getIcone()+"'>"+mp.getMenu()+"</div></a></td></tr>" );
    }
    logged = true;

}catch(Exception e){
response.sendRedirect("login.jsp");
}

%>
</table>

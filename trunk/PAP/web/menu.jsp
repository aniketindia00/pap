<%@page import="modelo.Menu"%>
<%@page import="modelo.Usuario"%>
<table>
<%

Usuario user;

try{

    user = (Usuario) session.getAttribute("user");

    out.print("Bem Vindo "+user.getNome());
    out.print("<a href='sair.jsp'>(Sair)</a>");
    for(Menu mp:user.getPerfil().getMenus()){

    out.print("<tr><td>"
            + "<a href='"+mp.getLink()+"'>"
            + "<img src='"+mp.getIcone()+"'>"+mp.getMenu()+"</a></td></tr>" );
    }

}catch(Exception e){
response.sendRedirect("login.jsp");
}

%>
</table>
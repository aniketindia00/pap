<%-- 
    Document   : rodape
    Created on : 16/06/2012, 22:31:16
    Author     : PC
--%>

<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
try{
Usuario usr = (Usuario) session.getAttribute("user");
out.print("<font class=\"leftAlg\">Bem Vindo "+usr.getNome());
out.print("  <a href='sair.jsp'>(Sair)</a></font>");
}catch(Exception e){
}
%>
<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowreturn-1-w"><span class="ui-icon ui-icon-arrowreturn-1-w"></span></li>
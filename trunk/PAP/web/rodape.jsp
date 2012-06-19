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
out.print("<table class='fill'><tr><td align='left'>");
out.print("<font class=\"leftAlg\">Bem Vindo "+usr.getNome()+"</font>");
out.print("</td><td align=\"right\">");
out.print("<a class='button' href='sair.jsp'>(Sair)</a>");
out.print("</td></tr></table>");
}catch(Exception e){
}
%>

<%-- 
    Document   : sair
    Created on : 01/03/2012, 23:29:16
    Author     : PC
--%>
<%
session.invalidate();
response.sendRedirect("index.jsp");
%>
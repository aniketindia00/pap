<%-- 
    Document   : teste
    Created on : 14/06/2012, 23:04:49
    Author     : PC
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.TimeZone"%>
<%@page import="modelo.ProdutoDAO"%>
<%@page import="modelo.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teste</title>
    </head>
    <body>
        <%

                    TimeZone.setDefault(TimeZone.getTimeZone("Brazil/East"));
                    DateFormat horaF = new SimpleDateFormat("HH:mm:ss");
                    DateFormat dataF = new SimpleDateFormat("dd/MM/yyyy");

                    Date date = new Date();

                    out.print(horaF.format(date));
                    out.print("<br />");
                    out.print(dataF.format(date));

%>
    </body>
</html>

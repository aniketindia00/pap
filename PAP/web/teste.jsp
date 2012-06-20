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
                    DateFormat dataMysql = new SimpleDateFormat("yyyy/MM/dd");

                    Date date = new Date();

                    
                    String hora = horaF.format(date);
                    out.print("Hora Normal: "+hora);
                    out.print("<br />");
                    String dataNormal = dataF.format(date);
                    out.print("Data Formato Brasil: "+dataNormal);
                    out.print("<br />");
                    String dataBancoDados = dataMysql.format(date);
                    out.print("Data Formato Banco de Dados MySQL: "+dataBancoDados);
                    out.print("<br />");


%>
    </body>
</html>

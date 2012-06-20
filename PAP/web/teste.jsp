<%-- 
    Document   : teste
    Created on : 14/06/2012, 23:04:49
    Author     : PC
--%>

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

        ArrayList<Produto> produtos = new ArrayList<Produto>();
        ArrayList<Produto> aux = new ArrayList<Produto>();
        if(session.getAttribute("produtos") != null){
        produtos =(ArrayList<Produto>) session.getAttribute("produtos");
        }

        ProdutoDAO pDB = new ProdutoDAO();
        pDB.conectar();
        ArrayList<Produto> lista = pDB.listaResumida(10,"nome"," ");
        pDB.desconectar();

        out.print(lista);

        for(Produto p1:produtos){
            for(Produto p2:lista){
            if(p1.getId() == p2.getId()){
            aux.add(p2);
            }
        }
        }
        lista.removeAll(aux);

        out.print("<br>"+lista);

%>
    </body>
</html>

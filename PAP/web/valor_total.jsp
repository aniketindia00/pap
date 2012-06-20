<%-- 
    Document   : valor_total
    Created on : 19/06/2012, 20:10:28
    Author     : PC
--%>

<%@page import="modelo.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% double valor=0;
try {

            ArrayList<Produto> produtos = new ArrayList<Produto>();
                            if (session.getAttribute("produtos") != null) {
                                produtos = (ArrayList<Produto>) session.getAttribute("produtos");
    }
            for(Produto p:produtos){
                valor += (p.getPreco() * p.getQuantidade());
            }
            } catch (Exception e) {
            }%>
Valor Total <input type="text" value="<%=valor%>" >

<%-- 
    Document   : produtos_orcamento
    Created on : 14/06/2012, 20:18:14
    Author     : PC
--%>

<%@page import="modelo.ProdutoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<table align="center">
<%
                try {
                    ArrayList<Produto> produtos = new ArrayList<Produto>();
                    if(session.getAttribute("produtos") != null){
                    produtos =(ArrayList<Produto>) session.getAttribute("produtos");
                    }
                    for(Produto p:produtos){%>

                    <tr>
                        <td><%=p.getId()%></td>
                        <td><%=p.getNome()%></td>
                        <td><%=p.getPreco()%></td>
                        <td><%=p.getCodBarras()%></td>
                        <td><a href="#" onclick="refreshPage('produtos2','excluir_produto_sessao.do?id=<%=p.getId()%>');">del</a></td>
                    </tr>

<%}
                } catch (Exception e) {
                    out.print(e);
                }
%>
</table>
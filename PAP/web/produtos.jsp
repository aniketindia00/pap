<%-- 
    Document   : produtos_nao_orcamento
    Created on : 14/06/2012, 20:18:54
    Author     : PC
--%>

<%@page import="modelo.ProdutoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<table align="center" class="fill">
<%
                try {
                    String coluna;
                    String query;
                    if(request.getParameter("coluna") != null){
                    coluna = request.getParameter("coluna");
                    query = request.getParameter("query");
                    }else{
                    coluna = "nome";
                    query = " ";
                    }
                    ProdutoDAO pDB = new ProdutoDAO();
                    pDB.conectar();
                    ArrayList<Produto> lista = pDB.listaResumida(10, coluna, query);
                    pDB.desconectar();
//                    for(Produto p1:produtos){
//                        for(Produto p2:lista){
//                        if(p1.getId() == p2.getId()){
//                        aux.add(p2);
//                        }
//                    }
//                   }
                    for(Produto p:lista){%>

                    <tr>
                        <td><%=p.getId()%></td>
                        <td ><%=p.getNome()%></td>
                        <td>R$ <%=p.getPreco()%></td>
                        <td><%=p.getCodBarras()%></td>
                        <td><a href="#" onclick="refreshPage('produtos2','inserir_produto_sessao.do?id=<%=p.getId()%>');"><img src="imagens/add.png"/></a></td>
                    </tr>

<%}
                } catch (Exception e) {
                    out.print(e);
                }
%>
</table>
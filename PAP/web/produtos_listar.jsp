<%-- 
    Document   : produtos_listar
    Created on : 17/06/2012, 22:32:04
    Author     : PC
--%>

<%@page import="modelo.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<table align="center" class="fill" border="1">
    <tr>
        <td>ID</td>
        <td>Nome</td>
        <td>Código de Barras</td>
        <td>Preço</td>
        <td width="20px">Opções</td>
    </tr>
    <%
                try {
                    String coluna;
                    String query;
                    if (request.getParameter("coluna") != null) {
                        coluna = request.getParameter("coluna");
                        query = request.getParameter("query");
                    } else {
                        coluna = "nome";
                        query = "";
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
                for (Produto p : lista) {%>

    <tr>
        <td><%=p.getId()%></td>
        <td ><%=p.getNome()%></td>
        <td>R$ <%=p.getCodBarras()%></td>
        <td><%=p.getPreco()%></td>
        <td>
            <a href="form_alterar_produto.jsp?id=<%=p.getId()%>"><img src="imagens/edit.png"></a>
            <a href="#" onclick="confirma(<%=p.getId()%>)" ><img src="imagens/delete.png"></a>
        </td>
    </tr>

    <%}
                } catch (Exception e) {
                    out.print(e);
                }
    %>
</table>
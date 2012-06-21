<%-- 
    Document   : produtos_orcamento
    Created on : 14/06/2012, 20:18:14
    Author     : PC
--%>

<%@page import="modelo.ProdutoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link href="css/custom-theme/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css">
        <link href="css/main.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/ajax.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.21.custom.min.js"></script>
        <script type="text/javascript" src="js/teste.js"></script>
    </head>
    <body onload="refreshPage('valor','valor_total.jsp');" >

        
        <table align="center" class="fillall">
            <%
                        try {
                            double valor = 0;
                            ArrayList<Produto> produtos = new ArrayList<Produto>();
                            if (session.getAttribute("produtos") != null) {
                                produtos = (ArrayList<Produto>) session.getAttribute("produtos");
                            }

                for(Produto p:produtos){
                    valor += (p.getPreco() * p.getQuantidade());
                }
                    %>
                        <tr>
                            <td bgcolor="#888" colspan="6" align="right" ><div id="valor" >Valor Total <input type="text" value="<%=valor%>" ></div></td>
                        </tr>
                    <%
                for (Produto p : produtos) {%>

            <tr>
                <td><%=p.getId()%></td>
                <td width="60%"><%=p.getNome()%></td>
                <td>R$ <%=p.getPreco()%></td>
                <td><%=p.getCodBarras()%></td>
                <td>Qnt. <input type="text" value="<%=p.getQuantidade()%>"  onkeyup="refreshPage('valor','inserir_produto_sessao.do?div=valor_total&id=<%=p.getId()%>&qnt='+this.value);" size="2"></td>
                <td><a href="#" onclick="refreshPage('produtos2','excluir_produto_sessao.do?id=<%=p.getId()%>'); refreshPage('valor','valor_total.jsp');"><img src="imagens/delete.png"/></a></td>
            </tr>

            <%}
                        } catch (Exception e) {
                            out.print(e);
                        }
            %>
        </table>
        </body>

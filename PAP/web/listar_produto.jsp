<%-- 
    Document   : lista_produto
    Created on : 17/06/2012, 16:49:23
    Author     : Daniel
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Produto"%>
<%@page import="modelo.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de produtos</title>
        <link href="css/custom-theme/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css">
        <link href="css/main.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/ajax.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.21.custom.min.js"></script>
        <script type="text/javascript" src="js/teste.js"></script>
        <script type="text/javascript" language="JavaScript">
            function confirma(id){
                var url="excluir_produto.do?id="+id;
                var resposta=confirm("Tem certeza que deseja excluir?\nclique em ok para confirmar ou em cancelar para desistir");
                if(resposta){
                    window.open(url,"_parent");
                }
            }
        </script>
    </head>
    <body>
        <div align="center">
            <table width="760" height="660" border="1" align="center" >
                <tr>
                    <td colspan="2">
                        <%@include file="banner.jsp" %>
                    </td>
                </tr>
                <tr>
                    <td width="150" height="510" valign="top">
                        <%@include file="menu.jsp" %>

                    </td>
                    <td width="610" height="510" valign="top">
                        <table align="center" >
                            <tr>
                                <td align="left" ><h1>Lista de Produtos</h1></td>
                                <td align="right" ><a href="form_inserir_produto.jsp">Inserir Produto</a></td>
                            </tr>
                        </table>
                        <table border="1" align="center" >
                            <tr>
                                <td>ID</td>
                                <td>Nome</td>
                                <td>Código de Barras</td>
                                <td>Preço</td>
                                <td width="20px">Opções</td>
                            </tr>


                            <%
                            try{
                                ProdutoDAO pDB = new ProdutoDAO();
                                pDB.conectar();
                                ArrayList<Produto> lista = pDB.listar();
                            for(Produto p:lista){%>

                            <tr>
                                <td>
                                    <%=p.getId()%>
                                </td>
                                <td>
                                    <%=p.getNome()%>
                                </td>
                                <td>
                                    <%=p.getCodBarras()%>
                                </td>
                                <td>
                                    <%=p.getPreco()%>
                                </td>
                                <td>
                                    <a href="form_alterar_produto.jsp?id=<%=p.getId()%>"><img src="imagens/edit.png"></a>
                                    <a href="#" onclick="confirma(<%=p.getId()%>)" ><img src="imagens/delete.png"></a>
                                </td>
                            </tr>

                            <% }
                            pDB.desconectar();
         }catch (Exception e) {
               out.println(e);
}
                            %>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
<%

    if(logged){
    Usuario uP = new Usuario();
    /*if(!uP.temPermissao(request.getRequestURI(),request.getContextPath(), user)){
       response.sendRedirect("index.jsp?erro=1");
    }else{
    session.setAttribute("usuario",true);
    }*/
    }

%>
    </body>
</html>

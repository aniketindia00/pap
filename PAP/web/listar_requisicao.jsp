<%--
    Document   : listar_mecanico
    Created on : 17/06/2012, 22:45:17
    Author     : Daniel
--%>

<%@page import="modelo.Mecanico"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.MecanicoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Mecânicos</title>
        <link href="css/custom-theme/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css">
        <link href="css/main.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/ajax.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.21.custom.min.js"></script>
        <script type="text/javascript" src="js/teste.js"></script>
        <script type="text/javascript" language="JavaScript">
            function confirma(cpf){
                var url="excluir_mecanico.do?cpf="+cpf;
                var resposta=confirm("Tem certeza que deseja excluir?\nclique em ok para confirmar ou em cancelar para desistir");
                if(resposta){
                    window.open(url,"_parent");
                }
            }

            $(function() {
		$( ".accordion" ).accordion();
	});
        </script>
    </head>
    <body>
        <div class="container" align="center">
            <div class="header">
                <table class="fill box ui-corner-all" align="center" >
                <tr>
                    <td colspan="2">
                        <%@include file="banner.jsp" %>
                    </td>
                </tr>
                </table>
                    </div>
                    <div class="content">
                        <table class="fill tableMin" >
                <tr>
                    <td class="box ui-corner-all"  valign="top">
                        <%@include file="menu.jsp" %>
                    </td>
                    <td class="fill" valign="top">
                        <table class="tableDist" align="center" >
                            <tr>
                                <td align="left"><h1>Lista de Mecânicos</h1></td>
                                <td align="right"><a class="button" href="form_inserir_requisicao.jsp">Inserir Requisição</a></td>
                            </tr>
                        </table>

                        <table class="fill box ui-corner-all tablePad" align="center" >
                            <tr>
                                <td width="20%">CPF</td>
                                <td width="20%">Nome</td>
                                <td width="20%">Oficina</td>
                                <td width="20%">Telefone</td>
                                <td width="20%">Opções</td>
                            </tr>
                            </table>
                            <div class="accordion">
                            <%
                            try{
                                MecanicoDAO mDB = new MecanicoDAO();
                                mDB.conectar();
                                ArrayList<Mecanico> lista = mDB.listar();
                            for(Mecanico m:lista){%>

                                    

                            <h3><a href="#">
                            <table class="fill" align="center" >
                            <tr>
                                <td width="20%"><%out.print(m.getCpf());%></td>
                                <td width="20%"><%out.print(m.getNome());%></td>
                                <td width="20%"><%out.print(m.getOficina());%></td>
                                <td width="20%"><%out.print(m.getTelefone());%></td>
                                <td width="20%">
                                    <button class="button" href="form_alterar_mecanico.jsp?id=<%=m.getCpf()%>" onclick="window.open('form_alterar_mecanico.jsp?cpf=<%=m.getCpf()%>','_parent');"><img src="imagens/edit.png"></button>
                                <button class="button" onclick="confirma('<%=m.getCpf()%>')"><img src="imagens/delete.png"></button>
                                </td>
                            </tr>
                            </table></a></h3>
                                    <div>
ola
                                        </div>
                            

                            <% }

         }catch (Exception e) {
               out.println(e);
}
                            %>
                            </div>
                            </td>
                </tr>
            </table>
        </div>
<%

    if(logged){
    Usuario uP = new Usuario();
    if(!uP.temPermissao(request.getRequestURI(),request.getContextPath(), user)){
       response.sendRedirect("index.jsp?erro=1");
    }else{
    session.setAttribute("menu",true);
    }
    }

%>
<div class="footer fill">
                <%@include file="rodape.jsp" %>
            </div>
</div>
    </body>
</html>

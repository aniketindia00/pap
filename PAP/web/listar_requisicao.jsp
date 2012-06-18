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
        <title>Lista de menus</title>
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
                                <td align="left" ><h1>Lista de Mecânicos</h1></td>
                            </tr>
                        </table>

                        <table border="1" align="center" >
                            <tr>
                                <td>CPF</td>
                                <td>Nome</td>
                                <td>Oficina</td>
                                <td>Telefone</td>
                                <td>Opções</td>
                            </tr>


                            <%
                            try{
                                MecanicoDAO mDB = new MecanicoDAO();
                                mDB.conectar();
                                ArrayList<Mecanico> lista = mDB.listar();
                            for(Mecanico m:lista){%>

                            <tr>
                                <td>
                                    <%out.print(m.getCpf());%>
                                </td>
                                <td>
                                    <%out.print(m.getNome());%>
                                </td>
                                <td>
                                    <%out.print(m.getOficina());%>
                                </td>
                                <td>
                                    <%out.print(m.getTelefone());%>
                                </td>
                                <td>
                                    <a href="form_alterar_mecanico.jsp?cpf=<%out.print(m.getCpf());%>"><img src="imagens/edit.png"></a>
                                    <a href="#" onclick="confirma('<%out.print(m.getCpf());%>')" ><img src="imagens/delete.png"></a>
                                </td>
                            </tr>

                            <% }

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
    if(!uP.temPermissao(request.getRequestURI(),request.getContextPath(), user)){
       response.sendRedirect("index.jsp?erro=1");
    }else{
    session.setAttribute("menu",true);
    }
    }

%>
    </body>
</html>

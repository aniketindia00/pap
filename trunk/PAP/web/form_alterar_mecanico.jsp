<%-- 
    Document   : form_alterar_mecanico
    Created on : 17/06/2012, 23:05:57
    Author     : Daniel
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="modelo.Mecanico"%>
<%@page import="modelo.MecanicoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulário de Alteração - Mecânico</title>
        <link href="css/custom-theme/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css">
        <link href="css/main.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/ajax.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.21.custom.min.js"></script>
        <script type="text/javascript" src="js/teste.js"></script>
        <script type="text/javascript">
            function validaForm(){

            var form_alterar_mecanico=document.form_alterar_mecanico;
                var campo_cpf=form_alterar_mecanico.cpf;
                var campo_nome=form_alterar_mecanico.nome;
                var campo_oficina=form_alterar_mecanico.oficina;
                var campo_telefone=form_alterar_mecanico.telefone;

                if(campo_cpf.value==""){
                    alert("Todos os campos devem ser preenchidos!");
                    campo_cpf.focus();
                    return false;
                }
                if(campo_nome.value==""){
                    alert("Todos os campos devem ser preenchidos!");
                    campo_nome.focus();
                    return false;
                }
                if(campo_oficina.value==""){
                    alert("Todos os campos devem ser preenchidos!");
                    campo_oficina.focus();
                    return false;
                }
                if(campo_telefone.value==""){
                    alert("Todos os campos devem ser preenchidos!");
                    campo_telefone.focus();
                    return false;
                }
                return true;
        }
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
                    <table class="fill tableMin">
                <tr>
                    <td class="box ui-corner-all" valign="top">
                        <%@include file="menu.jsp" %>
                    </td>
                    <td class="fill box ui-corner-all" valign="top">
                        <table  align="center" >
                            <tr>
                                <td align="left" ><h1>Alterar Mecânico</h1></td>
                            </tr>
                        </table>
                        <table align="center">
                            <form name="form_alterar_mecanico" action="alterar_mecanico.do" method="POST" onsubmit="return validaForm()">
                                <%
                    try{
                    String cpf = request.getParameter("cpf");

                    MecanicoDAO pDB = new MecanicoDAO();

                    pDB.conectar();

                    Mecanico m = pDB.carregaPorCpf(cpf);

                    pDB.desconectar();

                    %>
                                <tr>
                                    <td>CPF: </td>
                                    <td><input type="text" name="cpf" readonly value="<%out.print(m.getCpf());%>"/> </td>
                                </tr>
                                <tr>
                                    <td>Nome: </td>
                                    <td><input type="text" name="nome" value="<%out.print(m.getNome());%>"/> </td>
                                </tr>
                                <tr>
                                    <td>Oficina: </td>
                                    <td><input type="text" name="oficina" value="<%out.print(m.getOficina());%>"/> </td>
                                </tr>
                                <tr>
                                    <td>Telefone: </td>
                                    <td><input type="text" name="telefone" value="<%out.print(m.getTelefone());%>"/> </td>
                                </tr>
                                <tr>
                                    <td><input class="button" type="reset" value="Limpar"/> </td>
                                    <td><input class="button" type="submit" value="Alterar" /></td>
                                </tr>
                            </form>
                        </table>
                                <%

                                }catch(SQLException e){

                                        out.println(e);

                                        }

%>
                    </td>
                </tr>
            </table>
        </div>
                    <div class="footer fill">
                <%@include file="rodape.jsp" %>
            </div>
</div>
<%

    if(logged){
    if(session.getAttribute("requisicao") == null){
       response.sendRedirect("index.jsp?erro=1");
    }
    }

%>
    </body>
</html>

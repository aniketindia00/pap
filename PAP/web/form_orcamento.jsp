<%-- 
    Document   : form_orcamento
    Created on : 09/06/2012, 10:44:58
    Author     : Daniel
--%>

<%@page import="modelo.Orcamento"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Produto"%>
<%@page import="modelo.ProdutoDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Or&ccedil;amento</title>

        <script type="text/javascript" language="javascript" >
            function
        </script>

    </head>
    <body>
        <div align="center">
            <table width="760" heigth="660" border="1">
                <tr>
                    <td colspan="2">
                        <%@include file="banner.jsp" %>
                    </td>
                </tr>
                <tr>
                    <td width="150" heigth="510" valign="top">
                        <%@include file="menu.jsp" %>
                    </td>
                    <td width="610" heigth="510">
                        <form action="imprimir_orcamento.jsp" method="POST">
                        <table width="656" border="1" cellspacing="0" cellpadding="0" align="center"><!-- tabela geral-->
                            <table width="656" border="1" cellspacing="0" cellpadding="0" align="center"> <!-- tabela cabeçalho -->
                                <%
                                            TimeZone.setDefault(TimeZone.getTimeZone("Brazil/East"));
                                            String horaF = "HH:mm:ss";
                                            String dataF = "dd/MM/yyyy";
                                            String data = new SimpleDateFormat(dataF).format(new Date());
                                            String hora = new SimpleDateFormat(horaF).format(new Date());
                                            Orcamento o = new Orcamento();
                                            o.setData(data);
                                            o.setHora(hora);

                                %>
                                <tr>
                                    <td width="85%"colspan="3" align="center"> <h2>Orçamento</h2></td></tr>
                                <tr>
                                <tr>
                                    <td></td>
                                    <td align="right">Data: <input style="width: 70px;" type="text" readonly="true" name="data" value="<%= o.getData() %>" /></td>
                                    <td align="right" width="17%">Hora: <input style="width: 55px;" type="text" readonly="true" name="hora" value="<%= o.getHora()%>" /></td>
                                </tr>
                                    <input type="hidden" name="id_orcamento" value="" />
                                    <td width="40%">Empresa: <input style="width: 65%;" type="text" name="nome_empresa" value="Pointer Auto Peças" /></td>
                                    <td width="60%" colspan="2">Endereço: <input style="width: 78%;" type="text" name="endereco_empresa" value="Quadra 02 Lote 02 Loja 'B' Setor Sul - Gama - DF" /> </td>
                                </tr>
                                
                            </table><!-- tabela cabecalho -->
                            <br />
                            <table width="656" border="1" cellspacing="0" cellpadding="0" align="center"><!-- tabela cliente-->
                                <tr>
                                    <input type="hidden" name="id_cliente" value="" />
                                    <td colspan="2" width="70%">Nome: <input style="width: 88%;" type="text" name="nome_cliente" value="Zacarias"></td>
                                    <td width="20%" align="right">Telefone: <input style="width: 50%;" type="text" name="telefone_cliente" value="3201-7777"></td>
                                </tr>
                                <tr>
                                    <td>Marca: <input type="text" name="marca_carro" value="Chevrolet"></td>
                                    <td>Modelo: <input type="text" name="modelo_carro" value="Camaro SS"></td>
                                    <td width="20%" align="right" >Ano: <input style="width: 50%;" type="text" name="ano_carro" value="1967/1967"></td>
                                </tr>
                            </table><!-- tabela cliente-->
                            <br />
                            <table width="656" border="1" cellspacing="0" cellpadding="0" align="center"><!-- tabela pecas-->
                                <tr>
                                    <td width="440">Produto</td>
                                    <td width="90">Pre&ccedil;o Unit.</td>
                                    <td width="40">Qnt.</td>
                                    <td width="35">Total</td>
                                </tr>

                                <tr>
                                    <td width="65%"><input style="width: 98%;" type="text" name="preco_unitario" value="bla bla bla bla"></td>
                                    <td width="12%"><input style="width: 95%;" type="text" name="preco_unitario" value="R$ 99,00 "></td>
                                    <td width="8%"><input style="width: 90%;" type="text" name="quantidade"></td>
                                    <td width="15%"><input style="width: 90%;" type="text" name="preco_total" value="RS 999,00"></td>
                                </tr>

                                
                                
                                <tr>
                                    <td width="85%" colspan="3"><b>SUBTOTAL</b></td>
                                    <td width="15%"><input style="width: 90%;" type="text" name="subtotal" value="RS 999,00"></td>
                                </tr>
                                <tr>
                                    <td colspan="4"><input type="submit" value="Imprimir"></td>
                                </tr>
                            </table><!-- tabela pecas-->
                        </table><!-- tabela geral-->
                        </form>
                    </td>
                </tr>
            </table>
        </div>



    </body>
</html>

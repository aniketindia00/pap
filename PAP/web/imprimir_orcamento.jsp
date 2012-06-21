<%-- 
    Document   : imprimir_orcamento
    Created on : 12/06/2012, 16:35:14
    Author     : Daniel
--%>

<%@page import="modelo.CarroDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Carro"%>
<%@page import="modelo.OrcamentoDAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.TimeZone"%>
<%@page import="modelo.Orcamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link href="css/main.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orçamento - Pointer Auto Peças</title>
    </head>

    <STYLE TYPE="text/css">
        P.quebra-aqui {page-break-before: always}
    </STYLE>

    <body nLoad="javascript:window.print()">
        <%
                    Orcamento o = new Orcamento();
                    try {
                        int id = Integer.parseInt(request.getParameter("id"));

                        OrcamentoDAO oDB = new OrcamentoDAO();

                        
                        CarroDAO carDB = new CarroDAO();
                        ArrayList<Carro> car = new ArrayList<Carro>();
                        car = carDB.carrosCliente(id);
                        oDB.conectar();
                        o = oDB.carregaPorId(id);
                        session.setAttribute("produtos", o.getProdutos());

        %>
        <table class="impressao" width="657" border="2" cellspacing="0" cellpadding="0" align="center"><!-- tabela geral-->
            <tr><td>
                    <table width="654" border="1" cellspacing="0" cellpadding="0" align="center"> <!-- tabela cabeçalho -->

                        <tr>
                            <td rowspan="3" width="15%"><img src="imagens/pointer.png" heigth="97px" width="130px"></td>
                            <td width="85%"colspan="3" align="center"> <h2>Orçamento</h2></td></tr>
                        <tr>
                        <tr>
                            <td align="right" width="90px">Data: <%=o.getDataEmissao() %>&nbsp;</td>
                            <td align="right">Hora: <%=o.getHoraEmissao() %>&nbsp;</td>
                        </tr>
                    </table>
                    <br />
                    <table width="654" border="1" cellspacing="0" cellpadding="0" align="center">
                        <tr>
                        <input type="hidden" name="id_orcamento" value="" />
                        <td width="35%">Empresa: Pointer Auto Peças &nbsp;</td>
                        <td width="65%" colspan="2">Endereço: Quadra 02 Lote 02 Loja 'B' Setor Sul - Gama - DF &nbsp;</td>
            </tr>

            <tr>
            <input type="hidden" name="id_cliente" value="" />
            <td colspan="2" width="70%">Nome: <%=o.getCliente().getNome() %> </td>
            <td width="25%" align="right">Telefone: <%=o.getCliente().getTelefone() %> &nbsp;</td>
        </tr>
        <tr>
            <td>Marca: </td>
            <td>Modelo:  </td>
            <td width="20%" align="right" >Ano: &nbsp;</td>
        </tr>
    </table><!-- tabela cliente-->
    <br />
    <div class="pecas">
        <table width="654"  border="1" cellspacing="0" cellpadding="0" align="center"><!-- tabela pecas-->
            <tr>
                <td width="440">Produto</td>
                <td width="90" align="center">Pre&ccedil;o Unit.</td>
                <td width="40" align="center">Qnt.</td>
                <td width="35" align="center">Total</td>
            </tr>

            <tr>
                <td colspan="4">
                    <%@include file="produtos_orcamento_impressao.jsp" %>
                </td>
            </tr>
        </table><!-- tabela pecas-->
        <table class="subtotal" width="654"  border="1" cellspacing="0" cellpadding="0">
            <tr>
                <td width="85%" colspan="3"><b>SUBTOTAL</b></td>
                <td width="15%" align="center"> R$ <%=o.getValor() %> </td>
            </tr>
        </table>
    </div>

</td></tr>
</table>
<!-- <p class="quebra-aqui"></p> -->
<%
                            oDB.desconectar();

                        } catch (Exception e) {

                            out.println(e);

                        }
            %>

</body>
</html>

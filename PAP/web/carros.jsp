<%-- 
    Document   : carros
    Created on : 16/06/2012, 11:59:27
    Author     : PC
--%>

<%@page import="modelo.Carro"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.CarroDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                CarroDAO cDB = new CarroDAO();
                cDB.conectar();
                ArrayList<Carro> carros = cDB.carrosCliente(id);
                cDB.desconectar();
%>
<table align="center">
    <tr>
        <td colspan="2" align="center"><font class="subTitle" >Dados do Carro</font></td>
    </tr>
    <tr>
        <td><label for="id_carro">Carro Existente: </label></td>
        <td><select name="id_carro" size="1">
                <option value="0">
                    Selecione um carro
                </option>

                <%for (Carro c : carros) {%>

                <option value="<%=c.getId()%>">
                    <%=c.getMarca() + " " + c.getModelo() + ", " + c.getAno()%>
                </option>
                <%}%>
            </select></td>
    </tr>
    <tr>
        <td colspan="2" align="center"><font class="subTitle">Novo Carro</font></td>
    </tr>
    <tr>
        <td><label for="modelo">Modelo: </label></td>
        <td><input id="modelo" name="modelo" size="30%"></td>
    </tr>
    <tr>
        <td><label for="marca">Marca: </label></td>
        <td><input id="marca" name="marca" size="30%"></td>
    </tr>
    <tr>
        <td><label for="ano">Ano: </label></td>
        <td><input id="ano" name="ano" size="30%"></td>
    </tr>
</table>

<%
            } catch (Exception e) {
            }

%>

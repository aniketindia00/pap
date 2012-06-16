<%-- 
    Document   : carros
    Created on : 16/06/2012, 11:59:27
    Author     : PC
--%>

<%@page import="modelo.Carro"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.CarroDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
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
        <td colspan="2"><h3 align="center" >Dados do Carro</h3></td>
    </tr>
    <tr>
        <td><label for="id_carro">Carros: </label></td>
        <td><select name="id_carro" size="1">
                <option value="0">
                    Selecione um carro
                </option>

                <%for (Carro c : carros) {%>

                <option value="<%=c.getId()%>">
                    <%=c.getMarca()+" "+c.getModelo()+", "+c.getAno()%>
                </option>
                <%}%>
            </select></td>
    </tr>
</table>

<%
            } catch (Exception e) {
            }

%>

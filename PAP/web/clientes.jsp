<%
try{
response.setHeader("Content-Type", "application/json");
String q = request.getParameter("term");
ClienteDAO cDB= new ClienteDAO();
cDB.conectar();
ArrayList<Cliente> lista = cDB.autocompletar(q);
cDB.desconectar();
JSONArray jlist = new JSONArray();
for(Cliente c:lista){
jlist.add(c);
}
jlist.write(out);
} catch(Exception e){
}
%>
<%@page import="net.sf.json.util.JSONUtils"%>
<%@page import="net.sf.json.util.JSONStringer"%>
<%@page import="net.sf.json.util.JSONBuilder"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
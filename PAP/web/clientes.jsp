<%@page import="net.sf.json.JSONObject"%>
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
JSONObject jo = new JSONObject();
jo.put("value", c.getNome());
jo.put("label", c.getNome());
jo.put("telefone", c.getTelefone());
jo.put("nome", c.getNome());
jo.put("id", c.getId());
jlist.add(jo);
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
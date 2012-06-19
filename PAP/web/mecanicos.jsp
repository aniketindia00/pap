<%@page import="net.sf.json.util.JSONUtils"%>
<%@page import="net.sf.json.util.JSONStringer"%>
<%@page import="net.sf.json.util.JSONBuilder"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Mecanico"%>
<%@page import="modelo.MecanicoDAO"%>
<%@page import="net.sf.json.JSONObject"%>
<%
try{
response.setHeader("Content-Type", "application/json");
String q = request.getParameter("term");
MecanicoDAO mDB= new MecanicoDAO();
mDB.conectar();
ArrayList<Mecanico> lista = mDB.autocompletar(q);
mDB.desconectar();

JSONArray jlist = new JSONArray();
for(Mecanico m:lista){
JSONObject jo = new JSONObject();
jo.put("value", m.getNome());
jo.put("label", m.getNome());
jo.put("telefone", m.getTelefone());
jo.put("nome", m.getNome());
jo.put("cpf", m.getCpf());
jo.put("oficina", m.getOficina());
jlist.add(jo);
}
jlist.write(out);
} catch(Exception e){
}
%>

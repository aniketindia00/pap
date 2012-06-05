<%-- 
    Document   : form_alterar_menu
    Created on : 02/04/2012, 16:57:32
    Author     : André
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulário de Alteração - Menus</title>
        <script type="text/javascript" src="css_js/ajax.js"></script>
    </head>
    <body>
        <div align="center">
            <table width="760" height="660" border="1">
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
                        <h1>Alterar Menu</h1>
                        <form action="alterar_menu.do" method="POST" >
                            <table width="500">
                                <%
                                    String id = "";
                                    String menu = "";
                                    String link = "";
                                    String icone = "";

                                    if (request.getParameter("id") != null) {
                                        id = request.getParameter("id");
                                    }

                                    String DRIVER, USER, SENHA, URL;

                                        DRIVER = "com.mysql.jdbc.Driver";
                                        URL = "jdbc:mysql://localhost:3306/java3_vesp";
                                        USER = "root";
                                        SENHA = "root";

                                        try {
                                            Class.forName(DRIVER);
                                            Connection conn;

                                            conn = DriverManager.getConnection(URL, USER, SENHA);

                                            Statement stm = conn.createStatement();

                                            String sql = "SELECT * FROM menu WHERE id="+id;

                                            ResultSet rs = stm.executeQuery(sql);
                                            if(rs.next()){
                                            menu = rs.getString("menu");
                                            link = rs.getString("link");
                                            icone = rs.getString("icone");
                                            }
                                        } catch(SQLException e){

                                        out.println(e);

                                        }

                        %>
                                <tr>
                                    <td>Id:</td>
                                    <td><input readonly type="text" size="10" name="id" value="<%=id%>" /> </td>
                                </tr>
                                <tr>
                                    <td>Menu:</td>
                                    <td><input type="text" size="45" name="menu" value="<%=menu%>" /> </td>
                                </tr>
                                <tr>
                                    <td>Icone URL:</td>
                                    <td><input type="text" size="45" name="icone" value="<%=icone%>" onblur="refreshPage('thumb','thumb.jsp?link='+this.value)" /> </td>
                                    <td><div align="center" id="thumb"><img width="32" height="32" src="<%=icone%>"/></div></td>
                                </tr>
                                <tr>
                                    <td>Link:</td>
                                    <td><input type="text" size="45" name="link" value="<%=link%>" /> </td>
                                </tr>

                                <tr>
                                    <td></td>
                                    <td><input type="submit" value="Alterar"/> </td>
                                </tr>
                            </table>

                        </form>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>

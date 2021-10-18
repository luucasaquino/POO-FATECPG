<%-- 
    Document   : index
    Created on : 4 de out. de 2021, 08:49:57
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Prova</title>
    </head>
    <body>
        <%@include file = "WEB-INF/jspf/header.jspf" %>
        <h2>Contagem de pessoas logadas: <%= application.getAttribute("count")%></h2>
        <%if (session.getAttribute("name") != null) {
                //Lista de usuários logados 
                ArrayList<String> listName = null;
                if (application.getAttribute("listName") != null) {
                    listName = (ArrayList) application.getAttribute("listName");
                }
        %>
        <h2>Pessoas logadas no momento </h2>
        <table>
            <tr>
                <th>Nome</th>
            </tr>
            <%for (String name : listName) {%>
            <tr>
                <td><%= name%></td>
            </tr>
            <%}%>
        </table>
        <%}%>
    </body>
</html>

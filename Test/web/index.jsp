<%-- 
    Document   : index
    Created on : 4 de out. de 2021, 08:49:57
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Armazenamento de nomes da sessão de pessoas logadas
    String sessionName = "";
    if (application.getAttribute("sessionName") == null) {
        sessionName = "<tr><td>" + (String) session.getAttribute("name") + "</tr></td>";
        application.setAttribute("sessionName", "");
    } else if (request.getParameter("login") != null) {
        sessionName += "<tr><td>" + (String) request.getParameter("name") + "</tr></td>";
        sessionName += (String) application.getAttribute("sessionName");
        application.setAttribute("sessionName", sessionName);
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Prova</title>
    </head>
    <body>
        <%@include file = "WEB-INF/jspf/header.jspf" %>
        <h2>Contagem de pessoas logadas: <%= application.getAttribute("count")%></h2>
        <h2>Pessoas logadas no momento</h2>
        <table>
            <tr>
                <th>Nome</th>
            </tr>
            <%= application.getAttribute("sessionName")%>
        </table>
    </body>
</html>

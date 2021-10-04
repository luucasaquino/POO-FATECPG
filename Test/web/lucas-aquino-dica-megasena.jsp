<%-- 
    Document   : lucas-aquino-dica-megasena
    Created on : 4 de out. de 2021, 08:50:45
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //Verificação de login
    String error = null;
    if (session.getAttribute("name") == null) {
        error = "Você não tem permissão para acessar esse counteúdo. Faça login e tente novamente.";
    }
    // Processo de números aleatórios
    int random = 0;
    int randomVet[] = new int[6];
    String megasena = "";
    if (session.getAttribute("megasena") == null) {
        for (int i = 0; i < randomVet.length; i++) {
            random = 1 + (int) (Math.random() * 60);
            for (int j = 0; j < randomVet.length; j++) {
                if (random == randomVet[j] && j != i) {
                    random = 1 + (int) (Math.random() * 60);
                } else {
                    randomVet[i] = random;
                }
            }
        }
        for (int i = 0; i < randomVet.length; i++) {
            megasena += " "+randomVet[i];
        }
        session.setAttribute("megasena", megasena);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file = "WEB-INF/jspf/header.jspf" %>
        <%if (error == null) {%>
        <h1>Dicas megasena</h1>
        <table>
            <tr>
                <td><%= session.getAttribute("megasena")%></td>
            </tr>
        </table>
        <%} else {%>
        <h2 style="color: red"><%= error%></h2>
        <%}%>
    </body>
</html>

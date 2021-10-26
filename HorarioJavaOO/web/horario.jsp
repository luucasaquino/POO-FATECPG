<%-- 
    Document   : horario
    Created on : 25 de out. de 2021, 15:33:42
    Author     : root
--%>

<%@page import="java.util.Calendar"%>
<%@page import="model.Horario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    // Hora atual
    Calendar data = Calendar.getInstance();
    int hora = data.get(Calendar.HOUR_OF_DAY);
    int min = data.get(Calendar.MINUTE);
    int seg = data.get(Calendar.SECOND);
    
    Horario agora = new Horario(hora, min, seg);
    
    // Hora do intervalo
    
    Horario intervalo = new Horario(16, 40, 0);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Horário</title>
    </head>
    <body>
        <%@include file = "WEB-INF/jspf/header.jspf" %>
        <h1>Horário Atual</h1>
        <h3><%= agora.getHorario()%></h3>
        <h1>Horário do intervalo</h1>
        <h3><%= intervalo.getHorario() %></h3>
    </body>
</html>

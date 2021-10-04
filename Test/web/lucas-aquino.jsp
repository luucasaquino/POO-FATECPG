<%-- 
    Document   : lucas-aquino-dica-megasena
    Created on : 4 de out. de 2021, 08:50:45
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String error = null;
    if (session.getAttribute("name") == null) {
        error = "Você não tem permissão para acessar esse counteúdo. Faça login e tente novamente.";
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
        <h1>Dados pessoais</h1>
        <h2>RA: 1290482012020</h2>
        <h2>Nome: Lucas de Aquino Assunção</h2>
        <h2>Ingresso: 1° semestre de 2020</h2>
        <h2><a href="https://github.com/luucasaquino/POO-FATECPG">GitHub</a></h2>
        <hr>
        <h2>Disciplinas</h2>
        <table>
            <tr>
                <td>IBD002-Banco de Dados</td>
            </tr>
            <tr>
                <td>IES300-Engenharia de Software III</td>
            </tr>
            <tr>
                <td>ILP007-Programação Orientada a Objetos</td>
            </tr>
            <tr>
                <td>ILP512-Linguagem de Programação IV - INTERNET</td>
            </tr>
            <tr>
                <td>ISO200-Sistemas Operacionais II</td>
            </tr>
            <tr>
                <td>LIN400-Inglês IV</td>
            </tr>
            <tr>
                <td>TTG001-Metodologia da Pesquisa Científico-Tecnológica</td>
            </tr>
        </table>
        <%} else {%>
        <h2 style="color: red"><%= error%></h2>
        <%}%>
    </body>
</html>

<%-- 
    Document   : index
    Created on : 13 de set. de 2021, 15:53:50
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Diretrizes</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h2>Página Inicial</h2>
        <h2>Nome: Lucas de Aquino Assunção</h2>
        <h2>RA: 1290482012020</h2>
        <hr>
        <h2>Tabela Price</h2>
        <form action="table-price.jsp">
            <p>Valor Presente <input type="number" name="pv"></p>
            <p>Juros <input type="number" name="j" step="0.1"></p>
            <p>Período <input type="number" name="t"></p>
            <p><input type="submit" value="Enviar"></p>
        </form>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>

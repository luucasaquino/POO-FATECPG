<%-- 
    Document   : sum
    Created on : 30 de ago. de 2021, 15:35:23
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int n = 10;  
    String errorMessage = null;
    try{
         n = Integer.parseInt(request.getParameter("n"));
    }catch(Exception e){
        errorMessage =  "Erro ao ler parâmetro n: '"+request.getParameter("n")+"' não é um número inteiro válido";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JavaEE JSP</title>
    </head>
    <body>
        <h1>JavaEE</h1>
        <h2>Java Server Pages</h2>
        <h3><a href="index.html">Voltar</a></h3>
        <h3>Números aleatórios</h3>
        <% if(errorMessage==null){%>
        <table border="1">
            <tr>
                <th>Índice</th>
                <th>Número</th>
            </tr>
            <% for(int i = 1; i<=n; i++){%>
            <tr>
                <td><%= i %></td>
                <td><%= ((int)(100*Math.random())) %></td>
            </tr>
            <%}%>
        </table>
        <%}else{%>
            <div style="color: red"><%= errorMessage %></div>
        <%}%>
        <hr>
          <form action="random-list.jsp">
            <input type="number" name="n" value="<%= n %>">
            <input type="submit" value="Gerar">
        </form>
    </body>
</html>


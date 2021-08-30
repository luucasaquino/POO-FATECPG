<%-- 
    Document   : sum
    Created on : 30 de ago. de 2021, 15:35:23
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    double n1 = 0, n2 = 0, result = 0;  
    String errorMessage = null;
    try{
         n1 = Double.parseDouble(request.getParameter("n1"));
    }catch(Exception e){
        errorMessage =  "Erro ao ler parâmetro n1: "+request.getParameter("n1");
    }
    try{
         n2 = Double.parseDouble(request.getParameter("n2"));
    }catch(Exception e){
        errorMessage =  "Erro ao ler parâmetro n2: "+request.getParameter("n2");
    }
    try{
         result = n1+n2;
    }catch(Exception e){
        errorMessage =  "Erro ao somar os valores: "+e.getMessage();
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
        <h3>Soma</h3>
        <% if(errorMessage==null){%>
            <h4><%= n1 %> + <%= n2 %> = <%= result %></h4>
        <%}else{%>
            <div style="color: red"><%= errorMessage %></div>
        <%}%>
        <form action="sum.jsp">
            <input type="number" name="n1"> +
            <input type="number" name="n2">
            <input type="submit" value="=">
        </form>
    </body>
</html>


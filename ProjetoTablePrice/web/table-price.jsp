<%-- 
    Document   : table-price
    Created on : 13 de set. de 2021, 15:56:40
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int t = 0;
    double  pv = 0, j = 0, p = 0;
    String errorMessage = null;
    try{
         t = Integer.parseInt(request.getParameter("t"));
    }catch(Exception e){
        errorMessage =  "Erro ao ler parâmetro período: "+request.getParameter("t");
    }
    try{
         pv = Double.parseDouble(request.getParameter("pv"));
    }catch(Exception e){
        errorMessage =  "Erro ao ler parâmetro Valor Presente: "+request.getParameter("pv");
    }
    try{
         j = Double.parseDouble(request.getParameter("j"));
         j/= 100;
    }catch(Exception e){
        errorMessage =  "Erro ao ler parâmetro juros: "+request.getParameter("j");
    }
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Table Price</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h2>Table-Price</h2>
            <% if(errorMessage==null){%>
                <table border="1">
                    <tr>
                        <th>Período</th>
                        <th>Parcela</th>              
                        <th>Juros</th>
                        <th>Amortização</th>
                        <th>Saldo devedor</th>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><%= pv %></td>
                    </tr>
                    <%
                        double sd = 0;
                        double juros = 0;
                        double a = 0;
                        p = Math.round(pv * ((Math.pow(1 + j, t) * j) / ((Math.pow(1 + j, t) - 1))) * 100.00) / 100.00;
                        for (int i = 1; i <= t; i++) {
                            juros = Math.round(pv * j * 100.00) / 100.00;
                            a = Math.round((p - juros) * 100.00) / 100.00;
                            pv -= a;
                    %>
                    <tr>
                        <td><%= i%></td>
                        <td><%= Math.round(p * 100.00) / 100.00%></td>
                        <td><%= juros%></td>
                        <td><%= a%></td>
                        <td><%= Math.round(pv * 100.00) / 100.00%></td>
                    </tr>
                    <% } %>
                    </table>
                    <% }else{%>
                <div style="color: red"><%= errorMessage%></div>
                <%}%>
                <hr>
                <form action="table-price.jsp">
                    <p>Valor Presente <input type="number" name="pv"></p>
                    <p>Juros <input type="number" name="j" step="0.1"></p>
                    <p>Período <input type="number" name="t"></p>
                    <p><input type="submit" value="Enviar"></p>
                </form>
       
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>

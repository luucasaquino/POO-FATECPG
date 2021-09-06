<%-- 
    Document   : calendario
    Created on : 30 de ago. de 2021, 15:35:23
    Author     : root
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int mes = 0, ano = 0;  
    int dia = 1;
    String errorMessage = null;
    try{
         mes = Integer.parseInt(request.getParameter("mes"));
         mes-=1;
    }catch(Exception e){
        errorMessage =  "Erro ao ler parâmetro mês: "+request.getParameter("mes");
    }
    try{
         ano = Integer.parseInt(request.getParameter("ano"));
    }catch(Exception e){
        errorMessage =  "Erro ao ler parâmetro ano: "+request.getParameter("ano");
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
        <% if(errorMessage==null){%>
        <center>
            <h1>Calendário</h1>
            <h3>Mês: <%= (mes+1) %></h3>
            <h3>Ano: <%= ano %></h3>
        <table style="text-align: center;">
            <tr>
                <th>D</th>
                <th>S</th>
                <th>T</th>
                <th>Q</th>
                <th>Q</th>
                <th>S</th>
                <th>S</th>
            </tr>
            <% 
                try{
                    Calendar c = Calendar.getInstance();
                    c.set(Calendar.MONTH, mes);
                    c.set(Calendar.YEAR, ano);
                    c.set(Calendar.DAY_OF_MONTH, 1);
                    int quebra = 0;
                    int diaInicial = c.get(Calendar.DAY_OF_WEEK);
                    boolean check = true;
                    //String t = new SimpleDateFormat("EEEE").format(c.get(Calendar.DAY_OF_WEEK));
                    //out.println(t);
                    //out.println(c.getActualMaximum(Calendar.DAY_OF_MONTH)+"<hr>");
                    //out.println(c.get(Calendar.DAY_OF_WEEK)+"<hr>");

                    while(dia <= c.getActualMaximum(Calendar.DAY_OF_MONTH)){
                         c.set(Calendar.DAY_OF_MONTH, dia);
                         if(quebra == 7 ){
                            out.println("<tr><td>"+(c.get(Calendar.DAY_OF_MONTH))+"</td><br>");
                            quebra = 1;
                            dia++;
                         }
                         else{
                             if(diaInicial--<= 1){
                                 if(quebra == c.get(Calendar.DAY_OF_WEEK) && check){
                                     out.println("<tr>");
                                     quebra = 0;
                                     check = false;
                                 }
                                out.println("<td>"+c.get(Calendar.DAY_OF_MONTH)+"</td>");
                                  dia++;
                                  quebra++;
                             }
                             else{
                                 quebra++;
                               out.println("<td></td>");
                             }
                         }
                     }
                  }catch(Exception e){
                     errorMessage =  "Erro ao exibir o calendario: "+e.getMessage();
                  }
                %>
            </tr>
        </table>
       </center>
        <%}else{%>
            <div style="color: red"><%= errorMessage %></div>
        <%}%>
       <form action="calendario.jsp">
            <h3>Mês <input type="number" name="mes"></h3>
            <h3>Ano <input type="number" name="ano"></h3>
            <input type="submit" value="Enviar">
        </form>
    </body>
</html>


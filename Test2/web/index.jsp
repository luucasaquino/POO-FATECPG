<%-- 
    Document   : index
    Created on : 22 de nov. de 2021, 17:28:32
    Author     : root
--%>

<%@page import="db.LucasTasks"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList<String> taskList = new ArrayList<>();
    if(request.getParameter("sendTask") != null){
        String title = request.getParameter("task");
        String user = (String) session.getAttribute("user");
        LucasTasks.addTask(title, user);
        response.sendRedirect(request.getRequestURI());
    }
    if(request.getParameter("removeTask") != null){
        String title = request.getParameter("task2");
        LucasTasks.removeTask(title);
        response.sendRedirect(request.getRequestURI());
    }
        
    taskList = LucasTasks.getTasks();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <%if(session.getAttribute("user") == null){%>
        <div style="color: red">Não é possível acessar este conteúdo sem estar logado.</div>
        <%}else{%>
        <h1>Tasks</h1>
        <form>
            TAREFA <input type="text" name="task">
            <input type="submit" name="sendTask" value="CRIAR">
        </form>
        <hr>
        <table border="1">
            <%for(String taskName : taskList){%>
            <tr>
                <td><%=taskName %></td>
                <td>
                    <form>
                        <input type="hidden" name="task2" value="<%=taskName%>">
                        <input type="submit" name="removeTask" value="-">
                    </form>
                </td>
            </tr>
            <%}%>
        </table>
        <%}%>
    
</html>

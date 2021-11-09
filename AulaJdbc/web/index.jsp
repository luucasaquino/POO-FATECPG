<%-- 
    Document   : index
    Created on : 8 de nov. de 2021, 15:37:54
    Author     : root
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.Tasks"%>
<%@page import="web.DbListener"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Exception requestException = null;
    ArrayList<String> taskList = new ArrayList<>();
    String dataDiaMes = "";
    String dataHorario = "";
    try {
        if (request.getParameter("add") != null) {
            String taskName = request.getParameter("taskName");
            Tasks.addTask(taskName);

            response.sendRedirect(request.getRequestURI());
        }
        if (request.getParameter("remove") != null) {
            String taskName = request.getParameter("taskName");
            Tasks.removeTask(taskName);

            response.sendRedirect(request.getRequestURI());
        }

        taskList = Tasks.getTasks();

        //Data
        Calendar data = Calendar.getInstance();
        int hora = data.get(Calendar.HOUR_OF_DAY);
        int min = data.get(Calendar.MINUTE);
        int seg = data.get(Calendar.SECOND);
        int dia = data.get(Calendar.DAY_OF_MONTH);
        int mes = data.get(Calendar.MONTH);
        dataDiaMes = dia+"/"+mes;
        dataHorario = hora+":"+min+":"+seg;
        
    } catch (Exception ex) {
        requestException = ex;
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JDBC To-do List</title>
    </head>
    <body>
        <h1>JDBC</h1>
        <h2>Lucas de Aquino</h2>
        <h3>Data: <%= dataDiaMes %> - Hora: <%= dataHorario %></h3>
        <hr>
        <h2>To-do List</h2>
        <%if (DbListener.exception != null) {%>
        <div>
            Erro na criação do banco de dados:
            <%= DbListener.exception.getMessage()%>
        </div>
        <%}%>
        <%if (requestException != null) {%>
        <div>
            Erro na leitura ou gravação de tarefas:
            <%= requestException.getMessage()%>
        </div>
        <%}%>
        <h3>Tarefas</h3>
        <form>
            <input type="text" name="taskName">
            <input type="submit" name="add" value="adicionar">
        </form>
        <table>
            <%for (String taskName : taskList) {%>
            <tr>
                <td><%= taskName%></td>
                <td>
                    <form>
                        <input type="hidden" name="taskName" value="<%= taskName%>">
                        <input type="submit" name="remove" value="-">
                    </form>
                </td>
            </tr>
            <%}%>
        </table>
    </body>
</html>

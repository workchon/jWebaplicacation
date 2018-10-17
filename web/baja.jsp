<%-- 
    Document   : baja
    Created on : 5/10/2018, 02:14:00 PM
    Author     : Jesus
--%>

<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sesion=request.getSession(false);
            String strUsuario=(String)sesion.getAttribute("varSUsuario");
            sesion.setAttribute("Origen","Eliminar");
        %>
        <div style="float:right">
        <%=strUsuario%>
        </div>
        <form action="Guardar.jsp">
        <h1>Ingrese el ID, del que desea Eliminar</h1> <br>
            ID:<input type="text" name="varID" /> <br>
            <input type="submit" Value="Guardar" name="EnviarGuardar" />
        </form>
    </body>
</html>

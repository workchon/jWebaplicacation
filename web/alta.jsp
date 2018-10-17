<%-- 
    Document   : alta
    Created on : 4/10/2018, 06:38:27 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta</title>
    </head>
    <body>
        <%
            HttpSession sesion=request.getSession(false);
            String strUsuario=(String)sesion.getAttribute("varSUsuario");
            sesion.setAttribute("Origen","Alta");
        %>
        <div style="float:right">
        <%=strUsuario%>
        </div>
        <form action="Guardar.jsp">
            ID:<input type="text" name="varID" /> <br>
            Nombre:<input type="text" name="varNombre" /> <br>
            Carrera:
            <select name="opcCarrera"> 
                <option value="ISW">Software</option>
                <option value="IIS">Industrial</option>
                <option value="LPS">Psicologia</option>
            </select>
            <input type="submit" Value="Guardar" name="EnviarGuardar" />
        </form>
    </body>
</html>

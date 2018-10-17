<%-- 
    Document   : modificar
    Created on : 5/10/2018, 02:14:13 PM
    Author     : Jesus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Datos</title>
    </head>
    <body>
         <%
            HttpSession sesion=request.getSession(false);
            String strUsuario=(String)sesion.getAttribute("varSUsuario");
            sesion.setAttribute("Origen","Modificar");
        %>
        <div style="float:right">
        <%=strUsuario%>
        </div>
        <form action="Guardar.jsp">
            <h1>Ingrese el ID, del que desea Modificar</h1> <br>
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

<%-- 
    Document   : index
    Created on : 4/10/2018, 06:37:38 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Iniciar sesion</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form action="Principal.jsp" method="get">
            Ingrese el Usuario:<input type="text" name="varUsuario"/> <br>
            Ingrese la Contraseña:<input type="text" name="varPassword"/> <br>
            <input type="submit" value="Enviar" name="varEnviarServidor"/>
        </form>
    </body>
</html>

<%-- 
    Document   : mostrar
    Created on : 5/10/2018, 02:14:33 PM
    Author     : Jesus
--%>

<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mostrar Lista De Datos</title>
        <style>
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            td, th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even) {
                background-color: #dddddd;
            }
        </style>
    </head>
    <body>
        <a href="Principal.jsp">Volver al Inico</a>
        <%
            int cantidad = 0;
            try {

                Class.forName("com.mysql.jdbc.Driver");
                Connection Conexion = null;
                Statement Comando = null;
                ResultSet resultado = null;
                Conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/itson", "Jesus", "Perico123");

                Comando = Conexion.createStatement();
                String sql = "select count(*) as cantidad from alumnos; ";

                resultado = Comando.executeQuery(sql);

                while (resultado.next()) {
                    cantidad = Integer.parseInt(resultado.getString("cantidad"));
                }
            } catch (SQLException ex) {
                PrintWriter salid = response.getWriter();
                salid.println(ex.getMessage());
            }
            String[][] Datos = new String[cantidad][4];
             try {

                Class.forName("com.mysql.jdbc.Driver");
                Connection Conexion = null;
                Statement Comando = null;
                ResultSet resultado = null;
                Conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/itson", "Jesus", "Perico123");

                Comando = Conexion.createStatement();
                String sql = "select * from alumnos; ";

                resultado = Comando.executeQuery(sql);
                int count=0;
                while (resultado.next()) {
                    Datos[count][0]=resultado.getString("idAlumnos");
                    Datos[count][1]=resultado.getString("NombreAlumno");
                    Datos[count][2]=resultado.getString("Carrera");
                    Datos[count][3]=resultado.getString("idUsuario");
                    
               
        %>
        
        <TABLE>
            <TR>
                <TH>ID</TH>
                <TH>Nombre</TH>
                <TH>Carrera</TH>
                <TH>Usuario Que los Agrego</TH>
            </TR>
            <TR>
                <TD> <%=Datos[count][0]%> </TD>
                <TD> <%=Datos[count][1]%> </TD>
                <TD> <%=Datos[count][2]%> </TD>
                <TD> <%=Datos[count][3]%> </TD>
            </TR>
        </TABLE>
        <%
            count++;
             }
            } catch (SQLException ex) {
                PrintWriter salid = response.getWriter();
                salid.println(ex.getMessage());
            }
        %>
    </body>
</html>
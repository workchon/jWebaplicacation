<%-- 
    Document   : Guardar
    Created on : 4/10/2018, 06:38:44 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Guardar</title>
    </head>
    <body>
        <%@page import="java.io.*"%>
        <%@page  import="java.sql.*" %>
        <%
            HttpSession sesion=request.getSession(false);
            String Origen=(String)sesion.getAttribute("Origen");
            String strUsuario=(String)sesion.getAttribute("varSUsuario");
            PrintWriter Salida=response.getWriter();
            
            String ID = request.getParameter("varID");
            String Nombre = request.getParameter("varNombre");
            String Carrera = request.getParameter("opcCarrera");
            Boolean Error=false;
            Connection Conexion =null;
            Statement Comando=null;

            if(Origen.equals("Alta"))
            {
                try
                {
                Class.forName("com.mysql.jdbc.Driver");
                Conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/itson", "Jesus", "Perico123");
                Comando=Conexion.createStatement();
                String sql="insert into alumnos values ('"+ID+"','"+Nombre+"','"+Carrera+"','"+strUsuario+"');";
                Comando.execute(sql);
                }
                catch(SQLException ex)
                {
                    Error=true;
                    PrintWriter salid=response.getWriter();
                    salid.println(ex.getMessage());
                }
            }

            //
            //Realiza el comando de Modificar
            //
            
            if(Origen.equals("Modificar"))
            {
                try{
                Class.forName("com.mysql.jdbc.Driver");
                Conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/itson", "Jesus", "Perico123");
                Comando=Conexion.createStatement();
                String sql="UPDATE itson.alumnos SET NombreAlumno='"+Nombre+"',Carrera='"+Carrera+"',idUsuario='"+strUsuario+"' where idAlumnos ='"+ID+"'";
                Comando.executeUpdate(sql);
                }
                catch(SQLException ex)
                {
                    Error=true;
                    PrintWriter salid=response.getWriter();
                    salid.println(ex.getMessage());
                }
            }
            
            
            //
            // Seccion para Eliminar
            //
             if(Origen.equals("Eliminar"))
             {
                try
                {
                Class.forName("com.mysql.jdbc.Driver");
                Conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/itson", "Jesus", "Perico123");
                Comando=Conexion.createStatement();
                String sql="DELETE FROM itson.alumnos where idAlumnos='"+ID+"'";
                Comando.executeUpdate(sql);
                }
                catch(SQLException ex)
                {
                    Error=true;
                    PrintWriter salid=response.getWriter();
                    salid.println(ex.getMessage());
                }
             }
        %>
        <div style="padding: 20px;width: 200px;height: 150px; ">
            <a href="Principal.jsp" class="btn btn-info">Volver al Principal</a> <br><br>
            <a href="mostrar.jsp" class="btn btn-info">Mostrar Tabla</a>
        </div>
       
    </body>
</html>

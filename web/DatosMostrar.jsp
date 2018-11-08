<%-- 
    Document   : DatosMostrar
    Created on : 7/11/2018, 05:13:38 PM
    Author     : Jesus
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>

<% 

 PrintWriter salid = response.getWriter();
 try {
               
                Class.forName("com.mysql.jdbc.Driver");
                Connection Conexion = null;
                Statement Comando = null;
                ResultSet resultado = null;
                Conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/itson", "Jesus", "Perico123");

                Comando = Conexion.createStatement();
                String sql = "select * from alumnos; ";
                String Datos="[";
                resultado = Comando.executeQuery(sql);
                while (resultado.next()) {
                    if(!Datos.equals("["))
                    {
                        Datos+=",";
                    }
                    
                    Datos+="{\"idAlumnos\":\""+resultado.getString("idAlumnos")+"\",\"NombreAlumno\":\""+resultado.getString("NombreAlumno")+"\",\"Carrera\":\""+resultado.getString("Carrera")+"\",\"idUsuario\":\""+resultado.getString("idUsuario")+"\"}";
                    
                    }
                Datos+="]";
                salid.println(Datos);
            } catch (SQLException ex) {
                
                salid.println(ex.getMessage());
            }
                

%>
<%-- 
    Document   : Principal
    Created on : 4/10/2018, 06:39:46 PM
    Author     : pc
--%>

<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Principal</title>
    </head>
    <body>
       <%
       String strUsuario=(String)request.getParameter("varUsuario");
       String Password=(String)request.getParameter("varPassword");
       
       
       if(strUsuario!=null)
       {
       HttpSession sesion=request.getSession(true);
       sesion.setAttribute("varSUsuario", strUsuario);
       sesion.setAttribute("Origen", "Zero");
       sesion.setAttribute("Contraseña",Password);
       }else{
       HttpSession sesion=request.getSession(false);
       strUsuario=(String)sesion.getAttribute("varSUsuario");
       Password=(String)sesion.getAttribute("Contraseña");
       }
       
       boolean logeo=false;
       Cookie oreo=new  Cookie("cUsuario",strUsuario);
       oreo.setMaxAge(100000);
       response.addCookie(oreo);
       
       
       try{     
        Class.forName("com.mysql.jdbc.Driver");
        Connection Conexion =null;
        Statement Comando=null;
        ResultSet resultado=null;
        Conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/itson", "Jesus", "Perico123");
        
        Comando=Conexion.createStatement();
        String sql="Select idUsuario,Nombre,Password from usuario where idUsuario ='"+strUsuario+"'";
        
        resultado=Comando.executeQuery(sql);
        
        while(resultado.next())
        {
            if(resultado.getString("Password").equals(Password)){
                logeo=true;
            }
        }
        }
        catch(SQLException ex){
            PrintWriter salid=response.getWriter();
            salid.println(ex.getMessage());
        }
       
       PrintWriter salid=response.getWriter();
       if(logeo==true)
       {
       salid.println("<h1>Bienvenido "+strUsuario+"</h1>");
       
       %>
       <form action="alta.jsp" method="get" >
           <input type="submit" value="Alta" name="EnviarAlta" />
       </form>
       <br><br>
       <form action="baja.jsp">
           <input type="submit" value="Baja" name="EnviarBaja"/>
       </form>
        <br><br>
       <form action="modificar.jsp">
           <input type="submit" value="Modificar" name="EnviarModificar"/>
       </form>
       <br><br>             
       <form action="mostrar.jsp">
           <input type="submit" value="Mostrar Todo" name="EnviarMostrar"/>
       </form>
       <br><br>       
       <a href="Salir.jsp">Cerrar Sesion</a>
       <%
           }
       else{
           salid.println("<h1>No se ingreso un usuario permitido</h1>");
           salid.println("<a href="+"index.jsp"+">Intente de Nuevo</a>");
       }
       %>
    </body>
</html>

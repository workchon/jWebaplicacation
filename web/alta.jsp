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
        <link rel="stylesheet" href="jqwidgets/styles/jqx.base.css" type="text/css" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1 maximum-scale=1 minimum-scale=1" />
        <script type="text/javascript" src="scripts/jquery-1.11.1.min.js"></script>
        <script src="jqwidgets/jqxcore.js" type="text/javascript"></script>
        <script src="jqwidgets/jqxbuttons.js" type="text/javascript"></script>
        <script type="text/javascript" src="jqwidgets/jqxscrollbar.js"></script>
        <script type="text/javascript" src="jqwidgets/jqxsplitter.js"></script>
        <script type="text/javascript" src="jqwidgets/jqxlistbox.js"></script>
        <script type="text/javascript" src="jqwidgets/jqxdata.js"></script>
        <script type="text/javascript" src="jqwidgets/jqxcombobox.js"></script>
        <script type="text/javascript" src="scripts/demos.js"></script>

         <script type="text/javascript">
        $(document).ready(function () {           
            // prepare the data
            var data = new Array();
            var firstNames = ["Software", "Industrial", "Psicologia"];
            var valores = ["ISW", "IIS", "LPS"];
            var titles = ["Ing. Software", "Ing. Industrial", "Lic. Psicologia"];
            var k = 0;
            for (var i = 0; i < firstNames.length; i++) {
                var row = {};
                row["firstname"] = firstNames[k];
                row["valor"] = valores[k];
                row["title"] = titles[k];
                data[i] = row;
                k++;
            }
            var source =
            {
                localdata: data,
                datatype: "array"
            };
            var dataAdapter = new $.jqx.dataAdapter(source);
            $('#opcCarrera').jqxComboBox({ placeHolder: "",  source: dataAdapter, displayMember: "firstname", valueMember: "valor", itemHeight: 70, height: 30, width: 270,
                renderer: function (index, label, value) {
                    var datarecord = data[index];
                    var table = '<table style="min-width: 150px;"><tr><td style="width: 55px;" rowspan="2">' + '</td><td>' + datarecord.firstname  + '</td></tr><tr><td>' + datarecord.title + '</td></tr></table>';
                    return table;
                }
            });
        });
    </script>
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
            <div id="opcCarrera" name="opcCarrera">
                
            </div>
            <input type="submit" Value="Guardar" name="EnviarGuardar" />
        </form>
    </body>
</html>

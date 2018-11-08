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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <link href="jqwidgets/styles/jqx.base.css" rel="stylesheet" type="text/css"/>
        <script src="scripts/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="jqwidgets/jqxcore.js" type="text/javascript"></script>
        <script src="jqwidgets/jqxdata.js" type="text/javascript"></script>
        <script src="jqwidgets/jqxbuttons.js" type="text/javascript"></script>
        <script src="jqwidgets/jqxscrollbar.js" type="text/javascript"></script>
        <script src="jqwidgets/jqxmenu.js" type="text/javascript"></script>
        <script src="jqwidgets/jqxcheckbox.js" type="text/javascript"></script>
        <script src="jqwidgets/jqxlistbox.js" type="text/javascript"></script>
        <script src="jqwidgets/jqxdropdownlist.js" type="text/javascript"></script>
        <script src="jqwidgets/jqxgrid.js" type="text/javascript"></script>
        <script src="jqwidgets/jqxgrid.sort.js" type="text/javascript"></script>
        <script src="jqwidgets/jqxgrid.pager.js" type="text/javascript"></script>
        <script src="jqwidgets/jqxgrid.selection.js" type="text/javascript"></script>
        <script src="jqwidgets/jqxgrid.edit.js" type="text/javascript"></script>
        <script src="scripts/demos.js" type="text/javascript"></script>
    </head>
    <script type="text/javascript"> 
        $(document).ready(function () {
            var url = "DatosMostrar.jsp";
            // prepare the data
            var source =
            {
                datatype: "json",
                datafields: [
                    { name: 'idAlumnos', type: 'string' },
                    { name: 'NombreAlumno', type: 'string' },
                    { name: 'Carrera', type: 'string' },
                    { name: 'idUsuario', type: 'string' }
                ],
                /*root: "Products",
                record: "Product",
                id: 'ProductID',*/
                url: url
            };
            

            var cellsrenderer = function (row, columnfield, value, defaulthtml, columnproperties, rowdata) {
                if (value < 20) {
                    return '<span style="margin: 4px; margin-top:8px; float: ' + columnproperties.cellsalign + '; color: #ff0000;">' + value + '</span>';
                }
                else {
                    return '<span style="margin: 4px; margin-top:8px; float: ' + columnproperties.cellsalign + '; color: #008000;">' + value + '</span>';
                }
            }
            var dataAdapter = new $.jqx.dataAdapter(source, {
                downloadComplete: function (data, status, xhr) { },
                loadComplete: function (data) { },
                loadError: function (xhr, status, error) { }
            });
            
           
            // initialize jqxGrid
            $("#grid").jqxGrid(
            {
                width: getWidth('Grid'),
                source: dataAdapter,                
                pageable: true,
                autoheight: true,
                sortable: true,
                altrows: true,
                enabletooltips: true,
                editable: true,
                selectionmode: 'multiplecellsadvanced',
                columns: [
                  { text: 'id Alumno',  datafield: 'idAlumnos', width: 250 },
                  { text: 'Nombre del Alumno',  datafield: 'NombreAlumno', cellsalign: 'right', align: 'right', width: 200 },
                  { text: 'Carrera',  datafield: 'Carrera', align: 'right', cellsalign: 'right', cellsformat: 'c2', width: 200 },
                  { text: 'id del Usuario',  datafield: 'idUsuario', align: 'right', cellsalign: 'right', cellsformat: 'c2', width: 200 }
                ]/*,
                columngroups: [
                    { text: 'Product Details', align: 'center', name: 'ProductDetails' }
                ]*/
            });
        });
    </script>
    <body>
    <a href="Principal.jsp" class="btn btn-outline-primary text-dark">Volver al Inico</a>
        <div id="grid"></div>
    </body>
</html>

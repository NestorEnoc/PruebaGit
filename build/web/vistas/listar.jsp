<%@page import="modeloDao.personaDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <nav class="navegacion">
                <ul class="menu">
                    <li><a href="#">Inicio</a>
                        <ul class="submenu">
                            <li><a href="index.jsp">Inicio</a></li>
                            <li><a href="#">Salir</a></li>
                            <li><a href="#"></a></li>
                        </ul>
                    </li>
                    <li><a href="#">Agregar</a>
                        <ul class="submenu">
                            <li><a href="controlador?accion=add">Nuevo</a></li>
                            <li><a href="#">Personas</a></li>
                            <li><a href="#"></a></li>
                        </ul>
                    </li>
                    <li><a href="#">Informacion</a>
                        <ul class="submenu">
                            <li><a href="#">Info</a></li>
                            <li><a href="#">Reporte</a></li>
                            <li><a href="#"></a></li>
                        </ul>
                    </li>
                    <li><a href="#">Contacto</a>
                        <ul class="submenu">
                            <li><a href="#">Acerca de</a></li>
                            <!--<li><a href="#">Servicio #2</a></li>
                            <li><a href="#">Servicio #3</a></li>-->
                        </ul>
                    </li>
                </ul>
            </nav>
        </header>
        <div class="container">
            <center><h1>Personas</h1></center>
            <a class="btn btn-info" href="controlador?accion=add">Agregar Nuevo</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">DNI</th>
                        <th class="text-center">NOMBRES</th>
                        <th class="text-center">ACCIONES</th>
                    </tr>
                </thead>
                <%
                    personaDao dao = new personaDao();
                    List<persona> list = dao.listar();
                    Iterator<persona> iter = list.iterator();
                    persona per = null;
                    while (iter.hasNext()) {
                        per = iter.next();

                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%=per.getId()%></td>
                        <td class="text-center"><%=per.getDni()%></td>
                        <td><%=per.getNom()%></td>
                        <td class="text-center">
                            <a class="btn btn-success" href="controlador?accion=editar&id=<%= per.getId()%>"> Editar</a>
                            <a class="btn btn-danger" href="controlador?accion=eliminar&id=<%= per.getId()%>"> Eliminar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
        <style>
            *{
                 margin: 0;
                 padding: 0;
                 -webkit-box-sizing: border-box;
                 -moz-box-sizing: border-box;
                 box-sizing: border-box;
             }

             body{
                    background: #ffffff;
             }

             header{
                    width: 100%;
             }

             .navegacion{
                    width: 1000px;
                    margin: 30px auto;
                    background: #313D52;
             }

             .navegacion ul{
                    list-style: none;
             }

             .menu > li{
                    position: relative;
                    display: inline-block;
             }

             .menu > li > a{
                    display: block;
                    padding: 19px 24px;
                    color: #ffffff;
                    font-family: 'Open sans';
                    text-decoration: none;
             }

             .menu li a:hover{
                    color: #CE7D35;
                    transition: all .3s;
             }

             /* Submenu*/

             .submenu{
                    position: absolute;
                    background: #333333;
                    width: 120%;
                    visibility: hidden;
                    opacity: 0;
                    transition: opacity 1.5s;
             }

             .submenu li a{
                    display: block;
                    padding: 15px;
                    color: #fff;
                    font-family: 'Open sans';
                    text-decoration: none;
             }

             .menu li:hover .submenu{
                    visibility: visible;
                    opacity: 1;
             }
        </style>
    </body>
</html>

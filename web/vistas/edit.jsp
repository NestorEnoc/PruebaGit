
<%@page import="modelo.persona"%>
<%@page import="modeloDao.personaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
                <%
                    personaDao dao=new personaDao();
                    int id=Integer.parseInt((String)request.getAttribute("idper"));
                    persona p =(persona)dao.list(id);
                %>
                <h1>Modificar Persona</h1>
                <form action="controlador">
                    DNI: <br>
                    <input class="form-control" type="text" name="txtDni" value="<%=p.getDni()%>"><br>
                    Nombres: <br>
                    <input class="form-control" type="text" name="txtNom" value="<%=p.getNom()%>"><br>
                    <input type="hidden" name="txtid" value="<%=p.getId()%>">
                    <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"><br>
                    <a href="controlador?accion=listar">Regresar</a>
                 </form>
            </div>
        </div>
    </body>
</html>

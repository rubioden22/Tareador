<%@page import="controllers.UserController"%>
<%@page import="dominio.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>TAREADOR</title>
<style type="text/css">
	<%@ include file="Recursos/bootstrap.min.css" %>
	<%@ include file="Recursos/font-awesome.min.css" %>
	<%@ include file="Recursos/css1.css" %>
	<%@ include file="Recursos/css2.css" %>
	<%@ include file="Recursos/magnific-popup.css" %>
	<%@ include file="Recursos/creative.min.css" %>
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Registration</title>
<script type="text/javascript" src="${jsURL}">
</script>

    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

</head>

<body id="page-top">

<%
String nombreU; 
Integer idU = null;
if((Usuario)session.getAttribute("Sessuser") != null){
	nombreU = ((Usuario)session.getAttribute("Sessuser")).getNombreUsuario();
	idU = ((Usuario)session.getAttribute("Sessuser")).getIdUsuario();
}
else
{
	nombreU = "LOG IN";
	UserController us = new UserController();
	us.redireccion();
}

%>


<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="<c:url value='Inicio.html' />"  >Tareador</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                	<li>
                        <a class="page-scroll" href="<c:url value='IrListarDepartamentos.html' />"  >VOLVER</a>
                    </li>
                    <li>
<%--                         <a class="page-scroll" href="#about"><%= nombreU %></a> --%>
 <a class="page-scroll"  
                    	<%
		            		if(((Usuario)session.getAttribute("Sessuser")).getNombreUsuario() == null){
		            			
								// 
		            			out.print("style='display: none;'");
		            	    }
                    		///EditarUsuario-${Usuario.idUsuario}
						%>  href='EditarUsuario-<%= idU %>'><%= nombreU %></a>
						
                    </li>
                    <li>
                        <a class="page-scroll" href="<c:url value='CerrarSesion.html' />"  >Cerrar Sesion</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <header>
        <div class="header-content">
            <div class="header-content-inner">
                <h1 id="homeHeading"><c:out value="${ headerTitle}"></c:out></h1>
                <hr>
                 <a href="IrListarDepartamentos.html" class="btn btn-primary btn-xl page-scroll">LISTA DE DEPARTAMENTOS</a><br><br><br>
          
                
			
			<div align="center">
			<h3 id="homeHeading">   </h3>
						
				<form method="post" action="save-departamento.html">
					<table>
			
						
						<tr>
						<td>Codigo:</td>
						<td><input maxlength="30" type="text" style=" color: black " size="20" required="required" name="codigo" value="<c:out value="${ departamentoCodigo.toString() }"/>"></td>
						</tr>
						
						<tr>
						<td>Descripcion:</td>
						<td>
							<textarea rows="5" cols="18" style=" color: black " required="required" name="descripcion" 
							><c:out value="${ departamentoDescripcion.toString() }" /></textarea>
							
						</td>
						</tr>
						
						<tr>
						<td>
							<input type="hidden" style=" color: black " name="idDepartamento" value="<c:out value="${ idDepartamento }" />">
						</td>
						
						</tr>
						<tr>
						<td colspan="2" align="center">
							
						<input type="submit" name="btnGuardarUsuario"  value="Guardar" class="btn btn-success"/>
						
						
						
						<c:if test="${ idDepartamento != null }">
						
								<a type="button" href="<c:url value='/baja-departamento-${idDepartamento}' />" name="btnBorrarDepartamento" value="Eliminar_Departamento" class="btn btn-danger">Eliminar</a>
						</c:if>
						
						<a type="button" href="IrListarDepartamentos.html" id="btnCancelar" value="Cancelar"  class="btn btn-warning">Cancelar</a>
						
						</td> 
							</tr>
		</table>
	</form>

			                
            </div>
        </div>
    </header>





<script type="text/javascript">
	<%@ include file="Recursos/js/jquery.min.js" %>
	<%@ include file="Recursos/js/bootstrap.min.js" %>
	<%@ include file="Recursos/js/jquery.easing.min.js" %>
	<%@ include file="Recursos/js/scrollreveal.min.js" %>
	<%@ include file="Recursos/js/jquery.magnific-popup.min.js" %>
	<%@ include file="Recursos/js/creative.min.js" %>

</script>

</body>

</html>

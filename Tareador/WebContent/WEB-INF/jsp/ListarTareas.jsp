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
	<%@ include file="Recursos/dataTables.bootstrap.min.css" %>


</style>



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Registration</title>
<script type="text/javascript" src="${jsURL}">
</script>





    
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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
                        <a class="page-scroll" href="<c:url value='Inicio.html' />"  >VOLVER</a>

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
            <br><br>
                <h2 id="homeHeading">Listado de Tareas</h2>
    
<table >
<tr>
 <th style="padding-bottom: 5px;">
 	<form action="IrListarTareas.html" method="post" >
 		<input type="submit" name="ListarTareas" value="Actualizar Lista" class="btn btn-primary">
	</form>
</th>
	<c:if test="${NEW_TAREA == 1}">
		 <th style="padding-left: 5px;   padding-right: 5px; padding-bottom: 5px;">
			<form action="IrAltaTarea.html" method="post" >
			 	<input type="submit" name="NuevoTarea" value="Nuevo Tarea" class="btn btn-primary">
			</form>
		</th>
	</c:if>

						<td >Proyecto:</td>
							<td style="padding-left: 5px;   padding-right: 5px;">
							
							
							<select  id="cmbProyecto"  name="cmbProyecto" class="btn btn-primary dropdown-toggle">
								<option value="TODOS" selected="selected" >Todos </option>
								<c:forEach items="${lstProyectos}" var="item">
										       	<option value="${item.getIdProyecto()}">${item.getDescripcion()} </option>
			   					</c:forEach>
								
							</select>
							

							</td>
							
							<td >Prioridad:</td>
							<td style="padding-left: 5px;   padding-right: 5px;">
							
							
							<select  id="cmbPrioridad"  name="cmbPrioridad" class="btn btn-primary dropdown-toggle">
								<option value="TODOS" selected="selected" >Todos </option>
								<c:forEach items="${lstPrioridades}" var="item">
										       	<option value="${item.getIdPrioridad()}">${item.getDescripcion()} </option>
			   					</c:forEach>
								
							</select>
							

							</td>
							
							<td >Estado Tarea:</td>
							<td style="padding-left: 5px;   padding-right: 5px;">
							
							
							<select  id="cmbEstadoTarea"  name="cmbEstadoTarea" class="btn btn-primary dropdown-toggle">
								<option value="TODOS" selected="selected" >Todos </option>
								<c:forEach items="${lstEstadoTareas}" var="item">
										       	<option value="${item.getIdEstadoTarea()}">${item.getDescripcion()} </option>
			   					</c:forEach>
								
							</select>
							

							</td>
							
							<td >Tipo Tarea:</td>
							<td style="padding-left: 5px;   padding-right: 5px;">
							
							
							<select  id="cmbTipoTarea"  name="cmbTipoTarea" class="btn btn-primary dropdown-toggle">
								<option value="TODOS" selected="selected" >Todos </option>
								<c:forEach items="${lstTipoTareas}" var="item">
										       	<option value="${item.getIdTipoTareas()}">${item.getDescripcion()} </option>
			   					</c:forEach>
								
							</select>
							

							</td>
					
</tr>

</table>
    
    <form method="get" id = "adminForm" >
    </form>
    
               
<table class="table display AllDataTables">
	<thead>
		<tr>
			<th>ID</th>
			<th>Prioridad</th>
		   <th>Titulo</th>
		    <th>Proyecto</th>
		    <th>Tipo</th>
		    <th>Estado</th>
		   <th>Opciones</th>
	 	</tr>
	</thead>
	<tbody>

	
	
		<c:forEach items="${lstTareas}" var="item">
				<tr style="text-align: left" 
				data-proyecto="${item.getProyecto().getIdProyecto()}" 
				data-tipoTarea="${item.getTipoTarea().getIdTipoTareas()}"  
				data-estadoTarea="${item.getEstadoTarea().getIdEstadoTarea()}" 
				data-prioridad="${item.getPrioridad().getIdPrioridad()}"
				>
				<td>${item.getIdTarea()}</td>
				<td>${item.getPrioridad().getDescripcion()}</td>
				<td>${item.getTitulo()}</td>
				<td>${item.getProyecto().getDescripcion()}</td>
				<td>${item.getTipoTarea().getDescripcion()}</td>
				<td>${item.getEstadoTarea().getDescripcion()}</td>
				<td >
			<!--	<a href="<c:url value='/edit-tarea-${item.getIdTarea()}' />">Editar</a> -->
					
						<c:if test="${EDIT_TAREA == 1}">
							<button type="button" class="btn btn-primary"  onclick="callEditar(${item.getIdTarea()})"> Editar</button>
						</c:if>
						<button type="button" class="btn btn-primary"  onclick="callComentario(${item.getIdTarea()})"> Comentarios</button>
				</td>
				</tr>
				
			</c:forEach>
	
	

<!-- 		<form method="get" action="UsuariosTareadorServlet?verUsuario="> -->
<!-- 			<button type="submit" class="btn btn-primary"  onclick="callUsuarios()"> +Usuario</button> -->
<!-- 			<button type="submit" class="btn btn-primary"  onclick="callServlet()"> Editar</button> -->
<!-- 		</form> -->
			</td>
			</tr>
		
	</tbody>
</table>

			</div>
		</div>
	</header>




<script type="text/javascript">

function callEditar(idTarea){
	
	 form = document.createElement('form');
     form.setAttribute('method', 'POST');
     form.setAttribute('action', 'edit-tarea.html');
     myvar = document.createElement('input');
     myvar.setAttribute('name', 'idTarea');
     myvar.setAttribute('type', 'hidden');
     myvar.setAttribute('value', idTarea);
     form.appendChild(myvar);
     document.body.appendChild(form);
     form.submit();   
		 
// 		 document.getElementById("adminForm").action="/edit-tarea-" + IdTarea;
// 		 document.getElementById("adminForm").method = "GET";
// 		 document.getElementById("adminForm").submit();
		 
}

function callComentario(idTarea){
	
	 form = document.createElement('form');
    form.setAttribute('method', 'POST');
    form.setAttribute('action', 'IrListarComentarios.html');
    myvar = document.createElement('input');
    myvar.setAttribute('name', 'idTarea');
    myvar.setAttribute('type', 'hidden');
    myvar.setAttribute('value', idTarea);
    form.appendChild(myvar);
    document.body.appendChild(form);
    form.submit();   
		 
//		 document.getElementById("adminForm").action="/edit-tarea-" + IdTarea;
//		 document.getElementById("adminForm").method = "GET";
//		 document.getElementById("adminForm").submit();
		 
}


</script>

<script type="text/javascript">
		<%@ include file="Recursos/js/jquery.min.js" %>
		<%@ include file="Recursos/js/bootstrap.min.js" %>
		<%@ include file="Recursos/js/jquery.easing.min.js" %>
		<%@ include file="Recursos/js/scrollreveal.min.js" %>
		<%@ include file="Recursos/js/jquery.magnific-popup.min.js" %>
		<%@ include file="Recursos/js/creative.min.js" %>
		<%@ include file="Recursos/js/jquery-3.2.1.min.js" %>
		<%@ include file="Recursos/js/jquery.dataTables.min.js" %>
		<%@ include file="Recursos/js/dataTables.bootstrap.min.js" %>
	
	</script>

	<script>
		$(document).ready( function () {
		    $('.AllDataTables').DataTable({
		    	pageLength: 8,
	            lengthMenu: [[8],["de 8"]],
		    	language: {
		    		"sProcessing":     "Procesando...",
				    "sLengthMenu":     "Mostrar _MENU_ registros",
				    "sZeroRecords":    "No se encontraron resultados",
				    "sEmptyTable":     "Ning�n dato disponible en esta tabla",
				    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
				    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
				    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
				    "sInfoPostFix":    "",
				    "sSearch":         "Buscar:",
				    "sUrl":            "",
				    "sInfoThousands":  ",",
				    "sLoadingRecords": "Cargando...",
				    "oPaginate": {
				        "sFirst":    "Primero",
				        "sLast":     "�ltimo",
				        "sNext":     "Siguiente",
				        "sPrevious": "Anterior"
				    },
				    "oAria": {
				        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
				        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
				    }
		    	}
		    
		

			
		    });
		  
		    
		    
		
		$("#cmbProyecto").on('change',function(){
			
			
			
			$("#DataTables_Table_0_wrapper").find('tbody').find('tr').each(function(index,element){
				
				
				if($("#cmbProyecto").val() == $(element).attr('data-proyecto')){
					$(element).removeAttr('hidden');
				}else if($("#cmbProyecto").val() == "TODOS"){
					
					$(element).removeAttr('hidden');
					
				}else{
					$(element).attr('hidden','true');
				}
				
					
			});
			
		
			
			
		});
			$("#cmbTipoTarea").on('change',function(){
						
						
						
						$("#DataTables_Table_0_wrapper").find('tbody').find('tr').each(function(index,element){
							
							
							if($("#cmbTipoTarea").val() == $(element).attr('data-tipoTarea')){
								$(element).removeAttr('hidden');
							}else if($("#cmbTipoTarea").val() == "TODOS"){
								
								$(element).removeAttr('hidden');
								
							}else{
								$(element).attr('hidden','true');
							}
							
								
						});
						
					
						
						
					});
			$("#cmbEstadoTarea").on('change',function(){
				
				
				
				$("#DataTables_Table_0_wrapper").find('tbody').find('tr').each(function(index,element){
					
					
					if($("#cmbEstadoTarea").val() == $(element).attr('data-estadoTarea')){
						$(element).removeAttr('hidden');
					}else if($("#cmbEstadoTarea").val() == "TODOS"){
						
						$(element).removeAttr('hidden');
						
					}else{
						$(element).attr('hidden','true');
					}
					
						
				});
				
			
				
				
			});
			$("#cmbPrioridad").on('change',function(){
				
				
				
				$("#DataTables_Table_0_wrapper").find('tbody').find('tr').each(function(index,element){
					
					
					if($("#cmbPrioridad").val() == $(element).attr('data-prioridad')){
						$(element).removeAttr('hidden');
					}else if($("#cmbPrioridad").val() == "TODOS"){
						
						$(element).removeAttr('hidden');
						
					}else{
						$(element).attr('hidden','true');
					}
					
						
				});
				
			
				
				
			});
		
		
		}); 

		
		
		
		

	 

	    
	   
	</script>



</body>
</html>

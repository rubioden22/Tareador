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
                        <a class="page-scroll" href="<c:url value='IrListarRoles.html' />"  >VOLVER</a>
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
                <h2 id="homeHeading">Listado de Usuarios</h2>
    
<table >
<tr>
 <th style="padding-bottom: 5px;">
 	<form action="UsuariosTareadorServlet?ListarUsuarios=ListarUsuarios.jsp" method="post" >
 		                          <a style="border-top-width: 40px;" name="ListarUsuarios"  class="btn btn-primary btn-xl page-scroll" href="<c:url value='/IrListarUsuarios.html' />"  >LISTA DE USUARIOS</a><br><br><br>

	</form>
</th>
 <th style="padding-left: 5px;   padding-right: 5px; padding-bottom: 5px;">
	<form action="IrAltaUsuario.html" method="post" >
	 	<input type="submit" name="NuevoUsuario" value="Nuevo Usuario" class="btn btn-primary">
	</form>
</th>

						
						<td >Departamento:</td>
							<td style="padding-left: 5px;   padding-right: 5px;">
							<select  id="cmbDepartamento" name="cmbDepartamento" required="required" class="btn btn-info dropdown-toggle">
								
								<option value="TODOS"  >TODOS</option>
										
							<c:forEach items="${departamentos}" var="item">
								
								
								<option value="${item.idDepartamento}" >${item.descripcion}</option>
								
								
							
							</c:forEach>
									
						
							</select> 	
							
							
							</td>
					
					
						<td>Tipo de usuario:</td>
						<td style="padding-left: 5px;   padding-right: 5px; padding-bottom:5px;">

													<select  id="cmbTipoUsuario" name="cmbTipoUsuario" required="required" class="btn btn-info dropdown-toggle">
								
							<option value="TODOS" >TODOS</option>
										
							<c:forEach items="${tiposUsuario}" var="item">
								
								
								<option value="${item.idTipoUsuario}" >${item.descripcion}</option>
								
								
							
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
		   <th>Apellido</th>
		   <th>Usuario</th>
		   <th>Nombre</th>
		   <th>Email</th>
		   
		   <th>Opciones</th>
	 	</tr>
	</thead>
	<tbody>

	




			
			
			<c:forEach items="${usuarios}" var="Usuario">
				

	<tr style="text-align: left" data-dto="${Usuario.getDepartamento().getIdDepartamento()}" data-user="${Usuario.getTipoUsuario().getIdTipoUsuario()}" >
			
				<td> ${Usuario.apellido} </td>
				<td>${Usuario.nombreUsuario}</td>
				<td>${Usuario.nombre}</td>
				<td>${Usuario.email}
				</td>
							
			<td> 

				<td ><button type="submit" class="btn btn-primary"  onclick="callAgregar(${Usuario.idUsuario},${idRol})"> +Usuario</button></td>
				<!--<td ><a href="<c:url value='/AgregarProyectoUsuario/${Usuario.idUsuario}/${idProyecto}' />">+ Usuario</a></td>-->

			</td>
					</tr>
			</c:forEach>


	
	</tbody>
</table>

			</div>
		</div>
	</header>




<script type="text/javascript">

function callServlet(idUsuario){
	
	{
		 document.getElementById("adminForm").action="GestionarUsuario.jsp";
		 document.getElementById("adminForm").method = "POST";
		 document.getElementById("adminForm").submit();

		}
}

function callAgregar(idUsuario, idRol){
	
	{
		form = document.createElement('form');
	     form.setAttribute('method', 'POST');
	     form.setAttribute('action', 'AgregarProyectoRol.html');
	     myvar = document.createElement('input');
	     myvar.setAttribute('name', 'idUsuario');
	     myvar.setAttribute('type', 'hidden');
	     myvar.setAttribute('value', idUsuario);
	     myvar2 = document.createElement('input');
	     myvar2.setAttribute('name', 'idRol');
	     myvar2.setAttribute('type', 'hidden');
	     myvar2.setAttribute('value', idRol);
	     form.appendChild(myvar);
	     form.appendChild(myvar2);
	     document.body.appendChild(form);
	     form.submit();

	}
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
		  
		
		$("#cmbDepartamento").on('change',function(){
			
			
			
			$("#DataTables_Table_0_wrapper").find('tbody').find('tr').each(function(index,element){
				
				
				if($("#cmbDepartamento").val() == $(element).attr('data-dto')){
					$(element).removeAttr('hidden');
				}else if($("#cmbDepartamento").val() == "TODOS"){
					
					$(element).removeAttr('hidden');
					
				}else{
					$(element).attr('hidden','true');
				}
				
					
			});
			
		
			
			
		});
		
		$("#cmbTipoUsuario").on('change',function(){
			
			
			
			$("#DataTables_Table_0_wrapper").find('tbody').find('tr').each(function(index,element){
				
				
				if($("#cmbTipoUsuario").val() == $(element).attr('data-user')){
					$(element).removeAttr('hidden');
				}else if($("#cmbTipoUsuario").val() == "TODOS"){
					
					$(element).removeAttr('hidden');
					
				}else{
					$(element).attr('hidden','true');
				}
				
					
			});
			

			
		
		}); 
		
		}); 

		
		var editarUsuario= function(element){
			var CONTEXT_PATH =	$(element).attr('myContextPath');

			debugger;
			var userId="1";
			$.ajax({ url: CONTEXT_PATH+"/EditarUsuario",
				type: "POST",
				dataType: "json",
				data: JSON.stringify(userId),
				contentType: "application/json; charset=utf-8",
				success: function (result) {
					if (result.success) 
					{ alert(result.message); } 
					else { alert(result.message) } }, 
					error:function(error) { alert(error.message); } });
			
			
		}
		
		
		
		

	 

	    
	   
	</script>



</body>
</html>
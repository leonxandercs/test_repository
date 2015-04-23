<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="pe.gob.munisjl.java.bean.PersonaBean"%>
<%@page import="pe.gob.munisjl.daofactory.Factory"%>
<%@page import="pe.gob.munisjl.daofactory.PersonaDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home - Municipalidad Distrital de SJL</title>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/stylepage.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet" >
<script src="js/jquery-1.11.1.min.js"></script>
<!-- import --- datatables -->
<link href="//cdn.datatables.net/1.10.4/css/jquery.dataTables.css" rel="stylesheet">
<link href="//cdn.datatables.net/plug-ins/9dcbecd42ad/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">
<script src="js/datatable/jquery.dataTables.min.js"></script>
<script src="js/datatable/dataTables.bootstrap.js"></script>
<script src="js/datatable/datatable.crud.contribuyente.js" ></script>
<!-- -----import --- validation---->
<script src="js/jquery.validate.js"></script> 
<script src="js/additional-methods.js"></script>
<script src="js/messages_es.js"></script>



<%! PersonaBean person=new PersonaBean(); %>
<% List<PersonaBean> listContribuyente=(List)session.getAttribute("listaContActivos"); %>
<% String codigo=(String)session.getAttribute("new_cod_cont"); %>
</head>
<script>

$(document).ready(function(){

	function limpiarfields(){
		/* Limpiar el Validate */
	    $('.modificar .form-group').removeClass('has-error');
	    $(".help-block").hide();
	    /* Limpiar el Validate */
	    $('.registrar .form-group').removeClass('has-error');
	    $(".help-block").hide();
	    /* Limpiar el Modal */
		var modal =$('#myModalEmpNuevo');
		modal.find('.modal-body input').val('');
		modal.find('.modal-body #precio').val('S/.0.00');
		}
    function verNuevo(){
    	var modal =$('#myModalEmpNuevo');
    	modal.find('.modal-body #idContribuyente').val('1');
    	modal.find('.modal-body #codigo').val('<%=codigo%>');
    	$('#myModalEmpNuevo').modal('show');
    	};

	    $('#example tbody').on( 'click', 'tr', function () {
	    limpiarfields();
	   });
	   
		$('#btnNuevo').click(function(){
	    	limpiarfields();
			verNuevo();
	    });

		/*Validaciones personalizadas*/
		  jQuery.validator.addMethod("vigencia", function(value, element) {
				  return this.optional(element) || /^(SI|si|sI|Si|NO|no|No|nO)$/i.test(value);
		  }, "Ingrese sólo \"Si\" o \"No\" ");
		 jQuery.validator.addMethod("fecha", function(value, element) {
				  return this.optional(element) || /^\d{4}-\d{2}-\d{2}$/i.test(value);
		  }, "Fecha no válida utilice Formato yyyy-mm-dd");
		  
	/**********************************/

		 $('.registrar').validate({
				
			    rules: {
			    	codigo: {
			            minlength: 1,
			            maxlength: 10,
			            required: true
			        },
			        nombre: {
			            minlength:1,
			            maxlength:45,
			            required: true
			        },
			        ape_pa:{
			        	minlength:1,
			            maxlength:45,
						required:true
					},
					ape_ma:{
						minlength:1,
			            maxlength:45,
			            required:true
					},
					dni:{
						number:true,
						required:true,
						minlength:8,
						maxlength:8
					},
					edad:{
						number:true,
						maxlength:2,
						required:true
					},
					fec_nac:{
						fecha:true,
						required:true
					},
					direccion:{
						maxlength:300,
						minlength:10,
						required:true
					}
			    },
			    /*********************/
			messages:{ 
					codigo: {
			            maxlength:"El código debe ser de 10 digitos"
			        },
			        nombre: {
			            maxlength:"Se admite un máximo de  45 caracteres"
			        },
			        ape_pa:{
			            maxlength:"Se admite un máximo de  45 caracteres"
					},
					ape_ma:{
			            maxlength:"Se admite un máximo de  45 caracteres"
					},
					dni:{
						number:"Ingrese sólo números enteros",
						maxlength:"DNI inválido máximo 8 caracteres"
					},
					edad:{
						number:"Ingrese sólo números enteros",
						maxlength:"Edad máxima 99 años",
					},
					direccion:{
						maxlength:"Se admite un máximo de 300 caracteres"
					}
				},
			    /*......*/
			    highlight: function(element) {
			        $(element).closest('.form-group').addClass('has-error');
			    },
			    unhighlight: function(element) {
			        $(element).closest('.form-group').removeClass('has-error');
			    },
			    errorElement: 'span',
			    errorClass: 'help-block',
			    errorPlacement: function(error, element) {
			        if(element.parent('.input-group').length) {
			            error.insertAfter(element.parent());
			        } else {
			            error.insertAfter(element);
			        }
			    }
			});
	
		 $('.modificar').validate({
				
			    rules: {
			    	codigo: {
			            minlength: 1,
			            maxlength: 10,
			            required: true
			        },
			        nombre: {
			            minlength:1,
			            maxlength:45,
			            required: true
			        },
			        ape_pa:{
			        	minlength:1,
			            maxlength:45,
						required:true
					},
					ape_ma:{
						minlength:1,
			            maxlength:45,
			            required:true
					},
					dni:{
						number:true,
						required:true,
						minlength:8,
						maxlength:8
					},
					edad:{
						number:true,
						maxlength:2,
						required:true
					},
					fec_nac:{
						fecha:true,
						required:true
					},
					direccion:{
						maxlength:300,
						minlength:10,
						required:true
					}
			    },
			    /*********************/
			messages:{ 
					codigo: {
			            maxlength:"El código debe ser de 10 digitos"
			        },
			        nombre: {
			            maxlength:"Se admite un máximo de  45 caracteres"
			        },
			        ape_pa:{
			            maxlength:"Se admite un máximo de  45 caracteres"
					},
					ape_ma:{
			            maxlength:"Se admite un máximo de  45 caracteres"
					},
					dni:{
						number:"Ingrese sólo números enteros",
						maxlength:"DNI inválido máximo 8 caracteres"
					},
					edad:{
						number:"Ingrese sólo números enteros",
						maxlength:"Edad máxima 99 años",
					},
					direccion:{
						maxlength:"Se admite un máximo de 300 caracteres"
					}
				},
			    /*......*/
			    highlight: function(element) {
			        $(element).closest('.form-group').addClass('has-error');
			    },
			    unhighlight: function(element) {
			        $(element).closest('.form-group').removeClass('has-error');
			    },
			    errorElement: 'span',
			    errorClass: 'help-block',
			    errorPlacement: function(error, element) {
			        if(element.parent('.input-group').length) {
			            error.insertAfter(element.parent());
			        } else {
			            error.insertAfter(element);
			        }
			    }
			});




});
</script>
<body>
<%@include file="header.jsp" %>
<div id="contendedorCU">

<div class="panel panel-primary">
<div class="panel-heading">MANTENIMIENTO</div>
  <div class="panel-body">
    	<!-- -------------------------------------------------->
			<div class="list-group" style="text-align: center;">
				<a class="list-group-item" href="#">
					<h4 class="list-group-item-heading">MANTENIMIENTO DE CONTRIBUYENTES</h4>
				</a>
			</div>
			<!-- ----------------------------------------------------------- -->

<div class="panel panel-default">
  <div class="panel-heading">
  	<a href="#" class="btn btn-primary" data-toggle="modal" id="btnNuevo">+ Nuevo</a>&nbsp;
  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Lista de Contribuyentes
  </div>
  <div class="panel-body">

<!-- ----------------------------------------------------------- 

-->
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%" border="1">

        <thead>
            <tr>
            	<th>id</th>
             	<th>Codigo</th>
				<th>Nombre</th>
				<th>Apellido Paterno</th>
				<th>Apellido Materno</th>
				<th>Dni</th>
				<th>Edad</th>
				<th>Nacimiento</th>
				<th>Direccion</th>
            </tr>
        </thead>
 	<!--  -->
        <tfoot>
            <tr>
           		<th>id</th>
              	<th>Codigo</th>
				<th>Nombre</th>
				<th>Apellido Paterno</th>
				<th>Apellido Materno</th>
				<th>Dni</th>
				<th>Edad</th>
				<th>Nacimiento</th>
				<th>Direccion</th>
            </tr>
        </tfoot>
 <!--  -->
        <tbody>
        	<% 
			for(PersonaBean bean:listContribuyente){
			%>
			<tr>
				<td><%=bean.getIdPersona() %></td>
                <td><%=bean.getCodigo() %></td>
                <td><%=bean.getNombre() %></td>
                <td><%=bean.getApe_pa() %></td>
                <td><%=bean.getApe_ma() %></td>
                <td><%=bean.getDni() %></td>
                <td><%=bean.getEdad() %></td>
                <td><%=bean.getFecNac() %></td>
                <td><%=bean.getDireccion() %></td>
            </tr>
			<%
			 }
			%>
 		</tbody>
    </table>
    	<!---END TABLE------------- -->
	  </div>
</div>
<!-- ----END PANEL SECUNDARY---- -->
  </div>
</div>
</div>
<!-- ---END PANEL PRINIPAL----- -->

<!-- -----------Modal Register New------------ -->

<div class="modal fade" id="myModalEmpNuevo" role="dialog" ria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
  <form action="ServletContribuyenteCRUD" class="registrar">
    <div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    	<h4>Registrar Contribuyente</h4>
    </div>
		<div class="modal-body">
			
	    	<input type="hidden" class="form-control" id="idContribuyente" name="idContribuyente" value="1"/></br>
	    	<div class="form-group">
		   	<label>Código:</label>
	    	<input type="text" class="form-control" id="codigo" name="codigo" readonly="readonly"/></br>
	    	</div>
	    	<div class="form-group">
	    	<label>Nombre:</label>
	    	<input type="text" class="form-control" id="nombre" name="nombre"/></br>
	    	</div>
	    	<div class="form-group">
	    	<label>Apellido Paterno:</label>
	    	<input type="text" class="form-control" id="ape_pa" name="ape_pa"/></br>
	    	</div>
	    	<div class="form-group">
	    	<label>Apellido Materno::</label>
	    	<input type="text" class="form-control" id="ape_ma" name="ape_ma"/></br>
	    	</div>
	    	<div class="form-group">
	    	<label>DNI:</label>
	    	<input type="text" class="form-control" id="dni" name="dni"/></br>
	    	</div>
	    	<div class="form-group">
	    	<label>Edad:</label>
	    	<input type="text" class="form-control" id="edad" name="edad"/></br>
	    	</div>
	    	<div class="form-group">
	    	<label>Fecha Nacimiento:</label>
	    	<input type="text" class="form-control" id="fec_nac" name="fec_nac"/></br>
	    	</div>
	    	<div class="form-group">
	    	<label>Dirección:</label>
	    	<input type="text" class="form-control" id="direccion" name="direccion"/></br>
	    	</div>
   		 </div>
      <div class="modal-footer">
  	  <div style="text-align:left;">
   		<button type="submit" class="btn btn-primary">Registrar</button>&nbsp;&nbsp;
  		<button type="reset" class="btn btn-primary">Limpiar</button>
  		<input type="hidden" value="create" name="accion"></input>
   	  </div>
      <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
    </div>
    </form>
  </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->

</div>
<!-- -----------END MODAL NUEVO --------------- -->
<!-- -----------Modal Modificar------------ -->

<div class="modal fade" id="myModalModificar" role="dialog" ria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
  <form action="ServletContribuyenteCRUD" class="modificar">
    <div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    	<h4>Modificar Contribuyente</h4>
    </div>
    <div class="modal-body">
    		<div class="form-group">
	    	<input type="hidden" class="form-control" id="idContribuyente" name="idContribuyente"/></br>
	    	</div>
	    	<div class="form-group">
	    	<label>Código:</label>
	    	<input type="text" class="form-control" id="codigo" name="codigo" readonly="readonly" /></br>
	    	</div>
	    	<div class="form-group">
	    	<label>Nombre:</label>
	    	<input type="text" class="form-control" id="nombre" name="nombre"/></br>
	    	</div>
	    	<div class="form-group">
	    	<label>Apellido Paterno:</label>
	    	<input type="text" class="form-control" id="ape_pa" name="ape_pa"/></br>
	    	</div>
	    	<div class="form-group">
	    	<label>Apellido Materno::</label>
	    	<input type="text" class="form-control" id="ape_ma" name="ape_ma"/></br>
	    	</div>
	    	<div class="form-group">
	    	<label>DNI:</label>
	    	<input type="text" class="form-control" id="dni" name="dni"/></br>
	    	</div>
	    	<div class="form-group">
	    	<label>Edad:</label>
	    	<input type="text" class="form-control" id="edad" name="edad"/></br>
	    	</div>
	    	<div class="form-group">
	    	<label>Fecha Nacimiento:</label>
	    	<input type="text" class="form-control" id="fec_nac" name="fec_nac"/></br>
	    	</div>
	    	<div class="form-group">
	    	<label>Dirección:</label>
	    	<input type="text" class="form-control" id="direccion" name="direccion"/></br>
	    	</div>
	    	
    </div>
    <div class="modal-footer">
     <button class="btn btn-primary">Guardar</button>&nbsp;&nbsp;
     <input type="hidden" value="update" name="accion"></input>
	 <!-- Small modal -->
	 <button id="delete"  type="button" class="btn btn-danger" data-toggle="modal" data-target=".bs-example-modal-sm">Eliminar</button>&nbsp;&nbsp;
     <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
     </div>
    </form>
  </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->

</div>
<!-- -----------END MODAL MODIFICAR ----------- -->

<!-- ------------Show Message Modal------------ -->
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <div class="modal-header">
    	<h4 class="modal-title">Guardar Cambios</h4>
    </div>
    <form action="">
      <div class="modal-body" style="text-align: right;">
         <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
         <div id="conexionServer"></div>
         <!-- <button type="button" class="btn btn-primary eliminar" data-dismiss="modal">Si</button>
         <input type="hidden" value="delete" name="accion"></input> -->
         </div>
     </form>
      </div>
    </div>
  </div>

</body>



</html>
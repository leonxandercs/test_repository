<%@page import="pe.gob.munisjl.daofactory.TramiteDAO"%>
<%@page import="pe.gob.munisjl.daofactory.Factory"%>
<%@page import="java.util.List"%>
<%@page import="pe.gob.munisjl.java.bean.TramiteBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Home - Municipalidad Distrital de SJL</title>
<meta charset="utf-8">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/stylepage.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet" >
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.1.0/animate.min.css" media="all" rel="stylesheet">
<!--  <link href="css/animate.css" rel="stylesheet" >-->
<script src="js/jquery-1.11.1.min.js"></script>
<!-- import --- datatables -->
<link href="//cdn.datatables.net/1.10.4/css/jquery.dataTables.css" rel="stylesheet">
<link href="//cdn.datatables.net/plug-ins/9dcbecd42ad/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">
<script src="js/datatable/jquery.dataTables.min.js"></script>
<script src="js/datatable/dataTables.bootstrap.js"></script>
<script src="js/datatable/datatable.crud.js" ></script>
<!-- -----import --- validation---->
<script src="js/jquery.validate.js"></script> 
<script src="js/additional-methods.js"></script>
<script src="js/messages_es.js"></script>



<%! TramiteBean tramite=new TramiteBean(); %>
<% List<TramiteBean> listTramite=(List)session.getAttribute("listaTramites"); %>


<script type="text/javascript">

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
    	modal.find('.modal-body #id').val('45');
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
	  
	  jQuery.validator.addMethod("precio", function(value, element) {
		  return this.optional(element) || /^S\/.+[0-9]$/i.test(value);
  	  }, "Precio inválido");
  	  
	 jQuery.validator.addMethod("fecha", function(value, element) {
			  return this.optional(element) || /^\d{4}-\d{2}-\d{2}$/i.test(value);
	  }, "Fecha no válida utilice Formato yyyy-mm-dd");
	  
/**********************************/

	$('.registrar').validate({
		
	    rules: {
	    	id: {
	            minlength: 1,
	            maxlength: 2,
	            required: true
	        },
	        descripcion: {
	            minlength:3,
	            maxlength:100,
	            required: true
	        },
	        precio:{
		        precio:true,
		        maxlength:8,
				required:true
			},
			vigencia:{
				vigencia:true,
				required:true
				},
			consideraciones:{
				required:true,
				maxlength:600
			}	
			
	    },
	    /*********************/
	messages:{ 
		descripcion:{
			maxlength:"Máximo solo 100 caracteres" 
			},
		precio:{ 
			maxlength:"Precio Máximo S/.99.99" 
			}, 
		consideraciones:{
			maxlength:"Máximo 600 caracteres",
			equal: "digite Validado" 
			} 
		},
	    /*......*/
	    highlight: function(element) {
	       // $(element).closest('.form-group').addClass('has-error');
	    	$(element).closest(".form-group").removeClass("has-success").addClass("has-error").parents('form.animate-form').addClass("animated shake");
	    },
	    unhighlight: function(element) {
	       // $(element).closest('.form-group').removeClass('has-error');
	    	$(element).closest(".form-group").removeClass("has-error").addClass("has-success");
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
/** .................................................. **/

	$('.modificar').validate({
		
		 rules: {
		    	id: {
		            minlength: 1,
		            maxlength: 2,
		            required: true
		        },
		        descripcion: {
		            minlength:3,
		            maxlength:100,
		            required: true
		        },
		        precio:{
			        precio:true,
			        maxlength:8,
					required:true
				},
				vigencia:{
					vigencia:true,
					required:true
					},
				consideraciones:{
					required:true,
					maxlength:600
				},
				fec_registro:{
					fecha:true
				}	
				
		    },
		    /*********************/
		messages:{ 
			descripcion:{
				maxlength:"Máximo solo 100 caracteres" 
				},
			precio:{ 
				maxlength:"Precio Máximo S/.99.99" 
				}, 
			consideraciones:{
				maxlength:"Máximo 600 caracteres",
				equal: "digite Validado" 
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
/** .................................................. **/
});
</script>

</head>

<body>
<%@include file="header.jsp" %>
<div id="contendedorCU">

<div class="panel panel-primary">
<div class="panel-heading">MANTENIMIENTO</div>
  <div class="panel-body">
    	<!-- -------------------------------------------------->
			<div class="list-group" style="text-align: center;">
				<a class="list-group-item" href="#">
					<h4 class="list-group-item-heading">MANTENIMIENTO DE TRAMITES</h4>
				</a>
			</div>
			<!-- ----------------------------------------------------------- -->

<div class="panel panel-default">
  <div class="panel-heading">
  	<a href="#" class="btn btn-primary" data-toggle="modal" id="btnNuevo">+ Nuevo</a>&nbsp;
  	<!--<a href="#myModalModificar" class="btn btn-primary" data-toggle="modal"> Modificar</a>&nbsp;
  	<button id="button" class="btn btn-primary">Eliminar</button>   -->
  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Lista de Tramites
  </div>
  <div class="panel-body">
<!-- ----------------------------------------------------------- -->
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%" border="1">

        <thead>
            <tr>
             	<th>Codigo</th>
				<th>Nombre</th>
				<th>Precio</th>
				<th>Vigencia</th>
				<th>Registro</th>
				<th>Descripción</th>
            </tr>
        </thead>
        <tbody>
	<% 
	for(TramiteBean bean:listTramite){ 
		String vigencia="No";
		if( bean.getVigente()==1){vigencia="Si";}
	%>
				<tr>
                <td><%=bean.getIdTramite() %></td>
                <td><%=bean.getNomTramite()%></td>
                <td>S/.<%=bean.getPrecio() %></td>
                <td align="center"><%=vigencia%></td>
                <td><%=bean.getFec_registro() %></td>
                <td><%=bean.getConsideraciones()%></td>
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
  <form action="ServletTramiteCRUD" class="registrar">
    <div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    	<h4>Registrar Tramite</h4>
    </div>
		<div class="modal-body">
			<div class="form-group">
		    	<label>Id Tramite:</label>
		    	<input type="text" class="form-control" id="id" name="id" readonly="readonly"/></br>
	    	</div>
	    	<div class="form-group">
		    	<label>Descripción:</label>
		    	<input type="text" class="form-control" id="descripcion" name="descripcion"/></br>
	    	</div>
	    	<div class="form-group">
		    	<label>Precio:</label>
		    	<input type="text" class="form-control" id="precio" value="S/. " name="precio"/></br>
	    	</div>
	    	<div class="form-group">
	    		<label>Vigente:</label>
	    		<input type="text" class="form-control" id="vigencia" name="vigencia"/></br>
	    	</div>
	    	<div class="form-group">
	    		<label>Consideraciones:</label>
	    		<input type="text" class="form-control" id="consideraciones" name="consideraciones"/></br>
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
  <form action="ServletTramiteCRUD" class="modificar">
    <div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    	<h4>Modificar Tramite</h4>
    </div>
    <div class="modal-body">
   			<div class="form-group">
	    	<label>Id Tramite:</label>
	    	<input type="text" class="form-control" id="id" name="id" readonly="readonly"/></br>
	    	</div>
	    	<div class="form-group">
	    	<label>Descripción:</label>
	    	<input type="text" class="form-control" id="descripcion" name="descripcion"/></br>
	    	</div>
	    	<div class="form-group">
	    	<label>Precio:</label>
	    	<input type="text" class="form-control" id="precio" name="precio"/></br>
	    	</div>
	    	<div class="form-group">
	    	<label>Vigencia:</label>
	    	<input type="text" class="form-control" id="vigencia" name="vigencia"/></br>
	    	</div>
	    	<div class="form-group">
	    	<label>Fecha Registro:</label>
	    	<input type="text" class="form-control" id="fec_registro" name="fec_registro"/></br>
	    	</div>
	    	<div class="form-group">
	    	<label>Consideraciones:</label>
	    	<input type="text" class="form-control" id="consideraciones" name="consideraciones"/></br>
	    	</div>
    </div>
    <div class="modal-footer">
     <button  type="submit" class="btn btn-primary">Guardar</button>&nbsp;&nbsp;
     <input type="hidden" value="update" name="accion"></input>
	 <!-- Small modal -->
	 <button id="delete" class="btn btn-danger" type="button"  data-toggle="modal"  data-target=".bs-example-modal-sm">Eliminar</button>&nbsp;&nbsp;
     <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
     </div>
    </form>
  </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->

</div>
<!-- -----------END MODAL MODIFICAR ----------- -->

<!-- ------------Show Message Modal------------ -->
<div id="mensaje"  class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <div class="modal-header">
    	<h4 class="modal-title">Guardar Cambios</h4>
    </div>
    <form id="forma1" name="forma1" action="" method="post">
      <div class="modal-body" style="text-align: right;">
         <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        <!--  <button type="button" class="btn btn-primary eliminar" data-dismiss="modal">Si</button> -->
         <div id="conexionServer"></div>
         </div>
         <!--   <a id="conexionServer" href ="ServletTramiteD?id=20">eliminador</a>  -->
     </form>
      </div>
    </div>
  </div>

</body>

</html>
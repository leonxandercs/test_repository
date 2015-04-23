<%@page import="java.util.List"%>
<%@page import="pe.gob.munisjl.java.bean.ExpedienteBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<%! ExpedienteBean bean=new ExpedienteBean(); %>
<% List<ExpedienteBean> lista=(List)session.getAttribute("listaExpe"); %>
<script type="text/javascript">
$(document).ready(function() {
    var table = $('#example').DataTable({ "order": [[0, "desc" ]] } );
    $('#panel1').hide();
    //_------------------------------------------------
   $(document).on('click', '.mostrarDetaInt',function(e){
   	    e.preventDefault();
    		var id=$(this).data('id');
    		// alert(id);
			 console.log(id);
    		 console.log('Seleccionado EXP: '+id);
		   $.ajax({
    		 url:'ServletExpedienteCRUD',
    		 type:'post',
    		 datatype:'json',
    		 data:{accion:'detalle',id:id},
    		 success:function(resultado){
    			 var json=eval('{'+resultado+'}');
    			 console.log(json[0].codCont);
    			$('#panel0').hide();
    			 $('#panel1').show();
    			 $('#codExpe').val($('.mostrarDetaInt').data('exp'));
    			 $('#cboestado').prop('selectedIndex',json[0].idEstado-1);
    			 $('#fecreg').val(json[0].fechaRegistro);
    			 $('#motivo').val(json[0].motivo);
    			 if(json[0].medio==0){$('#medio').val('Presencial');}
    			 else{$('#medio').val('Online');}
    			 $('#ultima').val(json[0].fecactualiza);
    			 $('#user').val(json[0].logusu);
    			 $('#area').val("Autorizaciones y Registros Municipales");
    			 $('#codfut').val(json[0].codigoSolicitud);
    			 $('#fecsol').val(json[0].fecinisoli);
    			 $('#codCont').val(json[0].codCont);
    			 $('#nomCont').val(json[0].solicitante);
    		 }
    	  });
				   
	    
  	}); 

 $('#example tbody').on( 'click', 'tr', function () {
    	
        if ( $(this).hasClass('selected active') ) {
            $(this).removeClass('selected active');
        }
        else {
            table.$('tr.selected').removeClass('selected active');
            $(this).addClass('selected active');
            
          	var dato1=$(".selected td")[0].innerHTML;
          	var dato2=$(".selected td")[1].innerHTML;
	        $('.mostrarDetaInt').data('id',dato1);
	        $('.mostrarDetaInt').data('exp',dato2);
	        console.log(dato1);console.log(dato2);
        }
     } );
    
 $('#btnGenerarExp').click(function(event){
		event.preventDefault();
		$('#generarExp').modal();
	});

	$('#generaExpe').click(function(){
		//alert('ola');
		$.ajax({
			url:'ServletExpedienteCRUD',
			type:'post',
			data:{accion:"update",id:$('.mostrarDetaInt').data('id'),idestado:$('#cboestado').val()},
			success:function(msg){
				if (msg=='0') {
					alert('Error al Actualizar');
					document.location.href ='ServletExpedienteListar';
				}else{
					alert( "Actualizacion correcta");
					document.location.href ='ServletExpedienteListar';
			    }
			}
		});
	});
  //******************PANEL 1*******************************//
    var tabla=$('#documentos').DataTable();
	$('#documentos_length').hide();
	$('#documentos_filter').hide();
	$('#documentos_info').hide();
	$('#documentos_paginate').hide();
	
} );
</script>
</head>
<body>
<%@include file="header.jsp" %>
<div id="contendedorCU">
	<div class="panel panel-primary" id="panel0">
		<div class="panel-heading">
			<h4 class="panel-title">EXPEDIENTES</h4>
		</div>
		<div class="panel-body">
		 	<!-- -------------------------------------------------->
			<div class="list-group" style="text-align:center;">
				<a class="list-group-item" href="#">
					<h4 class="list-group-item-heading">LISTADO DE EXPEDIENTES</h4>
				</a>
			</div>
		<!-- ----------------------------------------------------------- -->
			<table id="example" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%" border="1">
        <thead>
            <tr>
             	<th>ID</th>
             	<th>Expediente</th>
				<th>N° FUT</th>
				<th>Solicitante</th>
				<th>Motivo</th>
				<th>Fecha</th>
				<th>Estado</th>
				<th>Detalles</th>
            </tr>
        </thead>
        <tbody>
        <% for(ExpedienteBean e:lista){ %>
            <tr>
            	<td><%=e.getIdExpediente() %></td>
                <td><%=e.getCodigoExpediente() %></td>
                <td><%=e.getCodigoSolicitud() %></td>
                <td><%=e.getSolicitante() %></td>
                <td><%=e.getMotivo() %></td>
                <td><%=e.getFechaRegistro()%></td>
                
                <%if(e.getEstado().equals("Pendiente")){%>
	                <td><label class="label label-warning">Pendiente</label> </td>
                <%}else if(e.getEstado().equals("Asignado")){%>
                	<td><label class="label label-warning">Asignado</label> </td>
                <%}else if(e.getEstado().equals("Aprobado")){%>
                	<td><label class="label label-success">Aprobado</label> </td>
                <%}else{%>
                	<td><label class="label label-danger">Rechazado</label> </td>
                <%} %>
				<td><a class="mostrarDetaInt label label-primary" href="#">Mostrar</a></td>
            </tr>
        <%} %>
        </tbody>
    </table>
			<div class="list-group">
				<a class="list-group-item" href="#"
					style="width:100%; float:auto; margin: 0">
					<h4 class="list-group-item-heading">Nota:</h4>
					<p class="list-group-item-text">La búsqueda se puede realizar
						por cualquier campo en la lista mostrada.</p>
				</a>
			</div>
		</div>
		<!-- End Body-->
	</div>
	<!-- End Panel 

<!-- -------------------------------------------------------------------------------- -->
<div class="panel panel-primary" id="panel1">
<div class="panel-heading">DETALLE DE EXPEDIENTE</div>
  <div class="panel-body">
    	<!-- -------------------------------------------------->
			<div class="list-group" style="text-align:center;">
				<a class="list-group-item" href="#">
					<h4  class="list-group-item-heading">DETALLE DE EXPEDIENTE</h4>
				</a>
			</div>
		<!-- ----------------------------------------------------------- -->

<div class="panel panel-default">
 <!-- <div class="panel-heading">
  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pagina en Proceso
  </div>-->
  <div class="panel-body">
	</br>	
			<form action="">
			<table>
				<tr>
						<td><label>N° Expediente:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>
						<input type="text" class="form-control input-sm" placeholder="Codigo Expediente" id="codExpe">
						</td>
						<td><label>&nbsp;&nbsp;&nbsp;Estado:</label>&nbsp;&nbsp;&nbsp;</td>
						<td>
						<select class="form-control input-sm btn-default cboEstado" name="cboEstado" id="cboestado">
							<option value="1">Pendiente</option>
							<option value="2" ><span class="help-block">Asignado</span></option>
							<option value="3"><span class="help-block">Aprobado</span></option>
							<option value="4"><span class="help-block">Rechazado</span></option>
						</select>
						</td>
				</tr>
				<tr><td></br></td></tr>
				<tr>
					<td><label>Fecha Registro:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>
						<input type="text" class="form-control input-sm" placeholder="Fecha de Registro" id="fecreg">
					</td>
					<td><label>&nbsp;&nbsp;&nbsp;Tipo Expediente:</label>&nbsp;&nbsp;&nbsp;</td>
					<td>
						<input type="text" class="form-control input-sm" placeholder="Tipo de Tramite de Expediente" id="motivo">
					</td>	
				</tr>
				<tr class="tercero"><td></br></td></tr>
				<tr>
					<td><label>Último Cambio:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="text" class="form-control input-sm" placeholder="Fecha de última modificación" id="ultima"></td>
			  	<td><label>&nbsp;&nbsp;&nbsp;Registrado por:</label>&nbsp;&nbsp;&nbsp;</td>
					<td><input type="text"  size="40" class="form-control input-sm" placeholder="Nombre de Empleado" id="user"></td>
			 	</tr>
				<tr><td></br></td></tr>
				<tr>
					<td><label>Area:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="text"  size="40" class="form-control input-sm" placeholder="Area de Empleado" id="area" ></td>
				</tr>
				<tr><td></br></td></tr>
				</table>
		
		</form>
<!-- Datos de Solicitante 
	<div class="panel panel-default">-->		
	 <fieldset >	
		<form action="">
		<legend><h5>Datos Adicionales:</h5></legend>
			<table>
				<tr>
					<td><label>N° FUT:&nbsp;&nbsp;</label></td>
					<td><input type="text" class="form-control input-sm" placeholder="Codigo FUT" id="codfut" ></td>
					<td><label>&nbsp;&nbsp;Medio:&nbsp;&nbsp;</label></td>
					<td><input type="text" class="form-control input-sm" placeholder="Online/Presencial" id="medio"></td>
					<td><label>&nbsp;&nbsp;Fecha:&nbsp;&nbsp;</label></td>
					<td><input type="text"  size="40" class="form-control input-sm" placeholder="Fecha de Registro" id="fecsol"></td>
				</tr>
				<tr><td></br></td><td></br></td><td></br></td></tr>
				<tr>
					<td><label>Codigo:&nbsp;&nbsp;</label>&nbsp;</td>
					<td><input type="text" class="form-control input-sm" placeholder="N° Contribuyente" id="codCont"></td>
					<td><label>&nbsp;&nbsp;Solicitante:&nbsp;&nbsp;</label>&nbsp;</td>
					<td><input type="text"  size="40" class="form-control input-sm" placeholder="Nombre Completo" id="nomCont"></td>
					
					<td colspan="2" style="text-align:center;vertical-align:top;">
			      	&nbsp;&nbsp;&nbsp;&nbsp;
					<a id="btnGenerarExp" href="#" class="btn btn-primary">&nbsp;&nbsp;Guardar&nbsp;&nbsp;&nbsp;</a>
					&nbsp;&nbsp;&nbsp;
					<a  href="ConsultarExpediente.jsp" class="btn btn-default">&nbsp;&nbsp;Cancelar&nbsp;&nbsp;&nbsp;</a>
				  	</td>
				  	<td></td>
				</tr>
			</table>
		</form>
	</fieldset>	
		
<!-- ----------END FORM DETALLE FUT-------------------->
			<h4 class="list-group-item-heading" style="text-align:left;">Documentos:</h4>
			<table id="documentos" class="table table-striped table-hover table-bordered" border="1 cellspacing="0" width="100%" cellpadding="0">
			<thead>
				<th>N°Item</th>
				<th>Documento</th>
				<th>Status</th>
				<th>Opciónes</th>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
			  		<td><a href="#">Solicitud al Alcalde</a></td>
			   		<td>&nbsp;&nbsp;<i class="glyphicon glyphicon-ok">&nbsp;&nbsp;Ok</i></td>
			    	<td><a style="font-size:12px;" class="label label-warning" >Mostrar</a></td>
				</tr>
				<tr>
					<td>2</td>
			  		<td><a href="#">Recibo Reclamado</a></td>
			   		<td>&nbsp;&nbsp;<i class="glyphicon glyphicon-ok">&nbsp;&nbsp;OK</i></td>
			    	<td><a style="font-size:12px;" class="label label-warning">Mostrar</a></td>
				</tr>
				<tr>
					<td>3</td>
			  		<td><a href="#">Copia de DNI</a></td>
			   		<td>&nbsp;&nbsp;<i class="glyphicon glyphicon-ok">&nbsp;&nbsp;OK</i></td>
			    	<td><a style="font-size:12px;" class="label label-warning">Mostrar</a></td>
				</tr>
				<tr>
					<td>4</td>
			  		<td><a href="#">Informe Técncio</a></td>
			   		<td>&nbsp;&nbsp;<i class="glyphicon glyphicon-remove">&nbsp;&nbsp;!</i></td>
			    <!-- <td><a style="font-size:12px;" class="label label-danger">Cargar </a></td> -->
			    	<td><input id="it" type="file" class="btn btn-default"></td>
				</tr>
				<tr>
					<td>5</td>
			  		<td><a href="#">Informe Técncio Legal</a></td>
			   		<td>&nbsp;&nbsp;<i class="glyphicon glyphicon-remove">&nbsp;&nbsp;!</i></td>
			    	  <!-- <td><a style="font-size:12px;" class="label label-danger">Cargar </a></td> -->
			    	<td><input id="itl" type="file" class="btn btn-default"></td>
				</tr>
				<tr>
					<td>6</td>
			  		<td><a href="#">Resolución Gerencial</a></td>
			   		<td>&nbsp;&nbsp;<i class="glyphicon glyphicon-remove">&nbsp;&nbsp;!</i></td>
			    	  <!-- <td><a style="font-size:12px;" class="label label-danger">Cargar </a></td> -->
			    	<td><input id="rg" type="file" class="btn btn-default"></td>
				</tr>
			</tbody>
			</table>
			</br>
			 <!-- END Form  -->
		</div>
	</div>
	<!-- ----------------------------------------------------------- -->
</div>
<!-- END PANEL BODY  -->
</div>

</div><!-- --end container -->

<!-- ------------Show Message Modal------------ -->
<div id="generarExp" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <div class="modal-header">
    	<h4 class="modal-title">¿Guardar cambios en Expediente?</h4>
    </div>
    <form action="">
      <div class="modal-body" style="text-align: right;">
         <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
         <button id="generaExpe" type="button" class="btn btn-primary" data-dismiss="modal">Si</button>
         <div id="conexionServer"></div>
         </div>
     </form>
      </div>
    </div>
  </div>
  <!-- ---End Modal Generar Expediente -->


</body>
</html>
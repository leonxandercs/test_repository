<%@page import="java.util.List"%>
<%@page import="pe.gob.munisjl.java.bean.FutBean"%>
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
<!--  <script src="js/datatable/datatable.js"></script>-->
<script src="js/datatable/jquery.dataTables.min.js"></script>
<script src="js/datatable/dataTables.bootstrap.js"></script>
<%! FutBean fut=new FutBean(); %>
<%PersonaBean usuario=(PersonaBean)session.getAttribute("usuario_logueado");%>
<%List<FutBean> listafut=(List)session.getAttribute("listaFut"); %>

<script type="text/javascript">
$(document).ready(function() {
	
	/*clonacion de inputs search de texto jquery*/
 	//$("#example_filter").clone(true).insertAfter("#formato");
	//$('#formato').html('expediente');
	/*.........................................*/
   var table = $('#example').DataTable({ "order": [[0, "desc" ]] } );
	$('#panel1').hide();
	
    $(document).on('click', '.mostrarDetaInt',function(e){
   	    e.preventDefault();
    		var id=$(this).data('id');
    		 //alert(id);
    		 console.log('Seleccionado FUT: '+id);
		   $.ajax({
    		 url:'ServletFutCRUD',
    		 type:'post',
    		 datatype:'json',
    		 data:{accion:'detalle',id:id},
    		 success:function(resultado){
    			 var json=eval('{'+resultado+'}');
    			 console.log(json[0].codCont);
    			 $('#panel0').hide();
    			 $('#panel1').show();
    			 $('#tituloDeta').html('FORMULARIO UNICO DE TRAMITE - N° '+$('.mostrarDetaInt').data('fut'));
    			 $('#cboEstado').prop('selectedIndex',json[0].idestado-1);
    			 $('#codCont').val(json[0].codCont);
    			 $('#dni').val(json[0].dni);
    			 if(json[0].medio==0){$('#medio').val('Presencial');}
    			 else{$('#medio').val('Online');}
    			 $('#nombres').val(json[0].solicitante);
    			 $('#correo').val(json[0].mailSolicitante);
    			 $('#motivoSol').val(json[0].motivo);
    			 $('#entidad').val(json[0].entidad);
    			 $('#textArea').val(json[0].fundamentacion);
    			 
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
	        $('.mostrarDetaInt').data('fut',dato2);
	        $('.detallext').data('id',dato1);
        }
     } );
    
	 $(document).on('click','.detallext',function(e){
		 e.preventDefault();
		 var id=$('.detallext').data('id');
		 console.log(id);
		 $.ajax({
			 url:'ServletFutCRUD',
			 type:'post',
			 data:{accion:'detallext',id:id},
			 success:function(resultado){
				 window.location = 'extDetaSolicitud.jsp';
			 }
	 });
	 });
  /************************PANEL 1*****************************/
    
    var tabla=$('#documentos').DataTable();
	$('#documentos_length').hide();
	$('#documentos_filter').hide();
	$('#documentos_info').hide();
	$('#documentos_paginate').hide();

	$('.cboEstado').click(function(){
		if($(this).val()!='1'){
			$('.obs').text('Observaciones :');
		}
		if($(this).val()=='4'){
			  $('.obs').text('Motivo de Rechazo :');
		}
		if($(this).val()=='1'){
			  $('.obs').text('Fundamentación :');
		}
	});

	$('#btnGenerarExp').click(function(event){
		event.preventDefault();
		if($('#cboEstado').val()!=3){ /*Si el fut es aprobado se genera expediente*/
			$.ajax({
				url:'ServletFutCRUD',
				type:'post',
				data:{accion:"update",id:$('.mostrarDetaInt').data('id'),idestado:$('#cboEstado').val(),obs:$('#textArea').val()},        
				success:function(msg){
					if (msg=='0') {
						alert('Error al Actualizar');
						document.location.href ='ServletFutListar';
					}else{
						alert( "Actualizacion correcta");
						document.location.href ='ServletFutListar';
				    }
				}
			});
		}else{/*Si No es aprobado No genera expediente*/
			$('#generarExp').modal();
		}
		
	});

	$('#generaExpe').click(function(){
		$.ajax({
				url:'ServletFutCRUD',
				type:'post',
				data:{accion:"genera",id:$('.mostrarDetaInt').data('id')},
				success:function(msg){
					var rs=[];
					rs=msg.split(',');
					console.log(rs[0]);
					console.log(rs[1]);
					if (rs[0]!='0') {
						alert('Error al Generar');
						$('#generarExp').hide();
						document.location.href ='ServletFutListar';
					}else{
						alert( "Expediente Generado: " + rs[1] );
						$('#generarExp').hide();
						document.location.href ='ServletFutListar';
				    }
				}
			});
  });
	
	
    /***********************************************************/
    
} );
</script>
</head>

<body>
<%@include file="header.jsp" %>
<div id="contendedorCU">

	<div class="panel panel-primary" id="panel0">
		<div class="panel-heading">
			<h4 class="panel-title">SOLICITUDES</h4>
		</div>
		<div class="panel-body">
			<!-- ------------------------------------------------->
			 
			<table>
			<tr> 
			<td>
			<div class="form-group">
				<label class="control-label">Solicitud</label>
				<div  id="formato" class="input-group">
				<!-- div de duplicacion de inputs search -->
				</div>
			</div>
			</td>
			<td>
			  
			</td>
			</tr>
			</table>
			
			<!-- ---------------------------------------------------- -->
			<div class="list-group">
				<a class="list-group-item" href="#">
					<h4 class="list-group-item-heading">Nota:</h4>
					<p class="list-group-item-text">La búsqueda se deberá realizar
						ingresando el número de solicitud,tal como se registró
						inicialmente en el sistema.</p>
				</a>
			</div>
			<!-- ------------------------------------------------------------ -->
			<table id="example" class="table table-striped table-bordered" border="1 cellspacing="0" width="100%" cellpadding="0">
				<thead>
					<tr>
						<th style="display: none;">id</th>
						<th>N° FUT</th>
						
					 <%if(usuario.getArea().equals("1") || usuario.getArea().equals("6") ){ %>
					 
						<th>Expediente</th>
					  <%} %>
					
					 <% if(!usuario.getArea().equals("6")){%>	
						<th>Solicitante</th>
					 <%}%>	
						<th>Motivo</th>
						<th>Fecha de Solicitud</th>
						<th>Estado</th>
						<th>Detalles</th>
						
						
					</tr>
				</thead>
				<tbody>
				  <% for(FutBean bean:listafut){ %>
					<tr>
						<td style="display: none;"><%= bean.getIdSolicitud() %></td>
						<td><%= bean.getCodSoli() %></td>
						
						 <%if(usuario.getArea().equals("1") || usuario.getArea().equals("6")){ %>
							 <%if(bean.getCodExpe()==null){%>
								 <td>No Registrado</td>
							  <%}else{ %>
								 <td><%=bean.getCodExpe() %></td>
							  <%} %>
						<%}%>	
						
						<% if(!usuario.getArea().equals("6")){%>
						<td><%=bean.getSolicitante() %></td>
						<%}%>
						
						
						<td><%= bean.getMotivo()%></td>
						<td><%=bean.getFechaini() %></td>
						<% if(bean.getEstado().equals("Pendiente")){%>
						<td><label class="label label-warning">Pendiente</label> </td>
						<%}else if(bean.getEstado().equals("Asignado")){ %>
						<td><label class="label label-warning">Asignado</label></td>
						<%}else if(bean.getEstado().equals("Aprobado")){ %>
						<td><label class="label label-success">Aprobado</label></td>
						<%}else if(bean.getEstado().equals("Rechazado")){ %>
						<td><label class="label label-danger">Rechazado</label></td>
						<%}else if(bean.getEstado().equals("Registrado")){ %>
						<td><label class="label label-info">Registrado</label></td>
						<%}else{%>
						<td><label class="label label-default">Pre-Registrado</label></td>
						<%} %>
						
						<% if(usuario.getArea().equals("6")){%>
						<td><a id="mostrarDetaExt" class="label label-primary detallext" href="#">Mostrar</a></td>
						<%}else{%>
						<td><a class="mostrarDetaInt label label-primary" href="inDetaSolicitud.jsp">Mostrar</a></td>
						<%}%>
					</tr>
					<% } %>

				</tbody>
			</table>
			<!-- ----------------------- -->
				<!-- ---------------------------------------------------- -->
			<div class="list-group">
				<a class="list-group-item" href="#">
					<h4 class="list-group-item-heading">Nota:</h4>
					<p class="list-group-item-text">La búsqueda se deberá realizar
						ingresando el número de solicitud,tal como se registró en el sistema.</p>
				</a>
			</div>
			<!-- ------------------------------------------------------------ -->
		</div>
		<!-- End Body-->
	</div> <!-- End Panel -->
  <!-- </div> fin contenderoCU -->	
	
	
	<!--------------------------------------------------------------------------------------------------------><div class="panel panel-primary" id="panel1">
 <div class="panel-heading">DATOS DE LA SOLICITUD - F.U.T</div>
  <div class="panel-body">
    	<!-- -------------------------------------------------->
			<div class="list-group" style="text-align:center;">
				<a class="list-group-item" href="#">
					<h4 class="list-group-item-heading"  id="tituloDeta"></h4>
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
						<td><label>Codigo Contribuyente:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>
						<input id="codCont" type="text" class="form-control input-sm" placeholder="Codigo Contribuyente">
						</td>
						<td><label>&nbsp;&nbsp;&nbsp;Estado:</label>&nbsp;&nbsp;&nbsp;</td>
						<td>
						<select id="cboEstado" class="form-control input-sm btn-default cboEstado" name="cboEstado">
							<option value="1">Pendiente</option>
							<option value="2" ><span class="help-block">Asignado</span></option>
							<option value="3"><span class="help-block">Aprobado</span></option>
							<option value="4"><span class="help-block">Rechazado</span></option>
							<option value="5"><span class="help-block">Registrado</span></option>
						</select>
						</td>
				</tr>
				<tr><td></br></td></tr>
				<tr>
					<td><label>DNI Contribuyente:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>
						<input id="dni" type="text" class="form-control input-sm" placeholder=" DNI ">
					</td>
					<td><label>&nbsp;&nbsp;&nbsp;Medio Atención:</label>&nbsp;&nbsp;&nbsp;</td>
					<td>
						<input id="medio" type="text" class="form-control input-sm" placeholder="Online/Presencial" required>
					</td>	
				</tr>
				<tr class="tercero"><td></br></td></tr>
				<tr>
					<td><label>Nombre y Apellidos:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input id="nombres" type="text" class="form-control input-sm" placeholder="Nombre Completo"></td>
					<td><label>&nbsp;&nbsp;&nbsp;Correo:</label>&nbsp;&nbsp;&nbsp;</td>
					<td><input id="correo" type="text"  size="40" class="form-control input-sm" placeholder="Correo Electrónico"></td>
				</tr>
				<tr><td></br></td></tr>
				<tr>
					<td><label>Motivo/Tramite:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input id="motivoSol" type="text"  size="40" class="form-control input-sm" placeholder="Tipo de Tramite"></td>
					<td><label>&nbsp;&nbsp;&nbsp;Entidad:</label>&nbsp;&nbsp;&nbsp;</td>
					<td><input id="entidad" type="text"  size="40" class="form-control input-sm" placeholder="Entidad Representada"></td>
				</tr>
				<tr><td></br></td></tr>
				<tr><td><label class="obs">Fundamentación:</label></td></tr>
				<tr>
				  <td colspan="2">
			      <textarea class="form-control" rows="3" id="textArea"></textarea>
			      <span class="help-block">Especifique claramente el motivo de su solicitud.</span>
			      </td>
			      <td colspan="2" style="text-align:left;vertical-align:top;">
			      	&nbsp;&nbsp;&nbsp;&nbsp;
				 	<a href="javascript:alert('Se envió nótificación por correo al contribuyente');" class="btn btn-primary">Enviar Mail ></a>
				 	&nbsp;&nbsp;&nbsp;
					<a id="btnGenerarExp" href="#" class="btn btn-primary">&nbsp;&nbsp;Guardar&nbsp;&nbsp;&nbsp;</a>
					&nbsp;&nbsp;&nbsp;
					<a onclick="$('#panel1').hide();$('#panel0').show();" href="ServletFutListar" class="btn btn-default">&nbsp;&nbsp;Cancelar&nbsp;&nbsp;&nbsp;</a>
				  </td>
				</tr>
				</table>
		
		</form>
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
			   		<td>&nbsp;&nbsp;<i class="glyphicon glyphicon-remove">&nbsp;&nbsp;!</i></td>
			    	<td><a style="font-size:12px;" class="label label-danger" >Mostrar</a></td>
				</tr>
				<tr>
					<td>2</td>
			  		<td><a href="#">Recibo Reclamado</a></td>
			   		<td>&nbsp;&nbsp;<i class="glyphicon glyphicon-ok">&nbsp;&nbsp;OK</i></td>
			    	<td><a style="font-size:12px;" class="label label-success">Mostrar</a></td>
				</tr>
				<tr>
					<td>3</td>
			  		<td><a href="#">Copia de DNI</a></td>
			   		<td>&nbsp;&nbsp;<i class="glyphicon glyphicon-ok">&nbsp;&nbsp;OK</i></td>
			    	<td><a style="font-size:12px;" class="label label-success">Mostrar</a></td>
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
<!-- ----END PANEL SECUNDARY---- -->
  </div>
<!-- ---END PANEL PRINIPAL----- -->
<!-- ------------Show Message Modal------------ -->
<div id="generarExp" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <div class="modal-header">
    	<h4 class="modal-title">¿Desea Generar Expediente?</h4>
    </div>
    <form action="">
      <div class="modal-body" style="text-align: right;">
         <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
         <a id="generaExpe" class="btn btn-primary ">Si</a>
     </form>
      </div>
    </div>
  </div>
  <!-- ---End Modal Generar Expediente -->
<!-------------------------------------------------------------------------------------------------------->

</body>
</html>
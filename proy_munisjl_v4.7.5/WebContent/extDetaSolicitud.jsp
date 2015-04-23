<%@page import="pe.gob.munisjl.java.bean.FutBean"%>
<%@page import="java.util.List"%>
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
<script src="js/datatable/datatable.js"></script>
<script src="js/datatable/jquery.dataTables.min.js"></script>
<script src="js/datatable/dataTables.bootstrap.js"></script>
<% List<FutBean> fut=(List)session.getAttribute("detallext");%>
<%! FutBean bean=new FutBean();%>
<%
for(FutBean futBean : fut) {
	bean.setCodSoli(futBean.getCodSoli());
	bean.setIdSolicitud(futBean.getIdSolicitud());
	bean.setFechaini(futBean.getFechaini());
	bean.setMotivo(futBean.getMotivo());
	if(futBean.getCodExpe()==null){
	  bean.setCodExpe("No Registrado");
	}else{
		bean.setCodExpe(futBean.getCodExpe());
	}
	if(futBean.getFundamentacion()==null){
		bean.setFundamentacion("Sin Observaciones");
	}else{
		bean.setFundamentacion(futBean.getFundamentacion());
	}
	
}
%>  


<script type="text/javascript">

$(document).ready(function() {
	/* ocultar buscadores del table */
	$('.dataTables_length').hide();
	$('.dataTables_filter').hide();
	/*mostrar historial*/
	var btnHistorial=$('#historial');
	btnHistorial.on('click',function(){
		var idsolicitud=<%=bean.getIdSolicitud()%>;
		var pnlhistorial=$('#divHistorial');
		pnlhistorial.show('slow');
		btnHistorial.hide();
		verHistorialfut(idsolicitud);
		$('#ocultar').show();
	});
	
	/*ocultar historial*/
	var btnOcultar=$('#ocultar');
	btnOcultar.on('click',function(){
	var pnlhistorial=$('#divHistorial');
		pnlhistorial.hide('slow');
		btnOcultar.hide();
		btnHistorial.show();
	});
	
 
	/* Evento con Mouse en Tabla */
	
	var table = $('#example').DataTable();
    
    $('#example tbody').on( 'click', 'tr', function () {
    	
        if ( $(this).hasClass('selected active') ) {
            $(this).removeClass('selected active');
        }
        else {
            table.$('tr.selected').removeClass('selected active');
            $(this).addClass('selected active');
        }
    } );
    /*
    $('#example tbody').on( 'dblclick', 'tr', function () {
    	
        if ( $(this).hasClass('selected active') ) {
            $(this).removeClass('selected active');
        }
        else {
            table.$('tr.selected').removeClass('selected active');
            $(this).addClass('selected active');
          //----------------------------
            var dato1=$(".selected td")[0].innerHTML;
            var dato2=$(".selected td")[1].innerHTML;
            var dato3=$(".selected td")[2].innerHTML;
            var dato4=$(".selected td")[3].innerHTML;
            var dato5=$(".selected td")[4].innerHTML;
    		alert('Item:'+dato1 +'\narea evaluadora: '+dato2+'\nfecha: '+dato3);
        }
    } );*/
    /* fin evento mouse en tabla  */
	function verHistorialfut(id){
    	$.ajax({
    		url:'ServletFutCRUD',
    		type:'post',
    		datatype:'json',
    		data:{accion:'historial',id:id},
    		success:function(resultado){
    			var json=eval('{'+resultado+'}');
    			var h=$('.historial tbody');
    			for(var i in json){
    				var html='<tr><td>'+json[i].codSoli+'</td><td>'+
		    		json[i].codExpe+'</td><td>'+json[i].accionH+'</td><td>'+
		    		json[i].entidad+'</td><td>'+json[i].fechaini+'</td>'+
		    		'<td>'+json[i].fundamentacion+'</td>'+'<td>'+json[i].usermodificador+'</td>';
    				if(json[i].accionH=='Actualizado Pendiente'){
		    			html=html+'<td><label class="label label-warning">Pendiente</label></td>';
		    		}else if(json[i].accionH=='Registro'){
			    			html=html+'<td><label class="label label-info">Registrado</label></td>';
			    	}else if(json[i].accionH=='Actualizado Rechazado'){
			    			html=html+'<td><label class="label label-danger">Rechazado</label></td>';
			    	}else{
			    			html=html+'<td><label class="label label-success">Aprobado</label></td>';
			    	 }
			    	 h.append(html+'</tr>');
		    		}
    			}
    			
    	});
    }
    
} );
</script>
</head>

<body>
<%@include file="header.jsp" %>
<div id="contendedorCU">

	<div class="panel panel-primary">
		<div class="panel-heading">
			<h4 class="panel-title">Detalle de Solicitud</h4>
		</div>
		<div class="panel-body">
	<!-- ----------formulario registro fut-------------------->
	<div class="list-group" style="text-align:left;">
		<div class="list-group-item">
			<h4 class="list-group-item-heading" style="text-align:left;">Detalle:</h4>
			</br>
			<table>
				<tr>
					<td><label>N° Solicitud:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="text"  size="40" class="form-control" placeholder="N° Solicitud" readonly="readonly" value="<%=bean.getCodSoli() %>" ></td>
					<td><label>&nbsp;&nbsp;&nbsp;Fecha:</label>&nbsp;&nbsp;&nbsp;</td>
					<td><input type="text"  size="40" class="form-control" placeholder="Fecha inicio" readonly="readonly" value="<%=bean.getFechaini() %>" ></td>
				</tr>
				<tr><td></br></td></tr>
				<tr>
					<td><label>Motivo Tramite:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="text"  size="40" class="form-control" placeholder="Motivo Tramite" readonly="readonly" value="<%=bean.getMotivo()%>"></td>
					<td></td>
					<td></td>
				</tr>
			<!--  -->
				<tr><td></br></td></tr>
				<tr>
					<td><label>N° Expediente:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="text"  size="40" class="form-control" placeholder="N° Expediente:" readonly="readonly" value="<%=bean.getCodExpe()%>"></td>
					<td></td>
					<td></td>
				</tr>
				<tr><td></br></td></tr>
				<tr><td><label>Observación:</label> </td></tr>
				<tr>
				  <td colspan="4">
			      <textarea class="form-control" rows="3" id="textArea" readonly="readonly"><%=bean.getFundamentacion()%></textarea>
			     <span class="help-block"><!--  Descripción.--></span>
			      </td>
				</tr>
				</table>
				<div style="text-align: right;">
				<button id="historial" class="btn btn-warning">Ver Historial</button>
				<button id="ocultar" class="btn btn-warning" style="display: none;">Ocultar Historial</button>
			 	&nbsp;<a href="ServletFutListar" class="btn btn-default">Volver</a>
			 	</div>
		</div>
	</div>
	</div>
		<!-- End Body-->
	</div> <!-- End Panel -->
	
<div id=divHistorial class="panel panel-default" style="display: none;">
  <div class="panel-heading">
    <h4 class="panel-title"><label>Historial de Atención</label></h4>
  </div>
  <div class="panel-body">
    <!-- ----------------------------------------------------------- -->
			<table id="example" class="historial table table-striped table-bordered" border="1 cellspacing="0" width="100%" cellpadding="0">
				<thead>
					<tr>
						<th>N° Expediente</th>
						<th>FUT</th>
						<th>Accion</th>
						<th>Entidad</th>
						<th>Fecha de Actualización</th>
						<th>Observaciones</th>
						<th>Usuario</th>
						<th>Estado</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>Gerencia de Rentas</td>
						<td>Gerencia de Rentas</td>
						<td>Gerencia de Rentas</td>
						<td>10/10/2014</td>
						<td>Gerencia de Rentas</td>
						<td>Gerencia de Rentas</td>
						<td><label class="label label-warning">Pendiente</label> </td>
					</tr>
					<!-- 
					<tr>
						<td>2</td>
						<td>Fiscalización Tributaria</td>
						<td>10/10/2014</td>
						<td><label class="label label-warning">Pendiente</label> </td>
						<td><a class="label label-primary" href="#">Mostrar</a></td>
					</tr>
					<tr>
						<td>3</td>
						<td>Tecnico rentas</td>
						<td>10/10/2014</td>
						<td><label class="label label-danger">Rechazado</label> </td>
						<td><a class="label label-primary" href="#">Mostrar</a></td>
					</tr>
					<tr>
						<td>4</td>
						<td>Column content</td>
						<td>10/10/2014</td>
						<td><label class="label label-warning">Pendiente</label> </td>
						<td><a class="label label-primary" href="#">Mostrar</a></td>
					</tr>
					<tr>
						<td>5</td>
						<td>Column content</td>
						<td>10/10/2014</td>
						<td><label class="label label-warning">Pendiente</label> </td>
						<td><a class="label label-primary" href="#">Mostrar</a></td>
					</tr>
					<tr>
						<td>6</td>
						<td>Column content</td>
						<td>10/10/2014</td>
						<td><label class="label label-success">Aprobado</label> </td>
						<td><a class="label label-primary" href="#">Mostrar</a></td>
					</tr>
					<tr>
						<td>7</td>
						<td>Column content</td>
						<td>10/10/2014</td>
						<td><label class="label label-success">Aprobado</label> </td>
						<td><a class="label label-primary" href="#">Mostrar</a></td>
					</tr>
					<tr>
						<td>8</td>
						<td>Column content</td>
						<td>10/10/2014</td>
						<td><label class="label label-warning">Pendiente</label> </td>
						<td><a class="label label-primary" href="#">Mostrar</a></td>
					</tr>
					<tr>
						<td>9</td>
						<td>Column content</td>
						<td>10/10/2014</td>
						<td><label class="label label-success">Aprobado</label> </td>
						<td><a class="label label-primary" href="#">Mostrar</a></td>
					</tr>
					<tr>
						<td>10</td>
						<td>Column content</td>
						<td>10/10/2014</td>
						<td><label class="label label-warning">Pendiente</label> </td>
						<td><a class="label label-primary" href="#">Mostrar</a></td>
					</tr>
					<tr>
						<td>11</td>
						<td>Column content</td>
						<td>Column content</td>
						<td><label class="label label-success">Aprobado</label> </td>
						<td><a class="label label-primary" href="#">Mostrar</a></td>
					</tr>
					<tr>
						<td>12</td>
						<td>Column content</td>
						<td>10/10/2014</td>
						<td><label class="label label-warning">Pendiente</label> </td>
						<td><a class="label label-primary" href="#">Mostrar</a></td>
					</tr>
					<tr>
						<td>13</td>
						<td>Column content</td>
						<td>10/10/2014</td>
						<td><label class="label label-success">Aprobado</label> </td>
						<td><a class="label label-primary" href="#">Mostrar</a></td>
					</tr>
					<tr>
						<td>14</td>
						<td>Column content</td>
						<td>10/1/2010</td>
						<td><label class="label label-success">Aprobado</label> </td>
						<td><a class="label label-primary" href="#">Mostrar</a></td>
					</tr>
					<tr>
						<td>15</td>
						<td>Column content</td>
						<td>10/10/2013</td>
						<td><label class="label label-warning">Pendiente</label> </td>
						<td><a class="label label-primary" href="#">Mostrar</a></td>
					</tr>
					<tr>
						<td>16</td>
						<td>Column content</td>
						<td>10/10/2014</td>
						<td><label class="label label-warning">Pendiente</label> </td>
						<td><a class="label label-primary" href="#">Mostrar</a></td>
					</tr>----------------------- -->
				</tbody>
			</table>
			
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
</div>

</div>
</body>
</html>
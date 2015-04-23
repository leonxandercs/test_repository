<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>Home - Municipalidad Distrital de SJL portada</title>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/stylepage.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet" >
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<style type="text/css">
	#cont{
		margin-left: 15%;
		margin-right:15%;
		margin-bottom:5%;
	}
</style>
<script>
$(document).ready(function(){
	
	$('#requisitos').hide();
	$('#devolucion').hide();
	$('#compensacion').hide();
	$('#tramites').hide();
	
	$('#listatramites').click(function(){
		$('#cont').hide();
		$('#compensacion').hide();
		$('#requisitos').hide();
		$('#devolucion').hide();
		$('#tramites').show();
	});
	
	$('#portada').click(function(){
		$('#cont').show();
		$('#tramites').hide();
	});
	
	
	$('li').click(function(){
		$.each($('li'),function(){
			$(this).removeClass('active');
		});
		$(this).addClass('active');
	});
	
	$('#rq1').click(function(){
		$('#tramites').hide();
		$('#compensacion').hide();
		$('#requisitos').show();
		$('#devolucion').show();
	});
	
	$('#rq2').click(function(){
		$('#tramites').hide();
		$('#devolucion').hide();
		$('#requisitos').show();
		$('#compensacion').show();
	});
	
});
</script>
</head>
<body>
<%@include file="reutilizables/cabe.jsp" %>
<!--- ---------------------- -->
	<div class="subnavbar">
		<div class="subnavbar-inner">
			<div class="container">
				<ul class="mainnav">
				<li class="dropdown active"><a id="portada" href="javascript:;"><i></i><span>PORTADA</span> <b class="caret"></b></a>
				<li class="dropdown"><a href="javascript:;"><i></i><span>DISTRITO</span> <b class="caret"></b></a>
				<li class="dropdown"><a href="javascript:;"><i></i><span>MUNICIPALIDAD</span> <b class="caret"></b></a>
				<li class="dropdown"><a id="listatramites" href="javascript:;"><i></i><span>TRAMITES Y SERVICIOS</span> <b class="caret"></b></a>
				<li class="dropdown"><a href="javascript:;"><i></i><span>OBRAS</span> <b class="caret"></b></a>
				<li class="dropdown"><a href="javascript:;"><i></i><span>TRANSPARENCIA</span> <b class="caret"></b></a>
				<li class="dropdown"><a href="javascript:;"><i></i><span>CONSULTAS ONLINE</span><b class="caret"></b></a>
				</ul>
			</div>
		</div>

<!--- ------------------------>
<div id="contendedorCU">

<div id="cont">
<img alt="" src="img/portal.JPG">
</div>
	
<div id="tramites" class="panel panel-primary">
		<div class="panel-heading">
			<h2 class="panel-title">Tramites y Servicio</h2>
		</div>
		<div class="panel-body" style="background-color:#DCE0E4;">
	<table>
	<tr>
	<th>
		<a id="rq1" href="#" class="btn btn-link"><strong>Devolución de pago en exceso o indebido Tributario y No Tributario</strong></a></br>
		<a id="rq2" href="#" class="btn btn-link"><strong>Compensación de pago en exceso o indebido Tributario</strong></a></br>
		<a href="#" class="btn btn-link">Presentación de Declaración Jurada - Inscripción de Propietario en calidad de Contribuyente</a></br>
		<a href="#" class="btn btn-link">Presentación de Declaración Jurada - Inscripción de Propietario en calidad de Contribuyente</a></br>
		<a href="#" class="btn btn-link">Presentación de Declaración Jurada - Inscripción de Posesionario en calidad de responsable</a></br>
		<a href="#" class="btn btn-link">Presentación de Declaración Jurada - Inscripción de Predio Anexo</a></br>
		<a href="#" class="btn btn-link">Presentación de Declaración Jurada - Aumento de Valor</a></br>
		<a href="#" class="btn btn-link">Presentación de Declaración Jurada - Disminución de Valor</a></br>
		<a href="#" class="btn btn-link">Presentación de Declaración Jurada - Rectificación de datos de identificación del predio</a></br>
		<a href="#" class="btn btn-link">Presentación de Declaración Jurada - Rectificación de datos del Contribuyente</a></br>
		<a href="#" class="btn btn-link">Baja del Registro de Contribuyente</a></br>
		<a href="#" class="btn btn-link">Baja del Registro de Predio</a></br>
		<a href="#" class="btn btn-link">Prescripción en materia Tributaria</a></br>
		<a href="#" class="btn btn-link">Duplicado de Declaración Jurada de autoevalúo</a></br>
		<a href="#" class="btn btn-link">Descargo de pagos no registrados en el Sistema Integral de Gestión Municipal</a></br>
		<a href="#" class="btn btn-link">Anulación de registro de código de contribuyente</a></br>
		<a href="#" class="btn btn-link">Constancia de Contribuyente</a></br>
		<a href="#" class="btn btn-link">Emisión de Estados de Cuenta Corriente, resumidos y detallados y data básica del predio</a></br>
		<a href="#" class="btn btn-link">Constancia certificada de inafectación de Alcabala para transferencias realizadas anteriores al año 2002</a></br>
	</th>
  <th>
<div style="background-image: url('img/muni.jpg'); background-size:cover; width:400px;">
<h1>&nbsp;</br>
&nbsp;</br>
&nbsp;</br>
&nbsp;</br>
&nbsp;</br>
&nbsp;</br>
&nbsp;</br>
&nbsp;</br></h1>
</div>
</br>
<div style="background-image: url('img/parque.jpg'); background-size:cover; width:400px;">
<h1>&nbsp;</br>
&nbsp;</br>
&nbsp;</br>
&nbsp;</br>
&nbsp;</br>
&nbsp;</br>
&nbsp;</br>
&nbsp;</br></h1>
</th>
</tr>

</table>
</div>
</div>

<!-- ---------------------------  -->
<div id="requisitos" class="panel panel-primary">
		<div class="panel-heading">
			<h2 class="panel-title">TRAMITES</h2>
		</div>
		<div class="panel-body">
			<table style="margin-left:20%;margin-right:40%;">
				<tr>
					<td><img id="compensacion" src="img/compensacion.jpg">
					<img id="devolucion"  src="img/devolucion.jpg"></td>
				</tr>
				<tr>
					<td><a href="#myModal" class="btn btn-success" data-toggle="modal" style="float:right;">Iniciar Tramite</a></td>
				</tr>
			</table>
		</div></div>
</br></br></br></br>
</div>
<!-- ------------Login Modal------------ -->

<div class="modal fade" id="myModal" role="dialog" ria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
    	<h4>Login de Usuario</h4>
    </div>
    <div class="modal-body">
    	<form action="ServletAuthenticate">
	    	<label>Usuario:</label>
	    	<input type="text" class="form-control" name="username"/></br>
	    	<label>Password:</label>
	    	<input type="password" class="form-control" name="password"/></br>
	    	
	    	<button type="submit" class="btn btn-success">Ingresar</button>&nbsp;&nbsp;
	    	<button type="reset" class="btn btn-info">Limpiar</button>
	    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    	</form>
    	
    </div>
    
    <div class="modal-footer">
      <span style="float:left;" ><a href="register.jsp">Registrarme</a></span>
      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      
    </div>
  </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->

</div>
<!-- ------------Login Modal------------ -->
</div>


</body>
</html>
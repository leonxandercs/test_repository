<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home - Municipalidad Distrital de SJL</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/stylepage.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet" >
<!--  <link href="css/animate.css" rel="stylesheet" >-->
<!-- ------CHarts-------------- -->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/chart/chart.by.alex.js"></script>
<link rel="stylesheet" href="css/jqxchart/styles/jqx.base.css" type="text/css" />
<script src="js/chart/jqxcore.js"></script>
<script src="js/chart/jqxdata.js"></script>
<script src="js/chart/jqxdraw.js"></script>
<script src="js/chart/jqxchart.core.js"></script>
<!--No se importa para no causar conflicto con el header
<script src="js/chart/highcharts.js"></script>
<script src="js/chart/modules/exporting.js"></script>
-->
<style type="text/css">
${demo.css}
</style>

<script>
$(document).ready(function(){

 	function printContent(el){
 		var restorepage=document.body.innerHTML;
 		var printcontent=document.getElementById(el).innerHTML;
 		document.body.innerHTML=printcontent;
 		window.print();
 		document.body.innerHTML=restorepage;
 	}
	
			
		$('#print').click(function(){
			printContent('contendedorCU');
		});
}); 
</script>
<body>
	<%@include file="header.jsp"%>
	<div id="contendedorCU">
	<div style="text-align: right;">
		<h2>
		  <a id="print" href="#" class="btn btn-default">
			<i class="glyphicon glyphicon glyphicon-print"></i>
		  </a> 
		</h2>
   	</div>
	 <div class="panel panel-default">
		<div class="panel panel-body">
	<div class="panel panel-default">
	<div class="panel panel-heading">
		<h4>
			<i class="glyphicon glyphicon glyphicon-stats"></i>&nbsp;&nbsp;
			&nbsp;&nbsp;<strong>Cantidad de Pagos, FUT's y Expedientes Registrados</strong>
		</h4>
	</div>
	<!-- /widget-header -->
	<div class="panel panel-body">
		<h6 style="margin-left:2%;">
			Año:
			<select name="año" id="año" style="width:60px;" title="Seleccione un departamento">
				<option value="2013">2013</option>
				<option value="2014">2014</option>
				<option value="2015">2015</option>
			</select>&nbsp;
			Desde:
			<select name="inicio" id="inicio" style="width: 120px;" title="Seleccione un departamento">
				<option value="1">Enero</option>
				<option value="2">Febrero</option>
				<option value="3">Marzo</option>
				<option value="4">Abril</option>
				<option value="5">Mayo</option>
				<option value="6">Junio</option>
				<option value="7">Julio</option>
				<option value="8">Agosto</option>
				<option value="9">Septiembre</option>
				<option value="10">Octubre</option>
				<option value="11">Noviembre</option>
				<option value="12">Diciembre</option>
			</select>&nbsp;
			Hasta:
			<select name="fin" id="fin" style="width: 120px;" title="Seleccione un departamento">
				<option value="1">Enero</option>
				<option value="2">Febrero</option>
				<option value="3">Marzo</option>
				<option value="4">Abril</option>
				<option value="5">Mayo</option>
				<option value="6">Junio</option>
				<option value="7">Julio</option>
				<option value="8">Agosto</option>
				<option value="9">Septiembre</option>
				<option value="10">Octubre</option>
				<option value="11">Noviembre</option>
				<option value="12">Diciembre</option>
			</select>
			&nbsp;&nbsp;
			<input class="btn btn-primary" type="submit" value="Reportar" id="btnReport1">
		</h6>
			<div id='chartContainer' class="chartContainer" 
			style="width:900px;margin-left:2%;height:400px;" >
			</div>
		</div>
	</div>
<!-- ---------------------------------- -->	
	<div class="panel panel-default">
	<div class="panel panel-heading">
	<h4>
	<i class="glyphicon glyphicon glyphicon-stats"></i>&nbsp;&nbsp;
	&nbsp;&nbsp;<strong>Cuadro Comparativo - FUT y Expedientes</strong>
	</h4>
	</div>
	<div class="panel panel-body">
		<h6 style="margin-left:2%;">
			Año:
			<select name="año2" id="año2" style="width:60px;" title="Seleccione un departamento">
				<option value="2013">2013</option>
				<option value="2014">2014</option>
				<option value="2015">2015</option>
			</select>&nbsp;
			Desde:
			<select name="inicio2" id="inicio2" style="width: 120px;" title="Seleccione un departamento">
				<option value="1">Enero</option>
				<option value="2">Febrero</option>
				<option value="3">Marzo</option>
				<option value="4">Abril</option>
				<option value="5">Mayo</option>
				<option value="6">Junio</option>
				<option value="7">Julio</option>
				<option value="8">Agosto</option>
				<option value="9">Septiembre</option>
				<option value="10">Octubre</option>
				<option value="11">Noviembre</option>
				<option value="12">Diciembre</option>
			</select>&nbsp;
			Hasta:
			<select name="fin2" id="fin2" style="width: 120px;" title="Seleccione un departamento">
				<option value="1">Enero</option>
				<option value="2">Febrero</option>
				<option value="3">Marzo</option>
				<option value="4">Abril</option>
				<option value="5">Mayo</option>
				<option value="6">Junio</option>
				<option value="7">Julio</option>
				<option value="8">Agosto</option>
				<option value="9">Septiembre</option>
				<option value="10">Octubre</option>
				<option value="11">Noviembre</option>
				<option value="12">Diciembre</option>
			</select>
			&nbsp;&nbsp;
			<input class="btn btn-primary" type="submit" value="Reportar" id="btnReport2">
		</h6>
		<div id="chart2" style="width:1000px; height: 400px; margin: 0 2">
		</div>
		
	</div>
	</div>
<!-- ------------------------------------------- -->
	<div class="panel panel-default">
	<div class="panel panel-heading">
	<h4>
	<i class="glyphicon glyphicon glyphicon-stats"></i>&nbsp;&nbsp;
	&nbsp;&nbsp;<strong>Cuadro de Expedientes</strong>
	</h4>
	</div>
	<div class="panel panel-body">		
		<div id="chart3" style="width:1000px; height:450px; margin: 0 2">
		</div>
		
	</div>
	</div>

<!-- ------------------------------------------- -->	
</div>
</div>
</div>
</body>
</html>
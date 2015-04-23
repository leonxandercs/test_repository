<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Highcharts Example</title>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/stylepage.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet" >
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.1.0/animate.min.css" media="all" rel="stylesheet">
<!--  <link href="css/animate.css" rel="stylesheet" >-->
<script src="js/bootstrap.js"></script>
<!-- import --- datatables -->
<!-- ------CHarts-------------- -->
<script src="js/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="css/jqxchart/styles/jqx.base.css" type="text/css" />
<script src="js/chart/jqxcore.js"></script>
<script src="js/chart/jqxdata.js"></script>
<script src="js/chart/jqxdraw.js"></script>
<script src="js/chart/jqxchart.core.js"></script>
<script src="js/chart/highcharts.js"></script>
<script src="js/chart/modules/exporting.js"></script>

<style type="text/css">
${demo.css}
</style>

<script>
$(document).ready(function(){

	/**-------------------------------------**/
		 var options = {
		chart: {
			type: 'areaspline',
			renderTo: 'container'
		},
		title: {
			text: []
		},
		xAxis: {
			categories: [],
			plotBands: [{ // visualize the weekend
		           from: 4.5,
		           to: 6.5,
		           color: 'rgba(68, 170, 213, .2)'
		       }]
		},
		yAxis: {
			title: {
			text: 'Unidades'
		}
		},
		tooltip: {
		          shared: true,
		          valueSuffix: ' unidades'
		      },
		      credits: {
		          enabled: false
		      },
		      plotOptions: {
		          areaspline: {
		              fillOpacity: 0.5
		          }
		      },
		series: []
		};
	//-----------------------------------------
		$('#btnReport2').click(function() {
			
			//obteniendo datos de los combos
		    var inicio=$('#inicio2').val();
			var fin=$('#fin2').val();
			var year=$('#año2').val();
			console.log(inicio);console.log(fin);console.log(year);
			alert('Generando Reporte');
			$.ajax({
				url:'ServletChart2',
				type:'get',
				datatype:'json',
				data:{ini:inicio,fin:fin,year:year},//enviamos datos al servlet
				success:function(resultado){
				var myObject=eval('{'+resultado+'}');
					imprimeGrafica(myObject,'chart2',year);
				}
					
			});
		});
	/*-------------------------------------*/
		function imprimeGrafica(json,div,year){
		
			options.chart.renderTo=div;
			options.chart.type='areaspline';
			options.title.text="Cantidad de FUTs y Expedientes Registrados en el año "+year;
			
			options.xAxis.categories=[];
			
			for(var i in json)
			{
				var m=(json[i].mes).substring(0,1).toUpperCase();
				var s=(json[i].mes).substring(1,(json[i].mes.length));
				options.xAxis.categories.push(m+s);
			}
		
			options.series=[];
			var seriesOptions1;
			var seriesOptions2;
			seriesOptions1={name:"FUT 's",data:[]};
			seriesOptions2={name:'Expedientes',data:[]};
			
			for(var i=0;i<json.length;i++){
				seriesOptions1.data.push(json[i].fut);
				seriesOptions2.data.push(json[i].expediente);
			};
			
			options.series.push(seriesOptions1);
			options.series.push(seriesOptions2);
			
			var chart = new Highcharts.Chart(options);
				
	  }

});
</script>
</head>
	<body>

		<div class="panel panel-default">
	<div class="panel panel-heading">
	<h4>
	<i class="glyphicon glyphicon glyphicon-stats"></i>&nbsp;&nbsp;
	&nbsp;&nbsp;<strong>Cantidad de Pagos, FUT's y Expedientes Registrados</strong>
	</h4>
	</div>
	<div class="panel panle-body">
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
		<div id="chart2" style="width:1000px; height: 400px; margin: 0 auto">
		</div>
	</div>
	</div>
</body>
</html>
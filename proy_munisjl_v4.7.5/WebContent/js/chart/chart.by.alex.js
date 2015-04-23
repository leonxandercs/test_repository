$(document).ready(function(){
	
	chart1(1,12,'2014');
	chart2(1,12,'2014');
	chart3();
	
	 var options = { /**--Metodo para Configurar Chart-----------------**/
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
/******* CHART 3******************************************************************/		 
	 
 function chart3(){
		 
	$.ajax({
		url:'ServletChart3',
		type:'get',
		datatype:'json',
		data:{ini:1,fin:12},//enviamos datos al servlet
		success:function(resultado){
		var myObject=eval('{'+resultado+'}');
			var datos=[];
		  for(var i in myObject){
	          if(myObject[i].estado=='Aprobado'){
	        	  datos.push(
		       			  { 
		       				name:myObject[i].estado,
		                    y:myObject[i].expedientes,
		                    sliced: true,
		                    selected: true
		                  }	  
		        	  );
	          }else{
	        	  datos.push([myObject[i].estado,myObject[i].expedientes]);
	          }
	       }
		  
			/*
		    Highcharts.getOptions().plotOptions.pie.colors = (function () {
		        var colors = [],
		            base = Highcharts.getOptions().colors[0],
		            i;
	
		        for (i = 0; i < 10; i += 1) {
		            // Start out with a darkened base color (negative brighten), and end
		            // up with a much brighter color
		            colors.push(Highcharts.Color(base).brighten((i - 3) / 7).get());
		        }
		        return colors;
		    }());
	        */
	        
	        
			// Radialize the colors Tema DArk
			Highcharts.getOptions().plotOptions.pie.colors = Highcharts.map(Highcharts.getOptions().colors,function (color) {
					        return {
					            radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
					            stops: [
					                [0, color],
					                [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
					            ]
					        };
			});
		    	        
		    // Build the chart
		    $('#chart3').highcharts({
		        chart: {
		            plotBackgroundColor: null,
		            plotBorderWidth: null,
		            plotShadow: false
		        },
		        title: {
		            text: 'Expedientes Según su Estado, 2014'
		        },
		        tooltip: {
		            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		        },
		        plotOptions: {
		            pie: {
		                allowPointSelect: true,
		                cursor: 'pointer',
		                dataLabels: {
		                    enabled: true,
		                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
		                    style: {
		                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
		                    },
		                    connectorColor: 'silver'
		                    
		                },
		        		showInLegend: true //habilita_el_legen_del_chart
		            }
		        },
		        
		       series:[{
		            type: 'pie',
		            name: 'de 500 Expedientes',
		            data:datos/* [
		                ['NO GENERADOS',   45.0],
		                ['RECHAZADOS',       26.8],
		                {
		                    name: 'APROBADOS',
		                    y: 12.8,
		                    sliced: true,
		                    selected: true
		                },
		                ['PENDIENTES',     6.2],
		                ['CANCELADOS',   0.7]
		            ]*/
	        }]
	    });
	}
		
		});
	 }
	 
/******* CHART 2******************************************************************/	
		$('#btnReport2').click(function() {
			//obteniendo datos de los combos
		    var inicio=$('#inicio2').val();
			var fin=$('#fin2').val();
			var year=$('#año2').val();
			console.log(inicio);console.log(fin);console.log(year);
			alert('Generando Reporte');
			chart2(inicio,fin,year);
		});
  //-----------------------------------------	
		function chart2(inicio,fin,year){
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
		}
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
/******* CHART 1******************************************************************/
		
		$('#btnReport1').click(function() {
			//obteniendo datos de los combos
		    var inicio=$('#inicio').val();
			var fin=$('#fin').val();
			var year=$('#año').val();
			console.log(inicio);console.log(fin);console.log(year);
			alert('Generando Reporte 1');
			chart1(inicio,fin,year);
		 });

		
		function chart1(inicio,fin,year){
			$.ajax({//metodo asincrono que permite acceder al servidor por medio de un objeto XMLHttpRequest (manda una peticion al servidor de varios tipos(json,xml o html))                       
				url :'ServletChart',
				type : 'get',
				datatype : 'json',
				data:{ //enviamos datos al servlet
					year:year,
					inicio:inicio,
					fin:fin
					},
				success : function(resultado) {
					var myObject = eval('{' + resultado + '}');
					// prepare jqxChart settings
					var settings = {
						title : "Cantidad de Pagos, FUT's y Expedientes Registrados en el año "+year,
						description : "Contribuyentes que iniciaron los Tramites",
						enableAnimations : true,
						showLegend : true,
						padding : {
							left : 5,
							top : 5,
							right : 5,
							bottom : 5
						},
						titlePadding : {
							left : 90,
							top : 0,
							right : 0,
							bottom : 10
						},
						source :myObject,/*Enviamos  el  obj que contiene los datos*/

						xAxis : {
							dataField : 'mes', /*atributo dia del bean*/
							showTickMarks : true,
							tickMarksInterval : 1,
							tickMarksColor : '#888888',
							unitInterval : 1,
							showGridLines : false,
							gridLinesInterval : 1,
							gridLinesColor : '#888888',
							axisSize : 'auto'
						},
						colorScheme : 'scheme02',//color tema scheme05-scheme02
						seriesGroups : [ {
							type : 'splinearea',
							valueAxis : {
								unitInterval : 10,
								minValue : 0,
								maxValue : 100,
								displayValueAxis : false,
								description : 'Cantidad de Contribuyentes',
								axisSize : 'auto',
								tickMarksColor : '#888888'
							},
							series : [/*atributo contirbuyente del bean*/
							{
								dataField : 'contribuyente',
								displayText : 'Contribuyentes',
								opacity : 0.7
							} ]
						}, {
							type : 'stackedcolumn',
							columnsGapPercent : 100,
							seriesGapPercent : 5,
							valueAxis : {
								unitInterval : 15,//intervalo de losindicadores y
								minValue : 0,
								maxValue :155, //maximo valor y
								displayValueAxis : true,
								description : 'Cantidad en Base decimal',
								axisSize : 'auto',
								tickMarksColor : '#888888',
								gridLinesColor : '#777777'
							},
							series : [/*atributos del bean*/
							{
								dataField : 'pagos',
								displayText : 'Pagos'
							}, {
								dataField : 'solicitudes',
								displayText : 'Solicitudes'
							}, {
								dataField : 'expedientes',
								displayText : 'Expedientes'
							} ]
						} ]
					};

					// setup the chart
					$('.chartContainer').jqxChart(settings);
				}
			});
		}
		
		
});


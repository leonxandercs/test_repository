<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home - Municipalidad Distrital de SJL</title>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/stylepage.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/demos.js"></script>
<script type="text/javascript" src="js/chart/jqxcore.js"></script>
<script type="text/javascript" src="js/jqxinput.js"></script>
<!-- import --- datatables -->
<link href="//cdn.datatables.net/1.10.4/css/jquery.dataTables.css" rel="stylesheet">
<link href="//cdn.datatables.net/plug-ins/9dcbecd42ad/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">
<script src="js/datatable/datatable.js"></script>
<script src="js/datatable/jquery.dataTables.min.js"></script>
<script src="js/datatable/dataTables.bootstrap.js"></script>
<!-- -----import --- validation---->
<script src="js/jquery.validate.js"></script> 
<script src="js/additional-methods.js"></script>
<script src="js/messages_es.js"></script>
<script src="js/jquery.ajaxfileupload.js"></script>
<!-- ---------------------------------------------------------------------------- -->   
<%! PersonaBean person=new PersonaBean();%>
<% person=(PersonaBean) session.getAttribute("usuario_logueado");%>
<!-- ---------------------------------------------------------------------------- -->   
<script type="text/javascript">
$(document).ready(function(){
	
	<%if(person.getArea().equals("6")){%>
		$('#frmFUTIn').hide();
		$('#frmFUText').show();
	<% }else{ %>
		$('#frmFUText').hide();
		$('#frmFUTIn').show();
	<% } %>
	
	$('.btnContinuar1').click(function(){
		$('#paso1').hide();
		$('#paso3').hide();
		$('#paso2').show();
		return false;
	});
	
	$('#btnContinuar2').click(function(evento){
		$('#paso1').hide();
		$('#paso2').hide();
		
		var  codCnt=$('#txtCodContribuyente').val();
		var idPago=$('#nOperacion').data('idPago');
		var tram;
		
		if($('.comboTramite').eq(0).val()>0){
			tram=$('.comboTramite').eq(0).val();
		}else{
			tram=$('.comboTramite').eq(1).val();
		}
		var fundamento;
		
		if ($('.textArea').eq(0).val()!='') {
			fundamento=$('.textArea').eq(0).val();
		} else {
			fundamento=$('.textArea').eq(1).val();
		}
		
		var  nomCnt=$('#txtNomContribuyente').val();
		var dni=$('#txtDNI').val();
		var entidad=$('#txtEntidad').val();
		
		$.ajax({
			url:'ServletFutCRUD',
			type:'post',
			data:{accion:'crea',codCnt:codCnt,idPago:idPago,tram:tram,fundamento:fundamento}
		}).done(function( msg ){
			var rs=[];
			rs=msg.split(',');
			if (rs[0]!='0') {
				alert('Error al Registrar Ya existen datos con el Pago: '+rs[1]);
				//document.location.href = document.location.href;
				document.location.href ='Paso1.jsp';
				/*$('#paso2').hide();
				$('#paso3').hide();
				$('#paso1').show();
				$('#frmFUT *').prop('disabled', true);
				$('#btnContinuar').addClass('disabled');
				$(':input[type=text]').val('');
				$('#nOperacion').prop('disabled',false);*/
			}else{
				$('#paso3').show();
				$('#futgenerado').html(rs[2]);
				alert( "Registro Correco FUT: " + rs[2] );
		    }
	     });

		
		console.log("codigo:"+codCnt);
		console.log(nomCnt);
		console.log(dni);
		console.log(entidad);
		console.log("pago :"+idPago);
		console.log("tramite"+tram);
		console.log(fundamento);
		
	});
	
	$('#paso2').hide();
	$('#paso3').hide();
	
	var nomContribuyentes=new Array();
	var codContribuyentes=new Array();
	dataContribuyentes(nomContribuyentes,codContribuyentes);
	
	// desabilitando todos elementos dentro de tag <div>
	$('.formulario *').prop('disabled', true);
	$('#btnContinuar').addClass('disabled');

	//busca caracteres que no sean espacio en blanco en una cadena
	 function vacio(q) {
       for ( i=0; i < q.length; i++ ) {
             if ( q.charAt(i) != " " ) {
                return true;
             }
       }
       return false
	}
	//valida que el campo no este vacio y no tenga solo espacios en blanco
	function valida() {
	       if( vacio($('#nOperacion').val()) == false) {
                alert("Ingrese n° Válido")
                $('#nOperacion').val('');
                return false
	        }else if($('#nOperacion').val().length>12){
	        	alert("Máximo 12 digitos")
	        	$('#nOperacion').val('');
                return false
	        }else if($('#nOperacion').val().length<10){
	        	alert("Minimo 10 digitos")
	        	$('#nOperacion').val('');
                return false
	        }else if(isNaN($('#nOperacion').val())){
	        	alert("Ingrese sólo números")
	        	$('#nOperacion').val('');
                return false
	        }else {
	        	if($('.agencia').is(':checked')){
	        		return true;
	        	}else{
		  			alert('Seleccione la Entidad donde Realizado el Pago');
		  			return false;
				}
	        }
	}

	function validado(){
	  $('#nOperacion').prop('disabled',true);
	  $('.agencia').prop('disabled',true);
	  $('.formulario *').removeAttr('disabled');
	  $('#btnContinuar').removeClass('disabled');
	  $('#btnValidar').hide();
	  var combo=$('.comboTramite');
	  comboTramite();
	}
	
	function cargar(){
		var $btn = $('#btnValidar');
	    $btn.button('loading');
	    // simulating a timeout
	    setTimeout(function () {
	        $btn.button('reset');
	    }, 1000);
	}

	function validarPago(){
		var ent=-1;	
		var ope=$('#nOperacion').val();
		
		if($('#agencia1').is(':checked')){
			ent=$('#agencia1').val();
		}else{
		    ent=$('#agencia0').val();
		}
		
		$.ajax({
				url:'ServletFutCRUD',
				type:'get',
				datatype:'json',
				data:{entidad:ent,noperacion:ope},
				success:function(resultado){
				  pago=eval('{'+resultado+'}');
				  if(pago!=0 && pago!=null && pago!=''){
					  validado();
					  $('#nOperacion').data("idPago",pago);
				   }
				  else{
						alert('N° de Operación inválido');
						$('#nOperacion').val('');
					}
				}
			  });
			
	}
	
	$('#btnValidar').click(function(){
		if(valida()){
			if($('.agencia').is(':checked')){
				  cargar();
				  setTimeout(function(){
				  validarPago();
				  }, 1000);
				}
		}
	});
//----------------------------------------------------------

	function comboTramite(){
		var combo=$('.comboTramite');  
		//$('#comboTramite').css('font-size','12px');
		$.ajax({ 
			url:'ServletCombo',
			type:'get',
			datatype:'json',
			success:function(resultado){
			 var json=eval('{'+resultado+'}');
			 combo.append('<option value=0>Selecciona un item</option>');
			  for(var i=0;i<json.length;i++){
				 combo.append('<option value='+json[i].idTramite+'>'+json[i].nomTramite+'</option>');
				//combo.options[combo.length]=new Option(json[i].nomTramite,json[i].idTramite);
			  }
			}
		});
	
	}

	function dataContribuyentes(arreglo1,arreglo2){

		$.ajax({
			
			url:'ServletInput',
			type:'get',
			datatype:'json',
			success:function(resultado){
			myObject=eval('{'+resultado+'}');

			for(var i in myObject){
				arreglo1.push(myObject[i].idPersona+"-"+myObject[i].nombre+" "+myObject[i].ape_pa);
				arreglo2.push(myObject[i].codigo);
			 }

			$("#txtNomContribuyente").jqxInput({
				disabled:true,
				source:arreglo1
			});

			$("#txtCodContribuyente").jqxInput({
				// height: 25, width: 200, minLength: 1,
				disabled:true,  
				source:arreglo2
			});
			
		   }
		});		
		$(':input').css({
			'font-size':'12px',
			'font-family': 'inherit'
			});
		$('#txtNomContribuyente').css({
			'font-size':'13px',
			'font-family': 'inherit'
			});
	}
	
	$('.tercero').hide();
  	
	
	$(".rdTercero").click(function(){  
        if($(this).is(':checked')) {
        	$('.tercero').show();
        }else { 
        	$('.tercero').hide();
        }  
    }); 
	
	 $('input[type="file"]').ajaxfileupload({
	      'action': 'UploadFile',
	  'onComplete': function(response) {	        
	        $('#upload').hide();
	        alert("Archivo Cargado!!");
	      },
	      'onStart': function() {
	        $('#upload').show(); 
	      }
	 });


});
</script>

</head>
<body>
<%@include file="header.jsp" %>
<div id="contendedorCU">

<div class="panel panel-primary" id="paso1" >
<div class="panel-heading">REGISTRAR FUT</div>
  <div class="panel-body">
    	<!-- -------------------------------------------------->
			<div class="list-group" style="text-align: center;">
				<a class="list-group-item" href="#">
					<h4 class="list-group-item-heading">FORMULARIO UNICO DE TRAMITE</h4>
				</a>
			</div>
			<!-- ----------------------------------------------------------- -->

<div class="panel panel-default">
 <!-- <div class="panel-heading">
  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pagina en Proceso
  </div>-->
  <div class="panel-body">
	<!-- ---------------- -->
	<ul class="nav nav-tabs">
	  <li role="presentation" class="active"><a href="#">PASO 1</a></li>
	  <li role="presentation" class="disabled"><a href="#">PASO 2</a></li>
	  <li role="presentation" class="disabled"><a href="#">MENSAJE</a></li>
	</ul>
	<!-- ---END TABS----- -->
	</br>
  	<!-- -------------validar voucher----------------->
		<table>
		<tr>
		<td><label class="list-group-item-heading">&nbsp;&nbsp;N° Operación:</label>&nbsp;&nbsp;</td>
		<td><input id="nOperacion" name="nOperacion" type="text"  size="40" class="form-control input-sm"></td>
		<!--<td><input id="idPago" type="text"></td>-->
		<td>&nbsp;&nbsp;&nbsp;<button id="btnValidar" type="button" class="btn btn-success" data-loading-text="Validando..." autocomplete="off" >Validar</button></td>
		<fieldset>
              <td>&nbsp;&nbsp;
              <input type="radio" id="agencia1" class="agencia" name="agencia" value="1" />&nbsp;<i>Banco de Nacion</i>&nbsp;&nbsp;
              <input type="radio" id="agencia0" class="agencia" name="agencia" value="0" />&nbsp;<i>Interno</i>
              </td>
        </fieldset>
		</tr>
		</table></br>	
		
<!-- ----------formulario registro fut-------------------->
	<div id="frmFUTIn" class="formulario list-group" style="text-align:left;">
		<div class="list-group-item">
			<h4 class="list-group-item-heading" style="text-align:left;">Detalle:</h4>
			<div style="text-align: right; margin-right:80px;">
			        	<fieldset>
			             &nbsp;&nbsp;&nbsp;<input class="rdTercero" type="checkbox"/>&nbsp;<i class="txtSolicitante">Tercero</i>&nbsp;&nbsp;
			            </fieldset>
			</div>
			</br>
			<!--  <form action="" class="regfutpaso1">-->
			<table>
			<tr class="tercero">
					<td><label>DNI Solictante:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="input-group" width="310">
					<div class="input-group form-group">
					<span class="input-group-addon"><a href="#"><i class="glyphicon glyphicon-search"></i></a></span>
					<input type="text" class="form-control input-sm" placeholder=" DNI Tercero" id="txtDNITercero" name="txtDNITercero" >
					</div>
					</td>
					<td class="tercero"><label>&nbsp;&nbsp;&nbsp;Solicitante:</label>&nbsp;&nbsp;&nbsp;</td>
					<td class="tercero">
					<div class="form-group"><input type="text" class="form-control input-sm" placeholder="Nombre Completo de Tercero" id="txtnSolicitante" name="txtnSolicitante" ></div>
					</td>	
				</tr>
				<tr class="tercero"><td></br></td></tr>
				
				<tr>
					
						<td><label>Codigo Contribuyente:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="input-group" width="310">
						<div class="input-group form-group">
						<span class="input-group-addon"><a href="#"><i class="glyphicon glyphicon-search"></i></a></span>
						<input type="text" class="form-control input-sm" placeholder="Codigo Contribuyente" id="txtCodContribuyente" name="txtCodContribuyente" >
						</div>	
						</td>
					
				</tr>
				
				<tr><td></br></td></tr>
				<tr>
					<td><label>Nombre Contribuyente:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><div class="form-group"><input type="text" class="form-control input-sm" placeholder="Nombre Completo" id="txtNomContribuyente" name="txtNomContribuyente"></div></td>
					<td><label>&nbsp;&nbsp;&nbsp;DNI/RUC:</label>&nbsp;&nbsp;&nbsp;</td>
					<td><div class="form-group"><input type="text"  size="40" class="form-control input-sm" placeholder="Tipo de Documento" id="txtDNI" name="txtDNI" ></div></td>
				</tr>
				<tr><td></br></td></tr>
				<tr>
				
				<td><label>Motivo/Tramite:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>
						<select class="form-control input-sm comboTramite" style="width:310px;font-size:15px;">
						</select>
					</td>
				<td><label>&nbsp;&nbsp;&nbsp;Entidad:</label>&nbsp;&nbsp;&nbsp;</td>
				<td><div class="form-group"><input type="text"  size="40" class="form-control input-sm" placeholder="Entidad Representada" id="txtEntidad"  name="txtEntidad" ></div></td>
				</tr>
				<tr><td></br></td></tr>
				<tr><td><label>Fundamentación:</label> </td></tr>
				<tr>
				  <td colspan="4">
			      <textarea class="form-control textArea" rows="3"></textarea>
			      <span class="help-block">Especifique claramente el motivo de su solicitud.</span>
			      </td>
				</tr>
				</table>
				<div style="text-align: right;">
				<!--
				<a id="btnContinuar" href="paso2.jsp" class="btn btn-primary">Continuar ></a>  -->
				<input class="btnContinuar1 btn btn-primary" type="submit" value="Continuar"></input>
			 	</div>
	<!-- 	</form>
			 <!-- END Form  -->
		</div>
	</div>
	<!-- ----------------------------------------------------------- -->
	
	
	
		<!-- ----------formulario registro fut-------------------->
	<div id="frmFUText" class="formulario list-group" style="text-align:left;">
		<div class="list-group-item">
			<h4 class="list-group-item-heading" style="text-align:left;">Detalle:</h4>
			</br>
			<table>
				<tr>
					<td><label>Solcitante:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="text"  size="40" class="form-control input-sm" 
					placeholder="Nombre Completo" value="<%=person.getFullname()%>"></td>
					<td><label>&nbsp;&nbsp;&nbsp;DNI/RUC:</label>&nbsp;&nbsp;&nbsp;</td>
					<td><input type="text"  size="40" class="form-control input-sm" placeholder="Tipo de Documento" value="<%=person.getDni()%>"></td>
				</tr>
				<tr><td></br></td></tr>
				<tr>
					<td><label>Motivo/Tramite:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>
						<select class="form-control input-sm comboTramite" style="width:310px;font-size:15px;">
						</select>
					</td>
					<td><label>&nbsp;&nbsp;&nbsp;Entidad:</label>&nbsp;&nbsp;&nbsp;</td>
					<td><input type="text"  size="40" class="form-control input-sm" placeholder="Entidad Representada" value="Ninguna"></td>
				</tr>
			<!--  -->
				<tr><td></br></td></tr>
				<tr><td><label>Fundamentación:</label> </td></tr>
				<tr>
				  <td colspan="4">
			      <textarea class="form-control textArea" rows="3"></textarea>
			      <span class="help-block">Especifique claramente el motivo de su solicitud.</span>
			      </td>
				</tr>
				</table>
				<div style="text-align: right;">
				<button  class="btnContinuar1 btn btn-primary">Continuar ></button>
			 	</div>
				
				
			<!--  -->
			 
			 <!-- END PANEL FOOTER  -->
		</div>
	</div>
	<!-- ----------------------------------------------------------- -->
	
	
</div>
<!-- END PANEL BODY  -->
</div>
<!-- ----END PANEL SECUNDARY---- -->
  </div>
</div>
<!-- ---END PANEL PRINIPAL----- -->

<!-- ----------------------------------------------------------------------------------------------- -->

<div class="panel panel-primary" id="paso2">
<div class="panel-heading">REGISTRAR FUT</div>
  <div class="panel-body">
    	<!-- -------------------------------------------------->
			<div class="list-group" style="text-align: center;">
				<a class="list-group-item" href="#">
					<h4 class="list-group-item-heading">FORMULARIO UNICO DE TRAMITE</h4>
				</a>
			</div>
			<!-- ----------------------------------------------------------- -->

<div class="panel panel-default">
 <!-- <div class="panel-heading">
  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pagina en Proceso
  </div>-->
  <div class="panel-body">
	<!-- ---------------- -->
	<ul class="nav nav-tabs">
	  <li role="presentation" class="disabled"><a href="#">PASO 1</a></li>
	  <li role="presentation" class="active"><a href="#">PASO 2</a></li>
	  <li role="presentation" class="disabled"><a href="#">MENSAJE</a></li>
	</ul>
	<!-- ---END TABS----- -->

<!-- ----------formulario registro fut-------------------->
	<div class="list-group" style="text-align:left;">
		<div class="list-group-item">
			<h4 class="list-group-item-heading" style="text-align: left;">Documentos:</h4></br>

	<p>Requisitos:</p>
		<table style="border-collapse: separate;border-spacing: 3px 15px;">
			<tr>
				<td><a href="#">DNI</a></td>
				<td>&nbsp;&nbsp;<i class="glyphicon glyphicon-ok">&nbsp;&nbsp;</i></td>
				<td><label>Cargar&nbsp;&nbsp;&nbsp;</label></td>
				<td><input type="file"  name="datafile"></td>
				<div id="upload" style="display:none;">Cargando..</div>
			</tr>
			<tr>
				<td><a href="#">Recibo Reclamado</a></td>
				<td>&nbsp;&nbsp;<i class="glyphicon glyphicon-ok"></i></td>
				<td><label>Cargar</label></td>
				<td><input type="file"  name="datafile"></td>
				<div id="upload" style="display:none;">Cargando..</div>
			</tr>
			<tr>
				<td><a href="#">Solicitud al Alcalde</a></td>
				<td>&nbsp;&nbsp;<i class="glyphicon glyphicon-ok"></i></td>
				<td><label>Cargar</label></td>
				<td><input type="file"  name="datafile"></td>
				<div id="upload" style="display:none;">Cargando..</div>
			</tr>
		</table>
		</br>
		<input type="submit" class="btn btn-primary" value="Editar">&nbsp;&nbsp;
		<input type="submit" class="btn btn-primary" value="Guardar">&nbsp;&nbsp;
		<input type="submit" class="btn btn-primary" value="Cancelar">
	
		<div style="text-align: right;">
				<button id="btnContinuar2" class="btn btn-primary">Continuar ></button>
		</div>
				
				
			<!--  -->
			 
			 <!-- END PANEL FOOTER  -->
		</div>
	</div>
	<!-- ----------------------------------------------------------- -->
</div>
<!-- END PANEL BODY  -->
</div>
<!-- ----END PANEL SECUNDARY---- -->
  </div>
</div>

<!-- ----------------------------------------------------------------------------------------------- -->
<div class="panel panel-primary" id="paso3">
<div class="panel-heading">REGISTRAR FUT</div>
  <div class="panel-body">
    	<!-- -------------------------------------------------->
			<div class="list-group" style="text-align: center;">
				<a class="list-group-item" href="#">
					<h4 class="list-group-item-heading">FORMULARIO UNICO DE TRAMITE</h4>
				</a>
			</div>
			<!-- ----------------------------------------------------------- -->

<div class="panel panel-default">
 <!-- <div class="panel-heading">
  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pagina en Proceso
  </div>-->
  <div class="panel-body">
	<!-- ---------------- -->
	<ul class="nav nav-tabs">
	  <li role="presentation" class="disabled"><a href="#">PASO 1</a></li>
	  <li role="presentation" class="disabled"><a href="#">PASO 2</a></li>
	  <li role="presentation" class="active"><a href="#">MENSAJE</a></li>
	</ul>
	<!-- ---END TABS----- -->
	</br>
	<div class="list-group-item alert alert-success" role="alert">
	<h4><label>Solicitud Registrada</label></h4></br>
	Codigo:&nbsp;<label id="futgenerado"></label></br></br>
	<!-- -------------------------------------------------->
			<fieldset class="alert alert-success">
				<h4 class="list-group-item-heading">¡ Aviso legal !</h4>
				<p>Su Solicitud será evaluada luego de las 12 horas  de haberse registrado,
				por políticas internas de seguridad.
				Por favor guardar su código de FUT (solicitud) para cualquier consulta ó reclamo
				con respecto a esta.</p>
			</fieldset>
			<label>&nbsp;Gracias!</label>
	<!-- ----------------------------------------------------------- -->
			<%
			if(person.getArea().equals("1") || person.getArea().equals("2")){ 
				System.out.println("area admin: "+person.getArea());
			%>
			<div style="text-align: right;"><a class="btn btn-success" href="ServletFutListar">Cerrar</a></div>
			<%
			}else{
				System.out.println("area other: "+person.getArea());
			%>
			<div style="text-align: right;"><a class="btn btn-success" href="ServletFutListar">Cerrar</a></div>
			<%
			}
			%>
	<!-- ----------------------------------------------------------- -->
	</div>
</div>
</div>
<!-- ----END PANEL SECUNDARY---- -->
  </div>
</div>
<!-- ----------------------------------------------------------------------------------------------- -->
</div>
</body>
</html>
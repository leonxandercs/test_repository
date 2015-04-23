<%@page import="java.util.List"%>
<%@page import="pe.gob.munisjl.java.bean.PersonaBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>Home - Municipalidad Distrital de SJL</title>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/stylepage.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet" >
<script src="js/jquery-1.11.1.min.js"></script>
<%PersonaBean user=(PersonaBean)session.getAttribute("usuario_logueado");%>
<%!String enlace=""; %>
<% if(user.getArea().equals("6")){enlace="Paso1.jsp";}else{enlace="Paso1.jsp";} %>
</head>
<body>
<%@include file="header.jsp" %>
<div id="contendedorCU">
	
<div class="panel panel-primary">
		<div class="panel-heading">
			<h2 class="panel-title">Tramites y Servicio</h2>
		</div>
		<div class="panel-body" style="background-color:#DCE0E4;">
	<table>
	<tr>
	<th>
		<a href=<%=enlace%> class="btn btn-link"><strong>Devoluci�n de pago en exceso o indebido Tributario y No Tributario</strong></a></br>
		<a href=<%=enlace%> class="btn btn-link"><strong>Compensaci�n de pago en exceso o indebido Tributario</strong></a></br>
		<a href="#" class="btn btn-link">Presentaci�n de Declaraci�n Jurada - Inscripci�n de Propietario en calidad de Contribuyente</a></br>
		<a href="#" class="btn btn-link">Presentaci�n de Declaraci�n Jurada - Inscripci�n de Propietario en calidad de Contribuyente</a></br>
		<a href="#" class="btn btn-link">Presentaci�n de Declaraci�n Jurada - Inscripci�n de Posesionario en calidad de responsable</a></br>
		<a href="#" class="btn btn-link">Presentaci�n de Declaraci�n Jurada - Inscripci�n de Predio Anexo</a></br>
		<a href="#" class="btn btn-link">Presentaci�n de Declaraci�n Jurada - Aumento de Valor</a></br>
		<a href="#" class="btn btn-link">Presentaci�n de Declaraci�n Jurada - Disminuci�n de Valor</a></br>
		<a href="#" class="btn btn-link">Presentaci�n de Declaraci�n Jurada - Rectificaci�n de datos de identificaci�n del predio</a></br>
		<a href="#" class="btn btn-link">Presentaci�n de Declaraci�n Jurada - Rectificaci�n de datos del Contribuyente</a></br>
		<a href="#" class="btn btn-link">Baja del Registro de Contribuyente</a></br>
		<a href="#" class="btn btn-link">Baja del Registro de Predio</a></br>
		<a href="#" class="btn btn-link">Prescripci�n en materia Tributaria</a></br>
		<a href="#" class="btn btn-link">Duplicado de Declaraci�n Jurada de autoeval�o</a></br>
		<a href="#" class="btn btn-link">Descargo de pagos no registrados en el Sistema Integral de Gesti�n Municipal</a></br>
		<a href="#" class="btn btn-link">Anulaci�n de registro de c�digo de contribuyente</a></br>
		<a href="#" class="btn btn-link">Constancia de Contribuyente</a></br>
		<a href="#" class="btn btn-link">Emisi�n de Estados de Cuenta Corriente, resumidos y detallados y data b�sica del predio</a></br>
		<a href="#" class="btn btn-link">Constancia certificada de inafectaci�n de Alcabala para transferencias realizadas anteriores al a�o 2002</a></br>
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
</div>


</body>
</html>
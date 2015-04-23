<%-- 
- Author(s):Alexander Chavez Simbron
- Date: 27/12/14
- Copyright Notice:
- @(#)
- Description: 
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>Home - Municipalidad Distrital de SJL</title>
<!--
<link href="css/style.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
-->
<script>
$(document).ready(function(){
	$('li').click(function(){
		$.each($('li'),function(){
			$(this).removeClass('active');
		});
		$(this).addClass('active');
	});
	
});
</script>
</head>

 <!-- ---------------------------------------------------------------------------------------------------- -->
<body>

<div class="subnavbar">
  <div class="subnavbar-inner">
    <div class="container">
      <ul class="mainnav" style="margin-left: 15%;">
      <li class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="glyphicon glyphicon-list"></i><span>Tramites</span> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="docs/tupa-actualizado-2014.pdf">Requisitos</a></li>
            <li><a href="#">Devolución</a></li>
            <li><a href="#">Reclamos</a></li>
            <li><a href="#">Declaraciones Juradas</a></li>
            <li><a href="#">Resoluciones</a></li>
            <li><a href="#">Horarios de Atención</a></li>
            </ul>
        </li>
        <li class="dropdown active"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="glyphicon glyphicon-edit"></i><span>Registro</span> <b class="caret"></b></a>
          <ul class="dropdown-menu">
          	<li><a href="#">Pago</a></li>
          	<li><a href="paso1.jsp">F.U.T	(solicitud)</a></li>
            <li><a href="ConsultarExpediente.jsp">Expediente</a></li>
            <li><a href="#">Cliente</a></li>
          </ul>
        </li>
        <li><a href="#"><i class="glyphicon glyphicon-list-alt"></i><span>Reportes</span> </a> </li>
        <li><a href="#"><i class="glyphicon glyphicon-user"></i><span>App Tour</span> </a></li>
        <li><a href="#"><i class="glyphicon glyphicon glyphicon-stats"></i><span>Charts</span> </a> </li>
        <li class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="glyphicon glyphicon-search"></i><span>Buscar</span> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="extConsultarSolicitud.jsp">F.U.T	(Solicitud)</a></li>
            <li><a href="ConsultarExpediente.jsp">Expediente</a></li>
            <li><a href="#">Informe Técnico Legal</a></li>
            <li><a href="#">Informe Técnico</a></li>
            <li><a href="#">Resolución</a></li>
          </ul>
        </li>
        <li class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="glyphicon glyphicon-arrow-down"></i><span>Mantenimiento</span> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="mantenerContribuyente.jsp">Contribuyentes</a></li>
            <li><a href="mantenerEmpleado.jsp">Empleados</a></li>
            <li><a href="mantenerTramite.jsp">Tramites</a></li>
            <li><a href="tests/mantener.jsp">demo</a></li>
          </ul>
        </li>
      </ul>
    </div>
    <!-- /container --> 
  </div>
  <!-- /subnavbar-inner --> 
</div>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/stylepage.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet" >
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.js"></script>
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
<body>
<%//@include file="reutilizables/cabe.jsp" %>
<!-- -------------------------------------------------------------------------------- -->
	<div class="subnavbar">
		<div class="subnavbar-inner">
			<div class="container">
				<ul class="mainnav">
				<li class="dropdown"><a href="Portada.jsp"><i></i><span>PORTADA</span> <b class="caret"></b></a>
				<li class="dropdown"><a href="javascript:;"><i></i><span>DISTRITO</span> <b class="caret"></b></a>
				<li class="dropdown"><a href="javascript:;"><i></i><span>MUNICIPALIDAD</span> <b class="caret"></b></a>
				<li class="dropdown active"><a href="tramites.jsp"><i></i><span>TRAMITES Y SERVICIOS</span> <b class="caret"></b></a>
				<li class="dropdown"><a href="javascript:;"><i></i><span>OBRAS</span> <b class="caret"></b></a>
				<li class="dropdown"><a href="javascript:;"><i></i><span>TRANSPARENCIA</span> <b class="caret"></b></a>
				<li class="dropdown"><a href="javascript:;"><i></i><span>CONSULTAS ONLINE</span><b class="caret"></b></a>
				</ul>
			</div>
		</div>
<!-- -------------------------------------------------------------------------------- -->
<div id="contendedorCU">
<div class="panel panel-primary">
		<div class="panel-heading">
			<h2 class="panel-title">TRAMITES</h2>
		</div>
		<div class="panel-body">
			<table style="margin-left:20%;margin-right:40%;">
				<tr>
					<td><img id="compensacion" src="img/compensacion.jpg""></td>
					<td><img id="devolucion"  src="img/devolucion.jpg""></td>
				</tr>
				<tr>
					<td><a href="#myModal" class="btn btn-success" data-toggle="modal" style="float:right;">Iniciar Tramite</a></td>
				</tr>
			</table>
		</div></div>
</br></br></br></br>

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
      <span style="float:left;" ><a href="#">Registrarme</a></span>
      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      
    </div>
  </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->

</div>
<!-- ------------Login Modal------------ -->

</body>
</html>
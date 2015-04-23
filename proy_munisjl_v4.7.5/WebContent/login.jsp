<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>Login - Municipalidad Distrital de SJL</title>

<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
	rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<link href="css/signin.css" rel="stylesheet" type="text/css">

</head>
<!-- ---------------------------------------------------------------------------- -->
<script>
	
<%Integer failed = null;
			failed = (Integer) request.getAttribute("failed_account");
			if (failed != null) {%>
	alert('Sus credenciales no son correctas');
<%}%>
	
</script>
<!-- ---------------------------------------------------------------------------- -->
<body>
	<%@include file="reutilizables/cabe.jsp"%>
	
	<div class="account-container">

		<div class="content clearfix">

			<form action="ServletAuthenticate" method="post" id="formlogin">

				<h1>Ingreso al Sistema</h1>
				</br>
				<div class="login-fields">
				  <p>Por favor proporcione sus datos</p>

					<div class="field">
						<label for="username">Username</label>
						<div class="input-group">
						    <span class="input-group-addon" id="basic-addon1">
							<i class="glyphicon glyphicon-user"></i></span> 
							<input type="text" id="username" name="username" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
						</div>
					</div>
					<!-- /field -->
					</br>
					<div class="field">
						<label for="password">Password:</label>
						<div class="input-group">
							<span class="input-group-addon" id="basic-addon1">
							<i class="glyphicon glyphicon-lock"></i></span> 
							<input type="password" id="password" name="password" class="form-control" placeholder="Password" aria-describedby="basic-addon1">
						</div>
					</div>
					<!-- /password -->
					</div>
				<!-- /login-fields -->

				<div class="login-actions">
					<span></br>&nbsp; <input id="Field" name="Field" type="checkbox"
						class="field login-checkbox" value="First Choice" tabindex="4" />
						<label class="choice" for="Field">No cerrar sesión</label></span>

					<!-- <button class="button btn btn-success btn-large">Entrar</button> -->
					<input type="submit" class="button btn btn-success btn-large"
						value="Entrar" />
				</div>
				<!-- .actions -->
			</form>
			<!-- Formulario -->
		</div>
		<!-- /content -->
	</div>
	<!-- /account-container -->



	<div class="login-extra">
		<a href="#">Resetar Password</a>
	</div>
	<!-- /login-extra -->

</body>
</html>
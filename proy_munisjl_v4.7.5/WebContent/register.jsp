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
	
</script>
<!-- ---------------------------------------------------------------------------- -->
<body>
	<%@include file="reutilizables/cabe.jsp"%>
	
		<div class="account-container register">
			
			<div class="content clearfix">
				
				<form action="#" method="post">
				
					<h1>Registrarse acceder</h1>			
					
					<div class="login-fields">
						
						<p>Activa tu cuenta ahora:</p>
						
						<div class="field">
							<label for="firstname">First Name:</label>
							<input type="text" id="firstname" name="firstname" value="" placeholder="Código Contribuyente" class="login" />
						</div> <!-- /field -->
						
						<div class="field">
							<label for="lastname">usuario:</label>	
							<input type="text" id="lastname" name="lastname" value="" placeholder="nombre de usuario" class="login" />
						</div> <!-- /field -->
						
						
						<div class="field">
							<label for="email">Correo:</label>
							<input type="text" id="email" name="email" value="" placeholder="Correo" class="login"/>
						</div> <!-- /field -->
						
						<div class="field">
							<label for="password">Password:</label>
							<input type="password" id="password" name="password" value="" placeholder="Password" class="login"/>
						</div> <!-- /field -->
						
						<div class="field">
							<label for="confirm_password">Confirm Password:</label>
							<input type="password" id="confirm_password" name="confirm_password" value="" placeholder="Confirm Password" class="login"/>
						</div> <!-- /field -->
						
					</div> <!-- /login-fields -->
					
					<div class="login-actions">
						
						<span class="login-checkbox">
							<input id="Field" name="Field" type="checkbox" class="field login-checkbox" value="First Choice" tabindex="4" />
							<label class="choice" for="Field">Agree with the Terms & Conditions.</label>
						</span>
											
						<button class="button btn btn-primary btn-large">Register</button>
						
					</div> <!-- .actions -->
					
				</form>
				
			</div> <!-- /content -->
			
		</div> <!-- /account-container -->
		
		
		<!-- Text Under Box -->
		<div class="login-extra">
			Ya tienes una cuenta? <a href="login.jsp">Ingresa con tu cuenta</a>
		</div> <!-- /login-extra -->

</body>
</html>
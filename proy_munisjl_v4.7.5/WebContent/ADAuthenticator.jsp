======== Authenticator Active Directory =======
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Ad Authenticator</title>
</head>
<body>

	<form action="ServletADAuthenticator" method="post">
		<table border="0">
			<tr>
				<td colspan="2">Login here</td>
			</tr>
			<tr>
				<td>Username</td>
				<td><input type="text" name="user"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="submit" value="Login"></td>
			</tr>
		</table>
	</form>


</body>
</html>
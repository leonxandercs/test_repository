======== Buscar User Active Directory =======
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consulting LDAP</title>
</head>
<body>

	<form action="ServletADSearch">
		<table>
			<tr>
				<td>Usuario:</td>
				<td><input type="text" name="userbuscado"></td>
				<td><input type="submit" value="buscarAD" name="accion" />
				<td><input type="submit" value="buscarBD" name="accion" />
				<td><input type="hidden" value="buscar" name="x" />
			</tr>
		</table>
	</form>

</body>
</html>
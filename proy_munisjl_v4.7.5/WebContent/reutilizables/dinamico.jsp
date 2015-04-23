<%@page import="pe.gob.munisjl.daofactory.MenuDAO"%>
<%@page import="pe.gob.munisjl.java.util.ConexionDB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>Home - Municipalidad Distrital de SJL</title>

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
<%String menu=(String)session.getAttribute("menu");%>

<body>
	<%out.print(menu);%>

</body>
</html>
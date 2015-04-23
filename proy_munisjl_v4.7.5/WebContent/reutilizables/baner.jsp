<%@page import="pe.gob.munisjl.java.bean.PersonaBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>Home - Municipalidad Distrital de SJL</title>
<style type="text/css">
.navbar .nav>li>a {
color: #fff !important;
}
.navbar .nav>li>a {
float: none;
padding: 10px 10px 11px;
line-height: 19px;
color: #999999;
text-decoration: none;
text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
}
.navbar .nav a {
font-size: 11px;
}
.nav>li>a {
position: relative;
display: block;
padding: 10px 15px;
}
.nav>li>a {
display: block;
}
a {
background-color: transparent;
}
a {
color: #337ab7;
text-decoration: none;
}
a:ACTIVE {
color:#337ab7;
}
.nav .open>a, .nav .open>a:hover, .nav .open>a:focus {
background-color: #eee;
border-color: #337ab7;
}

#logo{
	-webkit-background-size: cover; 
	-moz-background-size: cover;
	 -o-background-size: cover; 
	 background-image:url(img/logo3.png);
	 background-size: cover;
	 width:245px;
	 height:75px;
	 margin: 0 auto;
	 float:left;
	}
h3{
	text-align: center;
	margin-left:220px;
}	
</style>

</head>
<!-- ---------------------------------------------------------------------------- -->   
<% PersonaBean person=(PersonaBean) session.getAttribute("usuario_logueado");%>
<% session.setAttribute("account",person.getNombre()+" "+person.getApellido()); %>

    <script> 
    var x='<%=session.getAttribute("account")%>';
    </script>
 <!-- ---------------------------------------------------------------------------- -->   
<body>

<nav class="navbar navbar-default role="navigation" style="margin-bottom:0px;">
  <div class="container-fluid" style="background-color:#015192;">
  <div class="navbar-header">
  <!-- table indicador de usuario logeado (opcional)  -->
  <table>
  <tr><td><a class="navbar-brand" id="logo" href="#"></a></td></tr>
  <tr><td style="color:#938B8B;">Bienvenido(a): <%= person.getNombre()+" "+person.getApellido() %></td></tr>
  </table>
  <!-- ------------------------------------------------ -->
      <!--<a class="navbar-brand" id="logo" href="#"></a>-->
    </div>
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <h3 class="brand" style="color: white">Sistema de Gestión de Rentas</h3>
    </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
       
      </ul>
      <ul class="nav navbar-nav navbar-right">      
        
     <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="color:white;"><i class="glyphicon glyphicon-cog"></i>&nbsp;Account <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Setting</a></li>
            <li><a href="#">help</a></li>
          </ul>
        </li>
        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color:white"><i
           class="glyphicon glyphicon-user"></i>&nbsp;<%=person.getNombre().toLowerCase()+"."+person.getApe_pa().toLowerCase()+"@munisjl.gob.pe" %><b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="javascript:;">Profile</a></li>
              <!--<li><a href="javascript:;">Logout</a></li>-->
              <li><a href="login.jsp">Logout</a></li>
            </ul>
          </li>
          </li>
        </ul>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

</body>
</html>
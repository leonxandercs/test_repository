<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="pe.gob.munisjl.java.bean.PersonaBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home - Municipalidad Distrital de SJL</title>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/stylepage.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet" >
<script src="js/jquery-1.11.1.min.js"></script>
<!-- import --- datatables -->
<link href="//cdn.datatables.net/1.10.4/css/jquery.dataTables.css" rel="stylesheet">
<link href="//cdn.datatables.net/plug-ins/9dcbecd42ad/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">
<script src="js/datatable/datatable.js"></script>
<script src="js/datatable/jquery.dataTables.min.js"></script>
<script src="js/datatable/dataTables.bootstrap.js"></script>
<%! PersonaBean person=new PersonaBean(); %>
<% List<PersonaBean> listContribuyente=(List)session.getAttribute("listaContActivos"); %>


<script type="text/javascript">
$(document).ready(function() {
    var table = $('#example').DataTable();
 
    $('#example tbody').on( 'click', 'tr', function () {
    	
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
          //----------------------------
            var dato1=$(".selected td")[0].innerHTML;
            var dato2=$(".selected td")[1].innerHTML;
            var dato3=$(".selected td")[2].innerHTML;
            var dato4=$(".selected td")[3].innerHTML;
            var dato5=$(".selected td")[4].innerHTML;
            var dato6=$(".selected td")[5].innerHTML;
            var dato7=$(".selected td")[6].innerHTML;
            var dato8=$(".selected td")[7].innerHTML;
            var dato9=$(".selected td")[8].innerHTML;		
            mostrarmodal(dato1,dato2,dato3,dato4,dato5,dato6,dato7,dato8,dato9);
        }
    } );
 /*  Evento Doble click */
     $('#example tbody').on( 'dblclick', 'tr', function () {
    	
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
          //----------------------------
             var dato1=$(".selected td")[0].innerHTML;
            var dato2=$(".selected td")[1].innerHTML;
            var dato3=$(".selected td")[2].innerHTML;
            var dato4=$(".selected td")[3].innerHTML;
            var dato5=$(".selected td")[4].innerHTML;
            var dato6=$(".selected td")[5].innerHTML;
            var dato7=$(".selected td")[6].innerHTML;
            var dato8=$(".selected td")[7].innerHTML;	
            var dato9=$(".selected td")[8].innerHTML;		
            mostrarmodal(dato1,dato2,dato3,dato4,dato5,dato6,dato7,dato8,dato9);
	    	$('#myModalModificar').modal();
        }
    } );
 /*.....................*/
    $('.eliminar').click( function () {
        table.row('.selected').remove().draw( false );
        $('#myModalModificar').modal('hide');
    } );
    
    //--------function modal -----------
    function mostrarmodal(dato1,dato2,dato3,dato4,dato5,dato6,dato7,dato8,dato9){
    $('#myModalModificar').on('show.bs.modal', function (event) {
	  var modal = $(this);
	  modal.find('.modal-header h4').text('Modificar Contribuyente: ' + dato1);

	  modal.find('.modal-body #idEmpleado').val(dato1);
	  modal.find('.modal-body #codigo').val(dato2);
	  modal.find('.modal-body #nombre').val(dato3);
	  modal.find('.modal-body #ape_pa').val(dato4);
	  modal.find('.modal-body #ape_ma').val(dato5);
	  modal.find('.modal-body #dni').val(dato6);
	  modal.find('.modal-body #edad').val(dato7);
	  modal.find('.modal-body #fec_nac').val(dato8);
	  modal.find('.modal-body #direccion').val(dato9);
	});
    }
    //
    
} );
</script>
</head>

<body>
<%@include file="header.jsp" %>
<div id="contendedorCU">

<div class="panel panel-primary">
<div class="panel-heading">MANTENIMIENTO</div>
  <div class="panel-body">
    	<!-- -------------------------------------------------->
			<div class="list-group" style="text-align: center;">
				<a class="list-group-item" href="#">
					<h4 class="list-group-item-heading">MANTENIMIENTO DE TERCEROS</h4>
				</a>
			</div>
			<!-- ----------------------------------------------------------- -->

<div class="panel panel-default">
  <div class="panel-heading">
  	<a href="#myModalEmpNuevo" class="btn btn-primary" data-toggle="modal">+ Nuevo</a>&nbsp;
  	<!--<a href="#myModalModificar" class="btn btn-primary" data-toggle="modal"> Modificar</a>&nbsp;
  	<button id="button" class="btn btn-primary">Eliminar</button>   -->
  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Lista de Contribuyentes
  </div>
  <div class="panel-body">

<!-- ----------------------------------------------------------- 

-->
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%" border="1">

        <thead>
            <tr>
            	<th>id</th>
             	<th>Codigo</th>
				<th>Nombre</th>
				<th>Apellido Paterno</th>
				<th>Apellido Materno</th>
				<th>Dni</th>
				<th>Edad</th>
				<th>Nacimiento</th>
				<th>Direccion</th>
            </tr>
        </thead>
 	<!--  -->
        <tfoot>
            <tr>
           		<th>id</th>
              	<th>Codigo</th>
				<th>Nombre</th>
				<th>Apellido Paterno</th>
				<th>Apellido Materno</th>
				<th>Dni</th>
				<th>Edad</th>
				<th>Nacimiento</th>
				<th>Direccion</th>
            </tr>
        </tfoot>
 <!--  -->
        <tbody>
        	<% 
			for(PersonaBean bean:listContribuyente){
			%>
			<tr>
				<td><%=bean.getIdPersona() %></td>
                <td><%=bean.getCodigo() %></td>
                <td><%=bean.getNombre() %></td>
                <td><%=bean.getApe_pa() %></td>
                <td><%=bean.getApe_ma() %></td>
                <td><%=bean.getDni() %></td>
                <td><%=bean.getEdad() %></td>
                <td><%=bean.getFecNac() %></td>
                <td><%=bean.getDireccion() %></td>
            </tr>
			<%
			 }
			%>
 		</tbody>
    </table>
    	<!---END TABLE------------- -->
	  </div>
</div>
<!-- ----END PANEL SECUNDARY---- -->
  </div>
</div>
</div>
<!-- ---END PANEL PRINIPAL----- -->

<!-- -----------Modal Register New------------ -->

<div class="modal fade" id="myModalEmpNuevo" role="dialog" ria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
  <form action="ServletEmpleadoCRUD">
    <div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    	<h4>Registrar Contribuyente</h4>
    </div>
		<div class="modal-body">
			
	    	<input type="hidden" class="form-control" id="idEmpleado" name="idEmpleado" value="1"/></br>
		   	<label>Código:</label>
	    	<input type="text" class="form-control" id="codigo" name="codigo"/></br>
	    	<label>Nombre:</label>
	    	<input type="text" class="form-control" id="nombre" name="nombre"/></br>
	    	<label>Apellido Paterno:</label>
	    	<input type="text" class="form-control" id="ape_pa" name="ape_pa"/></br>
	    	<label>Apellido Materno::</label>
	    	<input type="text" class="form-control" id="ape_ma" name="ape_ma"/></br>
	    	<label>DNI:</label>
	    	<input type="text" class="form-control" id="dni" name="dni"/></br>
	    	<label>Edad:</label>
	    	<input type="text" class="form-control" id="edad" name="edad"/></br>
	    	<label>Fecha Nacimiento:</label>
	    	<input type="text" class="form-control" id="fec_nac" name="fec_nac"/></br>
	    	<label>Dirección:</label>
	    	<input type="text" class="form-control" id="direccion" name="direccion"/></br>
   		 </div>
      <div class="modal-footer">
  	  <div style="text-align:left;">
   		<button type="submit" class="btn btn-primary">Registrar</button>&nbsp;&nbsp;
  		<button type="reset" class="btn btn-primary">Limpiar</button>
  		<input type="hidden" value="create" name="accion"></input>
   	  </div>
      <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
    </div>
    </form>
  </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->

</div>
<!-- -----------END MODAL NUEVO --------------- -->
<!-- -----------Modal Modificar------------ -->

<div class="modal fade" id="myModalModificar" role="dialog" ria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
  <form action="ServletEmpleadoCRUD">
    <div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    	<h4>Modificar Contribuyente</h4>
    </div>
    <div class="modal-body">
    		
	    	<input type="hidden" class="form-control" id="idEmpleado" name="idEmpleado"/></br>
	    	<label>Código:</label>
	    	<input type="text" class="form-control" id="codigo" name="codigo"/></br>
	    	<label>Nombre:</label>
	    	<input type="text" class="form-control" id="nombre" name="nombre"/></br>
	    	<label>Apellido Paterno:</label>
	    	<input type="text" class="form-control" id="ape_pa" name="ape_pa"/></br>
	    	<label>Apellido Materno::</label>
	    	<input type="text" class="form-control" id="ape_ma" name="ape_ma"/></br>
	    	<label>DNI:</label>
	    	<input type="text" class="form-control" id="dni" name="dni"/></br>
	    	<label>Edad:</label>
	    	<input type="text" class="form-control" id="edad" name="edad"/></br>
	    	<label>Fecha Nacimiento:</label>
	    	<input type="text" class="form-control" id="fec_nac" name="fec_nac"/></br>
	    	<label>Dirección:</label>
	    	<input type="text" class="form-control" id="direccion" name="direccion"/></br>
	    	
    </div>
    <div class="modal-footer">
     <button class="btn btn-primary">Guardar</button>&nbsp;&nbsp;
     <input type="hidden" value="update" name="accion"></input>
	 <!-- Small modal -->
	 <button type="button" class="btn btn-danger" data-toggle="modal" data-target=".bs-example-modal-sm">Eliminar</button>&nbsp;&nbsp;
     <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
     </div>
    </form>
  </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->

</div>
<!-- -----------END MODAL MODIFICAR ----------- -->

<!-- ------------Show Message Modal------------ -->
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <div class="modal-header">
    	<h4 class="modal-title">Guardar Cambios</h4>
    </div>
    <form action="ServletEmpleadoCRUD">
      <div class="modal-body" style="text-align: right;">
         <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
         <button type="button" class="btn btn-primary eliminar" data-dismiss="modal">Si</button>
         <input type="hidden" value="delete" name="accion"></input>
         </div>
     </form>
      </div>
    </div>
  </div>

</body>

</html>
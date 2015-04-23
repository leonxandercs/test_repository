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
	    	mostrarmodal(dato1,dato2,dato3,dato4,dato5,dato6);
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
         //---------------------------------------
           var dato1=$(".selected td")[0].innerHTML;
           var dato2=$(".selected td")[1].innerHTML;
           var dato3=$(".selected td")[2].innerHTML;
           var dato4=$(".selected td")[3].innerHTML;
           var dato5=$(".selected td")[4].innerHTML;
           var dato6=$(".selected td")[5].innerHTML;
         //----------------------------------------
         //var children = $("tr td")[0].innerHTML;
         //alert(children);
         //----------------------------		
	    	mostrarmodal(dato1,dato2,dato3,dato4,dato5,dato6);
	    	$('#myModalModificar').modal();
       }
   } );
    
   /* $('.eliminar').click( function () {
    	table.row('.selected').remove().draw( false );
    	$('#myModalModificar').modal('hide');
    } );
    */
    
    $('#delete').click(function(){
    	$('#borrame').remove();
    	var modal = $('#myModalModificar');
    	var id=modal.find('.modal-body #id').val();
    	var c1="<a id=\"borrame\" class=\"btn btn-primary \" ";
        var str1 = "href=\"ServletTramiteCRUD?ideliminar=";
        var str2 = "\">Si</a>";
        var res = c1.concat(str1,id,str2);
        
    	$("#conexionServer").before(res);
    });

    //--------function modal -----------//
    function mostrarmodal(dato1,dato2,dato3,dato4,dato5,dato6){
    $('#myModalModificar').on('show.bs.modal', function (event) {
	  var modal = $(this);
	  modal.find('.modal-header h4').text('Modificar Tramite: ' + dato1);
	  
	  modal.find('.modal-body #id').val(dato1);
	  modal.find('.modal-body #descripcion').val(dato2);
	  modal.find('.modal-body #precio').val(dato3);
	  modal.find('.modal-body #vigencia').val(dato4);
	  modal.find('.modal-body #fec_registro').val(dato5);
	  modal.find('.modal-body #consideraciones').val(dato6);
	});
    }

    
} );
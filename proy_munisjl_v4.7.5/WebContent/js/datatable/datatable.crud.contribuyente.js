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
     
     $('#delete').click(function(){
     	$('#borrame').remove();
     	var modal = $('#myModalModificar');
     	var id=modal.find('.modal-body #idContribuyente').val();
     	var c1="<a id=\"borrame\" class=\"btn btn-primary \" ";
         var str1 = "href=\"ServletContribuyenteCRUD?ideliminar=";
         var str2 = "\">Si</a>";
         var res = c1.concat(str1,id,str2);
         
     	$("#conexionServer").before(res);
     });
    
    //--------function modal -----------
    function mostrarmodal(dato1,dato2,dato3,dato4,dato5,dato6,dato7,dato8,dato9){
    $('#myModalModificar').on('show.bs.modal', function (event) {
	  var modal = $(this);
	  modal.find('.modal-header h4').text('Modificar Contribuyente: ' + dato1);

	  modal.find('.modal-body #idContribuyente').val(dato1);
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
   
    
} );
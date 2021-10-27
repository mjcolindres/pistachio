
//Con este codigo podemos generar el datatable
$(document).on("ready", function(){			
	listar();			
	});
	
	//Boton 
	$("#btn_listar").on("click", function(){
		listar();
	})
	
	
	
	//Con este codigo mando a llamar las tablas para la seccion responsables
	var listar = function(){			
		var table = $("#dt_responsables").DataTable({
			"destroy": true,
			"ajax":{
				"method":"POST",
				"url":"../Modelos/listar_respon_modelo.php"
			},
			"columns":[
				{"data":"id_persona"},
				{"data":"nombres"},
				{"data":"tipo_persona"},
				//Botones de accion para cada registro de la tabla
				{"defaultContent":"<button type='button' class='editar btn btn-primary'><i class='fa fa-pencil-square-o'></i></button>	<button type='button' class='eliminar btn btn-danger' data-toggle='modal' data-target='#modalEliminar' ><i class='fa fa-trash-o'></i></button>"}
			],
			"language": idioma_espanol
		});
		//Llamamos a la funcion aqui 
		obtener_data_editar("#dt_responsables tbody", table);
		obtener_id_eliminar("#dt_responsables tbody", table);
		
	}
	
	//Funcion para obtener los datos del boton editar
	var obtener_data_editar = function(tbody, table){
		$(tbody).on("click", "button.editar", function(){
			var data = table.row($(this).parents("tr")).data();
			var idusuario = $("#id_persona").val(data.id_persona ),
				nombre = $("#nombres").val(data.nombres ),
				tipo_persona = $("#tipo_persona").val(data.tipo_persona );
		});
	}
	
	//Funcion para eliminar
	var obtener_id_eliminar = function(tbody, table){
		$(tbody).on("click", "button.eliminar", function(){
			var data = table.row($(this).parents("tr")).data();
			var idusuario = $("#frmEliminarUsuario #id_persona").val(data.id_persona );
				
		});
	}
	
	
	
	var idioma_espanol = {
	"sProcessing":   	"Procesando...",
	"sLengthMenu":   	"Mostrar_MENU_registros",
	"sZeroRecords":  	"No se encontraron resultados",
	"sEmptyTable":   	"Ningun dato disponible en esta tabla",
	"sInfo":      	 	"Mostrando registros del START al END de un total de TOTAL registros",
	"sInfoEmpty":    	"Mostrando registros del 0 al 0 de un total de 0 registros",
	"sInfoFiltered": 	"(filtrado de un total de MAX registros)",
	"sInfoPostFix":  	"",
	"sSearch":    		"Buscar:",
	"sUrl":		     	"",
	"sInfoThousands":	",",
	"sLoadingRecords":	"cargando...",
	"oPadinate":{
		"sFirst":		"Primero",
		"sLast":		"Ultimo",
		"sNext":		"Siguiente",
		"sPrevious":	"Amterior"
	},
	"oAria": {
		 sortAscending: ": Activar para ordenar la columna de manera ascendente",
		sortDescending: ": Activar para ordenar la columna de manera descendente"
	}    
} 
	
	
		
		
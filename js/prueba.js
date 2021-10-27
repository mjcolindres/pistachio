/*====================================
  = LLENAR EL SELECT DE TIPO PERSONA =
  ====================================*/
function llenar_tipo_persona() {
    var cadena = "&activar=activar";
    
    $.ajax({
      url: "../Controlador/prueba_controlador.php?op=tipo",
      type: "POST",
      data: cadena,
      success: function (r) {
        // console.log(r);  
        $("#el_tipo_persona").html(r).fadeIn();              
      },
    });   
  }
  llenar_tipo_persona();   

 /*===================================
   =   LLENAR EL SELECT DE PERSONA   =
   ===================================*/
 $("#el_tipo_persona").change(function () {
  var tipo = $(this).val();  
  //console.log(tipo);  
  $.post("../Controlador/personas.php", {
    id_tipo: tipo,
  }).done(function (respuesta) {
    $("#nombre_persona").html(respuesta);
  });
});

/*===================================
  =   LLENAR LOS DATOS DE PERSONA   =
  ===================================*/  
function mostrar_datos_persona(codigo) {
  $.post(
    "../Controlador/prueba_controlador.php?op=datos_persona",
    { id_persona: codigo },
    function (data, status) {
      data = JSON.parse(data);
      // console.log(data);
      //mostrarform(true);
      $("#txt_nombre_responsable").val(data.nombre);
      $("#txt_cargo_responsable").val(data.cargo);     
      $("#txt_cel_responsable").val(data.cel);
      $("#txt_tel_responsable").val(data.tel);  
      $("#txt_cor_responsables").val(data.cor);   
    }
  );
} 



/*=====================================
  =   INSERTAR LOS DATOS DE PERSONA   =
  =====================================*/ 
function sel_responsable(){
  var cargo = $("#txt_cargo_responsable").val();
  var nombre = $("#txt_nombre_responsable").val();
  var tel = $("#txt_tel_responsable").val();
  var cel = $("#txt_cel_responsable").val();
  var cor = $("#txt_cor_responsables").val();  
  
  if(nombre == "" || cargo == ""){
    swal({
      title: "¡Alerta!",
      text: "¡Debe seleccionar los campos vacios!",
      type: "warning",
      showConfirmButton: true,
      timer: 3000,
    });

  }else{ 

    $.ajax({
      url: "../Controlador/insertar_responsables_tabla_controlador.php",
      type: "POST",
      data: {
        nombre: nombre,        
        tel: tel,
        cel: cel,
        cor: cor,
        cargo: cargo,        
      },      
    }).done(function(){

      /*

        swal({
          title: "¡Advertencia!",
          text: "¡El responsable ya fue asignado!",
          type: "warning",
          showConfirmButton: true,
          timer: 5000,
        });*/

          document.getElementById("el_tipo_persona").value="";
          document.getElementById("nombre_persona").value="";
          document.getElementById("txt_nombre_responsable").value="";      
          document.getElementById("txt_tel_responsable").value="";
          document.getElementById("txt_cel_responsable").value="";
          document.getElementById("txt_cor_responsable").value="";
          document.getElementById("txt_cargo_responsable").value="";
          //$Id_objeto=117;
            
            //bitacora::evento_bitacora($Id_objeto, $_SESSION['id_usuario'],'SELECCIONÓ' , 'A LOS RESPONSABLES');
                
          swal({
            title: "¡Buen trabajo!",
            text: "¡Responsable asignado exitosamente!",
            type: "success",
            showConfirmButton: true,
            timer: 5000,
          });       
          tablaResponables.ajax.reload();    

      
    });      
  //================== CODIGO PARA HACER PRUEBAS ===================
  }
  
}


$(document).ready(function(){
  var id_usuario, opcion;
  opcion = 2;
      
      /*=========================================
        = FUNCION PARA BORRAR DATOS DE LA TABLA =
        =========================================*/
    $(document).on("click", ".btnBorrar", function(){
      fila = $(this);           
      id_usuario = parseInt($(this).closest('tr').find('td:eq(0)').text()) ;		
      opcion = 1; //eliminar        
          swal({
            title: "¡Alerta!",            
            text: "¿Desea eliminar al responsable numero "+id_usuario+"?",
            type: "warning",
            showCancelButton: true, 
            showConfirmButton: true,
            confirmButtonText: 'Si',
            cancelButtonText: "No",
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            timer: 5000,
          }).then(function(resultado){

              if(resultado){
                  $.ajax({
                    url: "../Controlador/tabla_personas_controlador.php",
                    type: "POST",
                    datatype:"json",    
                    data:  {opcion:opcion, id_usuario:id_usuario},    
                    success: function() {
                        tablaResponables.row(fila.parents('tr')).remove().draw();                  
                    }
                  });

                    swal({
                      title: "¡Hecho!",
                      text: "¡Registro eliminado!",
                      type: "success",
                      timer: 5000,
                    });
              }else{
                return false;
              }
          });
      });


      /*=============================================
        = FUNCION PARA LISTAR LOS DATOS EN LA TABLA =
        =============================================*/
      tablaResponables = $('#tablaResponsables').DataTable({  
        ajax:{            
            url: "../Controlador/tabla_personas_controlador.php", 
            method: 'POST', //usamos el metodo POST
            data:{opcion:opcion}, //enviamos opcion 4 para que haga un SELECT
            dataSrc:""
        },
        columns:[
            {data: "codigo"},
            {data: "nombre"},
            {data: "celular"},
            {data: "telefono"},
            {data: "correo"},
            {data: "cargo"},            
            {defaultContent: "<div class='text-center'><div class='btn-group'><button class='btn btn-danger btn-sm btnBorrar'><i class='fas fa-trash'></i></button></div></div>"}
        ],
        language: idioma_espanol
    }); 
});

var idioma_espanol = {
  "sProcessing":   	"Procesando...",
  "sLengthMenu":   	"Mostrar_MENU_registros",
  "sZeroRecords":  	"No se encontraron resultados",
  "sEmptyTable":   	"Ningun dato disponible en esta tabla",
  "sInfo":      	 	"Mostrando registros",
  "sInfoEmpty":    	"Mostrando registros del 0 al 0 de un total de 0 registros",
  "sInfoFiltered": 	"(filtrado de un total de MAX registros)",
  "sInfoPostFix":  	"",
  "sSearch":    		"Buscar:",
  "sUrl":		     	"",
  "sInfoThousands":	",",
  "sLoadingRecords":	"cargando...",
  "oPaginate":{
      "sFirst":		"Primero",
      "sLast":		"Ultimo",
      "sNext":		"Siguiente",
      "sPrevious":	"Anterior"
  },
  "oAria": {
       sortAscending: ": Activar para ordenar la columna de manera ascendente",
      sortDescending: ": Activar para ordenar la columna de manera descendente"
  }    
} 




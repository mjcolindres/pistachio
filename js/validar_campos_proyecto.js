var contador=0;
var contador_anexo=0;

function contador_click(){  
  document.forms.formRegistro.contador.value = ++contador;
    
}

function contador_click2(){  
  document.forms.formRegistro.contador_anexo.value = ++contador_anexo;
    
}

function validar_field1(){
  var nombre_proyecto = $("#txt_nombre_proyecto").val();
  var cb_estado = $("#cb_estado").val();  
  var tipo_proyecto = $("#txt_tipo_proyecto").val();  
  var fecha1 = $("#txt_fecha_inicio").val();
  var fecha2 = $("#txt_fecha_final").val();
  var fecha3 = $("#txt_fecha_inicio_rev").val();
  var fecha4 = $("#txt_fecha_inicio_final").val();
  var desc = $("#txt_area_descripcion").val();    

  if(nombre_proyecto==''||tipo_proyecto ==''||cb_estado==0||  
  fecha1==0||fecha2==0||fecha3==0||fecha4==0||desc==''){

        swal({
          title: "¡Advertencia!",
          text: "¡Debe llenar todos los campos vacíos!",
          type: "warning",
          showConfirmButton: true,
          timer: 10000,
      });  

      document.getElementById('btnS2').disabled=true;   
  }else{
    document.getElementById('btnS2').disabled=false;   
  }
}

function validar_field2(){
  var directos = $("#txt_directos").val();                
  var indirectos = $("#txt_indirectos").val(); 
  var total_b = $("#txt_total_beneficiarios").val();
  var modalidad = $("#cb_modalidad").val();
  var tipo_modalidad = $("#cb_tipo_modalidad").val();

  if(directos==''||indirectos==''||modalidad==0
  ||tipo_modalidad==0||total_b==''){
        
            swal({
                title: "¡Advertencia!",
                text: "¡Debe llenar todos los campos vacíos!",
                type: "warning",
                showConfirmButton: true,
                timer: 10000,
            });    

        document.getElementById('btnS3').disabled=true;    
  }else{
    document.getElementById('btnS3').disabled=false;    
  }    
}

function validar_field3(){
  var unah = $("#txt_porc_unah").val();
  var empresa = $("#txt_porc_empresa").val(); 

  if(unah=='' || empresa==''){

    swal({
        title: "¡Advertencia!",
        text: "¡Debe llenar todos los campos vacíos!",
        type: "warning",
        showConfirmButton: true,
        timer: 10000,
    });    

    document.getElementById('btnS4').disabled=true;    
  }else{
    document.getElementById('btnS4').disabled=false;    
  }    
}

function validar_field4(){
  var empresa = $("#cb_empresa").val();
  var contacto = $("#cb_contacto_empresa").val();
  var forma = $("#cb_formalizacion").val();
  var aporte = $("#cb_aporte").val();

  if(empresa==0||contacto==0||forma==0||aporte==0){

        swal({
          title: "¡Advertencia!",
          text: "¡Debe seleccionar todos los campos vacios!",
          type: "warning",
          showConfirmButton: true,
          timer: 10000,
        });    

      document.getElementById('btnS5').disabled=true;    

  }else{      
      document.getElementById('btnS5').disabled=false;    
  }
}

function validar_field5(){
  var contador = $("#contador").val();  

  if(contador>=1){

        document.getElementById('btnS6').disabled=false;               

  }else{

          swal({
            title: "¡Advertencia!",
            text: "¡Debe asignar a los responsables del proyecto!",
            type: "warning",
            showConfirmButton: true,
            timer: 10000,
        });    

      document.getElementById('btnS6').disabled=true;    
      
      
  }
}

function validar_field6(){
  var region = $("#cb_region").val();
  var depto = $("#cb_depto").val();
  var municipio = $("#cb_muni").val();  
  var aldea = $("#txt_aldea_caserio").val();
  var colonia = $("# txt_colonia_barrio").val();
 
  if(region==0||depto==0||municipio==0||
    aldea==""||colonia==""){

        swal({
          title: "¡Advertencia!",
          text: "¡Debe seleccionar todos los campos vacios!",
          type: "warning",
          showConfirmButton: true,
          timer: 10000,
        });    

      document.getElementById('btnS7').disabled=true;    

  }else{      
      document.getElementById('btnS7').disabled=false;    
  }
}


function validar_field7(){
  var objetivos = $("#txt_area_objetivos").val();
  var inmediatos = $("#txt_area_inmediatos").val();
  var resultados = $("#txt_area_resultados").val();  
  var actividades = $("#txt_area_actividades").val();
  
 
  if(objetivos==''||inmediatos==''||resultados==''||actividades==''){

        swal({
          title: "¡Advertencia!",
          text: "¡Debe seleccionar todos los campos vacios!",
          type: "warning",
          showConfirmButton: true,
          timer: 10000,
        });    

      document.getElementById('btnGuardar').disabled=true;    
      document.getElementById('subir').disabled=true; 

  }else{      
      document.getElementById('btnGuardar').disabled=false;    
      document.getElementById('subir').disabled=false; 
  }
}


  
$(document).ready(function () {
  //Disable full page
  $('body').bind('cut copy paste', function (e) {
      e.preventDefault();
  });
  
  //Disable part of page
  $('#id').bind('cut copy paste', function (e) {
      e.preventDefault();
  });
});

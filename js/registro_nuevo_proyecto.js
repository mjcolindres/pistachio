//========================================CODIGO DE PRUEBA ======================================================



//========================================CODIGO DE PRUEBA ======================================================
/*===================================
  =   LLENAR EL SELECT DE EMPRESA   =
  ===================================*/
   function llenar_empresa() {
    var cadena = "&activar=activar";
    
    $.ajax({
      url: "../controlador/registro_proyecto_nuevo_controlador.php?op=empresa",
      type: "POST",
      data: cadena,
      success: function (r) {
        // console.log(r);  
        $("#cb_empresa").html(r).fadeIn();              
      },
    });   
  }
  llenar_empresa();   

  /*===================================
    =   LLENAR EL SELECT DE APORTE    =
    ===================================*/
  function llenar_aporte() {
    var cadena = "&activar=activar";
    
    $.ajax({
      url: "../Controlador/registro_proyecto_nuevo_controlador.php?op=aporte",
      type: "POST",
      data: cadena,
      success: function (r) {
        // console.log(r);  
        $("#cb_aporte").html(r).fadeIn();              
      },
    });   
  }
  llenar_aporte();  
  
  /*==========================================
    =   LLENAR EL SELECT DE FORMALIZACION    =
    ==========================================*/
    function llenar_formalizacion() {
      var cadena = "&activar=activar";
      
      $.ajax({
        url: "../Controlador/registro_proyecto_nuevo_controlador.php?op=forma",
        type: "POST",
        data: cadena,
        success: function (r) {
          // console.log(r);  
          $("#cb_formalizacion").html(r).fadeIn();              
        },
      });   
    }
    llenar_formalizacion();  

 /*============================================
   =   LLENAR EL SELECT DE CONTACTO EMPRESA   =
   ============================================*/
 $("#cb_empresa").change(function () {
  var id_empresa = $(this).val();  
  //console.log(tipo);  
  $.post("../Controlador/listar_contacto_empresa_controlador.php", {
    id_empresa: id_empresa,
  }).done(function (respuesta) {
    $("#cb_contacto_empresa").html(respuesta);
  });

  $.post(
    "../Controlador/registro_proyecto_nuevo_controlador.php?op=clasificacion",
    { id_empresa: id_empresa },
    function (data, status) {
      data = JSON.parse(data);
      
      $("#txt_clasi_empresa").val(data.descripcion);       
    }
  );
});

 /*===============================================
   = LLENA LAS CAJAS CON LOS DATOS DEL CONTACTO  =
   ===============================================*/

function mostrar_datos_con_empresa(codigo){
    $.post(
        "../Controlador/registro_proyecto_nuevo_controlador.php?op=datos_contacto",
        { id_contacto: codigo },
        function (data, status) {
          data = JSON.parse(data);
          
          $("#txt_nombre_contacto").val(data.nombre);
          $("#txt_cor_contacto").val(data.cor);
          $("#txt_tel_contacto").val(data.tel);     
          $("#txt_cel_contacto").val(data.cel);
          $("#txt_inst_contacto").val(data.inst);  
          $("#txt_fb_contacto").val(data.fb);             
        }
      );
}

 /*===================================
   =   LLENAR EL SELECT DE EMPRESA   =
   ===================================*/
   function llenar_empresa() {
    var cadena = "&activar=activar";
    
    $.ajax({
      url: "../Controlador/registro_proyecto_nuevo_controlador.php?op=empresa",
      type: "POST",
      data: cadena,
      success: function (r) {
        // console.log(r);  
        $("#cb_empresa").html(r).fadeIn();              
      },
    });   
  }
  llenar_empresa();   
/*============================================
  =         CAPTURAR LOS CHECKBOX            =
  ============================================*/ 
  $("#ck1").click(function(){
    var v1=1;
    if (this.checked) document.getElementById("txt_ck1").value=v1;
        else document.getElementById("txt_ck1").value="";
    });

  $("#ck2").click(function(){
    var v2=2;
    if (this.checked) document.getElementById("txt_ck2").value=v2;
        else document.getElementById("txt_ck2").value="";
    });  

  $("#ck3").click(function(){
    var v3=3;
    if (this.checked) document.getElementById("txt_ck3").value=v3;
        else document.getElementById("txt_ck3").value="";
    });

  $("#ck4").click(function(){
    var v4=4;
    if (this.checked) document.getElementById("txt_ck4").value=v4;
        else document.getElementById("txt_ck4").value="";
  });

  $("#ck5").click(function(){
    var v5=5;
    if (this.checked) document.getElementById("txt_ck5").value=v5;
        else document.getElementById("txt_ck5").value="";
  });

  $("#ck6").click(function(){
    var v6=6;
    if (this.checked) document.getElementById("txt_ck6").value=v6;
        else document.getElementById("txt_ck6").value="";
  });

  $("#ck7").click(function(){
    var v7=7;
    if (this.checked) document.getElementById("txt_ck7").value=v7;
        else document.getElementById("txt_ck7").value="";
  });

  $("#ck8").click(function(){
    var v8=8;
    if (this.checked) document.getElementById("txt_ck8").value=v8;
        else document.getElementById("txt_ck8").value="";
  });

   

 /*============================================
   =   LLENAR EL SELECT DE CONTACTO EMPRESA   =
   ============================================*/
 $("#cb_empresa").change(function () {
  var id_empresa = $(this).val();  
  //console.log(tipo);  
  $.post("../Controlador/listar_contacto_empresa_controlador.php", {
    id_empresa: id_empresa,
  }).done(function (respuesta) {
    $("#cb_contacto_empresa").html(respuesta);
  });
});

function llenar_periodo() {
  var cadena = "&activar=activar";
  
  $.ajax({
    url: "../Controlador/registro_proyecto_nuevo_controlador.php?op=periodo",
    type: "POST",
    data: cadena,
    success: function (r) {
      // console.log(r);  
      $("#cb_periodo").html(r).fadeIn();              
    },
  });   
}
llenar_periodo();  

/*====================================
  =   LLENAR EL SELECT DE CLASE      =
  ====================================*/
  function llenar_asignatura() {
    var cadena = "&activar=activar";
    
    $.ajax({
      url: "../Controlador/registro_proyecto_nuevo_controlador.php?op=clase",
      type: "POST",
      data: cadena,
      success: function (r) {
        // console.log(r);  
        $("#cb_asignatura").html(r).fadeIn();              
      },
    });   
  }
  llenar_asignatura();

/*============================================
  =   LLENAR EL SELECT DE SECCION            =
  ============================================*/
  function llenar_seccion() {
    var cadena = "&activar=activar";
    
    $.ajax({
      url: "../Controlador/registro_proyecto_nuevo_controlador.php?op=seccion",
      type: "POST",
      data: cadena,
      success: function (r) {
        // console.log(r);  
        $("#cb_seccion").html(r).fadeIn();              
      },
    });   
  }
  llenar_seccion();

  /*====================================
    = LLENAR EL SELECT DE REGION       =
    ====================================*/
function llenar_region() {
  var cadena = "&activar=activar";
  
  $.ajax({
    url: "../Controlador/registro_proyecto_nuevo_controlador.php?op=region",
    type: "POST",
    data: cadena,
    success: function (r) {
      // console.log(r);  
      $("#cb_region").html(r).fadeIn();              
    },
  });   
}
llenar_region(); 

/*============================================
   =   LLENAR EL SELECT DE MUNICIPIOS         =
   ============================================*/
   $("#cb_region").change(function () {
    var id_region = $(this).val();  
    //console.log(tipo);  
    $.post("../Controlador/listar_departamentos_controlador.php", {
      id_region: id_region,
    }).done(function (respuesta) {
      $("#cb_depto").html(respuesta);
    });
  });



 /*============================================
   =   LLENAR EL SELECT DE MUNICIPIOS         =
   ============================================*/
   $("#cb_depto").change(function () {
    var id_depto = $(this).val();  
    //console.log(tipo);  
    $.post("../Controlador/listar_municipios_controlador.php", {
      id_depto: id_depto,
    }).done(function (respuesta) {
      $("#cb_muni").html(respuesta);
    });
  });

 /*====================================
   = LLENAR EL SELECT DE MODALIDAD    =
   ====================================*/
function llenar_modalidad() {
  var cadena = "&activar=activar";
  
  $.ajax({
    url: "../Controlador/registro_proyecto_nuevo_controlador.php?op=moda",
    type: "POST",
    data: cadena,
    success: function (r) {
      // console.log(r);  
      $("#cb_modalidad").html(r).fadeIn();              
    },
  });   
}
llenar_modalidad();  

/*====================================
  = LLENAR LA CAJA DE MODALIDAD      =
  ====================================*/
function mostrar_modalidad(codigo){
  $.post(
      "../Controlador/registro_proyecto_nuevo_controlador.php?op=mostrar_moda",
      { id_modalidad: codigo },
      function (data, status) {
        data = JSON.parse(data);
        
        $("#nombre_modalidad").val(data.modalidad);
        
      }
    );
}

/*====================================
  = LLENAR EL SELECT DE TIPO PERSONA =
  ====================================*/
  function llenar_tipo_persona() {
    var cadena = "&activar=activar";
    
    $.ajax({
      url: "../Controlador/registro_proyecto_nuevo_controlador.php?op=tipo",
      type: "POST",
      data: cadena,
      success: function (r) {
        // console.log(r);  
        $("#el_tipo_persona").html(r).fadeIn();              
      },
    });   
  }
  llenar_tipo_persona();   


  /*=====================================
    = LLENAR EL SELECT DE TIPO DE ANEXO =
    =====================================*/
  function llenar_tipo_anexo() {
    var cadena = "&activar=activar";
    
    $.ajax({
      url: "../Controlador/registro_proyecto_nuevo_controlador.php?op=tipo_anexo",
      type: "POST",
      data: cadena,
      success: function (r) {
        // console.log(r);  
        $("#cb_tipo_anexo").html(r).fadeIn();              
      },
    });   
  }
  llenar_tipo_anexo();   

/*====================================
  =   LLENAR EL SELECT DE FACULTAD   =
  ====================================*/
  function llenar_facultad() {
    var cadena = "&activar=activar";
    
    $.ajax({
      url: "../Controlador/registro_proyecto_nuevo_controlador.php?op=facultad",
      type: "POST",
      data: cadena,
      success: function (r) {
        // console.log(r);  
        $("#cb_facultad").html(r).fadeIn();              
      },
    });   
  }
  llenar_facultad();    

/*====================================
=   LLENAR EL SELECT DE CENTRO     =
====================================*/
function llenar_centro() {
  var cadena = "&activar=activar";
  
  $.ajax({
    url: "../Controlador/registro_proyecto_nuevo_controlador.php?op=centro",
    type: "POST",
    data: cadena,
    success: function (r) {
      // console.log(r);  
      $("#cb_centro_regional").html(r).fadeIn();              
    },
  });   
}
llenar_centro(); 

/*======================================
  = LLENAR EL SELECT DE TIPO MODALIDAD =
  ======================================*/
  function llenar_moda_proyecto() {
    var cadena = "&activar=activar";
    
    $.ajax({
      url: "../Controlador/registro_proyecto_nuevo_controlador.php?op=moda_proyecto",
      type: "POST",
      data: cadena,
      success: function (r) {
        // console.log(r);  
        $("#cb_tipo_modalidad").html(r).fadeIn();              
      },
    });   
  }
  llenar_moda_proyecto(); 


 /*===========================================
   =   LLENAR EL SELECT DEL NOMBRE PERSONA   =
   ===========================================*/
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
    "../Controlador/registro_proyecto_nuevo_controlador.php?op=datos_persona",
    { id_persona: codigo },
    function (data, status) {
      data = JSON.parse(data);
      // console.log(data);
      //mostrarform(true);
      $("#txt_nombre_responsable").val(data.nombre);                 
      $("#txt_tel_responsable").val(data.tel);  
      $("#txt_cel_responsable").val(data.cel);
      $("#txt_cor_responsable").val(data.cor);   
      $("#txt_dir_responsable").val(data.dir);
      $("#txt_cargo_responsable").val(data.cargo);
      $("#txt_cod_emp_responsable").val(data.emp);
    }
  );  
} 

$("#ck1").click(function(){
  var v1=1;
  if (this.checked) document.getElementById("txt_ck1").value=v1;
      else document.getElementById("txt_ck1").value="";
  });
/*=================================
  =  PARA EL CAMBIO DE LA MONEDA  =
  =================================*/ 
  $(document).ready(function(){
    $("#rd_usd_unah").click(function(){	           
      document.getElementById("valida_moneda").value="USD";
      document.getElementById("txt_porc_unah").value=""; 
      document.getElementById("txt_total_lps").value="";
      $('#txt_porc_unah').removeAttr('disabled');   
      $('#txt_porc_unah').focus();          

    });

    $("#rd_lps_unah").click(function(){	 
      document.getElementById("valida_moneda").value="LPS";
      document.getElementById("txt_porc_unah").value="";
      document.getElementById("txt_total_usd").value="";
      $('#txt_porc_unah').removeAttr('disabled');
      $('#txt_porc_unah').focus();
      
      });

      $("#rd_usd_empresa").click(function(){	     
        document.getElementById("txt_porc_empresa").value=""; 
        document.getElementById("txt_total_lps").value="";
        $('#txt_porc_empresa').removeAttr('disabled');   
        $('#txt_porc_empresa').focus();   
        
       });
 
       $("#rd_lps_empresa").click(function(){	       
       document.getElementById("txt_porc_empresa").value="";
       document.getElementById("txt_total_usd").value="";
       $('#txt_porc_empresa').removeAttr('disabled');
       $('#txt_porc_empresa').focus();            
       });
   }); 


   $(document).ready(function(){
    $("input[name=unah]").click(function () {    
        /*alert("Has hecho clic en: " + $('input:radio[name=unah]:checked').val());
        alert("el clic recibido fue: " + $(this).val());*/
        
    });
});

 /*===================================
   = PARA SUMAR LOS MONTOS LPS y USD =
   ===================================*/ 
   function sumar_montos() {
    var total = 0;
    var total2 = 0;
  
    if(document.getElementById('rd_usd_empresa').checked && 
      document.getElementById('rd_usd_unah').checked){
        $(".monto").each(function() {  
          if (isNaN(parseFloat($(this).val()))) {  
            total += 0;  
          } else {  
            total += parseFloat($(this).val());  
          }    
        });

        document.getElementById('txt_total_usd').value=total; 

      }else if(document.getElementById('rd_lps_empresa').checked && 
      document.getElementById('rd_lps_unah').checked){

        $(".monto").each(function() {  
          if (isNaN(parseFloat($(this).val()))) {  
            total2 += 0;  
          } else {  
            total2 += parseFloat($(this).val());  
          }    
        });

      document.getElementById('txt_total_lps').value=total2; 

      }    
    //alert(total);     
  }

  /*=================================
    =  PARA SUMAR LOS BENEFICIARIOS =
    =================================*/ 
  function sumar_beneficiarios() {
    var total = 0;
  
    $(".valor").each(function() {  
      if (isNaN(parseFloat($(this).val()))) {  
        total += 0;  
      } else {  
        total += parseFloat($(this).val());  
      }
  
    });  
    //alert(total);
    document.getElementById('txt_total_beneficiarios').value=total;  
  }

  function simulaCheck(){   

    /*document.formRegistro.checks1.click(); 
    document.formRegistro.checks2.click();     
    document.formRegistro.checks3.click(); 
    document.formRegistro.checks4.click(); 
    document.formRegistro.checks5.click();
    document.formRegistro.checks6.click();  
    document.formRegistro.checks7.click(); 
    document.formRegistro.checks8.click();*/
    
    
    /*if($('input[type=checkbox]:checked')){
      
    }*/

  }
  
/*===================================
  =   PARA LIMPIAR EL PROYECTO      =
  ===================================*/ 
function limpiar_proyecto(){
  document.getElementById("txt_nombre_proyecto").value="";
  document.getElementById("cb_estado").value="";
  document.getElementById("txt_tipo_proyecto").value="";      
  document.getElementById("cb_centro_regional").value="";
  document.getElementById("cb_facultad").value="";
  document.getElementById("cb_carrera").value="";
  document.getElementById("txt_fecha_inicio").value="";
  document.getElementById("txt_fecha_final").value="";
  document.getElementById("txt_fecha_inicio_rev").value="";
  document.getElementById("txt_fecha_final_rev").value="";
  document.getElementById("txt_area_descripcion").value="";
  document.getElementById("txt_directos").value=""; 
  document.getElementById("txt_indirectos").value=""; 
  document.getElementById("txt_total_beneficiarios").value=""; 
  document.getElementById("cb_modalidad").value="";  
  document.getElementById("nombre_modalidad").value="";  
  document.getElementById("cb_tipo_modalidad").value="";
  document.getElementById("CK1").checked = false;  
  document.getElementById("CK2").checked = false;  
  document.getElementById("CK3").checked = false;  
  document.getElementById("CK4").checked = false;  
  document.getElementById("CK5").checked = false;  
  document.getElementById("CK6").checked = false;  
  document.getElementById("CK7").checked = false;  
  document.getElementById("CK8").checked = false;  
  document.getElementById("txt_porc_unah").value="";
  document.getElementById("txt_porc_empresa").value="";
  document.getElementById("txt_total_usd").value="";
  document.getElementById("txt_total_lps").value="";
  document.getElementById("valida_moneda").value="";
  document.getElementById("cb_formalizacion").value="";
  document.getElementById("cb_periodo").value="";
  document.getElementById("cb_asignatura").value="";
  document.getElementById("cb_seccion").value="";
  document.getElementById("cb_region").value="";
  document.getElementById("cb_depto").value="";
  document.getElementById("cb_muni").value="";
  document.getElementById("txt_aldea_caserio").value="";
  document.getElementById("txt_colonia_barrio").value="";
  document.getElementById("txt_area_objetivos").value="";
  document.getElementById("txt_area_inmediatos").value="";
  document.getElementById("txt_area_resultados").value="";
  document.getElementById("txt_area_actividades").value="";
  document.getElementById("cb_tipo_anexo").value="";
  document.getElementById("anjunto").value="";
  document.getElementById("txt_titulo_doc").value="";
  document.getElementById("txt_desc_doc").value="";
  document.getElementById("cb_empresa").value="";
  document.getElementById("cb_contacto_empresa").value="";
  document.getElementById("txt_ck1").checked=false;
  document.getElementById("txt_ck2").checked=false;
  document.getElementById("txt_ck3").checked=false;
  document.getElementById("txt_ck4").checked=false;
  document.getElementById("txt_ck5").checked=false;
  document.getElementById("txt_ck6").checked=false;
  document.getElementById("txt_ck7").checked=false;
  document.getElementById("txt_ck8").checked=false;
}

/*===================================
  =   PARA CREAR UN PROYECTO NUEVO  =
  ===================================*/ 
function crear_proyecto(){
  var proyecto  = $("#txt_nombre_proyecto").val();
  var cb_estado = $("#cb_estado").val();
  var tipo_proyecto = $("#txt_tipo_proyecto").val();  
  var cb_centro = $("#cb_centro_regional").val();
  var cb_facu = $("#cb_facultad").val();
  var cb_carre = $("#cb_carrera").val();
  var fecha1 = $("#txt_fecha_inicio").val();
  var fecha2 = $("#txt_fecha_final").val();
  var fecha3 = $("#txt_fecha_inicio_rev").val();
  var fecha4 = $("#txt_fecha_final_rev").val();
  var area = $("#txt_area_descripcion").val();
  var directos = $("#txt_directos").val(); 
  var indirectos = $("#txt_indirectos").val(); 
  var total_bene = $("#txt_total_beneficiarios").val();
  var modalidad = $("#cb_modalidad").val();
  var tipo_modalidad = $("#cb_tipo_modalidad").val();
  var TK_v1 = $("#txt_ck1").val();
  var TK_v2 = $("#txt_ck2").val();
  var TK_v3 = $("#txt_ck3").val();
  var TK_v4 = $("#txt_ck4").val();
  var TK_v5 = $("#txt_ck5").val();
  var TK_v6 = $("#txt_ck6").val();
  var TK_v7 = $("#txt_ck7").val();
  var TK_v8 = $("#txt_ck8").val();
  var porce1 = $("#txt_porc_unah").val();
  var porce2 = $("#txt_porc_empresa").val();
  var moneda = $("#valida_moneda").val();
  var total_usd = $("#txt_total_usd").val();
  var total_lps = $("#txt_total_lps").val();
  var aporte = $("#cb_aporte").val();
  var formalizacion = $("#cb_formalizacion").val();
  var periodo = $("#cb_periodo").val();
  var cb_clase = $("#cb_asignatura").val();
  var seccion = $("#cb_seccion").val();
  var region = $("#cb_region").val();
  var cb_depto = $("#cb_depto").val();
  var cb_muni = $("#cb_muni").val();
  var aldea = $("#txt_aldea_caserio").val();
  var colonia = $("#txt_colonia_barrio").val();
  var objetivos = $("#txt_area_objetivos").val();
  var inmediatos = $("#txt_area_inmediatos").val();
  var resultados = $("#txt_area_resultados").val();
  var actividades = $("#txt_area_actividades").val();
  var cb_empresa = $("#cb_empresa").val();
  var contacto = $("#cb_contacto_empresa").val();


        $.ajax({
          url: "../Controlador/crear_proyecto_nuevo_controlador.php",
          type: "POST",
          data: {
            proyecto:proyecto,
            cb_estado:cb_estado,
            tipo_proyecto:tipo_proyecto,
            cb_centro:cb_centro,
            cb_facu:cb_facu,
            cb_carre:cb_carre,
            fecha1:fecha1,
            fecha2:fecha2,
            fecha3:fecha3,
            fecha4:fecha4,
            area:area,
            directos:directos,
            indirectos:indirectos,
            total_bene:total_bene,
            modalidad:modalidad,
            tipo_modalidad:tipo_modalidad,
            TK_v1:TK_v1,
            TK_v2:TK_v2,
            TK_v3:TK_v3,
            TK_v4:TK_v4,
            TK_v5:TK_v5,
            TK_v6:TK_v6,
            TK_v7:TK_v7,
            TK_v8:TK_v8,
            porce1:porce1,
            porce2:porce2,
            moneda:moneda,
            total_usd:total_usd,
            total_lps:total_lps,
            aporte:aporte,
            formalizacion:formalizacion,
            periodo:periodo,
            cb_clase:cb_clase,
            seccion:seccion,
            region:region,
            cb_depto:cb_depto,
            cb_muni:cb_muni,
            aldea:aldea,
            colonia:colonia,
            objetivos:objetivos,
            inmediatos:inmediatos,
            resultados:resultados,
            actividades:actividades,
            cb_empresa:cb_empresa,
            contacto:contacto,        

          },      
        });      
        
        //window.open("../Controlador/reporte_proyecto_nuevo_controlador.php?proyecto=proyecto");
        limpiar_proyecto();
        window.location.href="../vistas/GestionProyecto_listaproyectos.php";
        

       

}


/*=====================================
  =   INSERTAR LOS DATOS DE PERSONA   =
  =====================================*/ 
function sel_responsable(){    
  var nombre = $("#txt_nombre_responsable").val();  
  var tel = $("#txt_tel_responsable").val();  
  var cel = $("#txt_cel_responsable").val();
  var cor = $("#txt_cor_responsable").val();  
  var dir = $("#txt_dir_responsable").val();
  var cargo = $("#txt_cargo_responsable").val();
  
  
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
            dir: dir,
            cargo: cargo,        
          },      
        }).then(function(respuesta){        

              //if(respuesta){
                  document.getElementById("el_tipo_persona").value="";
                  document.getElementById("nombre_persona").value="";
                  document.getElementById("txt_nombre_responsable").value="";      
                  document.getElementById("txt_cel_responsable").value="";
                  document.getElementById("txt_tel_responsable").value="";                  
                  document.getElementById("txt_cor_responsable").value="";
                  document.getElementById("txt_dir_responsable").value="";
                  document.getElementById("txt_cargo_responsable").value=""; 
                
                
                  swal({
                    title: "¡Buen trabajo!",
                    text: "¡Se asignado a " +nombre+ " exitosamente!",
                    type: "success",
                    showConfirmButton: true,
                    timer: 10000,
                  });     
                tablaResponables.ajax.reload();
              //}
          });
       }  
}
/*
$(document).ready(function () {
  $('[name="checks[]"]').click(function () {
    var arr = $('[name="checks[]"]:checked')
      .map(function () {
        return this.value;
      })
      .get();

    var str = arr.join(",");

    $("#arr").text(JSON.stringify(arr));

    $("#str").text(str);

    $("#vinculacion").val(str);

    console.log(str);
  });
});*/



/*=================================================
  = FUNCION PARA GESTION DE LA TABLA RESPONSABLES =
  =================================================*/
$(document).ready(function(){
  var id_usuario, opcion;
  opcion = 2; 
      
      /*=========================================
        = FUNCION PARA BORRAR DATOS DE LA TABLA =
        =========================================*/
    $(document).on("click", ".btnBorrar", function(){
      fila = $(this);           
      id_usuario = parseInt($(this).closest('tr').find('td:eq(0)').text());		
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
                    contador_resta();
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
            {data: "telefono"},            
            {data: "celular"},
            {data: "correo"},           
            {data: "direccion"},
            {data: "cargo"},            
            {defaultContent: "<div class='text-center'><div class='btn-group'><button class='btn btn-danger btn-sm btnBorrar'><i class='fas fa-trash'></i></button></div></div>"}           
                              
            
        ],
        language: idioma_espanol
    }); 
    
});


/*==============================================
  = FUNCION PARA LLENAR LA TABLA DE LOS ANEXOS =
  ==============================================*/
$(document).ready(function(){
  var opcion;
  var enlace =  "$_SERVER['HTTP_HOST']?>";
  var directorio = "../archivos/archivos_de_proyecto";
  opcion = 1;                    
      
      tablaAnexos = $('#tablaAnexos').DataTable({  
        ajax:{            
            url: "../Controlador/tabla_anexos_controlador.php", 
            method: 'POST', //usamos el metodo POST
            data:{opcion:opcion}, //enviamos opcion 4 para que haga un SELECT
            dataSrc:""
        },
        columns:[
            {data: "codigo"},
            {data: "titulo"},            
            {data: "descripcion"}             
        ],
        language: idioma_espanol
    });     
});

/*============================
  =    TAMAÑO DE DOCUMENTO   =
  ============================*/
  var uploadField = document.getElementById('adjunto');

  uploadField.onchange = function() {
    if (this.files[0].size > 15728640) {
      //alert("Archivo muy grande!");
      swal('¡Advertencia!', '¡El archivo que intenta subir excede el limite permitido!', 'warning');
  
      this.value = '';
    }
  }; 
  

/*===================================
  =   PARA GUARDAR LOS ANEXOS       =
  ===================================*/ 
  function guardar_anexo(){    
    var formData = new FormData();
    var adjunto = $('#adjunto')[0].files[0];
    var desc_doc = $('#txt_desc_doc').val();
    var titulo = $('#txt_titulo_doc').val();
    var tipo_anexo = $('#cb_tipo_anexo').val();
    formData.append('adjunto', adjunto);
    formData.append('desc_doc', desc_doc);
    formData.append('tipo_anexo', tipo_anexo);
    formData.append('titulo', titulo);
    //formData.append('nombrearchivo',nombrearchivo);

    if(desc_doc == "" || titulo == ""  || tipo_anexo==0){
        swal({
          title: "¡Alerta!",
          text: "¡Debe llenar los campos vacios!",
          type: "warning",
          showConfirmButton: true,
          timer: 15000,
        }); 

    }else{

      //$('#btnGuardar').removeAttr('disabled');     

      $.ajax({
        url: '../Controlador/insertar_anexos_tabla_controlador.php',
        type: 'post',
        data: formData,
        contentType: false,
        processData: false,
        success: function(respuesta){
          //tablaResponables.row(fila.parents('tr')).add().draw(); 
          document.getElementById("adjunto").value="";
          document.getElementById("txt_desc_doc").value="";
          document.getElementById("txt_titulo_doc").value="";  
          document.getElementById("cb_tipo_anexo").value=0;
        
          swal({
            title: "¡Buen trabajo!",
            text: "¡Se adjunto el documento exitosamente!",
            type: "success",
            showConfirmButton: true,
            timer: 15000,
          }); 
          tablaAnexos.ajax.reload(); 
        }          
      })

    }  
       
    return false;
  }  


/*==================PROBANDO NUEVA TABLA ============================*/


contador =0;

function contador_resta(){  
  document.forms.formRegistro.contador.value = --contador;
    
}

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




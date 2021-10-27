if ((document.getElementsByName = 'cbm_persona')) {
	llenar_persona();
}

if ((document.getElementsByName = 'cbm_comision1')) {
	llenar_comision();
}

if ((document.getElementsByName = 'cbm_edificio')) {
	llenar_edificio();
}

if ((document.getElementsByName = 'cbm_aulal')) {
	llenar_tipoaula();
}

if ((document.getElementsByName = 'cbm_carrera')) {
	llenar_carrera();
}

if ((document.getElementsByName = 'cbm_departamento')) {
	llenar_departamento();
}

if ((document.getElementsByName = 'cbm_tipanexo')) {
	llenar_tipanexo();
}


if ((document.getElementsByName = 'cbm_estado')) {
	llenar_estado();
}


if ((document.getElementsByName = 'cbm_clasificacion')) {
	llenar_clasificacion();
}

if ((document.getElementsByName = 'cbm_tipcontacto')) {
	llenar_tipcontacto();
}

if ((document.getElementsByName = 'cbm_region')) {
	llenar_region();
}


if ((document.getElementsByName = 'cbm_facultad')) {
	llenar_facultad();
}
if ((document.getElementsByName = 'tipo_periodo')) {
	llenar_facultad();
}




function llenar_persona() {
	var cadena = '&activar=activar';
	$.ajax({
		url: '../Controlador/mantenimientos_controlador.php?op=listar_persona',
		type: 'POST',
		data: cadena,
		success: function(r) {
			// console.log(r);
			$('#cbm_persona').html(r).fadeIn();
		}
	});
}
llenar_persona();

$('#cbm_persona').change(function() {
	var persona = $(this).val();
	console.log(persona);
	$('#persona1').val(persona);
});

function llenar_comision() {
	var cadena = '&activar=activar';
	$.ajax({
		url: '../Controlador/mantenimientos_controlador.php?op=listar_comision',
		type: 'POST',
		data: cadena,
		success: function(r) {
			// console.log(r);
			$('#cbm_comision1').html(r).fadeIn();
		}
	});
}
llenar_comision();

$('#cbm_comision1').change(function() {
	var comision = $(this).val();
	console.log(comision);
	$('#comision1').val(comision);
});


function llenar_edificio() {
  var cadena = "&activar=activar";
  $.ajax({
    url: "../Controlador/mantenimientos_controlador.php?op=listar_edificio",
    type: "POST",
    data: cadena,
    success: function (r) {
      // console.log(r);
      $("#cbm_edificio").html(r).fadeIn();
    },
  });
}
llenar_edificio();

$("#cbm_edificio").change(function () {
  var edificio = $(this).val();
  console.log(edificio);
  $("#edificio").val(edificio);
  
});


function llenar_tipoaula() {
  var cadena = "&activar=activar";
  $.ajax({
    url: "../Controlador/mantenimientos_controlador.php?op=listar_aula",
    type: "POST",
    data: cadena,
    success: function (r) {
      // console.log(r);
      $("#cbm_aula").html(r).fadeIn();
    },
  });
}
llenar_tipoaula();

$("#cbm_aula").change(function () {
  var aula = $(this).val();
  console.log(aula);
  $("#aula").val(aula);
  
});

function llenar_carrera() {
	var cadena = "&activar=activar";
	$.ajax({
	  url: "../Controlador/mantenimientos_controlador.php?op=listar_carrera",
	  type: "POST",
	  data: cadena,
	  success: function (r) {
		// console.log(r);
		$("#cbm_carrera").html(r).fadeIn();
	  },
	});
  }
  llenar_carrera();
  
  $("#cbm_carrera").change(function () {
	var carrera = $(this).val();
	console.log(carrera);
	$("#carrera1").val(carrera);
	
  });

function llenar_departamento() {
	var cadena = '&activar=activar';
	$.ajax({
		url: '../Controlador/mantenimientos_controlador.php?op=listar_departamento',
		type: 'POST',
		data: cadena,
		success: function (r) {
			// console.log(r);
			$('#cbm_departamento').html(r).fadeIn();
		}
	});
}
llenar_departamento();

$('#cbm_departamento').change(function () {
	var departamento = $(this).val();
	console.log(departamento);
	$('#departamento1').val(departamento);
});

function llenar_tipanexo() {
	var cadena = '&activar=activar';
	$.ajax({
		url: '../Controlador/mantenimientos_controlador.php?op=listar_tipanexo',
		type: 'POST',
		data: cadena,
		success: function (r) {
			// console.log(r);
			$('#cbm_tipanexo').html(r).fadeIn();
		}
	});
}
llenar_tipanexo();

$('#cbm_tipanexo').change(function () {
	var nombre = $(this).val();<
	console.log(nombre);
	$('#tipanexo1').val(nombre);
});



function llenar_estado() {
	var cadena = '&activar=activar';
	$.ajax({
		url: '../Controlador/mantenimientos_controlador.php?op=listar_estado',
		type: 'POST',
		data: cadena,
		success: function (r) {
			// console.log(r);
			$('#cbm_estado').html(r).fadeIn();
		}
	});
}
llenar_estado();

$('#cbm_estado').change(function () {
	var descripcion = $(this).val();<
	console.log(descripcion);
	$('#estado1').val(descripcion);
});


function llenar_clasificacion() {
	var cadena = '&activar=activar';
	$.ajax({
		url: '../Controlador/mantenimientos_controlador.php?op=listar_clasificacion',
		type: 'POST',
		data: cadena,
		success: function (r) {
			// console.log(r);
			$('#cbm_clasificacion').html(r).fadeIn();
		}
	});
}
llenar_clasificacion();

$('#cbm_clasificacion').change(function () {
	var descripcion = $(this).val();<
	console.log(descripcion);
	$('#clasificacion1').val(descripcion);
});

function llenar_tipcontacto() {
	var cadena = '&activar=activar';
	$.ajax({
		url: '../Controlador/mantenimientos_controlador.php?op=listar_tipcontacto',
		type: 'POST',
		data: cadena,
		success: function (r) {
			// console.log(r);
			$('#cbm_tipcontacto').html(r).fadeIn();
		}
	});
}
llenar_tipcontacto();

$('#cbm_tipanexo').change(function () {
	var descripcion = $(this).val();<
	console.log(descripcion);
	$('#tipcontacto1').val(descripcion);
});

function llenar_region() {
	var cadena = '&activar=activar';
	$.ajax({
		url: '../Controlador/mantenimientos_controlador.php?op=listar_tipcontacto',
		type: 'POST',
		data: cadena,
		success: function (r) {
			// console.log(r);
			$('#cbm_region').html(r).fadeIn();
		}
	});
}
llenar_region();

$('#cbm_region').change(function () {
	var region = $(this).val();<
	console.log(region);
	$('#region1').val(region);
});



function llenar_facultad() {
	var cadena = "&activar=activar";
	$.ajax({
		url: "../Controlador/mantenimientos_controlador.php?op=listar_facultad",
		type: "POST",
		data: cadena,
		success: function (r) {
			// console.log(r);
			$("#cbm_facultad").html(r).fadeIn();
		},
	});
}
llenar_facultad();

$("#cbm_facultad").change(function () {
	var nombre = $(this).val();
	console.log(nombre);
	$("#facultad1").val(nombre);

});

function llenar_tipo_periodo() {
	var cadena = "&activar=activar";
	$.ajax({
	  url: "../Controlador/reporte_carga_controlador.php?op=select8",
	  type: "POST",
	  data: cadena,
	  success: function (r) {
		  
		$("#tipo_periodo").html(r).fadeIn();
	  },
	});
  }
  llenar_carrera();



//FUNCION CONSULTA SI EXISTE UN NUMERO DE IDENTIDAD EN LA BASE
function ExisteIdentidad() {
	identidad = $('#identidad').val();

	$.post('../Controlador/registro_docente_controlador.php?op=ExisteIdentidad', { identidad: identidad }, function(
		data,
		status
	) {
		console.log(data);
		data = JSON.parse(data);
		console.log(data);
		if (data.existe == 1) {
			$('#TextoIdentidad').removeAttr('hidden');
			//swal('error', 'Existe registro con esta identidad', 'warning');
			$('#identidad').val('');
		} else {
			$('#TextoIdentidad').attr('hidden', 'hidden');
		}
	});
}

//variable
var curriculo = document.getElementById('curriculum');

//============================
//      TAMAÑO DE CURRICULUM    =
//============================
var uploadField = document.getElementById('curriculum');

uploadField.onchange = function() {
	if (this.files[0].size > 15728640) {
		//alert("Archivo muy grande!");
		swal('Error', 'Archivo muy grande!', 'warning');

		this.value = '';
	}
}; 

//FUNCION QUE INGRESA O CARGA EL CURRICULUM
function Registrarcurriculum() {
	var formData = new FormData();
	var curriculum = $('#curriculum')[0].files[0];
	formData.append('c', curriculum);
	//formData.append('nombrearchivo',nombrearchivo);

	$.ajax({
		url: 'subirdocumento.php',
		type: 'post',
		data: formData,
		contentType: false,
		processData: false,
		success: function(respuesta) {
			if (respuesta != 0) {
				Swal('Mensaje De Confirmacion', 'Se subio el curriculum con exito', 'success');
			}
		}
	});
	return false;
}
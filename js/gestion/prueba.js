
//telefonos
var sendData = {};
var list = [];
var telefono = document.getElementById('tel');
var table1 = document.getElementById('tbData2');

//FUNCION QUE VALIDA QUE LOS NUMEROS DE TELEFONO SEAN LOCALES
function valtel(tel) {
	var expresion3 = /(9|8|3|2)\d{3}[-]\d{4}/;
	console.log(expresion3.test(tel));
	if (list.length <= 3 && expresion3.test(tel)) {
		return 1;
	} else {
		return 0;
	}
}

var addTask = () => {
	//var n = telefono.search("_");
	if ($('#tel').val().length == 0) {
		swal('Ingrese el telefono!', '', 'warning');

		return false;
	} else {
		if (list.length == 0) {
			if (valtel($('#tel').val()) == 0) {
				//aqui debo validar que no se agregue a la tabla ...
				swal('ingresar un numero valido');

				limpiarTEL();
				return false;
			}
		} else {
			if (valtel($('#tel').val()) == 0) {
				//aqui debo validar que no se agregue a la tabla ...
				swal('ingresar un numero valido');

				limpiarTEL();
				return false;
			}
		}

		var item = {
			telefono: telefono.value
		};
		console.log(item);

		list.push(item);

		viewlist();
		limpiarTEL();
	}

	
};

function limpiarTEL() {
	document.getElementById('tel').value = '';
}


var viewlist = () => {
	if (list.length <= 3) {
		var viewItem = '';
		list.map((item, index) => {
			item.id = index + 1;
			viewItem += `<tr>`;
			viewItem += `<td >${item.telefono}</td>`;
			//viewItem += `<td><button class="btn btn-danger btn_remove" type='button' id="remove">X</button></td>`;
			viewItem += `</tr>`;
		});
		table1.innerHTML = viewItem;
		$('#ModalTask1').modal('hide');

		if (list.length == 3) {
			desactivarboton1();
			swal('Aviso', 'limite 3 telefonos', 'warning');

			$('#ModalTask1').modal('hide');
		}
	}

	
};

var saveAll = () => {
	if (list.length > 0) {
		sendData.id = 1;
		sendData.data = list;
		console.log(sendData);

		fetch('../api/guardar_telefonos.php', {
			method: 'POST',
			body: JSON.stringify(sendData)
		})
			.then((response) => response.json())
			.then((response) => console.log(response));
		//alert("contactos creados!");

		//window.location.href = window.location.href;
	} else {
		//alert("No registró telefonos!");
		// Location.reload()
	}
};
function limpiarTEL() {
	document.getElementById('tel').value = '';
}
function desactivarboton1() {
	document.getElementById('gcorreotel').disabled = true;
}

//correos
var sendData5 = {};
var list5 = [];
var correo = document.getElementById('email');
var table5 = document.getElementById('tbData5');

const x = 0;
function correoInstDet(correo) {
	var expresion = /^([a-z0-9_\.-]+)@unah\.edu\.hn$/;
	//console.log(expresion.test(correo));
	if (list5.length <= 2 && expresion.test(correo)) {
		return 1;
	} else {
		return 0;
	}
}
//FUNCION QUE VERIFICA UN CORREO VALIDO
function correovalido(correo1) {
	var expresion1 = /^\w+([\.-]?\w+)*@(?:|hotmail|outlook|yahoo|live|gmail)\.(?:|com|es)+$/;

	//console.log(expresion1.test(correo1));
	if (list5.length <= 2 && expresion1.test(correo1)) {
		return 1;
	} else {
		return 0;
	}
}

var addTask5 = () => {
	if ($('#email').val().length == 0) {
		swal('Ingrese el correo!', '', 'warning');

		return false;
	} else {
		//console.clear();
		if (list5.length == 0) {
			if (correoInstDet($('#email').val()) == 0) {
				//aqui debo validar que no se agregue a la tabla ...

				swal('Alerta', 'Primero Ingresar correo institucional', 'warning');

				limpiarCOR();
				return false;
			} else {
				//console.log("exitosss xD") ;
			}
		} else {
			if (correovalido($('#email').val()) == 0) {
				//aqui debo validar que no se agregue a la tabla ...
				swal('ingresar un correo valido');

				limpiarCOR();
				return false;
			} else {
				desactivarboton();

				swal('Aviso', 'limite 2 correos', 'warning');

				$('#ModalTask5').modal('hide');
			}
		}
		var item5 = {
			correo: correo.value
		};

		list5.push(item5);

		//console.log(correo);

		viewlist5();
		limpiarCOR();
	}
};
function limpiarCOR() {
	document.getElementById('email').value = '';
}
function limpiarTEL() {
	document.getElementById('tel').value = '';
}


//telefonos
var sendData = {};
var list = [];
var telefono = document.getElementById('txt_contacto_tel');
var correo = document.getElementById('txt_contacto_otro');
var table1 = document.getElementById('tbData2');
var tipo_contacto_=document.getElementById('txt_tipo_contacto');
//var index = 0;

function verificacion(){
	
	var tipo_contacto_=document.getElementById('txt_tipo_contacto');
    var seleccion = tipo_contacto_.options[tipo_contacto_.selectedIndex].text;
    var tipo_ =document.getElementById('txt_tipo_contacto').value;
	if (tipo_ == 0){ 
		swal('Seleccione tipo de dato', '', 'warning');
		 
	}else{

	
if (seleccion=="TELEFONO") {
	addTask()
}else{
	if (seleccion=="CORREO ELECTRONICO") {
	
		addTask5()
	}else{
		addTask6()
	}
}
}
}
//FUNCION QUE VALIDA QUE LOS NUMEROS DE TELEFONO SEAN LOCALES
function valtel(tel) {
    var tipo_contacto_=document.getElementById('txt_tipo_contacto').value;
	
	var expresion3 = /(9|8|3|2)\d{3}[-]\d{4}/;
	console.log(expresion3.test(tel));
	if (tipo_contacto_ >= 1 && expresion3.test(tel)) {
		return 1;
	} else {
		return 0;
	}
}

var addTask = () => {

	
	if ($('#txt_contacto_tel').val().length == 0) {
		swal('Tiene campos vacíos', '', 'warning');

		return false;
	} else {
		
			if (valtel($('#txt_contacto_tel').val()) == 0) {
				//aqui debo validar que no se agregue a la tabla ...
				swal('Datos incorrecto');

				//limpiarTEL();
				return false;
			}
		 else {
		
		}

	
	}
	
    var item = {
        contacto: telefono.value,
		tipo: parseInt(tipo_contacto_.value)
    };
	

    console.log(item);

    list.push(item);

    viewlist();
    limpiarTEL();

	
};



function agregar_input(){

    
    var tipo_contacto_=document.getElementById('txt_tipo_contacto');
    var seleccion = tipo_contacto_.options[tipo_contacto_.selectedIndex].text;
    if (seleccion == "TELEFONO"){
	   document.getElementById("etiqueta").style.display = "block";
       document.getElementById("txt_contacto_tel").style.display = "block";
       document.getElementById("txt_contacto_otro").style.display = "none";

	   document.getElementById("txt_contacto_tel").value = "";
       document.getElementById("txt_contacto_otro").value = "";

  
    }else{
		
		document.getElementById("etiqueta").style.display = "block";
		document.getElementById("txt_contacto_otro").style.display = "block";
		document.getElementById("txt_contacto_tel").style.display = "none";
		document.getElementById("txt_contacto_tel").value = "";
		document.getElementById("txt_contacto_otro").value = "";

    }
	if (seleccion == "CORREO ELECTRONICO"){
		document.getElementById("txt_contacto_otro").placeholder = "ejemplo@dominio.com";		
	}else{
		if (seleccion == "FACEBOOK"){
			document.getElementById("txt_contacto_otro").placeholder = "facebook";		
		}else{
			if (seleccion == "INSTAGRAM"){
				document.getElementById("txt_contacto_otro").placeholder = "instagram";		
			}
		}
	}
}


function limpiarTEL() {
	document.getElementById('txt_contacto_tel').value = '';
    document.getElementById('txt_tipo_contacto').selectedIndex = 0;
}


var viewlist = () => {

 
		var viewItem = '';
		list.map((item, index) => {
			item.id = index + 1;
			viewItem += `<tr>`;
            viewItem += `<td>${item.contacto}</td>`;
			viewItem += `<td><input class="btn btn-danger btn_remove" value="X" type='button' id="remove" onclick="deleteRow(this,${item.id})"></button></td>`;
			viewItem += `</tr>`;
		
		});
		
		table1.innerHTML = viewItem;

			reinicio ()
		$('#ModalTask1').modal('hide');
	//	reinicio ();
seleccion ="";

	
};


//correos





const x = 0;

//FUNCION QUE VERIFICA UN CORREO VALIDO
function correovalido(correo1) {
	var tipo_contacto_=document.getElementById('txt_tipo_contacto').value;
	var expresion1 = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9-]+[.][A-Za-z]{2,}$/;

	


	
	if (tipo_contacto_>=1 && expresion1.test(correo1)) {
		return 1;
		
	} else {
		return 0;
	}
}

var addTask5 = () => {
	
	if ($('#txt_contacto_otro').val().length == 0) {
		swal('Tiene campos vacíos', '', 'warning');

		return false;
	} else {
		
			if (correovalido($('#txt_contacto_otro').val()) == 0) {
				//aqui debo validar que no se agregue a la tabla ...
				swal('Dato incorrecto');

				
				return false;
			}
				
		}
		
			var item = {
				contacto: correo.value,
				tipo: parseInt(tipo_contacto_.value)
			};
	
			list.push(item);
	
			console.log(item);
	
			viewlist5()
			limpiarCOR()
		
	
};
function limpiarCOR() {
	document.getElementById('txt_contacto_otro').value = '';
    document.getElementById('txt_tipo_contacto').selectedIndex = 0;
}


var viewlist5 = () => {
	

		var viewItem = '';
		list.map((item, index) => {
			item.id = index + 1;
			viewItem += `<tr>`;
			viewItem += `<td>${item.contacto}</td>`;
			viewItem += `<td><input type="button" value="X" class="btn btn-danger btn_remove" type='button' id="remove" onclick="deleteRow(this,${item.id})"></button></td>`;
			viewItem += `</tr>`;
			
		});
		
		table1.innerHTML = viewItem;
		console.log(list);
	
	   reinicio()
		$('#ModalTask1').modal('hide');
		
		
		
		
};


function deleteRow(row,item_id){

  var i = list.findIndex(x => x.id === item_id);

  list.splice(i, 1);
  var d = row.parentNode.parentNode.rowIndex;
  document.getElementById('dsTable').deleteRow(d);
  
 }

 

function reinicio (){
	document.getElementById("etiqueta").style.display = "none";
	document.getElementById("txt_contacto_tel").style.display = "none";
	document.getElementById("txt_contacto_otro").style.display = "none";
}


function guardar_datos_empresa(){
	var nombre_empre = document.getElementById("txt_nombre_empresa").value;
    var tipo_cla =	document.getElementById("txt_clasificacion").value;
	var nombre_contacto_empre = document.getElementById("txt_contacto_nombre").value;
	nombre_empre.trim()
	nombre_contacto_empre.trim()

	if (nombre_empre.length == 0 || tipo_cla == 0   || nombre_contacto_empre.length==0 || list.length==0) {
	swal({
			title: 'alerta',
			text: 'Faltan campos por llenar',
			type: 'warning',
			showConfirmButton: true,
			timer: 15000
		});
		
	
	}else
	if (nombre_empre == " " || nombre_contacto_empre ==" ") {
		swal({
				title: 'alerta',
				text: 'Faltan campos por llenar',
				type: 'warning',
				showConfirmButton: true,
				timer: 15000
			});
			
		
		}else{

		Registar_empresa()
		
}
	
}


function Registar_empresa() {
	var nombre_empre = document.getElementById("txt_nombre_empresa").value;
    var tipo_cl =	document.getElementById("txt_clasificacion").value;

			nombre_empre = nombre_empre.toUpperCase();
			tipo_cla= parseInt(tipo_cl);

			var datos = {
				nombre_empre: nombre_empre,
				tipo_cl: tipo_cl
			};

			const xhr = new XMLHttpRequest();
			xhr.open('POST', '../api/guardar_empresa_proyecto.php', true);
			//xhr.setRequestHeader("Content-Type", "application/json");
			xhr.send(JSON.stringify(datos));
			console.log(datos);
			xhr.onload = function() {
				if (this.status == 200) {
					console.log(xhr.responseText);

				Registar_nombre_contacto()

				} else {
					if (this.status == 409) {
						console.log(xhr.responseText);
					
						swal({
							title:"",
							text:"Lo sentimos la empresa ya existe",
							type: "error",
							showConfirmButton: false,
							timer: 3000
						 });
					
				
			}else{

				if (this.status == 401) {
					console.log(xhr.responseText);
				swal({
					title:"",
					text:"Lo sentimos los datos no fueron guardados correctamente",
					type: "error",
					showConfirmButton: false,
					timer: 3000
				 });

			}

		}

				}
			}
}


	
function Registar_nombre_contacto() {
	var nombre_contacto_empre = document.getElementById("txt_contacto_nombre").value;
		nombre_contacto_empre = nombre_contacto_empre.toUpperCase();
		var datos2 = {
			nombre_contacto_empre: nombre_contacto_empre

		};
		const xhr = new XMLHttpRequest();
		xhr.open('POST', '../api/guardar_nombre_contacto.php', true);
		//xhr.setRequestHeader("Content-Type", "application/json");
		xhr.send(JSON.stringify(datos2));
		
		xhr.onload = function() {
			if (this.status == 200) {
				console.log(xhr.responseText);
				registrar_contacto()

			} else {
				if (this.status == 401) {
					console.log(xhr.responseText);
	
					swal({
						title:"",
						text:"Lo sentimos los datos no fueron guardados correctamente",
						type: "error",
						showConfirmButton: false,
						timer: 3000
					 });
			
		}

	}

}			
			
	}





	var registrar_contacto = () => {
	
		if (list.length > 0) {

			const xhr = new XMLHttpRequest();
			xhr.open('POST', '../api/guardar_contacto.php', true);
			xhr.setRequestHeader("Content-Type", "application/json");
			xhr.send(JSON.stringify(list));
			
			xhr.onload = function() {
				if (this.status == 200) {
					console.log(xhr.responseText);
			
					swal({
						 title:"",
						 text:"Los datos  se almacenaron correctamente",
						 type: "success",
						 showConfirmButton: false,
						 timer: 3000
					  });
					  $(".FormularioAjax")[0].reset();
					  location.replace('../vistas/empresas_proyecto_vista.php');
				
				
				} else {
					console.log(xhr.responseText);
					swal({
						title:"",
						text:"Lo sentimos los datos no fueron guardados correctamente",
						type: "error",
						showConfirmButton: false,
						timer: 3000
					 });
					
				
			}

		}
	}
	};

	//solo permitir letras o numeros

  /*==============================================
    =     VALIDACION SOLO LETRAS            =
    ==============================================*/
    function sololetras(e){
        
        key=e.keyCode || e.wich;
    
        teclado= String.fromCharCode(key).toUpperCase();
    
        letras= " ABCDEFGHIJKLMNOPQRSTUVWXYZÑ";
        
        especiales ="8-37-38-46-164";
    
        teclado_especial=false;
    
        for (var i in especiales) {
          
          if(key==especiales[i]){
            teclado_especial= true;break;
          }
        }
    
        if (letras.indexOf(teclado)==-1 && !teclado_especial) {
          return false;
        }
    
    }


	 /*==============================================
    =     VALIDACION SOLO correos           =
    ==============================================*/
    function sololetras2(e){
        
        key=e.keyCode || e.wich;
    
        teclado= String.fromCharCode(key).toUpperCase();
    
        letras= " ABCDEFGHIJKLMNOPQRSTUVWXYZÑ@.";
        
        especiales ="8-37-38-46-164";
    
        teclado_especial=false;
    
        for (var i in especiales) {
          
          if(key==especiales[i]){
            teclado_especial= true;break;
          }
        }
    
        if (letras.indexOf(teclado)==-1 && !teclado_especial) {
          return false;
        }
    
    }

	  //no permite dobre espacio
	  function DobleEspacio(campo, event) {

		CadenaaReemplazar = "  ";
		CadenaReemplazo = " ";
		CadenaTexto = campo.value;
		CadenaTextoNueva = CadenaTexto.split(CadenaaReemplazar).join(CadenaReemplazo);
		campo.value = CadenaTextoNueva;
	  
	  }




	  //agregar otro tipo de contacto


	  var addTask6 = () => {
	
		if ($('#txt_contacto_otro').val().length == 0) {
			swal('Tiene campos vacíos', '', 'warning');
	
			return false;
		} else {
			var tipo_contacto_=document.getElementById('txt_tipo_contacto').value;
			var otro_contacto_=document.getElementById('txt_contacto_otro').value;
			
				var item = {
					contacto: otro_contacto_,
					tipo: parseInt(tipo_contacto_)
				};
		
				list.push(item);
		
				console.log(item);
		
				viewlist6()
				limpiarCOR()
			
		
	};
}

	var viewlist6 = () => {
	

		var viewItem = '';
		list.map((item, index) => {
			item.id = index + 1;
			viewItem += `<tr>`;
			viewItem += `<td>${item.contacto}</td>`;
			viewItem += `<td><input type="button" value="X" class="btn btn-danger btn_remove" type='button' id="remove" onclick="deleteRow(this,${item.id})"></button></td>`;
			viewItem += `</tr>`;
			
		});
		
		table1.innerHTML = viewItem;
		console.log(list);
	
	   reinicio()
		$('#ModalTask1').modal('hide');
		
		
		
		
};
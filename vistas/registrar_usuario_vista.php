<?php
require_once ('../clases/conexion.php');
$identidad_persona=strtoupper ($_POST['identidad_persona']);
 $sqlexiste=("select count(identidad) as identidad  from tbl_personas where identidad='$identidad_persona'");
$existe = mysqli_fetch_assoc($conection->query($sqlexiste));

/* Logica para que no acepte campos vacios */
if ($_POST['identidad_persona']  <>' ')
{
  /* Condicion para que no se repita el rol*/
    if ($existe['identidad']==1)
    {
      $var="Error";
      header("Location: ../vistas/registrar_persona_vista.php?fallo= true");
    }
    else
    {
      
    }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>PISTACCHIO | Crear Usuario</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/adminlte.min.css">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="../../index2.html"><b>PISTACCHIO</b> Catering</a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Ingrese su correo Electronico</p>
      <form action="../controlador/guardar_usuario_controlador1.php" method="post">
        <div class="input-group mb-3">
          <input type="email" class="form-control" id="correo" name="correo" placeholder="Correo" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <p class="login-box-msg">Defina un Nombre de Usuario</p>
        <div class="input-group mb-3">
        <input class="form-control" type="text" id="usuario" name="usuario"  value="" required style="text-transform: uppercase" onkeyup="Espacio(this, event)"  onkeypress="return Letras(event)"  maxlength="30">
        </div>
        <p class="login-box-msg">Defina una Contraseña</p>
        <div class="input-group mb-3">
          <input type="password" class="form-control" id="contra" name="contra" placeholder="Contraseña" minlength="8" maxlength="12" required="" onkeyup="Espacio(this, event)" >
          <div class="input-group-append">
            <div type ="button" class="input-group-text" onclick="mostrar()">
              <span class="fas fa-eye"></span>
            </div>
          </div>
        </div>
        <p class="login-box-msg">Confirme la Contraseña</p>
        <div class="input-group mb-3">
          <input type="password" class="form-control" id="confi_contra" name="confi_contra" placeholder="Password" minlength="8" maxlength="12" required="" onkeyup="Espacio(this, event)" >
          <div class="input-group-append">
          <div type ="button" class="input-group-text" onclick="mostrar2()">
              <span class="fas fa-eye"></span>
            </div>
          </div>
        </div>
        <input type="text" class="form-control" id="id" name="id" value= "<?php echo $_POST['identidad_persona']; ?>" style="display:none">
        <input type="text" class="form-control" id="nombre" name="nombre" value= "<?php echo $_POST['nombre']; ?>" style="display:none">
        <div id="msg"></div>
        

        <!-- Fin Mensajes de Verificación -->
        <center>
          <div>
            <button type="submit" id="login" name="login" class="btn btn-primary">Crear mi usuario</button>
          </div>
        </center>
          <!-- /.col -->
        </div>
      </form>

    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/adminlte.min.js"></script>
<script>
          //No permite Espacio
function Espacio(campo, event) {

  CadenaaReemplazar = " ";
  CadenaReemplazo = "";
  CadenaTexto = campo.value;
  CadenaTextoNueva = CadenaTexto.split(CadenaaReemplazar).join(CadenaReemplazo);
  campo.value = CadenaTextoNueva;

}
function Letras(e) {
  tecla = (document.all) ? e.keyCode : e.which;

  //Tecla de retroceso para borrar, siempre la permite
  if (tecla == 8) {
    return true;
  }

  // Patron de entrada, en este caso solo acepta  letras
   patron = /[A-Z a-z]/;
   tecla_final = String.fromCharCode(tecla);
   return patron.test(tecla_final);
  }
  function MismaLetra(id_input) {
	var valor = $('#' + id_input).val();
	var longitud = valor.length;
	//console.log(valor+longitud);
	if (longitud > 2) {
		var str1 = valor.substring(longitud - 3, longitud - 2);
		var str2 = valor.substring(longitud - 2, longitud - 1);
		var str3 = valor.substring(longitud - 1, longitud);
		nuevo_valor = valor.substring(0, longitud - 1);
		if (str1 == str2 && str1 == str3 && str2 == str3) {
			swal('Error', 'No se permiten 3 letras consecutivamente', 'error');

			$('#' + id_input).val(nuevo_valor);
		}
	}
}
</script>

<script>

 // La siguiente funcion valida el elemento input
 function validar2() {
      // Variable que usaremos para determinar si el input es valido
      let isValid2 = false;

      // El input que queremos validar
      const input = document.forms['validationForm']['contra'];
    
      // El tamaño maximo para el input
      const minimo = 8;
      
      // Primera validacion, si input esta vacio entonces no es valido
      if(!input.value) {
        isValid2 = false;
      } else {
        // Segunda validacion, si input es mayor que 8
        if(input.value.length > minimo) {
          isValid2 = false;
        } else {
            // Si pasamos todas la validaciones anteriores, entonces el input es valido
            isValid2 = true;
          }
      }

      //Ahora coloreamos el borde de nuestro input
      if(!isValid2) {
        // rojo: no es valido
        input.style.borderColor = 'palegreen'; // me parece que 'salmon' es un poco menos agresivo que 'red'

      } else {
        // verde: si es valido
        input.style.borderColor = 'salmon'; // 'palegreen' se ve mejor que 'green' en mi opinion
        // ocultamos mensaje;
        message.hidden = true;
      }

      // devolvemos el valor de isValid
      return isValid2;
    }

    // Por último, nuestra función que verifica si el campo es válido antes de realizar cualquier otra acción.
    // function verificar() {
    //  const valido = validar();
    // if (!valido) {
    //  alert('El campo no es válido.');
    // } else {
    // alert('El campo es válido');
    //}
    //}
</script>

<script type="text/javascript">

  function mostrar(){
    var tipo = document.getElementById("contra");

    if(tipo.type == 'password'){
      tipo.type = 'text';
    }else{
      tipo.type = 'password';
    }
  }

  function mostrar2(){
    var tipo = document.getElementById("confi_contra");

    if(tipo.type == 'password'){
      tipo.type = 'text';
    }else{
      tipo.type = 'password';
    }
  }

</script>
</body>
</html>

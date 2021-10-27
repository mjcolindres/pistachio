<?php

//primero se existe post que es cuando el usuario da click al boton 
//empty significa vacio o si no existe o hace lo contrario 
//!empty significa si existe 

$alert= '';
//validar que despues de loguearme no me muestre la ventana del loguin y se usa sin existe 
 session_start();
 //las variables de sesion deben de inicializarse
if(!empty($_SESSION['active']))
{
   header('location: vistas/principal_vista.php');
}else{

//sino existe verifica todo 
 if (!empty($_POST))
  {
  	//si el input usuario esta vacio o si el imput clave esta vacio dentro de la variable post se pone el name del input
 	if (empty($_POST['usuario']) || empty($_POST['clave'])) 
 	{

 		$alert='Ingrese su usuario y contraseña';
 		//sino está vacio conecta a la base de datos requiriendo el archivo donde está la conexion
 	}else{
 		require_once "clases/conexion.php";
       //dos variable se crean lo que esta enviado por el metodo post osea que toma lo que está en el input 
 		//mysqli_real_escape_string recibe dos parametros, tenemos formulario de login evita que los caracteres raros en el usuario como en la clave para encriptar contraseña
 		//md5 encripta la contraseña 
 		$user = mysqli_real_escape_string($conection, $_POST['usuario']);
 		$pass = mysqli_real_escape_string($conection, $_POST['clave']);

 		//FUNCION  DE DOS PARAMETROS LA CONEXION Y EL QUERY QUE VA A EJECUTARSE
 		//el query dice seleccionar toda la fila de la tabla usuario donde el usuario sea igual a user la variable y la clave sea igual a la variable pass y usuario y clave son los nombre de los campos en la base y user y pass son las variables que contienen los post de los nombre de los imputs 
 		$query = mysqli_query($conection, "SELECT * FROM tbl_usuarios WHERE usuario= '$user' AND pass = '$pass'");
    //cerrando la conexion
      mysqli_close($conection);
 		//se va a guardar en una variable y esto lo que hace es que da un numero 
 		$result = mysqli_num_rows($query);

 		//una condicicion si la variable result es mayor a 0 , si encunetra un valor va a guardar en un arreglo 
 		if($result > 0)
 		{
            $data = mysqli_fetch_array($query);
           //dentro de variables de sesion se guarda la informacion de la data y con esto indicamos que estamos empezando una sesion, los datos que necesitamos 
           
            $_SESSION['active'] = true; //
            $_SESSION['idUser'] = $data['id_usuario']; //id del usuario
            $_SESSION['usuario'] = $data['usuario'];
     
           $_SESSION['rol'] = $data['rol'];

           //redireccionar a nuestro sistema carpeta a donde va a ir 
           header('location: vistas/principal_vista.php');

           //solo cuando result sea mayor a 0
 		}else{
 			$alert='El usuario y contraseña son incorrectas';
 			session_destroy();
 			//se destruyen las seciones 
 		
 		}

 	}
 }
}

?>




<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Login | Sistema Facturación</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Pistacchio | Log in</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
</head>
<body lass="hold-transition login-page" background="dist/img/fondo09.jpg">

<div class="login-box">
  
  
  <!-- /.login-logo -->
  <div class="card">
    
    <div class="card-body login-card-body">
      <div class="login-logo">
        <a href="index.html"><b>Pistacchio</b>Catering</a>
      </div>
      



<form action="" method="post">

	
   <h3>Iniciar sesión </h3>
   <div class="input-group mb-3">
   <input type="text" name="usuario" placeholder="usuario">
   <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
   <input type="password" name="clave" placeholder="contraseña">
   <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="remember">
              <label for="remember">
                Recordarme
              </label>
            </div>
          </div>

		  <div class="col-4">
	 <div class="alert"><?php echo isset($alert) ? $alert : ''; ?></div> 
   <input type="submit" value="ingresar">
</div>
</div>
</form>
  <p class="mb-1">
        <a href="forgot-password-v2.html">Olvidaste tu contraseña</a>
      </p>
      <p class="mb-0">
        <a href="index2.html" class="text-center">Registrar</a>
      </p>
    </div>
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




</body>
</html>
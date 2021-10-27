
<?php
 ob_start();


 session_start();
 require_once ('principal_vista.php');
require_once ('../clases/conexion.php');
require_once ('../clases/funcion_bitacora.php');
require_once ('../clases/funcion_visualizar.php');
require_once ('../clases/funcion_permisos.php');


$Id_objeto=3 ;
       
 bitacora::evento_bitacora( $_SESSION['idUser'],$Id_objeto,'Ingreso' , 'A Crear Usuarios');

$visualizacion= permiso_ver($Id_objeto);



if ($visualizacion==0)
{
    echo '<script type="text/javascript">
                             swal({
                                  title:"",
                                  text:"Lo sentimos no tiene permiso de visualizar la pantalla",
                                  type: "error",
                                  showConfirmButton: false,
                                  timer: 3000
                               });
                          window.location = "../vistas/menu_usuarios_vista.php";

                           </script>';
// header('location:  ../vistas/menu_usuarios_vista.php');
}

else

{
      


if (permisos::permiso_insertar($Id_objeto)=='1')
{
 $_SESSION['btn_guardar_usuario']="";
}
else
{
   $_SESSION['btn_guardar_usuario']="disabled";
  }
  /*
  
  if (isset($_REQUEST['msj']))
  {
      $msj=$_REQUEST['msj'];
        if ($msj==1)
            {
            echo '<script> alert("Lo sentimos el rol a ingresar ya existe favor intenta con uno nuevo")</script>';
            }
   
               if ($msj==2)
                  {
                  echo '<script> alert("Rol agregado correctamente")</script>';
                  }
  }
  
  */
  

  }
  

//si está exite el post osea todo los datos se hace que nlos campos no estén vacio
if(!empty($_POST))
{
   $alert='';
   if(empty($_POST['usuario'])  || empty($_POST['clave']) || empty($_POST['rol']))
    {
         $alert = '<p class="msg_error">Todos los campos son obligatorios</p>';
    }else{
  
      



     
    
      $user = $_POST['usuario'];
      $clave = md5($_POST['clave']);
      $rol = $_POST['rol'];



      //verificar si el correo y usuario ya existen 
     
     





      //almacenar la informacion
      //en el insert son los datos de la base de datos 
      // en el value es la variable del post que tienen los nombres de l input el name 

      $query_insert = mysqli_query($conection,"INSERT INTO tbl_usuarios(id_persona, id_rol, usuario, pass, estado, creado_por, fecha_creacion)
            values('2', '$rol', '$user', '$clave', '2','admin','12/05/2021')");


      //evaluar si guarda si es verdadero 
      if($query_insert){
        $alert='<p se almaceno</p>';

      }else{
             $alert='<p class="msg_error">-Error al crear el usuario</p>';
      }
    }
  }
   









ob_end_flush();



 
?>







  <!DOCTYPE html>
<html>
<head>
  <title></title>


</head>
<body >





 <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">


            <h1>USUARIOS</h1>
          </div>

                <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="../vistas/gestion_usuarios_vista.php">GESTIÓN USUARIOS</a></li>
              <li class="breadcrumb-item active"><a href="../vistas/principal_vista.php">INICIO</a></li>
            </ol>
          </div>

           
          <div class="RespuestaAjax"></div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

<form action="" method="post"  data-form="save" autocomplete="off" class="FormularioAjax">

 <div class="card card-default">
          <div class="card-header">
            <h3 class="card-title">INGRESE EL NUEVO USUARIO</h3>

            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
            </div>
          </div>
          <section class="content">
            <div class="container-fluid">
     
         
            	
            	
            	<label for="usuario" >Usuario</label>
            	<input type="text" name="usuario" id="usuario" placeholder="Usuario" >
            	<label for="clave">Clave</label>
            	<input type="password" name="clave" id="clave" placeholder="Clave de Acceso" value="" >
            	<label for="rol">Roles de usuario:</label>

                  <?php 
                   //para que muestre los roles como select 
                  $query_rol = mysqli_query($conection, "SELECT * FROM tbl_roles");
                  //se guardan en un arreglo 
                  //cuenta cuantas filas devuelve 

                  mysqli_close($conection);
                  $result_rol = mysqli_num_rows($query_rol);
                  
                  

                   ?>

            	<select name="rol" id="rol">

                  <?php 
                  if($result_rol > 0)
                  {
                        //va a reperit la cantidad de veces que de 
                      while ($rol = mysqli_fetch_array($query_rol)){
                      
                  ?>

                      <option value="<?php echo $rol["id_rol"]; ?>"><?php echo $rol["rol"] ?></option>
                  <?php 
                  //que aparezca lo del la basen de dato 
                      }
                  }
                 
                   ?>
            		
            		
            	</select>
              <p>
            	<input type="submit" value="Crear Usuario" class="btn-save " >
        
		</div>
    
          <!-- /.card-body -->
          <div class="card-footer">
            
          </div>
        </div>

       
        
</form>



      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>




 </body>

</html>
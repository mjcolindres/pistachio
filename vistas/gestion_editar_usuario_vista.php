
<?php



 
ob_start();

session_start();



require_once ('principal_vista.php');
require_once ('../clases/conexion.php');
require_once ('../clases/funcion_bitacora.php');
require_once ('../clases/funcion_visualizar.php');
require_once ('../clases/funcion_permisos.php');

        $Id_objeto=6 ;
     $visualizacion= permiso_ver($Id_objeto);



if ($visualizacion==0)
 {
  header('location:  ../vistas/principal_vista.php');
}

else

{
 
        bitacora::evento_bitacora( $_SESSION['idUser'],$Id_objeto,'Ingreso' , 'A Gestion de Parametros');


if (permisos::permiso_modificar($Id_objeto)=='1')
 {
  $_SESSION['btn_modificar_parametro']="";
}
else
{
    $_SESSION['btn_modificar_parametro']="disabled";
}


/* Manda a llamar todos las datos de la tabla para llenar el gridview  */
$sqltabla_parametro="SELECT parametro, descripcion , valor         
FROM tbl_parametro";
$resultadotabla_parametro = $conection->query($sqltabla_parametro);



/* Esta condicion sirve para  verificar el valor que se esta enviando al momento de dar click en el icono modicar */
if (isset($_GET['Parametro']))
 {
$sqltabla_parametro="SELECT parametro, descripcion , valor         
FROM tbl_parametro";
$resultadotabla_parametro = $conection->query($sqltabla_parametro);

$Parametro = $_GET['Parametro'];    

/* Iniciar la variable de sesion y la crea */


 /* Hace un select para mandar a traer todos los datos de la 
 tabla donde rol sea igual al que se ingreso e el input */
    $sql = "SELECT * FROM tbl_parametro WHERE parametro = '$Parametro'";
    $resultado = $conection->query($sql);
    /* Manda a llamar la fila */
    $row = $resultado->fetch_array(MYSQLI_ASSOC);

    $Id_parametro= $row['id_parametro']; 
 $_SESSION['TxtParametro']=$row['parametro'];
  $_SESSION['TxtParametro_descripcion']=$row['descripcion'];
   $_SESSION['TxtParametro_valor']=$row['valor'];

if (isset($_SESSION['TxtParametro'])){


?>
  <script>
    $(function(){
    $('#modal_modificar_parametro').modal('toggle')

    })

  </script>;
<?php 
 ?> 

  <?php


  }


} 

}






if (isset($_REQUEST['msj']))
    {
    $msj=$_REQUEST['msj'];
    
    if ($msj==1)
    {
  echo '<script type="text/javascript">
                    swal({
                       title:"",
                       text:"Lo sentimos el Parametro ya existe",
                       type: "info",
                       showConfirmButton: false,
                       timer: 3000
                    });
                    
                </script>'; 
       
        }
   
        if ($msj==2)
                   {


  echo '<script type="text/javascript">
                    swal({
                       title:"",
                       text:"Los datos  se almacenaron correctamente",
                       type: "success",
                       showConfirmButton: false,
                       timer: 3000
                    });
                    
                </script>'; 
        $sqltabla_parametro="SELECT parametro, descripcion , valor         
FROM tbl_parametro";
$resultadotabla_parametro = $conection->query($sqltabla_parametro);



                   }
                     if ($msj==3)
                   {


  echo '<script type="text/javascript">
                    swal({
                       title:"",
                       text:"Lo sentimos tiene campos por rellenar.",
                       type: "error",
                       showConfirmButton: false,
                       timer: 3000
                    });
                    
                </script>'; 
                


                   }

    }

ob_end_flush();




$consulta=ModificarUsuarios($_GET["id_usuario"]);
function ModificarUsuarios( $id_usuario)


{
  include '../clases/conexion.php';


$sentencia="SELECT * FROM tbl_usuarios WHERE id_usuario='".$id_usuario."' ";

 $resultado = $conection->query($sentencia) or die   ("error al consultar" .mysql_error($conection));

 


$filas=$resultado->fetch_assoc();
   //print_r( $filas);

    return [  

              $filas["id_usuario"],
              $filas["usuario"],
              $filas["estado"]
              
            ];
    


}




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


            <h1>EDITAR USUARIOS</h1>
          </div>

                <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="../vistas/gestion_usuarios_vista.php">GESTIÓN USUARIOS</a></li>
              <li class="breadcrumb-item active"><a href="../vistas/principal_vista.php">INICIO</a></li>
            </ol>
          </div>

           
   
        </div>
      </div><!-- /.container-fluid -->
    </section>

<form action="../controlador/actualizar_usuario_controlador.php" method="post"  data-form="save" autocomplete="off" class="FormularioAjax">

 <div class="card card-default">
          <div class="card-header">
            <h3 class="card-title">REALIZAR CAMBIOS</h3>

            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
            </div>
          </div>

     
          <tbody>
    <tr>

     
    </tr>
  </tbody>  


          <!-- /.card-header -->
          <div class="card-body">
            <div class="row">

            <div class="col-md-12">


                
                <div class="form-group">
                  <label>ID</label>
                    <input class="form-control" type="text" id="id_usuarios" name="id_usuarios"  value= "<?php echo $consulta[0] ?>" >
                </div>

               
                  <div class="form-group">
                  <label>USUARIO</label>
                    <input class="form-control" type="text" id="usuarios" name="usuarios"  value= "<?php echo $consulta[1] ?>"  required style="text-transform: uppercase" onkeyup="Espacio(this, event)"  onkeypress="return Letras(event)" onkeypress="return comprobar(this.value, event, this.id)"  maxlength="30">
                </div>


                           <?php 
                  
               ?>


             
              <div class="form-group">
                  <label>ESTADO</label>
                    <input class="form-control" type="text" id="estado" name="estado"  value= "<?php if ($consulta[2]==1){
                      echo $consultar[2]='ACTIVO';
                    }


                    if ($consulta[2]==2){
                      echo $consultar[2]='BLOQUEADO'; }



                    if ($consulta[2]==3){
                      echo $consultar[2]='INHABILITADO'; }




                       ?>" >
                </div>

               


                  <div class="form-group">
                  <label>ROLES</label>
                    <select class="form-control" name="cb_comborol" id="cb_comborol" value= "1"   required="">
                           <option >Seleccione un Rol:</option>

                              <option>ADMINISTRADOR</option>
                              <option>USUARIO</option>
                              <option>CLIENTE</option>
       
                        </select>
                  
                </div>

                
              <p class="text-center" style="margin-top: 20px;">
                <button type="submit" href="" class="btn  btn-primary " id="btnActualizar" name="btnActualizar"   ><i class="zmdi zmdi-floppy"></i> Actualizar</button>
              </p>

             

              </div>
            </div>
          </div>



          <!-- /.card-body -->
          <div class="card-footer">
            
          </div>
        </div>


       


    
    <div class="RespuestaAjax"></div>
</form>

  </div>
</section>



</body>
</html>

<?php
ob_start();

session_start();



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
?>
   


<center>
    
    <h1>COPIAS DE  SEGURIDAD <br> DE DATOS DEL SISTEMA</h1>

<br>
        <label>CLICK EN EL ENLACE</label>
    <a href="descarga.php" class="small-box-footer">
        <br>

    <i class="fas fa-arrow-circle-right"><h3> REALIZAR COPIA DE SEGURIDAD</h3></i>
<br>

</center>


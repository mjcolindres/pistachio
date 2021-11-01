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

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>BACKUPS & RESTORE  </title>
</head>



<body >

     <div class="row" style="  display: flex;
    align-items: center;
    justify-content: center;">


     <div class="col-6 col-sm-6 col-md-4">
                     <div class="col-12 col-sm-6 col-md-4">
               <div class="small-box bg-warning">
                <div class="inner">


    <h1>COPIAS DE  SEGURIDAD <br> Y RESTAURACIÓN <br> DE DATOS DEL SISTEMA</h1>

    <a href="../backupDB/Backup.php" class="small-box-footer">
        <br>
    <i class="fas fa-arrow-circle-right"><h3> REALIZAR COPIA DE SEGURIDAD</h3></i></a>
    <form action="../backupDB/Restore.php" method="POST">
        <br><label>SELECCIONE EL PUNTO DE RESTAURACIÓN</label><br>

</div>
</div>
</div>


        <select name="restorePoint">
            <option value="" disabled="" selected=""><h4>PUNTO DE RESTAURACIÓN</h4></option>
           
            <?php
                include_once '../backupDB/Connet.php';
                $ruta=BACKUP_PATH;
                if(is_dir($ruta)){
                    if($aux=opendir($ruta)){
                        while(($archivo = readdir($aux)) !== false){
                            if($archivo!="."&&$archivo!=".."){
                                $nombrearchivo=str_replace(".sql", "", $archivo);
                                $nombrearchivo=str_replace("-", ":", $nombrearchivo);
                                $ruta_completa=$ruta.$archivo;
                                if(is_dir($ruta_completa)){
                                }else{
                                    echo '<option value="'.$ruta_completa.'">'.$nombrearchivo.'</option>';
                                }
                            }
                        }
                        closedir($aux);
                    }
                }else{
                    echo $ruta." No es ruta válida";
                }
            ?>
        </select>
        <button  type="submit" >Restaurar</button>
    </form>

    </div>

</div>

</div>

</body>
</html>

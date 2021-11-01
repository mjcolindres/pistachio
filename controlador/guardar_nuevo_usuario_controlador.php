
<?php



RegistroUsuarios($_POST['txt_id'],$_POST['usuario_nombre'],  $_POST['correo'], $_POST['contrasena'], $_POST['fecha_creacion'], $_POST['fecha_vencimiento'], $_POST['comborol2']);

function RegistroUsuarios ( $Uid_persona, $usuario_nombre,  $correo, $contrasena, $fecha_creacion, $fecha_vencimiento, $roles){


            include '../clases/conexion.php';



                 echo    $senten = "INSERT INTO tbl_roles ( rol, fecha_creacion) VALUES ('$roles', '$fecha_creacion' )";

                 echo    $result=mysqli_query($conection, $senten) or die ("ERROR AL INSERTAR LOS DATOS en ROLES" .mysqli_error($conection));

echo "<br>";
echo "<br>";
/*

                  $Uid_persona=mysqli_query($conection, "SELECT MAX(id_persona) AS id_persona FROM tbl_personas");

                 // if ($row = mysqli_fetch_row($Uid_persona)) {
                   // $id_persona = trim($row[0]);
echo "<br>";
echo "<br>";
                  

                  $Uid_rol=mysqli_query($conection, "SELECT MAX(id_rol) AS id_rol FROM tbl_roles");

echo "<br>";
echo "<br>";
                  //if ($row = mysqli_fetch_row($Uid_rol)) {
                 //   $id_rol = trim($row[0]);


            */        

                    
                 // }

                //  }



 echo $senten2="INSERT INTO tbl_usuarios (id_persona, id_rol, usuario, password, fecha_vencimiento, correo_electronico, fecha_creacion) VALUES (id_persona=".$_SESSION['Uid_persona'].", '".$conection->insert_id."', '$usuario_nombre','$contrasena','$fecha_vencimiento','$correo','$fecha_creacion')";
echo "<br>";
echo "<br>";
         
 
   
         echo  $result2=mysqli_query($conection, $senten2) or die ("ERROR AL INSERTAR LOS DATOS en USUARIOS" .mysqli_error($conection));
              
echo "<br>";
echo "<br>";


}


?>

<script type="text/javascript">
  alert("usuario ingresado exitosamente!");
 //window.location.href='../vistas/gestion_usuarios_vista.php';
</script>



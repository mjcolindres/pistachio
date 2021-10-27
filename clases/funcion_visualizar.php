<?php 

 

function permiso_ver($pantalla)


{


require ('../clases/conexion.php');

$sql_permisos="select pu.visualizar as ver from tbl_permisos pu ,tbl_objetos p,tbl_usuarios u ,tbl_roles r where r.id_rol=pu.id_rol and r.id_rol=u.id_rol and pu.id_objeto=p.id_objeto and u.id_usuario=$_SESSION[idUser] and p.id_objeto=$pantalla ";

$resultado_permisos = $conection->query($sql_permisos);


$permiso_ver= mysqli_fetch_array($resultado_permisos);



 

return $permiso_ver['ver'];
}

?>
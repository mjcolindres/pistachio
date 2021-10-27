<?php

class permisos {



public static function permiso_modificar($permiso_modificar)

                   {

 require ('../clases/conexion.php');

                    $sql_permiso_mod="SELECT pu.modificar as modificar from tbl_permisos pu ,tbl_objetos p,tbl_usuarios u ,tbl_roles r where r.id_rol=pu.id_rol and r.id_rol=u.id_rol and pu.id_objeto=p.id_objeto and id_usuario=".$_SESSION['idUser']." and p.id_objeto='$permiso_modificar' ";

                  $resultado_permiso_mod = $conection->query($sql_permiso_mod);

                  $permisos= $resultado_permiso_mod->fetch_row();

                   return $permisos[0];
                
                   }



public static function permiso_insertar($permiso_insertar)

                   {


 require ('../clases/conexion.php');

                    $sql_permiso_in="SELECT pu.insertar as insertar from tbl_permisos pu ,tbl_objetos p,tbl_usuarios u ,tbl_roles r where r.id_rol=pu.id_rol and r.id_rol=u.id_rol and pu.id_objeto=p.id_objeto and id_usuario=".$_SESSION['idUser']." and p.id_objeto='$permiso_insertar' ";

                  $resultado_permiso_in = $conection->query($sql_permiso_in);

                  $permisos= $resultado_permiso_in->fetch_row();

                   return $permisos[0];
                
                   }    

public static function permiso_eliminar($permiso_eliminar)

                   {


 require ('../clases/conexion.php');

 session_start();
                    $sql_permiso_eliminar="SELECT pu.eliminar as eliminar from tbl_permisos pu ,tbl_objetos p,tbl_usuarios u ,tbl_roles r where r.id_rol=pu.id_rol and r.id_rol=u.id_rol and pu.id_objeto=p.id_objeto and id_usuario=".$_SESSION['idUser']." and p.id_objeto='$permiso_eliminar' ";

                  $resultado_permiso_eliminar = $conection->query($sql_permiso_eliminar);

                  $permisos= $resultado_permiso_eliminar->fetch_row();

                   return $permisos[0];
                
                   }                                  

}
                   ?>
<?php

Require_once ('../clases/conexion.php');





if (session_status() === PHP_SESSION_NONE){session_start();} 

      


$sql_permisos="select pu.visualizar ,p.id_objeto from tbl_permisos pu ,tbl_objetos
 p,tbl_usuarios u ,tbl_roles r where r.id_rol=pu.id_rol and r.id_rol=u.id_rol and pu.id_objeto=p.id_objeto
  and id_usuario=".$_SESSION['idUser']." ";

$resultado_permisos = $conection->query($sql_permisos);
/*Botones principales*/
   $_SESSION['btn_seguridad']='none';
   $_SESSION['btn_pedidos']='none';
   $_SESSION['btn_productos']='none';
   
   
   
   
   

   /*Menu laterales*/
   $_SESSION['pregunta_vista']='none';
   $_SESSION['usuarios_vista']='none';
   $_SESSION['roles_vista']='none';
   $_SESSION['parametro_vista']='none';
   $_SESSION['permisos_vista']='none';
   $_SESSION['bitacora_vista']='none';
   $_SESSION['ver_pedidos_vista']='none';
   $_SESSION['ver_productos_vista']='none';
  



  while ($fila = $resultado_permisos->fetch_row())
   {
   	/*
   	echo '<script> alert("Bienvenido a nuestro sistema :  ' .$fila[0], $fila[1]. '")</script>';
       */
    if ($fila[0]=='1') 
       {
      $_SESSION['confirmacion_ver']="block";
       }
    else
       {
        $_SESSION['confirmacion_ver']="none";
       }
    permisos_a_roles_visualizar($fila[1],$_SESSION['confirmacion_ver']);
    }

    
          

 function  permisos_a_roles_visualizar($pantalla,$confirmacion)
    {
   $_SESSION['confirmacion']=$confirmacion;
  $_SESSION['pantalla']=$pantalla;
      

   /* $_SESSION['historial_registro']='none';*/

    

           if ($_SESSION['pantalla']>='1' and $_SESSION['pantalla']<='10')
       {
        if ( $_SESSION['confirmacion']=='block') 
        {
         $_SESSION['btn_seguridad']="block";

        }
       }

       if ($_SESSION['pantalla']>='11' )
       {
        if ( $_SESSION['confirmacion']=='block') 
        {
         $_SESSION['btn_pedidos']="block";

        }
       }


       if ($_SESSION['pantalla']>='15' )
       {
        if ( $_SESSION['confirmacion']=='block') 
        {
         $_SESSION['btn_productos']="block";

        }
       }

    

   //================== CODIGO PROPIO ==================================
        
   //================== CODIGO PROPIO ==================================
   

    
 if ($_SESSION['pantalla']=='1' or $_SESSION['pantalla']=='2')
       {
        if ( $_SESSION['confirmacion']=='block') 
        {
         $_SESSION['pregunta_vista']="block";

        }
       }

        if ($_SESSION['pantalla']=='3' or $_SESSION['pantalla']=='10')
       {
        if ( $_SESSION['confirmacion']=='block') 
        {
         $_SESSION['usuarios_vista']="block";

        }
       }
        if ($_SESSION['pantalla']=='4' or $_SESSION['pantalla']=='5')
       {
        if ( $_SESSION['confirmacion']=='block') 
        {
         $_SESSION['roles_vista']="block";

        }
       }
        if ($_SESSION['pantalla']=='6')
       {
        if ( $_SESSION['confirmacion']=='block') 
        {
         $_SESSION['parametro_vista']="block";

        }
       }
     
        if ($_SESSION['pantalla']=='7' or $_SESSION['pantalla']=='8')
       {
        if ( $_SESSION['confirmacion']=='block') 
        {
         $_SESSION['permisos_vista']="block";

        }
       }
          if ($_SESSION['pantalla']=='9')
       {
        if ( $_SESSION['confirmacion']=='block') 
        {
         $_SESSION['bitacora_vista']="block";

        }
       }
       if ($_SESSION['pantalla']=='11')
       {
        if ( $_SESSION['confirmacion']=='block') 
        {
         $_SESSION['ver_pedidos_vista']="block";

        }
       }

       if ($_SESSION['pantalla']=='15')
       {
        if ( $_SESSION['confirmacion']=='block') 
        {
         $_SESSION['ver_productos_vista']="block";

        }
       }
    }

?>
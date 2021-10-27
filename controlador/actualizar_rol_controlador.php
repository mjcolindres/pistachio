<?php
  
session_start();
    
require_once ('../clases/conexion.php');
require_once ('../clases/funcion_bitacora.php');


  $Rol=strtoupper ($_POST['txtnombrerol']);
  $Descripcion=strtoupper ($_POST['txtdescripcionrol']);
  $Id_rol= $_GET['Id_rol']; 
  $var=0;

  /* Iniciar la variable de sesion y la crea */


///Logica para el rol que se repite
 $sqlexiste=("SELECT count(rol) as rol  from tbl_roles where rol='$Rol' and id_rol<>'$Id_rol' ;");
 //Obtener la fila del query
$existe = mysqli_fetch_assoc($conection->query($sqlexiste));



if ($existe['rol']==1 )
{/*
header("location: ../contenidos/editarRoles-view.php?msj=1&Rol=$Rol2 ");*/

                        header("location:../vistas/gestion_roles_vista.php?msj=1"); 

}
else
{


  if (isset($_POST['checkboxactivomodificar']) && $_POST['checkboxactivomodificar'] == 'true') 
  {
  $var=1;
  }
  else
  {
  $var=0;
  } 


   $sql = "call proc_actualizar_rol('$Rol','$Descripcion',$var,'$_SESSION[usuario]','$Id_rol' )";






 

    $valor="SELECT rol, descripcion, estado from tbl_roles WHERE id_rol= '$Id_rol'";
    $result_valor=$conection->query($valor);
    $valor_viejo=$result_valor->fetch_array(MYSQLI_ASSOC);

    if ($valor_viejo['rol']<>$Rol and $valor_viejo['descripcion']<>$Descripcion and $valor_viejo['estado']<>$var )
        {
          
      $Id_objeto=5 ;
        bitacora::evento_bitacora( $_SESSION['idUser'],$Id_objeto,'MODIFICO ' , ' EL ROL '.$valor_viejo['Rol'].' POR '.$Rol. ', LA DESCRIPCION DE EL ROL ' .$Rol .', EL ESTADO DE' .$Rol. ' ');  
        


           /* Hace el query para que actualize*/
        $resultado = $conection->query($sql);

        if ($resultado==true) {
                        header("location:../vistas/gestion_roles_vista.php?msj=2"); 


}
else
{
           header("location:../vistas/gestion_roles_vista.php?msj=3"); 

}


        

          }


      elseif ($valor_viejo['rol']<>$Rol and $valor_viejo['descripcion']<>$Descripcion )
          {
            
        $Id_objeto=5;
          bitacora::evento_bitacora( $_SESSION['idUser'],$Id_objeto,'Modifico' , ' '.$valor_viejo['rol'].' por '.$Rol. ', La descripción de el rol ' .$Rol .' '); 
             /* Hace el query para que actualize*/
    
          $resultado = $conection->query($sql);

       if ($resultado==true) {
                        header("location:../vistas/gestion_roles_vista.php?msj=2"); 


}
else
{
           header("location:../vistas/gestion_roles_vista.php?msj=3"); 

}

      
            }


          elseif ($valor_viejo['rol']<>$Rol and  $valor_viejo['estado']<>$var )
              {
                
            $Id_objeto=5 ;
              bitacora::evento_bitacora( $_SESSION['idUser'],$Id_objeto,'Modifico' , ' '.$valor_viejo['rol'].' por '.$Rol. ', El Estatus de el rol ' .$Rol. ' '); 
                 /* Hace el query para que actualize*/
               
              $resultado = $conection->query($sql);

       if ($resultado==true) {
                        header("location:../vistas/gestion_roles_vista.php?msj=2"); 


}
else
{
           header("location:../vistas/gestion_roles_vista.php?msj=3"); 

}

           

                }


              elseif ($valor_viejo['descripcion']<>$Descripcion and $valor_viejo['estado']<>$var )
                  {
                    
                $Id_objeto=5;
                  bitacora::evento_bitacora( $_SESSION['idUser'],$Id_objeto,'Modifico' , ' '. ' La descripción de el rol ' .$Rol .', El Estatus de el rol ' .$Rol. ' ');  
                     /* Hace el query para que actualize*/
                               $resultado = $conectio->query($sql);
                                      if ($resultado==true) {
                        header("location:../vistas/gestion_roles_vista.php?msj=2"); 


}
else
{
           header("location:../vistas/gestion_roles_vista.php?msj=3"); 

}


                    }

                  elseif ($valor_viejo['rol']<>$Rol)
                      {
                        
                    $Id_objeto=5 ; 
                         bitacora::evento_bitacora( $_SESSION['idUse'],$Id_objeto,'Modifico' , ' ' . $valor_viejo['rol'].' por '.$Rol.' ' ); 
                         /* Hace el query para que actualize*/
        
                      $resultado = $conection->query($sql);
                             if ($resultado==true) {
                        header("location:../vistas/gestion_roles_vista.php?msj=2"); 


}
else
{
           header("location:../vistas/gestion_roles_vista.php?msj=3"); 

}
                        }

                              elseif ($valor_viejo['descripcion']<>$Descripcion)
                              {
                                
                            $Id_objeto=5 ; 
                                bitacora::evento_bitacora( $_SESSION['idUser'],$Id_objeto,'Modifico' , ' La descripción de el rol ' .$Rol. ' ' );


                                   /* Hace el query para que actualize*/
                           
                              $resultado = $conection->query($sql);
                                     if ($resultado==true) {
                        header("location:../vistas/gestion_roles_vista.php?msj=2"); 


}
else
{
           header("location:../vistas/gestion_roles_vista.php?msj=3"); 

}

                                 
                                } 

                                      elseif ($valor_viejo['estado']<>$var)
                                    {
                                      
                                  $Id_objeto=5 ; 
                                       bitacora::evento_bitacora($_SESSION['idUser'],$Id_objeto, 'Modifico' , 'El Estatus de el rol ' .$Rol.' ' );
                                          /* Hace el query para que actualize*/

                              
                                    $resultado = $conection->query($sql);
                                           if ($resultado==true) {
                        header("location:../vistas/gestion_roles_vista.php?msj=2"); 


}
else
{
           header("location:../vistas/gestion_roles_vista.php?msj=3"); 

}
 
                                      }  
          else
          {
          /*header("location: ../contenidos/editarRoles-view.php?msj=3&Rol=$Rol2 ");*/
             header("location:../vistas/gestion_roles_vista.php?msj=3"); 

          } 



        

    
}


?>

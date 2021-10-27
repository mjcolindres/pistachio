<?php

 require_once ('principal_vista.php');
 require_once ('../clases/conexion.php');
 require_once ('../clases/funcion_bitacora.php');
 require_once ('../clases/funcion_visualizar.php');
 require_once ('../clases/funcion_permisos.php');

 $Id_objeto=11 ;


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
                            window.location = "../vistas/principal_vista.php";

                             </script>';
 }

 else

 {
   //esta linea es para insertar en la bitacora que se ingresó a la pantalla ver pedido
         bitacora::evento_bitacora($_SESSION['idUser'],$Id_objeto, 'Ingreso' , 'A ver pedidos');



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

          </div>
<h1> pedido de PISTACCHIO</h1>


		</div>



	   </div>
	 </div>
   </section>
 </div>


</body>
</html>

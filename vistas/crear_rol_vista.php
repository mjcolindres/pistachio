<?php
 
ob_start();


session_start();
require_once ('principal_vista.php');
require_once ('../clases/Conexion.php');
require_once ('../clases/funcion_bitacora.php');
require_once ('../clases/funcion_visualizar.php');
require_once ('../clases/funcion_permisos.php');





      $Id_objeto=4 ;

bitacora::evento_bitacora( $_SESSION['idUser'],$Id_objeto,'Ingreso' , 'A Crear roles');



$visualizacion= permiso_ver($Id_objeto);



if ($visualizacion==0)
{
//header('location:  ../vistas/menu_roles_vista.php');

  echo '<script type="text/javascript">
                            swal({
                                 title:"",
                                 text:"Lo sentimos no tiene permiso de visualizar la pantalla",
                                 type: "error",
                                 showConfirmButton: false,
                                 timer: 3000
                              });
                         window.location = "../vistas/menu_roles_vista.php";

                          </script>';

}

else

{ 
    





if (permisos::permiso_insertar($Id_objeto)=='1')
{
$_SESSION['btn_guardar_roles']="";
}
else
{
  $_SESSION['btn_guardar_roles']="disabled";
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


            <h1>ROLES</h1>
          </div>

                <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="../vistas/gestion_roles_vista.php">GESTIÓN ROLES</a></li>
              <li class="breadcrumb-item active"><a href="../vistas/principal_vista.php">INICIO</a></li>
            </ol>
          </div>

          <div class="RespuestaAjax"></div>
   
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <form action="../controlador/guardar_rol_controlador.php" method="post"  data-form="save" class="FormularioAjax" autocomplete="off">


<div class="card card-default">
          <div class="card-header">
            <h3 class="card-title">NUEVO ROL</h3>

            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
            </div>
          </div>


          <!-- /.card-header -->
          <div class="card-body">
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <label>NUEVO ROL</label>
                    <input class="form-control" type="text" id="txt_rol" name="txt_rol" style="text-transform: uppercase" onkeypress="return Letras(event)" onkeyup="DobleEspacio(this, event)" required="" maxlength="30" onpaste="return false">
                    <label>DESCRIPCIÓN</label>
                      <input class="form-control" type="text" id="txt_descripcionrol"  name="txt_descripcionrol" style="text-transform: uppercase" onkeypress="return Letras(event)" onkeyup="DobleEspacio(this, event)" required="" maxlength="30" onpaste="return false">
                </div>

                <div class="form-group clearfix">
                      <div class="icheck-success d-inline">
                        <input type="checkbox"  id="txt_checkboxactivo" name="txt_checkboxactivo" value="true">
                        <label for="txt_checkboxactivo">Activo
                        </label>
                      </div>
                </div>

              <p class="text-center" style="margin-top: 20px;">
                <button type="submit" class="btn  btn-warning " id="btn_guardar_roles" <?php echo $_SESSION['btn_guardar_roles']; ?>  ><i class="zmdi zmdi-floppy"></i> Guardar</button>
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
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>



   

 
</body>
</html>

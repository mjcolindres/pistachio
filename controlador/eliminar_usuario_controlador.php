<?php 
require_once ('../clases/conexion.php');
require_once ('../clases/funcion_permisos.php');
require_once ('../clases/funcion_bitacora.php');



$id="";
if (isset($_GET['UsuarioG'])) {
$id = $_GET['UsuarioG'];
}



$Id_objeto=10;

if (permisos::permiso_eliminar($Id_objeto)=='0') {

  echo '<script type="text/javascript">
                              swal({
                                   title:"",
                                   text:"Lo sentimos no tiene permiso para eliminar",
                                   type: "error",
                                   showConfirmButton: false,
                                   timer: 3000
                                });
                                $(".FormularioAjax")[0].reset();
                                               window.location = "../vistas/gestion_usuarios_vista.php";

                            </script>';
}
else
{

$sql = "call proc_eliminar_usuario('$id')";
	$resultado = $conection->query($sql);
	if($resultado === TRUE){
      bitacora::evento_bitacora( $_SESSION['idUser'],$Id_objeto,'ELIMINO' , 'EL USUARIO  '.ctype_upper($id).'');

                        	echo '<script type="text/javascript">
                              swal({
                                   title:"",
                                   text:"Los datos  se eliminaron correctamente",
                                   type: "success",
                                   showConfirmButton: false,
                                   timer: 3000
                                });
                                $(".FormularioAjax")[0].reset();
                                               window.location = "../vistas/gestion_usuarios_vista.php";

                            </script>';
                        }else{
                        	echo '<script type="text/javascript">
                                    swal({
                                       title:"",
                                       text:"No se realizo el proceso, el registro a eliminar tiene datos en otras tablas",
                                       type: "error",
                                       showConfirmButton: false,
                                       timer: 5000
                                    });
                                     $(".FormularioAjax")[0].reset();
                                </script>';
                        }
                      }
?>
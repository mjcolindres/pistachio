<?php 
session_start();
 
require_once ('principal_vista.php');
require_once ('../clases/conexion.php');
require_once ('../clases/funcion_bitacora.php');
  require_once ('../clases/funcion_visualizar.php');






        $Id_objeto=9 ; 

        $visualizacion= permiso_ver($Id_objeto);



if ($visualizacion==0)
 {
   header('location:  ../vistas/principal_vista.php'); 
}

else

{

        bitacora::evento_bitacora( $_SESSION['idUser'],$Id_objeto,'Ingreso' , 'A Bitacora del sistema');


/* Manda a llamar todos las datos de la tabla para llenar el gridview  */
$sql_tabla_bitacora=" SELECT u.usuario, b.accion, b.descripcion,Date_format(b.fecha,'%Y-%m-%d') as 
fecha from tbl_usuarios u, tbl_bitacora b where u.id_usuario=b.id_usuario ORDER BY b.fecha DESC";
$resultadotabla_bitacora = $conection->query($sql_tabla_bitacora);


if (isset($_REQUEST['query']))
 {
$query=$_REQUEST['query'];

    if ($query==1) 
    {
     $sql_bitacora_usuario_accion_fecha="SELECT u.usuario as usuario, b.accion, b.descripcion,Date_format(b.fecha,'%Y-%m-%d') as
      fecha from tbl_usuarios u, tbl_bitacora b where u.id_usuario=b.id_usuario and u.usuario='".$_GET['usuario']."'
       and b.accion='".$_GET['accion']."' and  b.fecha>='".$_GET['fechainicio']."' and b.fecha<=(DATE_ADD('".$_GET['fechafinal']."', 
       INTERVAL 1 DAY))  ";
        $resultadotabla_bitacora = $conection->query($sql_bitacora_usuario_accion_fecha);
      }

      if ($query==2) 
        {
         $sql_bitacora_usuario_accion="SELECT u.usuario as usuario, b.accion, b.descripcion,Date_format(b.fecha,'%Y-%m-%d')
          as fecha from tbl_usuarios u, tbl_bitacora b where u.id_usuario=b.id_usuario and u.usuario='".$_GET['usuario']."'
           and b.accion='".$_GET['accion']."'  ";
            $resultadotabla_bitacora = $conection->query($sql_bitacora_usuario_accion);
          }

          if ($query==3) 
            {
             $sql_bitacora_usuario_fecha=" SELECT u.usuario as usuario, b.accion, b.descripcion,Date_format(b.Fecha,'%Y-%m-%d') as
              fecha from tbl_usuarios u, tbl_bitacora b where u.id_usuario=b.id_usuario and u.usuario='".$_GET['usuario']."' and 
               b.fecha>='".$_GET['fechainicio']."' and b.fecha<=(DATE_ADD('".$_GET['fechafinal']."', INTERVAL 1 DAY))  ";
                $resultadotabla_bitacora = $conection->query($sql_bitacora_usuario_fecha);
              }

                  if ($query==4) 
                  {
                   $sql_bitacora_accion_fecha="SELECT u.usuario as usuario, b.accion, b.descripcion,Date_format(b.fecha,'%Y-%m-%d') as
                    fecha from tbl_usuarios u, tbl_bitacora b where u.id_usuario=b.id_usuario  and b.accion='".$_GET['accion']."' and  
                    b.fecha>='".$_GET['fechainicio']."' and b.fecha<=(DATE_ADD('".$_GET['fechafinal']."', INTERVAL 1 DAY))  ";
                      $resultadotabla_bitacora = $conection->query($sql_bitacora_accion_fecha);
                    }


                      if ($query==5) 
                  {
                   $sql_bitacora_accion="SELECT u.usuario as usuario, b.accion, b.descripcion,Date_format(b.fecha,'%Y-%m-%d') as
                    fecha from tbl_usuarios u, tbl_bitacora b where u.id_usuario=b.id_usuario  and b.accion='".$_GET['accion']."' ";
                      $resultadotabla_bitacora = $conection->query($sql_bitacora_accion);
                    }


                      if ($query==6) 
                      {
                       $sql_bitacora_fecha="SELECT u.usuario as usuario, b.accion, b.descripcion,Date_format(b.Fecha,'%Y-%m-%d') as
                        fecha from tbl_usuarios u, tbl_bitacora b where u.id_usuario=b.id_usuario and  b.fecha>='".$_GET['fechainicio']."'
                         and b.fecha<=(DATE_ADD('".$_GET['fechafinal']."', INTERVAL 1 DAY))  ";
                          $resultadotabla_bitacora = $conection->query($sql_bitacora_fecha);
                        }
                            if ($query==7) 
                              {
                               $sql_bitacora_usuario="SELECT u.usuario as usuario, b.accion, b.descripcion,Date_format(b.Fecha,'%Y-%m-%d') as
                                fecha from tbl_usuarios u, tbl_bitacora b where u.id_usuario=b.id_usuario and u.usuario='".$_GET['usuario']."' ";
                                  $resultadotabla_bitacora = $conection->query($sql_bitacora_usuario);
                                }

}


if (isset($_REQUEST['msj'])) 
{
  $msj=$_REQUEST['msj'];

    if ($msj==1)
      {
               echo '<script> alert("Fecha invalidas favor verificar.")</script>';

      }

      if ($msj==2)
      {
               echo '<script> alert("Datos por rellenar, por favor verificar.")</script>';

      }
       if ($msj==3)
      {
               echo '<script> alert("Por favor verificar fechas.")</script>';

      }

}

}

 ?>

<?php




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


            <h1>BITÁCORA DEL SISTEMA</h1>
          </div>

                <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="../vistas/principal_vista.php">INICIO</a></li>
             
            </ol>
          </div>

           
   
        </div>
      </div><!-- /.container-fluid -->
    </section>
   




<section class="content">
            <div class="container-fluid">
  <!-- pantalla 1 -->
      
<form action="../controlador/filtrar_bitacora_controlador.php" method="post"  data-form="save" autocomplete="off" >

 <div class="card card-default">
          <div class="card-header">
            <h3 class="card-title">Datos</h3>

            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
            </div>
          </div>


          <!-- /.card-header -->
          <div class="card-body">
            <div class="row">
                     
                           
              <div class="col-sm-6">
                <div class="form-group">
                  <label>Fecha Inicio</label>
                    <input class="form-control" type="date" id="txt_fecha_inicio" name="txt_fecha_inicio"  >
                </div>


              </div>
                <div class="col-sm-6">
                 <div class="form-group">
                  <label>Fecha Final</label>
                    <input class="form-control" type="date" id="txt_fecha_final" name="txt_fecha_final"  >
                </div>

              </div>
                <div class="col-sm-6">
                 <div class="form-group">
                  <label>Usuario</label>
                    <input class="form-control" type="text" id="txt_usuario_bitacora" name="txt_usuario_bitacora"  
                    value="" style="text-transform: uppercase" onkeyup="Espacio(this, event)"  onkeypress="return Letras(event)"  >
                </div>

              </div>
                <div class="col-sm-6">

                 <div class="form-group">
                  <label>Accion</label>
                  		<select class="form-control" name="accion_bitacora" id="accion_bitacora">
					<option value="0">Seleccione una opcion:</option>
                    <option value="Ingreso">Ingreso</option>
                    <option value="Inserto">Inserto</option>
                    <option value="Modifico">Modifico</option>
                    <option value="Elimino">Elimino</option>

                </select>
                </div>
                 </div>

              <p class="text-center" style="margin-top: 20px;">
                <button type="submit" class="btn  btn-warning" id="btn_filtrar_bitacora" ><i class="zmdi zmdi-floppy"></i> Filtrar</button>
              </p>

           
           









            </div>
          </div>



          <!-- /.card-body -->
          <div class="card-footer">
            
          </div>
        </div>
         
         
    
    
</form>

  </div>
</section>
<!--Pantalla 2-->


 
 <div class="card card-default">
            <div class="card-header">
              <h3 class="card-title">Registros de Bitacora del Sistema</h3>
              <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
            </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="tabla" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>USUARIO</th>
                  <th>ACCION</th>
                  <th>DESCRIPCION</th>
                  <th>FECHA</th>
                  </tr>
                </thead>
                <tbody>
                <?php while($row = $resultadotabla_bitacora->fetch_array(MYSQLI_ASSOC)) { ?>
                <tr>
      <td><?php echo $row['usuario']; ?></td>
         <td><?php echo strtoupper($row['accion']); ?></td>
           <td><?php echo strtoupper($row['descripcion']); ?></td>
         <td><?php echo $row['fecha']; ?></td>
            
               </tr>
               <?php } ?>
             </tbody>
            </table>
         </div>


            <!-- /.card-body -->
          </div>

        
          <!-- /.card-body -->
          <div class="card-footer">
            
          </div>
        </div>

</div>





</section>

</div>




<script type="text/javascript">
  

 $(function () {
   
    $('#tabla').DataTable({
      "paging": true,
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": true,
      "responsive": true,
    });
  });

 
</body>
</html>

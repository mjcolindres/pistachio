<?php
 ob_start();


 //session_start();
 require_once ('principal_vista.php');
require_once ('../clases/conexion.php');
require_once ('../clases/funcion_bitacora.php');
require_once ('../clases/funcion_visualizar.php');
require_once ('../clases/funcion_permisos.php');

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


            <h1>PRODUCTOS PARA LA VENTA</h1>
          </div>
                <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">   
              <li class="breadcrumb-item active"><a href="../vistas/principal_vista.php">INICIO</a></li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
 


  <!-- Main content -->
      <section class="content">
        <div class="container-fluid">
          <!-- pantalla  -->

          <div class="card card-default">

            <!-- /.card-header -->
            <div class="card-body">
              <div class="row">

                <div class="col-sm-12 ">
                  <label>CREAR PRODUCTO</label>
                  <hr>

                </div>
                <div class="col-sm-4">
                  <div class="form-group">
                  <!-- NOMBRES -->
                    <label>Nombre </label>
                    <input class="form-control" type="text"  id="nombre" name="nombre" maxlength="25" value=""  style="text-transform: uppercase" onkeyup="DobleEspacio(this, event)" onkeypress="return sololetras(event)" ;>
                  </div>
                </div>

                <div class="col-sm-4">
                  <div class="form-group">
                  <!-- APELLIDOS -->
                    <label>Descripción </label>
                    <input class="form-control" type="text" id="descripcion" name="descripcion" maxlength="25" value=""  style="text-transform: uppercase" onkeyup="DobleEspacio(this, event)" onkeypress="return sololetras(event)" ;>
                  </div>
                </div>
                <div class="col-sm-4">
                  <div class="form-group">
                  <!-- IDENTIDAD -->
                    <label>Precio </label>

                    <input class="form-control" type="text" id="precio" name="precio"  value="" >


                  </div>
                </div>

        

                <div class="col-sm-4">
                  <div class="form-group">
                  <!-- NACIONALIDAD -->
                    <label>Nacionalidad</label>
                    <select class="form-control" name="nacionalidad_persona" id="nacionalidad_persona" style="text-transform: uppercase" >
                    <option value="" selected hidden>Seleccione</option>
                   
                       
                    </select>
                  </div>
                </div>

                <div class="col-sm-4">
                  <div class="form-group">
                  <!-- FECHA DE NACIMIENTO -->
                    <label>Fecha de nacimiento</label>
                    <input class="form-control" type="date" pattern="[0-9]{2}-[0-9]{2}-[0-9]{4}" id="fecha_persona" name="fecha_persona" >
                  </div>
                </div>

                <div class="col-sm-4">
                  <div class="form-group">
                  <!-- ESTADO CIVIL -->
                    <label>Estado civil</label>
                    <select class="form-control" name="estado_civil_persona" id="estado_civil_persona" style="text-transform: uppercase" >
                    <option value="" selected hidden>Seleccione</option>
              
                    </select>
                  </div>
                </div>
                <div class="col-sm-4">
                  <div class="form-group">
                  <!-- GENERO -->
                    <label>Género</label>
                    <select class="form-control" name="genero_persona" id="genero_persona" style="text-transform: uppercase" >
                    <option value="" selected hidden>Seleccione</option>
             
                    </select>
                  </div>
                </div>

              
                <div class="col-sm-12">


                  <hr>

                </div>


                <div class="col-sm-4">
                  <div class="form-group">
                  <!-- IDENTIDAD -->
                    <label>Telefono </label>

                    <input class="form-control" type="text" id="telefono_persona" name="telefono_persona"  value="" data-inputmask='"mask": " 9999-9999"' data-mask onkeyup="ValidarIdentidad($('#identidad').val());"  >


                  </div>
                </div>


                <div class="col-sm-4">
                  <div class="form-group">
                  <!-- APELLIDOS -->
                    <label> Correo Electrónico </label>

                    <input class="form-control" type="text" id="correo_persona" name="correo_persona" maxlength="" value="" required style="text-transform: uppercase" onkeyup="DobleEspacio(this, event)"  ;>


                  </div>
                </div>

                <div class="col-sm-4">
                  <div class="form-group">
                  <!-- APELLIDOS -->
                    <label> Direccion </label>

                    <input class="form-control" type="text" id="direccion_persona" name="direccion_persona" maxlength="25" value=""  style="text-transform: uppercase" onkeyup="DobleEspacio(this, event)"  ;>


                  </div>
                </div>

                <div class="col-sm-12">


                  <hr>

                </div>

                  <div class="col-sm-4">
                  <div class="form-group">
                  <!-- GENERO -->
                    <label>Tipo Persona</label>
                    <select class="form-control" name="tipo_persona" id="tipo_persona" style="text-transform: uppercase" >
                    <option value="" selected hidden>Seleccione</option>
                                  </select>
                  </div>
                </div>

              
                

          </div>
          </div>
                <p class="text-center" style="margin-top: 20px;">
                <button type="submit" class="btn  btn-warning" id="btnGuardar" name="btnGuardar" onclick="guardar()"><i class="zmdi zmdi-floppy"></i>Guardar</button>
              </p>
          </div>


          </form>

      </section>


  </div>

</div>


</body>
</html>
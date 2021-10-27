<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>PISTACCHIO | Pedidos pendientes</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
</head>
<body class="Informational">
<div class="wrapper ">



  <div class="content" style="width: 850px;"  >
    <!-- Content Header (Page header) -->

    <!-- Main content -->
    
        <!-- /.row -->
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Código de Pedido: </h3> <h2 class="card-title"> 0003</h2><br>
                <h3 class="card-title">Usuario: </h3> <h2 class="card-title"> DAVIDIM94</h2><br>
                <h2 class="card-title">Cliente: </h2> <h2 class="card-title"> Roberto Castillo</h2>

                <div class="card card-header float-right">
                    <div class=" float-left">
                        <ol class="float-left">
                            <ul class="brand-text">Fecha Pedido</ul>
                            <ul class="brand-text" >Realizado</ul>
                            <ul class="brand-text" >Entrega</ul>
                            <ul class="brand-text justify-content-center" >Entrega en 10 días</ul>
                          </ol>
                    </div>
                    
                  </div>

              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0" style="height: auto;">
                <table class="table table-head-fixed text-nowrap">
                  <thead>
                    <tr>
                       
                        <th>Código Producto</th>
                        <th>Descripción</th>
                        <th>Cantidad</th>
                        <th>Costo Estimado</th>
                        <th>Tiempo estimado</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1000</td>
                      <td>Pastel personalizado de Mario Bross</td>
                      <td>1</td>
                      <td>L.950.00</td>
                      <td>2 días</td>
                    </tr>
                    
                    <tr>
                        <td>1001</td>
                        <td>Cupcakes</td>
                        <td>20</td>
                        <td>L.450.00</td>
                        <td>4 días</td>
                    </tr>
                    <tr>
                        <td>1002</td>
                        <td>Platos Fuertes</td>
                        <td>12</td>
                        <td>L.2,160.00</td>
                        <td>6 días</td>
                    </tr>
                    
                    <tr>
                        <td>1003</td>
                        <td>Tiramisú</td>
                        <td>12</td>
                        <td>L.600.00</td>
                        <td>7 días</td>
                    </tr>
                
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>



      </div><!-- /.container-fluid -->

      
    </section>
    <!-- /.content -->


    
</div>
  
  
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="../../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../../plugins/jszip/jszip.min.js"></script>
<script src="../../plugins/pdfmake/pdfmake.min.js"></script>
<script src="../../plugins/pdfmake/vfs_fonts.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
<!-- Page specific script -->
<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": ["ver", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>
</body>
</html>

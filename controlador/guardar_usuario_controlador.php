<?php


//si está exite el post osea todo los datos se hace que nlos campos no estén vacio
if(!empty($_POST))
{
   $alert='';
   if(empty($_POST['usuario'])  || empty($_POST['clave']) || empty($_POST['rol']))
    {
         $alert = '<p class="msg_error">Todos los campos son obligatorios</p>';
    }else{
  
      



     
    
      $user = $_POST['usuario'];
      $clave = md5($_POST['clave']);
      $rol = $_POST['rol'];



      //verificar si el correo y usuario ya existen 
     
     





      //almacenar la informacion
      //en el insert son los datos de la base de datos 
      // en el value es la variable del post que tienen los nombres de l input el name 

      $query_insert = mysqli_query($conection,"INSERT INTO tbl_usuarios(id_persona, id_rol, usuario, pass, estado, creado_por, fecha_creacion)
            values('2', '$rol', '$user', '$clave', '2','admin','12/05/2021')");


      //evaluar si guarda si es verdadero 
      if($query_insert){
        echo '<script type="text/javascript">
        swal({
             title:"",
             text:"Los datos  se almacenaron correctamente",
             type: "success",
             showConfirmButton: false,
             timer: 3000
          });
          $(".FormularioAjax")[0].reset();
      </script>'; 

      }else{
             $alert='<p class="msg_error">-Error al crear el usuario</p>';
      }
    }
  }
   



?>
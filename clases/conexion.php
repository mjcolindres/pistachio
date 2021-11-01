<?php

   $host = 'localhost';
   $user = 'root';
   $pass = '';
   $db = 'pistacchio';


   $conection = @mysqli_connect($host,$user,$pass,$db);
//cerrando la conexion
   


if(!$conection){
    echo "error en la conexión";
}

?>
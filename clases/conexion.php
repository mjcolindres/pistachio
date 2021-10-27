<?php

   $host = 'localhost';
   $user = 'root';
   $pass = '';
   $db = 'pistachio';


   $conection = @mysqli_connect($host,$user,$pass,$db);
//cerrando la conexion
   


if(!$conection){
    echo "error en la conexión";
}

?>
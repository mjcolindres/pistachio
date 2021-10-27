<?php
  

   require_once ('../clases/conexion.php');
   require_once ('../clases/funcion_bitacora.php');



   $sql = "SELECT nombres from tbl_personas order by nombres";
   $res = $conection->query($sql);

   $arreglo_php = array();

   if (mysqli_num_rows($res)==0) 
   {
          array_push($arreglo_php, "No hay datos");
   }
    else{
        while($palabras = mysqli_fetch_array($res)){
            array_push($arreglo_php, $palabras["nombres"]);

        }
   }
   
?>
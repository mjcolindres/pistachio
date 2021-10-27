<?php
 
 //para cerrar sesion se inicia la sesion y se termina 
session_start();
session_unset(); /*Elimina los valores de la sesion*/
session_destroy();/*cierra la sesion*/

header('location: ../');
?>
<?php
include('Backup.php');
include('../clases/conexion.php');

echo backup_tables('localhost','root','','pistacchio');

$fecha=date("Ymd-His");
header("Content-disposition: attachment; filename=db-pistacchio-".$fecha.".sql");
header("Content-type: MIME");
readfile("backups/db-pistacchio-".$fecha.".sql");
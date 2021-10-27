<?php
require "../clases/conexion_mantenimientos.php";

$instancia_conexion = new conexion();

class usuarios
{
    	//Implementamos nuestro constructor
	public function __construct()
	{

    }
    
	//Implementamos un método para insertar registros de primera unica de supervision
	
	public function insertar($Id_persona,$Id_rol,$Usuario,$contrasena,$_SESSION(usuario))
	{
        global $instancia_conexion;
		$sql = "call proc_insert_usuarios('$Id_persona', '$Id_rol',  '$Usuario',  '$Contrasena',  '$_SESSION(usuario)');";
		return $instancia_conexion->ejecutarConsulta($sql);
	}

    

  //Implementar un método para listar los registros
	public function listar()
	{
        global $instancia_conexion;
		$sql="SELECT  id_persona, id_rol, usuario, contrasena,  estado, creado_por, fecha_creacion FROM tbl_usuarios";
		return $instancia_conexion->ejecutarConsulta($sql);
	}

	
    
	


}




   


?>

























?>



   <?php


	class bitacora {
		public static function evento_bitacora($id_usuario,$id_objeto,$accion,$descripcion)
		{
			   require ('../clases/conexion.php');
			   
			   		$sql = "INSERT INTO  tbl_bitacora (id_usuario, id_objeto, accion ,descripcion, fecha)
    			 VALUES ('$id_usuario' , '$id_objeto', '$accion', '$descripcion', sysdate() )";
		
			$resultado = $conection->query($sql);
		}
		
}
		?>
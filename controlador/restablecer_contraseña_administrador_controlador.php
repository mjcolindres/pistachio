<?php 

//fernandoizaguirrehn7@gmail.com
include '../vistas/restablecer_contraseña_vista_administrador.php';
 
		try{
			if(isset($_POST['correo']) && !empty($_POST['correo'])){
                $pass = substr( md5(microtime()), 1, 10);
                $mail = $_POST['correo'];
                
                include '../backupDB/Connet.php';

                $sql = "UPDATE tbl_usuarios Set password='$pass' Where correo='$mail'";

                if ($conection->query($sql) === TRUE) {
                    echo "usuario modificado correctamente ";
                } else {
                    echo "Error modificando: " . $conection->error;
                }
                
                $to = $_POST['correo'];//"destinatario@correo.com";
                $from = "From: " . "Masterhouse" ;
                $subject = "Recordar contraseña";
                $message = "El sistema le asigno la siguiente clave " . $pass;

                mail($to, $subject, $message, $from);
                echo 'Correo enviado satisfactoriamente a ' . $_POST['correo'];
            }
            else 
                echo 'Informacion incompleta';
		}
		catch (Exception $e) {
			echo 'Excepción capturada: ',  $e->getMessage(), "\n";
		}
            
        ?>


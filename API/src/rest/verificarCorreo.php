<?php
	require_once '../modelo/conexionBD.php';
	require_once '../queries/sql.php';


	if (isset($_POST['email'])) {
	
		// Crear una instancia de la clase conexionBD
		$db = new conexionBD();
		$conn=$db->get_con();
		
		// Filtrar y escapar las variables de entrada
		$email = $conn->real_escape_string($_POST['email']);
		
		// Llamada a la función crearUsuario 
		$resultado = verificarCorreo($conn,$email);
		
		if ($resultado) {
			echo json_encode(true);
		} else {
			echo json_encode(false);
		}
		
	
		$db->dbDisconnect();    
		

		
	}




?>
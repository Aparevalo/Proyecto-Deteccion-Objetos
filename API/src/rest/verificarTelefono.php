<?php
	require_once '../modelo/conexionBD.php';
	require_once '../queries/sql.php';


	if (isset($_POST['telefono'])) {
	
		// Crear una instancia de la clase conexionBD
		$db = new conexionBD();
		$conn=$db->get_con();
		
		// Filtrar y escapar las variables de entrada
		$telefono = $conn->real_escape_string($_POST['telefono']);
		
		// Llamada a la función crearUsuario 
		$resultado = verificarTelefono($conn,$telefono);
		
		if ($resultado) {
			echo json_encode(true);
		} else {
			echo json_encode(false);
		}
		
	
		$db->dbDisconnect();    
		

		
	}




?>
<?php

require_once '../modelo/persona.php';
require_once '../modelo/user.php';
require_once '../modelo/conexionBD.php';
require_once '../queries/sql.php';


// Verificar si se han recibido los datos del formulario
if (isset($_POST['nombre']) && isset($_POST['apellido']) && isset($_POST['telefono']) && isset($_POST['email']) && isset($_POST['contrasena'])) {
	
	// Crear una instancia de la clase conexionBD
	$db = new conexionBD();
	$conn=$db->get_con();
    
	// Filtrar y escapar las variables de entrada
    $email = $conn->real_escape_string($_POST['email']);
	$contrasena = $conn->real_escape_string($_POST['contrasena']);
	$nombre = $conn->real_escape_string($_POST['nombre']);
	$apellido = $conn->real_escape_string($_POST['apellido']);
	$telefono = $conn->real_escape_string($_POST['telefono']);

    $salt = bin2hex(random_bytes(16)); // Genera un "salt" de 16 bytes
    $hashedPassword = password_hash($contrasena . $salt, PASSWORD_BCRYPT);

    // Crear el objeto Persona
    $persona = new Persona($nombre, $apellido, $telefono, 'user');

    // Llamada a la función crearUsuario 
    $resultado = crearUsuario($conn, $persona, $email, $hashedPassword, $salt);
	
	if ($resultado) {
		echo json_encode(true);
	} else {
		echo json_encode(false);
	}
	
	
	// Desconectarse de la base de datos
	$db->dbDisconnect();    
	

	
}

?>

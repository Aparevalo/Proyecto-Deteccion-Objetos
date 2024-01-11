<?php

require_once '../config/db_config.php';
require_once '../modelo/persona.php';
require_once '../modelo/user.php';



// Verificar si se han recibido los datos del formulario
if (isset($_POST['nombre']) && isset($_POST['apellido']) && isset($_POST['telefono']) && isset($_POST['email']) && isset($_POST['contrasena'])) {

    $email = $_POST['email'];
    $contrasena = $_POST['contrasena'];
    $nombre =  $_POST['nombre'];
    $apellido =  $_POST['apellido'];
    $telefono =  $_POST['telefono'];
    $salt = bin2hex(random_bytes(16)); // Genera un "salt" de 16 bytes
    $hashedPassword = password_hash($contrasena . $salt, PASSWORD_BCRYPT);
	
    // Crear el objeto Persona
    $persona = new Persona($nombre, $apellido, $telefono, 'user');
    $queryPersona = $persona->insert();

    // Intentar ejecutar la consulta SQL
    if ($conn->query($queryPersona) === TRUE) {
        // Obtener el ID insertado
        $insertedId = $conn->insert_id;

        if ($insertedId > 0) {
            // Código para crear un usuario
            $usuario = new User($email, $hashedPassword, $salt, 'user', $insertedId);
            $queryUsuario = $usuario->insert();

            // Intentar ejecutar la consulta SQL para crear el usuario
            if ($conn->query($queryUsuario)) {
                 echo json_encode(true);
            } else {
                echo json_encode(false);
            }
        } else {
            echo json_encode(false);
        }
    } else {
        echo json_encode(false);
    }

    $conn->close();
}
?>

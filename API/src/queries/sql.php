<?php

	require_once '../modelo/persona.php';
	require_once '../modelo/user.php';
	

	
	function verificarCorreo(mysqli $conn, $email) {
		// Obtener el correo electrónico de la base de datos
		$query = "SELECT email FROM usuarios WHERE email = '$email' LIMIT 1";
		$result = $conn->query($query);

		if ($result->num_rows > 0) {
			// El correo electrónico existe en la base de datos
			return false;
		} else {
			// El correo electrónico no existe en la base de datos
			return true;
		}
	}
	
	
	function verificarTelefono(mysqli $conn, $telefono) {
		// Obtener el correo electrónico de la base de datos
		$query = "SELECT telefono FROM personas WHERE telefono = '$telefono' LIMIT 1";
		$result = $conn->query($query);

		if ($result->num_rows > 0) {
			// El telefono electrónico existe en la base de datos
			return false;
		} else {
			// El telefono electrónico no existe en la base de datos
			return true;
		}
	}
	
	
	function crearUsuario(mysqli $conn, Persona $persona, $email, $hashedPassword, $salt) {
		// Intentar ejecutar la consulta SQL para insertar la persona
		if ($conn->query($persona->insert()) === TRUE) {
			// Obtener el ID insertado
			$insertedId = $conn->insert_id;

			if ($insertedId > 0) {
				// Código para crear un usuario
				$usuario = new User($email, $hashedPassword, $salt, 'user', $insertedId);
				$queryUsuario = $usuario->insert();

				// Intentar ejecutar la consulta SQL para crear el usuario
				if ($conn->query($queryUsuario)) {
					
					return true;
				} else {
					
					return "Error al crear el usuario: " . $conn->error;
				}
			} else {
				
				return "Error al obtener el ID insertado: " . $conn->error;
			}
		} else {
			
			return "Error al insertar la persona: " . $conn->error;
		}
	}

	
	function verificarContrasena(mysqli $conn, $email, $password_ingresada) {
    // Obtener el "salt" y el hash de la base de datos usando el email
    $query = "SELECT salt, contrasena FROM usuarios WHERE email = '$email'";
    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $salt_from_db = $row['salt'];
        $hashedPassword_from_db = $row['contrasena'];
		
		
	        // Verificar la contraseña ingresada con el hash almacenado y el "salt"
        if (password_verify($password_ingresada . $salt_from_db, $hashedPassword_from_db)) {
            // Contraseña válida
            return true;
        } else {
            // Contraseña incorrecta
            return false;
        }
    } else {
        // El usuario no existe en la base de datos
        return false;
    }
	
	}
	
	
	
	 
	
  
?>
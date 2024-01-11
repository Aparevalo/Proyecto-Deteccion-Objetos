<?php

class User {
    private $email;
    private $contrasena;
	private $salt;
    private $nivel;
	private $id_persona;

    public function __construct($email, $contrasena, $nivel, $salt ,$id_persona) {
        $this->email = $email;
        $this->contrasena = $contrasena;
        $this->salt = $salt;
		$this->nivel = $nivel;
		$this->id_persona = $id_persona;
    }


	/*Getters and Setters*/
	

	

	/*Funciones SQL*/

	public function insert() {
		$query = "INSERT INTO usuarios (email, contrasena, salt, nivel, id_persona) VALUES ";
		$query .= "('$this->email', '$this->contrasena','$this->salt','$this->nivel','$this->id_persona')";
		return $query;
	}

	public function update($id) {
		$query = "UPDATE usuarios SET email = '$this->email', contrasena = '$this->contrasena' WHERE id = $id";
		return $query; 
	}

	public function delete($id) {
		$query = "DELETE FROM usuarios WHERE id = $id";
		return $query; 
	}

	public static function getById($id) {
		$query = "SELECT * FROM usuarios WHERE id = $id";
		return $query; 
	}

	public static function getAll() {
		$query = "SELECT * FROM Usuarios";
		return $query; 
	}

}

?>
<?php

class Persona {
    private $nombre;
    private $apellido;
	private $telefono;
    private $rol;
	

    public function __construct($nombre, $apellido, $telefono, $rol) {
        $this->nombre = $nombre;
        $this->apellido = $apellido;
        $this->telefono = $telefono;
		$this->rol = $rol;
	
    }


	/*Funciones SQL*/

	public function insert() {
		$query = "INSERT INTO Personas (nombre, apellido, telefono, rol) VALUES ";
		$query .= "('$this->nombre', '$this->apellido','$this->telefono','$this->rol')";
		return $query;
	}

	//

	public function update($id) {
		$query = "UPDATE personas SET nombre = '$this->nombre', apellido = '$this->apellido, telefono = '$this->telefono' WHERE id = $id";
		return $query; 
	}

	public function delete($id) {
		$query = "DELETE FROM personas WHERE id = $id";
		return $query; 
	}

	public static function getById($id) {
		$query = "SELECT * FROM personas WHERE id = $id";
		return $query; 
	}

	public static function getAll() {
		$query = "SELECT * FROM personas";
		return $query; 
	}

}

?>
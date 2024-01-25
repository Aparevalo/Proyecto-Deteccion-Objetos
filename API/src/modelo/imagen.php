<?php

class Imagen {
    private $nombre;
    private $ruta;
    private $id_usuario;

    public function __construct($nombre, $ruta,$id_usuario) {
        $this->nombre = $nombre;
        $this->ruta = $ruta;
		$this->id_usuario = $id_usuario;
    }


	/*Funciones SQL*/

	public function insert() {
		$query = "INSERT INTO imagen (nombre, ruta, id_usuario) VALUES ";
		$query .= "('$this->nombre', '$this->ruta','$this->id_usuario')";
		return $query;
	}

	//las cosas absolutas no se toca -> array no se modifica
	public function update($id) {
		$query = "UPDATE imagen SET nombre = '$this->nombre', ruta = '$this->ruta' WHERE id = $id";
		return $query; 
	}

	public function delete($id) {
		$query = "DELETE FROM imagen WHERE id = $id";
		return $query; 
	}

	public static function getById($id) {
		$query = "SELECT * FROM imagen WHERE id = $id";
		return $query; 
	}

	public static function getAll() {
		$query = "SELECT * FROM Usuarios";
		return $query; 
	}

}

?>
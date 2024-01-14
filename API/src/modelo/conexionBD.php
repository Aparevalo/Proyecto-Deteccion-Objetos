<?php
 require_once '../config/db_config.php';
 
 class conexionBD {

    private $con;
    
   public function __construct() {
    $this->dbConnect();
	}


	public function get_con(){

	  return $this->con;
	}


	//Funciones de conexion

	//Funcion para iniciar conexion
	public function dbConnect()
	{
		
		$this->con = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
		if ($this->con->connect_error) {
			die("Conexión fallida: " . $this->con->connect_error);
		}
	}
	
	//Funcion para cerrar conexion
	public function dbDisconnect() {
        if ($this->con) {
            $this->con->close();
        }
    }
	

}
?>
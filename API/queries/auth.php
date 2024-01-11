<?php

	require_once '../config/db_config.php';
	
	public function escape($str){
	   return $this->con->real_escape_string($str);
	 }
	 
	function authenticate($username='', $password='') {
		global $db;
		$username = $db->escape($username);
		$password = $db->escape($password);
		$sql  = sprintf("SELECT id,username,password,user_level FROM users WHERE username ='%s' LIMIT 1", $username);
		$result = $db->query($sql);
		if($db->num_rows($result)){
		  $user = $db->fetch_assoc($result);
		  $password_request = sha1($password);
		  if($password_request === $user['password'] ){
			return $user['id'];
		  }
		}
	   return false;
	  }
  
?>
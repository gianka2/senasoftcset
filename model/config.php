<?php
//Clase confuguración proyecto
class Conectar{
	private $host = 'localhost';
	private $user = 'root';
	private $pass = '';
	private $bd = '';
	public function con(){ #Función conectarnos a la BD
		try{
		    $con = new PDO("mysql:host=".$this->host.";dbname=".$this->bd, $this->user,$this->pass);
		    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		    $con->query("SET NAMES 'utf8'");
		    return $con;
		}catch(PDOException $e){
		echo "ERROR: ".$e->getMessage();
		echo "erro al conectar";
		}
	}
	public static function ruta(){ #Ruta por defecto Raiz del Proyecto
		return "http://localhost/www/hackathon/html/";
	}

	public function comillas_inteligentes($valor){
		// Retirar las barras
		if (get_magic_quotes_gpc()) {
			$valor = stripslashes($valor);
		}
		// Colocar comillas si no es entero
		if (!is_numeric($valor)){
			$valor = "'".mysql_real_escape_string($valor)."'";
		}
		return $valor;
	}
}
?>


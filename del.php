<?php
include("db.php");
if(isset($_GET['x'])){
	$nombre = $_GET['x'];
	$sql = "DELETE FROM usuarios WHERE nombre='$nombre'";
	$res = mysqli_query($conexion,$sql);
	if($res){
		echo "<br>Se ha borrado el usuario ".$nombre;
	}else{
		echo "<br>No se pudo borrar el usuario";
	}
}
?>

<?php
include("db.php");
if (isset($_POST['s'])) {
	$nombre = $_POST['nombre'];
	$correo = $_POST['correo'];
	$clave = $_POST['clave'];
	$sql = "INSERT INTO usuarios(nombre, correo, clave) VALUES ('$nombre','$correo','$clave')";
	$res = mysqli_query($conexion,$sql);
	if($res){
		echo "<h3>Se ha registrado el usuario correctamente</h3>";
	}else{
		echo "<h3>No se pudo registrar el usuario correctamente</h3>";
	}
}

?>


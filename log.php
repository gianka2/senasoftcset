<?php
include('db.php');
if (isset($_POST['s'])) {
	$nombre = $_POST['nombre'];
$clave = $_POST['clave'];
$sql = "SELECT * FROM usuarios WHERE nombre='$nombre' and clave='$clave'";
$res = mysqli_query($conexion,$sql);
$existe = $res->num_rows;
if ($existe == 1) {
	SESSION_START();
	$_SESSION['loged']="si";
	header("location:inicio.php");

}else{
	header("location:index.php");

	}

}

?>
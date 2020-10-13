<?php
include("sesion.php");
$con = include("db.php");
?>
<!DOCTYPE html>
<html>
<head>
	<title>Formulario de actualizacion</title>
</head>
<body>
<h1 align="center">Formulario de actualización</h1>
<?php
$nombre = $_GET['nombre'];
if($con){
$sql = "SELECT * FROM usuarios WHERE nombre='$nombre'";
$res = mysqli_query($conexion,$sql);
$row = $res->fetch_array();
$nombre = $row['nombre'];
$correo = $row['correo'];
$clave = $row['clave'];
}
else{
	echo "No se pudo encontrar el usuario";
}
?>
<form method="post" action="upd.php">
	<label>Usuario:</label>
	<input type="text" name="nombre" value="<?php echo $nombre?>">
	<label>Correo:</label>
	<input type="text" name="correo" value="<?php echo $correo?>">
	<label>Clave</label>
	<input type="text" name="clave" value="<?php echo $clave?>">
	<input type="submit" name="x" value="Actualizar">
</form>
</body>
<a href="inicio.php">Cancelar</a>
</html>
<?php
include("sesion.php");
$con = include("db.php");
?>
<!DOCTYPE html>
<html>
<head>
	<title>Actualizar registros</title>
</head>
<body>
	<h1 align="center">Formulario de actualización</h1>
<?php
if ($con) {
	$sql = "SELECT * FROM usuarios";
	$res = mysqli_query($conexion,$sql);
	?>
	<table align=center border=1 width='70%'>
	<tr>
		<th>Nombre</th>
		<th>Correo</th>
		<th>Clave</th>
		<th>Opción</th>
	</tr>
	
	<?php
	while ($row = $res->fetch_array()) {
		$nombre = $row['nombre'];
		$correo = $row['correo'];
		$clave = $row['clave'];
	echo "<tr>";
		echo "<td align=center>".$nombre."</td>";
		echo "<td align=center>".$correo."</td>";
		echo "<td align=center>".$clave."</td>";
		echo "<td align=center><a href='act.php?nombre=$nombre'>Actualizar registro</a></td>";
	echo "</tr>";
	}
	echo "</table>";
}

?>
<a href="inicio.php">Volver</a>

</body>
</html>
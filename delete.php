<?php
include("sesion.php");
include("del.php"); 
?>
<!DOCTYPE html>
<html>
<head>
	<title>Borrar usuarios</title>
</head>
<h1 align="center">Borrar usuarios</h1>
<body>
<?php
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
		echo "<td align=center><a href='delete.php?x=$nombre'>Borrar registro</a></td>";
	echo "</tr>";
	}
	echo "</table>";


?>
</body>
<a href="inicio.php">Volver</a>
</html>
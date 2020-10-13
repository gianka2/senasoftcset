<?php 
include("sesion.php");
include("db.php");
?>
<!DOCTYPE html>
<html>
<head>
	<title>Mostrar registros</title>
</head>
<body>
	<h1 align="center">Usuarios Registrados</h1>
	<form method="post" align="center" action="<?php echo $_SERVER['PHP_SELF'];?>">
		<tr>
			<th><label>Usuario</label></th>
			<th><input type="text" name="busque" required></th>
			<th><input type="submit" name="b" value="Buscar"></th>
			<th><a href="read.php">Mostrar todo</a></th>
		</tr>
	</form>

	<table align=center border=1 width='70%'>
	<tr>
		<th>Nombre</th>
		<th>Correo</th>
		<th>Clave</th>
	</tr>
	
	<?php
	if(isset($_POST['b'])){
		$busque = $_POST['busque'];
		$sql2 = "SELECT * FROM usuarios WHERE nombre='$busque'";
		$res2 = mysqli_query($conexion,$sql2);
		while ($row = $res2->fetch_array()) {
		$nombre = $row['nombre'];
		$correo = $row['correo'];
		$clave = $row['clave'];
	echo "<tr>";
		echo "<td align=center>".$nombre."</td>";
		echo "<td align=center>".$correo."</td>";
		echo "<td align=center>".$clave."</td>";
	echo "</tr>";
	}
	echo "</table>";
	}
	else{
		$sql = "SELECT * FROM usuarios";
		$res = mysqli_query($conexion,$sql);	
		while ($row = $res->fetch_array()) {
		$nombre = $row['nombre'];
		$correo = $row['correo'];
		$clave = $row['clave'];
	echo "<tr>";
		echo "<td align=center>".$nombre."</td>";
		echo "<td align=center>".$correo."</td>";
		echo "<td align=center>".$clave."</td>";
	echo "</tr>";
	}
	echo "</table>";
	}
#}

?>
<a href="inicio.php">Volver</a>

</body>
</html>
<?php
include("sesion.php");
include("reg.php");
?>
<!DOCTYPE html>
<html>
<head>
	<title>Registro</title>
</head>
<body>
<form method="post" >
	<h1>Formulario de registro</h1>
	<input type="text" name="nombre" placeholder="Nombre" required>
	<input type="email" name="correo" placeholder="Correo" required>
	<input type="password" name="clave" placeholder="Clave" required>
	<input type="submit" name="s" value="Registrar">
</form>
</body>
<a href="inicio.php">Volver</a>
</html>
<?php
include('sesion.php');
$salir = $_SESSION['loged'];
?>
<!DOCTYPE html>
<html>
<head>
	<title>Inicio de sesión</title>
</head>
<h1 align="center">Menú principal</h1>
<body>
<ul>
	<li><a href="registro.php">Crear usuarios</a></li>
	<li><a href="read.php">Buscar usuarios</a></li>
	<li><a href="update.php">Actualizar usuarios</a></li>
	<li><a href="delete.php">Borrar usuarios</a></li>
</ul>
<a href="index.php?salir=$salir">Salir</a>
</body>
</html>
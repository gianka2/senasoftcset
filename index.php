<?php
SESSION_START();
if (isset($_GET['salir'])) {
		echo "Ha finalizado la sesión ";	
		session_destroy();	
}
include('log.php');
?>
<!DOCTYPE html>
<html>
<head>
	<title>Inicio de sesión</title>
</head>
<body>
<form align="center" method="post">
	<label>Usuario</label>
	<input type="text" name="nombre" required>
	<label>Contraseña</label>
	<input type="password" name="clave" required>
	<input type="submit" name="s" value="Entrar">
</form>
</body>
</html>

<?php 
include("sesion.php");
$con = include("db.php");
?>
<!DOCTYPE html>
<html>
<head>
	<title>Formulario de actualización</title>
</head>
<body>
<?php
$nombre = $_POST['nombre'];
$correo = $_POST['correo'];
$clave = $_POST['clave'];
if(isset($_POST['x'])){
$sql = "UPDATE usuarios SET nombre='$nombre',correo='$correo',clave='$clave' WHERE nombre='$nombre'";
$res = mysqli_query($conexion,$sql);}
else{
	echo "Error";
}
if($res){
	 echo "<script>
                alert('Registro hecho correctamente');
                window.location= 'update.php'
    		</script>";
}else{
	echo "<p>Hubo un error</p>";
}
?>
</body>
</html>
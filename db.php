<?php
$conexion=mysqli_connect(
	'localhost',
	'root',
	'',
	'vacas');
if (isset($conexion)) {
	echo "Online";
}else{
	echo "Offline";}
 ?>

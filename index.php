<?php
	require_once("model/config.php");

	if(!empty($_GET["accion"]))
		$accion=$_GET["accion"];
	else
		$accion="login";
	
	if(is_file("controller/".$accion."Controller.php"))
		require_once("controller/".$accion."Controller.php");
	else
		require_once("controller/errorController.php");
?>
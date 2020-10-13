<?php
SESSION_START();
if($_SESSION['loged']<>"si"){
	 echo "<script>
                alert('No ha iniciado sesión');
                window.location= 'index.php'
    		</script>";
}
?>
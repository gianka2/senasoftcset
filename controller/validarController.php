<?php
    require_once("model/model-admin.php");

    if(isset($_POST["login"])){

        $cons   = new Consultas();

        
        $identificador  = htmlspecialchars($_POST["documento"]);
        $contrasena     = htmlspecialchars($_POST["clave"]);
       
        $datos  = $cons->loguearse($identificador, $contrasena);


        
                
                $id = $datos[0]["id_usuario_sigo"];
                $nom = $datos[0]["nombre_usurio"];
            

        if($cons->mensaje == "error"){
           
            echo "ERROR USURAIO NO ENCONTRADO";
        }
        else{ 
            
				session_start();
                $_SESSION['Autorizado']="Si";

                if($_SESSION['Autorizado']=="Si"){
                   require_once("view/vista_menu_superadmin.phtml");
                }
                else{
                    require_once("view/error.phtml"); 
                }
        }
    }

?>
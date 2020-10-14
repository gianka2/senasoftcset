<?php
    class Consultas extends Conectar{

        private $cons;
        public $mensaje;

        public function  __construct(){
            $this->cons=array();
        }

        ## - - - - FUNCION PARA LOGIN - - - - ##
        public function loguearse($identificador, $contrasena){
            $res=parent::con();
            $sql=$res->prepare("SELECT * FROM siigo WHERE id_usuario_sigo ='".$identificador."' AND clave_usuario_sigo ='".$contrasena."'");
            $sql->execute();
            $total = $sql->rowcount();

            if($total == 0){

                $this->mensaje= "error";
            }else{
                while($reg=$sql->fetch()){

                    $this->cons[]=$reg;
                }
            }
           

            
        
        }
    }
?>
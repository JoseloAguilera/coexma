<?php 
session_start();
 include_once "../conn/conn.php";
 include_once "../funciones/funciones.php";
 if(isset($_POST['id'])):
    $id_ciudad = $_POST['id_ciudad'];
    $id_met = $_POST['id'];
    $connection = conn();
    $_SESSION['costo_envio'] = 0 ;
    //recibe id_met_envio e id_ciudad    
    $u=getMetEnvioCiudad($id_met,$id_ciudad);
	
    $html="0";
    //si hay un precio asignado a la ciudad // el costo se asignara al envio
    if (($u != null)) {
            $html=$u['precio'];
            $_SESSION['costo_envio'] = $u['precio'];
            

            echo $html;
    } else {
             $costo_envio_default= getMetodosDeEnvioDefault($id_met);
       
             if ($costo_envio_default != null ) {
                    $html=$costo_envio_default['costo'];
                    $_SESSION['costo_envio'] = $html;
                    
                    echo $html;
             } else
                echo $html;
            }
	
	;	
endif;
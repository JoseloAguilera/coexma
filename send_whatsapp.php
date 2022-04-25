<?php
include_once "conn/conn.php";
require "funciones/funciones.php";
include("includes/phpmailerenvio.php");  

//function savePedidoExpress ($nombre, $telefono, $email, $id, $mensaje){
    $connection = conn();
    $nom = $_POST['whats_nombre'];
    $whats = $_POST['whats_nro'];
    $vendedor = $_POST['whats_vendedor'];
    $full_url = $_POST['full_url'];
    //$nro_vendedor= getVendedor($vendedor)['whatsapp'];
    

     // the message
     $titulo= '<h3>MENSAJE ENVIADO DESDE FORMULARIO DE WHATSAPP</h3>';
     $link="Link: ".$full_url ;
     $nombre=  "Nombre: ". $nom ;
     $telefono= "WhatsApp: ".$whats;
     $vendedorn= "Vendedor: ".getVendedor($vendedor)['nombre'];
     //$mensajeform = "Mensaje: ".$_POST['mensaje'];
     $msg = $titulo." <br> \n".  $nombre."<br> \n".$telefono."<br> \n".$vendedorn."<br>\n".$link."<br> \n";


    $emaildata =getMails(1);     

    $mail->setFrom($emaildata['email_from']);
    $mail->addAddress($emaildata['email_to'], 'Dto. de Marketing');     //Add a recipient
    //$mail->addAddress('capacitcursoscde@gmail.com');               //Name is optional
    //$mail->addReplyTo($_POST['email'], $_POST['nombre']);

    $mail->isHTML(true);                                  //Set email format to HTML
    $mail->Subject = 'MENSAJE DE WHATSAPP EN EL SITIO (NO RESPONDER EL MAIL)';
    $mail->Body    = $msg;
    $mail->AltBody = $msg;

    $mail->send();



    try {
            $sql = "INSERT INTO tb_pedido_express (url_desde, nombre, telefono, email, id_producto, mensaje, vendedor, full_url)
                 VALUES ('WhatsApp', '$nom', '$whats', '','1', '', '$vendedor', '$full_url')";
            $query = $connection->prepare($sql);
            $query->execute();
            $id_ult_pd= $connection->lastInsertId();

            if ($query->rowCount() > 0) {
                $result = 1;
               
            } else {
                $result = 0;
       } 
                   
                    
    } catch (\Exception $e) {
        $result = $e;
    }
    $connection = disconn($connection);
    echo $result;
//}
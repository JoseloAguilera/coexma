<?php
include_once "conn/conn.php";
//function savePedidoExpress ($nombre, $telefono, $email, $id, $mensaje){
    $connection = conn();
    $nom = $_POST['whats_nombre'];
    $whats = $_POST['whats_nro'];
    $vendedor = $_POST['whats_vendedor'];
    $full_url = $_POST['full_url'];
    //$nro_vendedor= getVendedor($vendedor)['whatsapp'];

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
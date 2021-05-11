<?php
    include_once "./plugins/sdk-php-master/Pagopar.php";

    function pagoTeste () {
        // $db = new DBPagopar( 'ecommerce' , 'root' , '' );
        // /* Generar  nuevo  pedido */
        // //Id  mayor  al Id del  ultimo  pedido , solo  para  pruebas
        // $idNuevoPedido = 1515;
        // // Generamos  el  pedido
        // $pedidoPagoPar = new  Pagopar($idNuevoPedido ,$db);
        $public_key = "";
        $private_key = "82636bffa10e70e7cd3d929b5ceb8b96";
        $seller_public_key = "bb984ecc72487ec5ad13d6ac065c3f5a";
        // $result = $pedidoPagoPar->newTestPagoparTransaction($public_key,$private_key,$seller_public_key);
        
        $token = sha1($private_key."CIUDADES");
        $args = ['token'=>$token,'token_publico'=>$seller_public_key];
        
        $response = runCurl($args, "https://api.pagopar.com/api/ciudades/1.1/traer");
        
        
        return json_decode($response);
    }

    function runCurl($args, $url){
        $args = json_encode($args);

        $ch = curl_init();
        $headers= array('Accept: application/json','Content-Type: application/json');
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);

        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $args);

        $response = curl_exec($ch);
        $error = curl_error($ch);
        $info = curl_getinfo($ch);
        curl_close($ch);

        return $response;
    }

    // $ciudad = "https://api.pagopar.com/api/ciudades/1.1/traer";
?>



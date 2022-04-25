<?php

$nombre = 'JUAN';
$mail = 'capacitcursoscde@gmail.com';
$empresa ='capacit';

$header = 'From: ' . $mail . " \r\n";
$header .= "X-Mailer: PHP/" . phpversion() . " \r\n";
$header .= "Mime-Version: 1.0 \r\n";
$header .= "Content-Type: text/plain";

$mensaje = "Este mensaje fue enviado por " . $nombre . ", telefono " . $empresa . " \r\n";
$mensaje .= "Su e-mail es: " . $mail . " \r\n";
$mensaje .= "Mensaje: " . $_POST['mensaje'] . " \r\n";
$mensaje .= "Enviado el " . date('d/m/Y', time());

$para = 'capacitcursoscde@gmail.com';
$asunto = 'Contacto de prueba';

mail($para, $asunto, utf8_decode($mensaje), $header);

echo '&estatus=ok&';
?>




?>
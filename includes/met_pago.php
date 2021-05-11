<?php 
if(isset($_POST['id'])):
    $id_met = $_POST['id'];
	$_SESSION['metodo_pago'] = $id_met;
    echo "Metodo de pago seleccionado Correctamente :)"; 
endif;
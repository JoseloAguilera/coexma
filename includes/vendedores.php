<?php 
 //include_once "/conn/conn.php";
 include_once "../conn/conn.php";
 include_once "../funciones/funciones.php";



 //<a href='https://web.whatsapp.com/send?phone=".limpiar($value['whatsapp'])."&text=Hola%2C+quiero+m%C3%A1s+informaci%C3%B3n+sobre+un+producto...'>

if(isset($_POST['id'])):
	//$connection = conn();
	$u=getVendedores($_POST['id']);
	$html="<br><hr>";
	
	foreach ($u as $value)
	//$w=limpiar($value['whatsapp']);
		$html.="
	
		<div class='col-md-12' id='vendedor' onclick='guardar(".$value['id'].",".limpiar($value['whatsapp']).");'>
		<a href='#'<div class='row'>
		<div class='col-md-2'>
		<figure class='whats-list-img'>
		<img src='img/vendedores/".$value['foto']."' alt=''>
		</figure>
		</div>
		
		<div class='col-md-10'>
		".$value['nombre']."<br><span class='whats-send-text'>Enviar Mensaje</span>
		</div>
		
		</div>
		</div></a><hr>";
	echo $html;	
endif;
<?php 
 include_once "conn.php";
if(isset($_POST['id'])):
	$connection = conn();
	$u=getDepartamentos($_POST['id']);
	$html="";
	foreach ($u as $value)
		$html.="<option value='".$value['id']."'>".$value['nombre']."</option>";
	echo $html;	
endif;
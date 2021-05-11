<?php
require "./mods/server/login.php";

$_SESSION['empresa'] = "Coexma";
$_SESSION['empresa-menu'] = "<b>Coexma</b>";
$_SESSION['empresa-mini'] = "<b>CXMA</b>";

if($_SERVER['REQUEST_METHOD'] == "POST") {
	// if(isset($_POST['usuario']) || isset($_POST['contrasena'])) {
		if(isset($_POST['usuario']) && $_POST['usuario'] != '' && isset($_POST['contrasena']) &&  $_POST['contrasena'] != '' ) {
			$usuario = $_POST['usuario'];
			$contrasena = md5($_POST['contrasena']); //md5 para encriptar
	
			$login = login ($usuario, $contrasena);

			if ($login == null) {
				$mensaje = '<p class="alert alert-danger text-center">Usuario y/o contraseña no encontrados!</p>';	
			} else {
				$_SESSION['logueado'] = $login['id'];
				$_SESSION['nome_usuario'] = $login['nombre'];
				$_SESSION['usuario'] = $login['usuario'];
				$_SESSION['tipo'] = $login['tipo'];
				header('Location: index.php');	
			}
		} else { //Si no encontró apresenta error
			$mensaje = '<p class="alert alert-danger text-center">Por favor, Ingrese Todos los Datos!</p>';
		}
	// } else {
	// 	$mensaje = '<p class="alert alert-danger">Por favor, Ingrese Todos los Datos!</p>';
	// }
}
?>
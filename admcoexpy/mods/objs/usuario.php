<?php
    include_once "./mods/server/usuario.php";

	$usuarios = getAllUser();

	if ($_SERVER['REQUEST_METHOD'] == "POST") {
		if (isset($_POST['nuevo'])){    
			if($_POST['contrasena1'] ==  $_POST['contrasena2']) {
				// var_dump($_POST);
				$contrasena = md5($_POST['contrasena1']);
				$incluir = newUser ($_POST['usuario'], $_POST['nombre'], $contrasena);
			
				if (substr($incluir,0,1) == "E") {
					$tipomensaje = 'error';
					$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error->"'.$incluir.'"</p>';
				} else if ($incluir == null) {
					$tipomensaje = 'error';
					$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
				} else {
					$tipomensaje = 'success';
					$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron insertados correctamente.</p>';
					$usuarios = getAllUser();
				}	
			} else {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Revise las contraseñas</p>';
			}
		} else if (isset($_POST['guardar'])) {
			// var_dump($_POST);
			if($_POST['contrasena1'] ==  $_POST['contrasena2']) {
				if ($_POST['contrasena1'] == "") {
					$contrasena = null;
				} else {
					$contrasena = md5($_POST['contrasena1']);
				}

				$guardar = saveUser ($_POST['codigo'], $_POST['nombre'], $contrasena);
				if ($guardar == $_POST['codigo']) {
					$tipomensaje = 'success';
					$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron actualizados correctamente.</p>';
					$usuarios = getAllUser();
				} else if ($guardar == null) {
					$tipomensaje = 'success';
					$mensaje = '<h3>Perfecto!</h3><p>No hubo alteración en los datos.</p>';
				} else {
					$tipomensaje = 'error';
					$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error->"'.$guardar.'"</p>';
				}
			} else {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Revise las contraseñas</p>';
			}
		} else if (isset($_POST['excluir'])) {
			$excluir = deleteUser ($_POST['codigo']);

			if ($excluir == $_POST['codigo']) {
				$tipomensaje = 'success';
				$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron eliminados correctamente.</p>';
                $usuarios = getAllUser();
			} else if ($excluir == null) {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
			} else {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error->"'.$excluir.'"</p>';
			}
		}	
	}
?>
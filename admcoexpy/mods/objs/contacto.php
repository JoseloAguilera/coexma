
<?php
    include_once "mods/server/contacto.php";
	include_once "mods/server/funcs.php";
    
    $contactos = getAllContactos();

    if($_SERVER['REQUEST_METHOD'] == "POST") {
		if (isset($_POST['excluir'])){
			$codigo =  $_POST['codigo'];
			$excluir = deleteContacto ($codigo);

			if ($excluir == $codigo) {
				$tipomensaje = 'success';
				$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron eliminados correctamente.</p>';
                $contactos = getAllContactos();
			} else if ($excluir == null) {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
			} else {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error->"'.$excluir.'"</p>';
			}
		}  else {
			$tipomensaje = 'error';
			$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error Desconocido</p>';
		}
	}
?>
<?php 
    include_once "mods/server/cliente.php";

    $clientes = getAllClientes();

    if($_SERVER['REQUEST_METHOD'] == "POST") {
		if (isset($_POST['guardar'])){ 
            $mayorista = null;
			if(!isset($_POST['mayorista'])) {
				$mayorista = 0;
			} else {
				$mayorista = 1;
			}
			
			$guardar = saveClienteADM ($_POST['codigo'], $mayorista);

			if ($guardar == $_POST['codigo']) {
				$tipomensaje = 'success';
				$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron actualizados correctamente.</p>';
				
				$clientes = getAllClientes();
			} else if ($guardar == null) {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
			} else {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error->"'.$guardar.'"</p>';
			}
		}  else {
			$tipomensaje = 'error';
			$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error Desconocido</p>';
		}
	}
?>
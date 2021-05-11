<?php
	include_once "mods/server/informacion.php";

    $info_empresa = getInfo("empresa.php");
    $info_terminos = getInfo("terminos-y-condiciones.php");
    $info_pgto = getInfo("formas-de-pago.php");

	if($_SERVER['REQUEST_METHOD'] == "POST") {
		if (isset($_POST['guardarempresa'])){ 
			$guardar = saveInfo ("empresa.php", $_POST['edtempresa']);
			if ($guardar == "empresa.php") {
				$tipomensaje = 'success';
				$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron actualizados correctamente.</p>';
				$info_empresa = getInfo("empresa.php");
			} else if ($guardar == null) {
				$tipomensaje = 'success';
				$mensaje = '<h3>Perfecto!</h3><p>No hubo alteración en los datos.</p>';
			} else {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error->"'.$guardar.'"</p>';
			}
			$_SESSION['info_tab'] = "empresa";
		} else if (isset($_POST['guardarterminos'])){ 
			$guardar = saveInfo ("terminos-y-condiciones.php", $_POST['edtterminos']);
			if ($guardar == "terminos-y-condiciones.php") {
				$tipomensaje = 'success';
				$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron actualizados correctamente.</p>';
				$info_terminos = getInfo("terminos-y-condiciones.php");
			} else if ($guardar == null) {
				$tipomensaje = 'success';
				$mensaje = '<h3>Perfecto!</h3><p>No hubo alteración en los datos.</p>';
			} else {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error->"'.$guardar.'"</p>';
			}
            $_SESSION['info_tab'] = "terminos";
        } else if (isset($_POST['guardarpgtos'])){ 
			$guardar = saveInfo ("formas-de-pago.php", $_POST['edtpgto']);
			if ($guardar == "formas-de-pago.php") {
				$tipomensaje = 'success';
				$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron actualizados correctamente.</p>';
				$info_pgto = getInfo("formas-de-pago.php");
			} else if ($guardar == null) {
				$tipomensaje = 'success';
				$mensaje = '<h3>Perfecto!</h3><p>No hubo alteración en los datos.</p>';
			} else {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error->"'.$guardar.'"</p>';
			}
			$_SESSION['info_tab'] = "formas";
        }
        
	}
?>
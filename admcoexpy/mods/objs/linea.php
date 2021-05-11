<?php
	include_once "mods/server/linea.php";
	include_once "mods/server/uploads.php";

	$lineas = getAllLineas();

	if($_SERVER['REQUEST_METHOD'] == "POST") {
		if (isset($_POST['nuevo'])){
			if (basename($_FILES["fileToUpload"]["name"]) == "") {
				$img = "no-image.png";
			} else {
				$imgname = basename($_FILES["fileToUpload"]["name"])."-".date("Y-m-d");
				$img = saveImg ("../img/lineas/", $imgname, "fileToUpload");
			}

			$incluir = newLinea ($_POST['nombre'], $img);
			if (substr($incluir,0,1) == "E") {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error->"'.$incluir.'"</p>';
			} else if ($incluir == null) {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
			} else {
				$tipomensaje = 'success';
				$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron insertados correctamente.</p>';
				
                $lineas = getAlllineas();
			}
		} else if (isset($_POST['guardar'])){ 
			// var_dump($_POST);
			$activo = null;
			if(!isset($_POST['activo'])) {
				$activo = 0;
				$menu = 0;
			} else {
				$activo = 1;
			}

			if (basename($_FILES["fileToUpload"]["name"]) == "") {
				$img = $_POST['imgurl'];
			} else {
				$imgname = basename($_FILES["fileToUpload"]["name"])."-".date("Y-m-d");
				$img = saveImg ("../img/lineas/", $imgname, "fileToUpload");
			}

			$guardar = saveLinea ($_POST['codigo'], $_POST['nombre'], $img, $activo);

			if ($guardar == $_POST['codigo']) {
				$tipomensaje = 'success';
				$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron actualizados correctamente.</p>';
				
                $lineas = getAllLineas();
			} else if ($guardar == null) {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
			} else {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error->"'.$guardar.'"</p>';
			}
		} else if (isset($_POST['excluir'])){
			$codigo =  $_POST['codigo'];
			$excluir = deleteLinea ($codigo);

			if ($excluir == $codigo) {
				$tipomensaje = 'success';
				$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron eliminados correctamente.</p>';
                $lineas = getAllLineas();
			} else if ($excluir == "inactivo") {
				$tipomensaje = 'warning';
				$mensaje= '<h3>Atención!</h3><p>No se pudo eliminar el registro devido a productos pendientes.<br>La linea fue INACTIVADA.</p>';
                $lineas = getAlllineas();
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
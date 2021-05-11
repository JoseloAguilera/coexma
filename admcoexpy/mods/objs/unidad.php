<?php
	include_once "mods/server/unidad.php";
	include_once "mods/server/uploads.php";

	$unidades = getAllUnidades();

	if($_SERVER['REQUEST_METHOD'] == "POST") {
		if (isset($_POST['nuevo'])){
			if (basename($_FILES["fileToUpload"]["name"]) == "") {
				$img = "no-image.png";
			} else {
                $extension = substr($_FILES["fileToUpload"]["type"], 6);
				$random_number = mt_rand(10000, 99999);
				$nombre = str_replace(" ", "-", strtolower($_POST['nombre']));
                $imgname = $nombre."-".$random_number.".".$extension;
				$img = saveImg ("../img/unidades/", $imgname, "fileToUpload");
			}

			$incluir = newUnidad ($_POST['nombre'], $_POST['direccion'], $_POST['telefonos'], $_POST['horarios'], $img);
			if (substr($incluir,0,1) == "E") {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error->"'.$incluir.'"</p>';
			} else if ($incluir == null) {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
			} else {
				$tipomensaje = 'success';
				$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron insertados correctamente.</p>';
				
                $unidades = getAllUnidades();
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
                $extension = substr($_FILES["fileToUpload"]["type"], 6);
                $random_number = mt_rand(10000, 99999);
                $nombre = str_replace(" ", "-", strtolower($_POST['nombre']));
                $imgname = $nombre."-".$random_number.".".$extension;
                $img = saveImg ("../img/unidades/", $imgname, "fileToUpload");
            }

			$guardar = saveUnidad ($_POST['codigo'], $_POST['nombre'], $_POST['direccion'], $_POST['telefonos'], $_POST['horarios'], $img, $activo);

			if ($guardar == $_POST['codigo']) {
				$tipomensaje = 'success';
				$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron actualizados correctamente.</p>';
				
                $unidades = getAllUnidades();
			} else if ($guardar == null) {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
			} else {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error->"'.$guardar.'"</p>';
			}
		} else if (isset($_POST['excluir'])){
			$codigo =  $_POST['codigo'];
			$excluir = deleteUnidad ($codigo);

			if ($excluir == $codigo) {
				$tipomensaje = 'success';
				$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron eliminados correctamente.</p>';
                $unidades = getAllUnidades();
			} else if ($excluir == "inactivo") {
				$tipomensaje = 'warning';
				$mensaje= '<h3>Atención!</h3><p>No se pudo eliminar el registro devido a vendedores pendientes.<br>La unidad fue INACTIVADA.</p>';
                $unidades = getAllUnidades();
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
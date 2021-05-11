<?php
	include_once "mods/server/categoria.php";
	include_once "mods/server/uploads.php";

	$categorias = getAllCategorias();

	if($_SERVER['REQUEST_METHOD'] == "POST") {
		if (isset($_POST['nuevo'])){ 
			if (basename($_FILES["fileToUpload"]["name"]) == "") {
				$img = "no-image.png";
			} else {
				$extension = substr($_FILES["fileToUpload"]["type"], 6);
				$nombre = str_replace(" ", "-", strtolower($_POST['nombre']));
				$imgname = $nombre."-".date("Y-m-d-h-i-s").".".$extension;
				$img = saveImg ("../img/categorias/", $imgname, "fileToUpload");
			}

			$incluir = newCategoria ($_POST['nombre'], $_POST['categoria'], $img);

			if (substr($incluir,0,1) == "E") {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error->"'.$incluir.'"</p>';
			} else if ($incluir == null) {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
			} else {
				$tipomensaje = 'success';
				$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron insertados correctamente.</p>';
				
				$categorias = getAllCategorias();
			}
		} else if (isset($_POST['guardar'])){ 
			// var_dump($_POST);
			if (basename($_FILES["fileToUpload"]["name"]) == "") {
				$img = $_POST['imgurl'];
			} else {
				$extension = substr($_FILES["fileToUpload"]["type"], 6);
				$nombre = str_replace(" ", "-", strtolower($_POST['nombre']));
				$imgname = $nombre."-".date("Y-m-d-h-i-s").".".$extension;
				$img = saveImg ("../img/categorias/", $imgname, "fileToUpload");
			}

			$menu = null;
			if(!isset($_POST['menu'])) {
				$menu = 0;
			} else {
				$menu = 1;
			}
			$activo = null;
			if(!isset($_POST['activo'])) {
				$activo = 0;
				$menu = 0;
			} else {
				$activo = 1;
			}
			$guardar = saveCategoria ($_POST['codigo'], $_POST['nombre'], $_POST['categoria'], $img, $menu, $activo);

			if ($guardar == $_POST['codigo']) {
				$tipomensaje = 'success';
				$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron actualizados correctamente.</p>';
				
				$categorias = getAllCategorias();
			} else if ($guardar == null) {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
			} else {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error->"'.$guardar.'"</p>';
			}
		} else if (isset($_POST['excluir'])){
			$codigo =  $_POST['codigo'];
			$excluir = deleteCategoria ($codigo);

			if ($excluir == $codigo) {
				$tipomensaje = 'success';
				$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron eliminados correctamente.</p>';
				$categorias = getAllCategorias();
			} else if ($excluir == "inactivo") {
				$tipomensaje = 'warning';
				$mensaje= '<h3>Atención!</h3><p>No se pudo eliminar el registro debido a productos y subcategorias pendientes.<br>La categoría fue INACTIVADA.</p>';
				$categorias = getAllCategorias();
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
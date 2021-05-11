<?php
	include_once "mods/server/unidad.php";
	include_once "mods/server/vendedor.php";
	include_once "mods/server/uploads.php";

	$vendedores = getAllVendedores();
	$unidades = getUnidades();

	if($_SERVER['REQUEST_METHOD'] == "POST") {
		if (isset($_POST['nuevo'])){
			if (basename($_FILES["fileToUpload"]["name"]) == "") {
				$img = "no-image.png";
			} else {
				$extension = substr($_FILES["fileToUpload"]["type"], 6);
				$nombre_prod = str_replace(" ", "-", strtolower($_POST['nombre']));
				$imgname = $nombre_prod."-".date("Y-m-d-h-i-s").".".$extension;
				$img = saveImg ("../img/vendedores/", $imgname, "fileToUpload");
			}

			$espanol = "";
			if(!isset($_POST['espanol'])) {
				$espanol = 0;
			} else {
				$espanol = 1;
			}

			$portugues = "";
			if(!isset($_POST['portugues'])) {
				$portugues = 0;
			} else {
				$portugues = 1;
			}

			$ingles = "";
			if(!isset($_POST['ingles'])) {
				$ingles = 0;
			} else {
				$ingles = 1;
			}

			$incluir = newVendedor($_POST['nombre'], $_POST['unidad'], $_POST['email'], $_POST['skype'], $_POST['telefonoa'], $_POST['telefonob'], $_POST['whatsapp'], $img, $espanol, $portugues, $ingles);
			if (substr($incluir,0,1) == "E") {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error->"'.$incluir.'"</p>';
			} else if ($incluir == null) {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
			} else {
				$tipomensaje = 'success';
				$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron insertados correctamente.</p>';
				
                $vendedores = getAllVendedores();
			}
		} else if (isset($_POST['guardar'])){ 
			if (basename($_FILES["fileToUpload"]["name"]) == "") {
				$img = $_POST['imgurl'];
			} else {
				$extension = substr($_FILES["fileToUpload"]["type"], 6);
				$nombre_prod = str_replace(" ", "-", strtolower($_POST['nombre']));
				$imgname = $nombre_prod."-".date("Y-m-d-h-i-s").".".$extension;
				$img = saveImg ("../img/vendedores/", $imgname, "fileToUpload");
			}

			$espanol = "";
			if(!isset($_POST['espanol'])) {
				$espanol = 0;
			} else {
				$espanol = 1;
			}

			$portugues = "";
			if(!isset($_POST['portugues'])) {
				$portugues = 0;
			} else {
				$portugues = 1;
			}

			$ingles = "";
			if(!isset($_POST['ingles'])) {
				$ingles = 0;
			} else {
				$ingles = 1;
			}

			$guardar = saveVendedor ($_POST['codigo'], $_POST['nombre'], $_POST['unidad'], $_POST['email'], $_POST['skype'], $_POST['telefonoa'], $_POST['telefonob'], $_POST['whatsapp'], $img, $espanol, $portugues, $ingles);

			if ($guardar == $_POST['codigo']) {
				$tipomensaje = 'success';
				$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron actualizados correctamente.</p>';
				
                $vendedores = getAllVendedores();
			} else if ($guardar == null) {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
			} else {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error->"'.$guardar.'"</p>';
			}
		} else if (isset($_POST['excluir'])){
			$codigo =  $_POST['codigo'];
			$excluir = deleteVendedor ($codigo);

			if ($excluir == $codigo) {
				$tipomensaje = 'success';
				$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron eliminados correctamente.</p>';
                $vendedores = getAllVendedores();
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
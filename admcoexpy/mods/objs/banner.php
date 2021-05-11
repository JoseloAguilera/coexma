<?php
	include_once "mods/server/banner.php";
	include_once "mods/server/producto.php";
	include_once "mods/server/categoria.php";
	include_once "mods/server/marca.php";
	include_once "mods/server/uploads.php";

	include_once "./mods/server/pagopar.php";

	$categorias = getCategorias();
	$marcas = getAllMarcas();
	$productos = getAllProductos();

	$banners = getAllBanners();
	$lastOrdenR = getBannerLO(0);
	if ($lastOrdenR['orden'] >= 0) {
		$lastOrdenR = $lastOrdenR['orden'] + 1;
	} else {
		$lastOrdenR = $lastOrdenR['orden'];
	}

	$lastOrdenM = getBannerLO(1);
	if ($lastOrdenM['orden'] >= 0) {
		$lastOrdenM = $lastOrdenM['orden'] + 1;
	} else {
		$lastOrdenM = $lastOrdenM['orden'];
	}

	// var_dump(getProdbyCategoria (11));
	if($_SERVER['REQUEST_METHOD'] == "POST") {
		if (isset($_POST['nuevo'])){
			// var_dump(pagoTeste());			
			if (basename($_FILES["fileToUpload"]["name"]) == "") {
				$img = "no-banner.png";
			} else {
				$extension = substr($_FILES["fileToUpload"]["type"], 6);
				$imgname = "banner-".date("Y-m-d-h-i-s").".".$extension;
				$img = saveImg ("../img/banners/", $imgname, "fileToUpload");
			}

			if (substr($img,0,6) == "banner" OR $img == "no-image.png") {
				$activo = null;
				if(!isset($_POST['activo'])) {
					$activo = 0;
				} else {
					$activo = 1;
				}

				$posicion = null;
				if(!isset($_POST['posicion'])) {
					$posicion = 0;
				} else {
					$posicion = 1;
				}

				$link = "";
				if($_POST['linktype'] == "categoriatype"){
					$link = "categorie.php?cat=".$_POST['categoria'];
				} else if($_POST['linktype'] == "productotype"){
					$link = "product.php?id=".$_POST['producto'];
				// } else if($_POST['linktype'] == "promociontype"){
				// 	$link = "#promo-".$_POST['promocion'];
				} else {
					$link = $_POST['link'];
				}

				$incluir = newBanner ($img, $_POST['alternativo'], $link, $_POST['orden'], $posicion, $activo);

				if ($incluir == $img) {
					$tipomensaje = 'success';
					$mensaje= '<h3>Perfecto!</h3><p>El banner fue insertado correctamente.</p>';
					$banners = getAllBanners();
					$lastOrdenR = getBannerLO(0);
					$lastOrdenR = $lastOrdenR['orden'] + 1;
					$lastOrdenM = getBannerLO(1);
					$lastOrdenM = $lastOrdenM['orden'] + 1;
				} else if ($incluir == null) {
					$tipomensaje = 'error';
					$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
				} else {
					$tipomensaje = 'error';
					$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error->"'.$incluir.'"</p>';
				}
			} else {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>'.$img.'</p>';
			}
		} else if (isset($_POST['excluir'])){
			$codigo =  $_POST['codigo'];
			$excluir = deleteBanner ($codigo);

			if ($excluir == $codigo) {
				$tipomensaje = 'success';
				$mensaje= '<h3>Perfecto!</h3><p>La imagen fue eliminada correctamente.</p>';
				$banners = getAllBanners();
				$lastOrdenR = getBannerLO(0);
				$lastOrdenR = $lastOrdenR['orden'] + 1;
				$lastOrdenM = getBannerLO(1);
				$lastOrdenM = $lastOrdenM['orden'] + 1;
			} else if ($excluir == null) {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
			} else {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error->"'.$excluir.'"</p>';
			}
		} else if (isset($_POST['guardar'])){
			if (basename($_FILES["fileToUpload"]["name"]) == "") {
				$img = $_POST['imgurl'];
			} else {
				$extension = substr($_FILES["fileToUpload"]["type"], 6);
				$imgname = "banner-".date("Y-m-d-h-i-s").".".$extension;
				$img = saveImg ("../img/banners/", $imgname, "fileToUpload");
			}

			$activo = null;
			if(!isset($_POST['activo'])) {
				$activo = 0;
			} else {
				$activo = 1;
			}

			$posicion = null;
			if(!isset($_POST['posicion'])) {
				$posicion = 0;
			} else {
				$posicion = 1;
			}

			$link = "";
			if($_POST['linktype-alt'] == "categoriatype-alt"){
				$link = "categorie.php?cat=".$_POST['categoria'];
			} else if($_POST['linktype-alt'] == "productotype-alt"){
				$link = "product.php?id=".$_POST['producto'];
			// } else if($_POST['linktype-alt'] == "promociontype-alt"){
			// 	$link = "#promo-".$_POST['promocion'];
			} else {
				$link = $_POST['link'];
			}

			$guardar = saveBanner ($_POST['codigo'], $img, $_POST['alternativo'], $link, $_POST['orden'], $posicion, $activo);
			if ($guardar == $_POST['codigo']) {
				$tipomensaje = 'success';
				$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron actualizados correctamente.</p>';
				$banners = getAllBanners();
				$lastOrdenR = getBannerLO(0);
				$lastOrdenR = $lastOrdenR['orden'] + 1;
				$lastOrdenM = getBannerLO(1);
				$lastOrdenM = $lastOrdenM['orden'] + 1;
			} else if ($guardar == null) {
				$tipomensaje = 'success';
				$mensaje = '<h3>Perfecto!</h3><p>No hubo alteración en los datos.</p>';
			} else {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error->"'.$guardar.'"</p>';
			}
		} 
	}
?>
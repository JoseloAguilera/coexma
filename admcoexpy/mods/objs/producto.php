<?php
	include_once "mods/server/producto.php";
    include_once "mods/server/categoria.php";
    include_once "mods/server/marca.php";

	if (isset($_SESSION['action'])) {
		if ($_SESSION['action'] == "drop") {
			$_SESSION['action'] = "";
			$tipomensaje = 'success';
			$mensaje= '<h3>Perfecto!</h3><p>El producto fue eliminado correctamente.</p>';
		}
    }
    
	$productos = getAllProductos();
	$categorias = getCategorias();
	$marcas = getAllMarcas();
    
	// if($_SERVER['REQUEST_METHOD'] == "POST") {
	// 	if (isset($_POST['nuevo'])){
	// 		$activo = 1;
	// 		$destacado = null;
	// 		if(!isset($_POST['destacado'])) {
	// 			$destacado = 0;
	// 		} else {
	// 			$destacado = 1;
	// 		}

	// 		if ($_POST['valorminorista'] > 0) {
	// 			$valorminorista = str_replace(".", "", $_POST['valorminorista']);
	// 		} else {
	// 			$valorminorista = "NULL";
	// 		}

	// 		if ($_POST['valormayorista'] > 0) {
	// 			$valormayorista = str_replace(".", "", $_POST['valormayorista']);
	// 		} else {
	// 			$valormayorista = "NULL";
	// 		}

	// 		$incluir = newProducto ($_POST['referencia'], $_POST['nombre'], $_POST['descripcion'], $valorminorista, $valormayorista, $_POST['categoria'], $_POST['marca'], $destacado, $activo);
			
	// 		if (substr($incluir,0,1) == "E") {
	// 			$tipomensaje = 'error';
	// 			$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error->"'.$incluir.'"</p>';
	// 		} else if ($incluir == null) {
	// 			$tipomensaje = 'error';
	// 			$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
	// 		} else {
	// 			$tipomensaje = 'success';
	// 			$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron insertados correctamente.</p>';
				
    //             $_SESSION['action'] = "new";
	// 			echo "<script type='text/javascript'>document.location.href='producto_detalle.php?producto=".$incluir."';</script>";
	// 		}
	// 	} 
	// }
?>
<?php 

    include_once "mods/server/bloques_producto.php";



    $bloques_productos = getProductosBloques();

	$bloques = getBloques();

	$productos = getAllProductos();

	//var_dump($_POST);

    if($_SERVER['REQUEST_METHOD'] == "POST") {

		if (isset($_POST['guardar'])){ 

			// var_dump($_POST);

			$guardar = newBloqueProd ($_POST['codigo_bloque'], $_POST['codigo_producto']);

			//var_dump($guardar);
			
			if ($guardar == "Si") {

				$tipomensaje = 'success';

				$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron guardados correctamente.</p>';

				

				$bloques_productos = getProductosBloques();

			} else if ($guardar == null) {

				$tipomensaje = 'error';

				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';

			} else {

				$tipomensaje = 'error';

				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error->"'.$guardar.'"</p>';

			}

	
	
		} else if (isset($_POST['excluir'])){

			$codigo_producto =  $_POST['codigo_producto'];

			$codigo_bloque = $_POST['codigo_bloque'];

			$excluir = deleteProductoBloque ($codigo_bloque, $codigo_producto);

			if ($excluir == "Si") {

				$tipomensaje = 'success';

				$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron eliminados correctamente.</p>';

                $bloques_productos = getProductosBloques();

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
<?php 

    include_once "mods/server/bloques.php";



    $bloques = getBloques();



    if($_SERVER['REQUEST_METHOD'] == "POST") {

		if (isset($_POST['guardar'])){ 

			// var_dump($_POST);

			$activo = null;

			if(!isset($_POST['activo'])) {

				$activo = 0;

				$menu = 0;

			} else {

				$activo = 1;

			}



			$guardar = saveBloque ($_POST['codigo'], $_POST['ubicacion'], $_POST['titulo'], $_POST['descripcion'], $_POST['fondo'], $_POST['color_tit'], $_POST['color_desc'] , $activo, $_POST['posicion']);



			if ($guardar == $_POST['codigo']) {

				$tipomensaje = 'success';

				$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron actualizados correctamente.</p>';

				

				$bloques = getBloques();

			} else if ($guardar == null) {

				$tipomensaje = 'error';

				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';

			} else {

				$tipomensaje = 'error';

				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error->"'.$guardar.'"</p>';

			}

	
	
		}

	}
?>
<?php 

	include_once "conn.php";

	function getBloques () {

		$connection = conn();

        $sql = "SELECT * FROM bloques";

		$query = $connection->prepare($sql);

		$query->execute();



		if ($query->rowCount() > 0) {

			$result= $query->fetchAll();

		} else {

			$result = null;

		}



		$connection = disconn($connection);

		return $result;

    }

	function saveBloque ($id, $ubicacion, $titulo, $descripcion, $fondo, $color_tit, $color_desc, $activo, $posicion) {

		$connection = conn();
		

		try {

				$sql = "UPDATE bloques SET ubicacion = '$ubicacion', titulo = '$titulo', descripcion = '$descripcion', fondo = '$fondo', color_tit = '$color_tit', color_desc = '$color_desc', activo = '$activo', posicion = '$posicion' 

	 					WHERE id = $id";

				$query = $connection->prepare($sql);

				$query->execute();


				if ($query->rowCount() > 0) { 

                    $result = $id;

				} else {

				$result = null;

				}			

		} catch (\Exception $e) {

			$result = $e;

		}

		$connection = disconn($connection);

		return $result;

	}
	
	function getProductosBloques () {

		$connection = conn();

        $sql = "SELECT bloques_productos.*, 
		tb_producto.id as id, 
		tb_producto.nombre as nombre,
		tb_producto.referencia as referencia
		FROM bloques_productos, tb_producto
		WHERE bloques_productos.id_productos = tb_producto.id
		ORDER BY id_bloque ASC";

        

		$query = $connection->prepare($sql);

		$query->execute();



		if ($query->rowCount() > 0) {

			$result= $query->fetchAll();

		} else {

			$result = null;

		}



		$connection = disconn($connection);

		return $result;

    }

	

	/*function countAllClientes () {

		$connection = conn();

        $sql = "SELECT COUNT(id) AS TOTAL

		FROM tb_cliente

		WHERE deleted_at IS NULL";

        

		$query = $connection->prepare($sql);

		$query->execute();



		if ($query->rowCount() > 0) {

			$result= $query->fetch();

		} else {

			$result = null;

		}



		$connection = disconn($connection);

		return $result;

	}*/

	

  

?>
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

	function newBloqueProd ($cod_bloque, $cod_prod) {

		$connection = conn();

		try {

			$sql = "INSERT INTO bloques_productos (id_bloque, id_producto)

		 			VALUES ($cod_bloque, $cod_prod)";

			$query = $connection->prepare($sql);

			$query->execute();



			if ($query->rowCount() > 0) {

				$result = "Si";

			} else {

				$result = null;

			}

		} catch (\Exception $e) {

			$result = "Erro ->".$e;

		}



		$connection = disconn($connection);

		return $result;

	}

	function getProductosBloques () {

		$connection = conn();

        $sql = "SELECT bloques_productos.*,
		tb_producto.id as id, 
		tb_producto.nombre as nombre,
		tb_producto.referencia as referencia,
		bloques.ubicacion AS ubicacion,
		bloques.titulo AS titulo,
		bloques.id AS bloque_Id
		FROM bloques_productos, tb_producto, bloques
		WHERE tb_producto.id = bloques_productos.id_producto AND bloques_productos.id_bloque = bloques.id
		ORDER BY id_bloque DESC";

        

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


	function deleteProductoBloque ($idBloque, $idProducto) {

		$connection = conn();

		try {

				$sql = "DELETE FROM bloques_productos WHERE id_bloque = '$idBloque' AND id_producto = '$idProducto'";

                $query = $connection->prepare($sql);

                $query->execute();

    
                if ($query->rowCount() > 0) {

                    $result = "Si";

                } else {

                    $result = null;

                }    


		} catch (\Exception $e) {

			$result = $e;

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

	function getAllProductos () {

		$connection = conn();

		$sql = "SELECT tb_producto.*, tb_marca.nombre AS marca FROM tb_producto LEFT JOIN tb_marca ON tb_producto.id_marca = tb_marca.id ORDER BY id ASC";

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

  

?>
<?php 
	include_once "conn.php";

	function getProdImages ($producto) {
		$connection = conn();
		$sql = "SELECT * FROM tb_producto_img WHERE tb_producto_img.id_producto = '$producto' ORDER BY orden ASC";
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

	function getProdImageLO ($producto) {
		$connection = conn();
		$sql = "SELECT MAX(orden) as orden FROM tb_producto_img WHERE tb_producto_img.id_producto = '$producto'";
		$query = $connection->prepare($sql);
		$query->execute();

		if ($query->rowCount() > 0) {
			$result= $query->fetch();
		} else {
			$result = null;
		}

		$connection = disconn($connection);
		return $result;
	}

	function newProdImage ($url, $producto, $orden, $activo) {
		$connection = conn();
		try {
			$sql = "INSERT INTO tb_producto_img (url, id_producto, orden, activo)
		 			VALUES ('$url', '$producto', $orden, $activo)";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$result = $url;//$connection->lastInsertId();
			} else {
				$result = null;
			}
		} catch (\Exception $e) {
			$result = $e;
		}

		$connection = disconn($connection);
		return $result;
	}

	function saveProdImage ($codigo, $url, $orden, $activo) {
		$connection = conn();
		
		try {
			$sql = "SELECT * from tb_producto_img WHERE id = $codigo";
			$query = $connection->prepare($sql);
			$query->execute();

			$img = $query->fetch();

			//cambio de imagen
			if ($img['url'] != $url && $img['url'] != "no-image.png") {
				unlink("../img/productos/".$img['url']); //apaga imagen anterior
			}

			if ($query->rowCount() > 0) {
				$sql = "UPDATE tb_producto_img SET url = '$url', orden = $orden, activo = '$activo'
	 					WHERE id = $codigo";
				$query = $connection->prepare($sql);
				$query->execute();

				if ($query->rowCount() > 0) {
					$result = $codigo;
				} else {
					$result = $codigo; //Sem alteração
				}
			} else {
				$result = null;
			}			
		} catch (\Exception $e) {
			$result = $e;
		}
		$connection = disconn($connection);
		return $result;
	}

	function deleteProdImage ($codigo) {
		$connection = conn();
		try {
			$sql = "SELECT * from tb_producto_img WHERE id = $codigo";
			$query = $connection->prepare($sql);
			$query->execute();
			$img = $query->fetch();

			if ($img['url'] != "no-image.png") {
				if (!unlink("../img/productos/".$img['url'])) {  
					return $img." cannot be deleted due to an error";  
				}  
			}  
			
			$sql = "DELETE FROM tb_producto_img WHERE id = '$codigo'";
			$query = $connection->prepare($sql);
			$query->execute();	

			if ($query->rowCount() > 0) {
				$result = $codigo;
			} else {
				$result = null;
			}
		} catch (\Exception $e) {
			$result = $e;
		}

		$connection = disconn($connection);
		return $result;
	}
?>
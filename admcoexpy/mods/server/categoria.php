<?php 
	include_once "conn.php";

	function getAllCategorias () {
		$connection = conn();
		$sql = "SELECT a.*, b.nombre as padre FROM tb_categoria a LEFT JOIN tb_categoria b ON b.id = a.id_padre ORDER BY padre ASC, a.nombre ASC";
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

	function getCategorias () {
		$connection = conn();
		$sql = "SELECT * FROM tb_categoria WHERE id_padre IS NULL ORDER BY nombre ASC";
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

	function getSubCategorias ($categoria) {
		$connection = conn();
		$sql = "SELECT * FROM tb_categoria WHERE id_padre = '$categoria' ORDER BY nombre ASC";
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

	function getProdCategorias ($producto) {
		$connection = conn();
		$sql = "SELECT * FROM tb_producto_categoria LEFT JOIN tb_categoria ON tb_producto_categoria.id_categoria = tb_categoria.id WHERE tb_categoria.id_padre IS NULL AND tb_producto_categoria.id_producto = '$producto' ORDER BY nombre ASC";
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

	function getProdSubCategorias ($categoria, $producto) {
		$connection = conn();
		$sql = "SELECT * FROM tb_producto_categoria LEFT JOIN tb_categoria ON tb_producto_categoria.id_categoria = tb_categoria.id WHERE tb_categoria.id_padre = '$categoria' AND tb_producto_categoria.id_producto = '$producto' ORDER BY nombre ASC";
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

	function newCategoria ($nombre, $padre, $img) {
		$connection = conn();
		try {
			$sql = "INSERT INTO tb_categoria (nombre, id_padre, url, activo, menu)
		 			VALUES ('$nombre', $padre, '$img', 1, 1)";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$result = $connection->lastInsertId();
			} else {
				$result = null;
			}
		} catch (\Exception $e) {
			$result = "Erro ->".$e;
		}

		$connection = disconn($connection);
		return $result;
	}

	function saveCategoria ($id, $nombre, $padre, $img, $menu, $activo) {
		$connection = conn();
		
		try {
			$sql = "SELECT * from tb_categoria WHERE id = $id";
			$query = $connection->prepare($sql);
			$query->execute();
			$img_old = $query->fetch();

			//cambio de imagen
			if ($img_old['url'] != $img && $img_old['url'] != "no-image.png") {
				unlink("../img/categorias/".$img_old['url']); //apaga imagen anterior
			}

			if ($query->rowCount() > 0) {
				$sql = "UPDATE tb_categoria SET nombre = '$nombre', id_padre = $padre, activo = '$activo', menu = '$menu', url = '$img'
	 					WHERE id = $id";
				$query = $connection->prepare($sql);
				$query->execute();

				if ($padre == "NULL") { //Categoria
					if ($activo == 0) { //se desactivar hace falta desactivar las subcategorias
						$sql = "UPDATE tb_categoria SET activo = 0, menu = 0
	 			 		WHERE id_padre = $id";
					}
				} else { //Subcategoria
					if ($activo == 1) { //se activar hace falta activar la categoría padre						
						if ($menu == 0) {
							$sql = "UPDATE tb_categoria SET activo = 1
							WHERE id = $padre";
						} else {  //si se activa el menu, también tiene que activarse el menu del padre
							$sql = "UPDATE tb_categoria SET activo = 1, menu = 1
							WHERE id = $padre";
						}
					}					
				}
				$query = $connection->prepare($sql);
				$query->execute();

				if ($query->rowCount() > 0) {
					$result = $id;
				} else {
					$result = $id; //Sem alteração
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

	function deleteCategoria ($id) {
		$connection = conn();
		try {
			$sql = "SELECT id_padre from tb_categoria WHERE id_padre = '$id'";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$sql = "UPDATE tb_categoria SET activo = 0, menu = 0
	 					WHERE id = $id OR id_padre = $id";
				$query = $connection->prepare($sql);
				$query->execute();
				return "inactivo";
			}

			$sql = "SELECT id_producto from tb_producto_categoria WHERE id_categoria = '$id'";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$sql = "UPDATE tb_categoria SET activo = 0, menu = 0
	 					WHERE id = $id OR id_padre = $id";
				$query = $connection->prepare($sql);
				$query->execute();
				return "inactivo";
			}

			$sql = "SELECT * from tb_categoria WHERE id = $id";
			$query = $connection->prepare($sql);
			$query->execute();
			$img = $query->fetch();

			//excluye la imagen de la carpeta
			if ($img['url'] != "no-image.png") {
				if (!unlink("../img/categorias/".$img['url'])) {  
					//return $img." cannot be deleted due to an error";  
				}  
			}  

			$sql = "DELETE FROM tb_categoria WHERE id = '$id'";
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
?>
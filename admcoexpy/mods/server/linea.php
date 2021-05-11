<?php 
	include_once "conn.php";

	function getAllLineas() {
		$connection = conn();
		$sql = "SELECT * FROM tb_linea  WHERE activo =1 ORDER BY nombre ASC";
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

	function newLinea ($nombre, $url) {
		$connection = conn();
		try {
			$sql = "INSERT INTO tb_linea (nombre, url, activo)
		 			VALUES ('$nombre', '$url', 1)";
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

	function saveLinea ($id, $nombre, $url, $activo) {
		$connection = conn();
		
		try {
			$sql = "SELECT * from tb_linea WHERE id = $id";
			$query = $connection->prepare($sql);
			$query->execute();

			$img = $query->fetch();

			//cambio de imagen
			if ($img['url'] != $url && $img['url'] != "no-image.png") {
				unlink("".$img['url']); //apaga imagen anterior
			}

			if ($query->rowCount() > 0) {
				$sql = "UPDATE tb_linea SET nombre = '$nombre', url = '$url', activo = '$activo'
	 					WHERE id = $id";
				$query = $connection->prepare($sql);
				$query->execute();

				if ($query->rowCount() > 0) { //se houve mudanças e activo == 0 desabilita o producto
                    if ($activo == 0) {
                        $sql = "UPDATE tb_producto SET activo = '$activo'
                                WHERE id_linea = $id";
                        $query = $connection->prepare($sql);
                        $query->execute();
                    }
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

	function deleteLinea ($id) {
		$connection = conn();
		try {
			$sql = "SELECT id_linea from tb_producto WHERE id_linea = '$id'";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$sql = "UPDATE tb_linea SET activo = 0
	 					WHERE id = $id";
				$query = $connection->prepare($sql);
                $query->execute();
                
                $sql = "UPDATE tb_producto SET activo = 0
                        WHERE id_linea = $id";
                $query = $connection->prepare($sql);
                $query->execute();
				return "inactivo";
			} else {
				$sql = "SELECT * from tb_linea WHERE id = $id";
				$query = $connection->prepare($sql);
				$query->execute();
				$img = $query->fetch();

				//excluye la imagen de la carpeta
				if ($img['url'] != "no-image.png") {
					if (!unlink("../img/lineas/".$img['url'])) {  
						return $img." cannot be deleted due to an error";  
					}  
				}  

                $sql = "DELETE FROM tb_linea WHERE id = '$id'";
                $query = $connection->prepare($sql);
                $query->execute();
    
                if ($query->rowCount() > 0) {
                    $result = $id;
                } else {
                    $result = null;
                }    
            }
		} catch (\Exception $e) {
			$result = $e;
		}

		$connection = disconn($connection);
		return $result;
	}
?>
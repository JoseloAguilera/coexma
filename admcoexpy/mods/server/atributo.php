<?php 
	include_once "conn.php";

	function getAllAtributos () {
		$connection = conn();
		$sql = "SELECT * FROM tb_atributo ORDER BY tb_atributo.nombre";
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
	
	function getAtributosValores ($atributo) {
		$connection = conn();
		$sql = "SELECT tb_atr_valor.* FROM tb_atr_valor WHERE id_atributo = '$atributo' ORDER BY tb_atr_valor.nombre";
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
	
	function getProdAtributos ($producto) {
		$connection = conn();
		$sql = "SELECT * FROM tb_producto_atributo LEFT JOIN tb_atributo ON tb_producto_atributo.id_atributo = tb_atributo.id WHERE tb_producto_atributo.id_producto = '$producto' ORDER BY nombre ASC";
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

    function newAtributo ($nombre) {
		$connection = conn();
		try {
			$sql = "INSERT INTO tb_atributo (nombre, activo)
		 			VALUES ('$nombre', 1)";
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
    
    function newValor ($nombre, $atributo) {
		$connection = conn();
		try {
			$sql = "INSERT INTO tb_atr_valor (nombre, id_atributo, activo)
		 			VALUES ('$nombre', $atributo, 1)";
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

	function saveAtributo ($id, $nombre, $activo) {
		$connection = conn();
		
		try {
			$sql = "SELECT * from tb_atributo WHERE id = $id";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$sql = "UPDATE tb_atributo SET nombre = '$nombre', activo = '$activo'
	 					WHERE id = $id";
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

	function saveValor ($id, $nombre, $activo) {
		$connection = conn();
		
		try {
			$sql = "SELECT * from tb_atr_valor WHERE id = $id";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$sql = "UPDATE tb_atr_valor SET nombre = '$nombre', activo = '$activo'
	 					WHERE id = $id";
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

	function deleteAtributo ($id) {
		$connection = conn();
		try {
			$sql = "SELECT id_atributo from tb_atr_valor WHERE id_atributo = '$id'";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$sql = "DELETE FROM tb_atr_valor WHERE id_atributo = '$id'";
				$query = $connection->prepare($sql);
				$query->execute();
			}

			$sql = "DELETE FROM tb_atributo WHERE id = '$id'";
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

	function deleteValor ($id) {
		$connection = conn();
		try {
			$sql = "DELETE FROM tb_atr_valor WHERE id = '$id'";
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
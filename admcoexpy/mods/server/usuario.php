<?php 
	include_once "conn.php";

	function getAllUser () {
		$connection = conn();

		$sql= "SELECT * from tb_usuario ORDER BY usuario";
		$query= $connection->prepare($sql);
		$query->execute();
		$result = null;

		if ($query->rowCount() > 0) {
			$result = $query->fetchAll();
		} else {
			$result = null;
		}

		$connection = disconn($connection);

		return $result;
	}

	function newUser ($usuario, $nombre, $password) {
		$connection = conn();
		
		try {
			$sql = "SELECT * from tb_usuario WHERE usuario = '$usuario'";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$result = "ERRO -> Usuario ya está registrado en la base de datos";
			} else {
				$sql = "INSERT INTO tb_usuario (usuario, nombre, password, tipo)
		 				VALUES ('$usuario', '$nombre', '$password', 1)";
				$query = $connection->prepare($sql);
				$query->execute();

				if ($query->rowCount() > 0) {
					$result = $connection->lastInsertId();
				} else {
					$result = null;
				}
			}	
		} catch (\Exception $e) {
			$result = 'ERROR -> '.$e;
		}

		$connection = disconn($connection);
		return $result;
	}

	function saveUser ($id, $nombre, $password) {
		$connection = conn();
		try {
			$sql = "SELECT * from tb_usuario WHERE id = $id";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				if ($password == null) {
					$aux = "";
				} else {
					$aux = ", password = '$password'";
				}
				$sql = "UPDATE tb_usuario SET nombre = '$nombre' $aux
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

	function deleteUser ($id) {
		$connection = conn();
		try {
			$sql = "DELETE FROM tb_usuario WHERE id = '$id'";
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
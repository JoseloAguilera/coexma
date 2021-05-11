<?php 
	include_once "conn.php";

	function getAllClientes () {
		$connection = conn();
        $sql = "SELECT * FROM tb_cliente 
        ORDER BY nombre ASC";
        
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
	
	function countAllClientes () {
		$connection = conn();
        $sql = "SELECT COUNT(id) AS TOTAL FROM tb_cliente";
        
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
	
    function getCliente ($id) {
		$connection = conn();
        $sql = "SELECT * FROM tb_cliente 
                WHERE tb_cliente.id = $id";
        
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
        
    function getClienteDireccion ($id) {
		$connection = conn();
        $sql = "SELECT tb_cli_direccion.*, tb_departamento.nombre AS DEPART_DESC, tb_ciudad.nombre AS CIUDAD_DESC FROM tb_cli_direccion 
				LEFT JOIN tb_ciudad ON tb_cli_direccion.ciudad = tb_ciudad.id
				LEFT JOIN tb_departamento ON tb_cli_direccion.departamento = tb_departamento.id
                WHERE tb_cli_direccion.id_cliente = $id
				LIMIT 1";
        
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

	function saveClienteADM ($id, $mayorista) {
		$connection = conn();
		
		try {
			$sql = "SELECT * from tb_cliente WHERE id = $id";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$sql = "UPDATE tb_cliente SET mayorista = '$mayorista'
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

?>
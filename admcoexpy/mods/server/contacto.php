<?php 
    include_once "conn.php";
    
    function getAllContactos () {
		$connection = conn();
		$sql = "SELECT * FROM tb_contacto ORDER BY id DESC";
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

	function countAllContactos () {
		$connection = conn();
		$sql = "SELECT COUNT(tb_contacto.id) AS TOTAL FROM tb_contacto";
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

	function deleteContacto ($id) {
		$connection = conn();
		try {
			$sql = "SELECT id from tb_contacto WHERE id = '$id'";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
                $sql = "DELETE FROM tb_contacto WHERE id = '$id'";
                $query = $connection->prepare($sql);
                $query->execute();
    
                if ($query->rowCount() > 0) {
                    $result = $id;
                } else {
                    $result = null;
                }    
            } else {
				$result = "Pedido no encontrado!";
			}
		} catch (\Exception $e) {
			$result = $e;
		}

		$connection = disconn($connection);
		return $result;
    }
?>
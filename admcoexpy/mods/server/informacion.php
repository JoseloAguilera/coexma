<?php 
	include_once "conn.php";
	// include_once "./objs/funcoes.php";

	function getInfo ($pag) {
		$connection = conn();
		$sql = "SELECT cms.* FROM cms WHERE pagina = '$pag'";
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

	function saveInfo ($page, $contenido) {
		$connection = conn();
		
		try {
			$sql = "SELECT * from cms WHERE pagina = '$page'";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$sql = "UPDATE cms SET contenido = '$contenido'
	 					WHERE pagina = '$page'";
				$query = $connection->prepare($sql);
				$query->execute();

				if ($query->rowCount() > 0) { //se houve mudanças e activo == 0 desabilita o producto
                    $result = $page;
				} else {
					$result = $page; //Sem alteração
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
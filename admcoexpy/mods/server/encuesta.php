<?php 
	include_once "conn.php";

	function getPregunta($id) {
		$connection = conn();
		$sql = "SELECT tb_preguntas.* FROM tb_preguntas WHERE tb_preguntas.id= '$id' AND tb_preguntas.activo = 1 ";
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
	
	function getOpcion($id, $idpregunta) {
		$connection = conn();
		$sql = "SELECT tb_preguntas_opciones.* 
		FROM tb_preguntas_opciones
		 WHERE tb_preguntas_opciones.id= '$id' 
		 AND tb_preguntas_opciones.id_pregunta= '$idpregunta'";
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
	

    function getRespuesta ($idpregunta, $idvalor) {
		$connection = conn();
		$sql = "SELECT id_respuesta, count(*) as cantidad
		FROM tb_preguntas_respuestas  WHERE id_pregunta= $idpregunta AND id_respuesta = $idvalor
		GROUP BY tb_preguntas_respuestas.id_respuesta";
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

	function countAllEncuestas() {
		$connection = conn();
        $sql = "SELECT COUNT(DISTINCT(id)) AS TOTAL
		FROM tb_preguntas_respuestas";
        
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
?>
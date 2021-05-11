<?php 
	include_once "conn.php";

	function getAllCurriculums () {
		$connection = conn();
        $sql = "SELECT * FROM tb_curriculum
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

    function getCurriculum ($id) {
		$connection = conn();
        $sql = "SELECT * FROM tb_curriculum 
        WHERE id = '$id'
        ORDER BY nombre ASC";
        
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
	
	function getExperiencia ($id) {
		$connection = conn();
        $sql = "SELECT * FROM tb_curriculum_experiencia 
        WHERE id_curriculum = '$id'
        ORDER BY desde ASC";
        
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
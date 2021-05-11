<?php 
	include_once "conn.php";

    //OBTENER IMAGENES DE TODOS LOS PRODUCTOS
    function getAllUnidades () {
        $connection = conn();
        $sql = "SELECT * FROM tb_unidades ORDER BY id ASC";
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

    //OBTENER IMAGENES DE TODOS LOS PRODUCTOS
    function getUnidades () {
        $connection = conn();
        $sql = "SELECT * FROM tb_unidades WHERE activo = '1' ORDER BY id ASC";
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

    function newUnidad ($nombre, $direccion, $telefonos, $horarios, $url) {
		$connection = conn();
		try {
			$sql = "INSERT INTO tb_unidades (nombre, direccion, telefonos, horarios, img_url, activo)
		 			VALUES ('$nombre', '$direccion', '$telefonos', '$horarios', '$url', 1)";
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
    
    function saveUnidad ($id, $nombre, $direccion, $telefonos, $horarios, $url, $activo) {
		$connection = conn();
		
		try {
			$sql = "SELECT * from tb_unidades WHERE id = $id";
			$query = $connection->prepare($sql);
			$query->execute();

			$img = $query->fetch();

			//cambio de imagen
			if ($img['img_url'] != $url && $img['img_url'] != "no-image.png") {
				unlink("../img/unidades/".$img['img_url']); //apaga imagen anterior
			}

			if ($query->rowCount() > 0) {
				$sql = "UPDATE tb_unidades SET nombre = '$nombre', img_url = '$url', direccion = '$direccion', horarios = '$horarios', telefonos = '$telefonos', activo = '$activo'
	 					WHERE id = $id";
				$query = $connection->prepare($sql);
				$query->execute();

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

    function deleteUnidad ($id) {
		$connection = conn();
		try {
			$sql = "SELECT unidad from tb_vendedores WHERE unidad = '$id'";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$sql = "UPDATE tb_unidades SET activo = 0
	 					WHERE id = $id";
				$query = $connection->prepare($sql);
                $query->execute();
                
				return "inactivo";
			} else {
				$sql = "SELECT * from tb_unidades WHERE id = $id";
				$query = $connection->prepare($sql);
				$query->execute();
				$img = $query->fetch();

				//excluye la imagen de la carpeta
				if ($img['img_url'] != "no-image.png") {
					if (!unlink("../img/unidades/".$img['img_url'])) {  
						return $img." cannot be deleted due to an error";  
					}  
				}  

                $sql = "DELETE FROM tb_unidades WHERE id = '$id'";
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
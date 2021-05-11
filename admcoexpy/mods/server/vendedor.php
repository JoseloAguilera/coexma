<?php 
	include_once "conn.php";

	function getAllVendedores () {
		$connection = conn();
		$sql = "SELECT tb_vendedores.*, tb_unidades.nombre AS UNIDAD FROM tb_vendedores LEFT JOIN tb_unidades ON tb_vendedores.unidad = tb_unidades.id ORDER BY tb_vendedores.unidad";
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

    function getVendedoresBy($unidad) {
        $connection = conn();
        $sql = "SELECT * FROM tb_vendedores WHERE unidad = '$unidad' ORDER BY RAND()";
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
	
	function newVendedor ($nombre, $unidad, $email, $skype, $telefonoa, $telefonob, $whatsapp, $foto, $espanol, $portugues, $ingles) {
		$connection = conn();
		try {
			$link_email = "";
			if ($email != "") {
				$link_email = "mailto:".$email."?Subject=Contato site";
			}
			$link_skype = "";
			if ($skype != "") {
				$link_skype = "callto://+".$skype;
			}
			$link_telefonoa = "";
			if ($telefonoa != "") {
				$link_telefonoa = "tel:".preg_replace('/[^0-9]/', '', $telefonoa);
			}
			$link_telefonob = "";
			if ($telefonob != "") {
				$link_telefonob = "tel:".preg_replace('/[^0-9]/', '', $telefonob);
			}
			$link_whatsapp = "";
			if ($whatsapp != "") {
				$link_whatsapp = "https://api.whatsapp.com/send?phone=".preg_replace('/[^0-9]/', '', $whatsapp);
			}
			$sql = "INSERT INTO tb_vendedores (nombre, unidad, cargo, foto, email, link_email, skype, link_skype, telefono_a, link_telefono_a, telefono_b, link_telefono_b, whatsapp, link_whatsapp, espanol, portugues, ingles)
		 			VALUES ('$nombre', $unidad, 'Vendedor', '$foto', '$email', '$link_email', '$skype', '$link_skype', '$telefonoa', '$link_telefonoa', '$telefonob', '$link_telefonob', '$whatsapp', '$link_whatsapp', $espanol, $portugues, $ingles)";
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

	function saveVendedor ($id, $nombre, $unidad, $email, $skype, $telefonoa, $telefonob, $whatsapp, $foto, $espanol, $portugues, $ingles) {
		$connection = conn();
		
		try {
			$sql = "SELECT * from tb_vendedores WHERE id = $id";
			$query = $connection->prepare($sql);
			$query->execute();

			$img = $query->fetch();

			//cambio de imagen
			if ($img['foto'] != $foto && $img['foto'] != "no-image.png") {
				unlink("../img/vendedores/".$img['foto']); //apaga imagen anterior
			}

			if ($query->rowCount() > 0) {
				$link_email = "";
				if ($email != "") {
					$link_email = "mailto:".$email."?Subject=Contato site";
				}
				$link_skype = "";
				if ($skype != "") {
					$link_skype = "callto://+".$skype;
				}
				$link_telefonoa = "";
				if ($telefonoa != "") {
					$link_telefonoa = "tel:".preg_replace('/[^0-9]/', '', $telefonoa);
				}
				$link_telefonob = "";
				if ($telefonob != "") {
					$link_telefonob = "tel:".preg_replace('/[^0-9]/', '', $telefonob);
				}
				$link_whatsapp = "";
				if ($whatsapp != "") {
					$link_whatsapp = "https://api.whatsapp.com/send?phone=".preg_replace('/[^0-9]/', '', $whatsapp);
				}

				$sql = "UPDATE tb_vendedores SET nombre = '$nombre', foto = '$foto', unidad = '$unidad', email = '$email', link_email= '$link_email', skype = '$skype', link_skype = '$link_skype', telefono_a = '$telefonoa', link_telefono_a = '$link_telefonoa', telefono_b = '$telefonob', link_telefono_b = '$link_telefonob', whatsapp = '$whatsapp', link_whatsapp = '$link_whatsapp', espanol = '$espanol', portugues = '$portugues', ingles = '$ingles'
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

	function deleteVendedor ($id) {
		$connection = conn();
		try {
			$sql = "SELECT * from tb_vendedores WHERE id = $id";
			$query = $connection->prepare($sql);
			$query->execute();
			$img = $query->fetch();

			//excluye la imagen de la carpeta
			if ($img['foto'] != "no-image.png") {
				if (!unlink("../img/vendedores/".$img['foto'])) {  
					return $img." cannot be deleted due to an error";  
				}  
			}  

			$sql = "DELETE FROM tb_vendedores WHERE id = '$id'";
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
<?php 
	include_once "../conn/conn.php";

	function getStockProducto ($id) {
        $connection = conn();

        $sql = "SELECT * FROM tb_producto_stock WHERE tb_producto_stock.id_producto = '$id'";
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

    function getAtributos ($id) {
        $connection = conn();

        $sql = "SELECT tb_producto_atributo.*, tb_atributo.nombre AS atributo FROM `tb_producto_atributo`
				LEFT JOIN tb_atributo ON tb_producto_atributo.id_atributo = tb_atributo.id 
				WHERE tb_producto_atributo.id_producto='$id' ORDER BY tb_producto_atributo.id";
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

    function getValores ($dependencia, $atributo) {
        $connection = conn();

        if ($dependencia == "NULL") {
			$sql = "SELECT tb_producto_combinacion.*, tb_producto_atr_valor.id, tb_producto_stock.stock, tb_atr_valor.nombre FROM tb_producto_combinacion
                    LEFT JOIN tb_producto_atr_valor ON tb_producto_atr_valor.id = tb_producto_combinacion.id_producto_atr_valor
					LEFT JOIN tb_atr_valor ON tb_atr_valor.id = tb_producto_atr_valor.id_atr_valor                    
					LEFT JOIN tb_producto_stock ON tb_producto_combinacion.id_combinacion = tb_producto_stock.id_combinacion 
                    WHERE tb_producto_atr_valor.id_atributo = '$atributo' AND tb_producto_stock.stock > 0
                    GROUP BY tb_producto_atr_valor.id
                    ORDER BY tb_atr_valor.nombre";   
        } else {
            // ORDER BY tb_producto_atr_valor.nombre";  
            $where1 = "";
            $where2 = "";
            $dependencia = explode(",", $dependencia);

            foreach ($dependencia as $dep) {
                if ($where1 == "") {
                    $where1 = $dep."";
                    $where2 = $dep."";
                } else {
                    $where1 = $where1;
                    $where2 = $where2." AND tb_producto_combinacion.id_producto_atr_valor != ".$dep."";
                }
            }

            $sql = "SELECT tb_producto_combinacion.*, tb_producto_atr_valor.id, tb_producto_stock.stock, tb_atr_valor.nombre FROM tb_producto_combinacion 
                    LEFT JOIN tb_producto_atr_valor ON tb_producto_atr_valor.id = tb_producto_combinacion.id_producto_atr_valor
					LEFT JOIN tb_atr_valor ON tb_atr_valor.id = tb_producto_atr_valor.id_atr_valor                    
                    LEFT JOIN tb_producto_stock ON tb_producto_combinacion.id_combinacion = tb_producto_stock.id_combinacion 
                    WHERE tb_producto_combinacion.id_combinacion IN 
                        (SELECT tb_producto_combinacion.id_combinacion FROM tb_producto_combinacion 
                        WHERE tb_producto_combinacion.id_producto_atr_valor = $where1) 
                    AND tb_producto_combinacion.id_producto_atr_valor != $where2
                    AND tb_producto_atr_valor.id_atributo = '$atributo'
					AND tb_producto_stock.stock > 0
                    GROUP BY tb_producto_atr_valor.id
                    ORDER BY tb_atr_valor.nombre";
        }

        // $sql = "SELECT tb_producto_atr_valor.* FROM `tb_producto_atr_valor`
        // WHERE tb_producto_atr_valor.id_atributo='$atributo' ORDER BY tb_producto_atr_valor.nombre";
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

    function getCtdStok ($valores) {
        $connection = conn();              
        $valores = explode(",", $valores);
        $id_combinacion = searchCombinacion ($valores);

        $sql = "SELECT * from tb_producto_stock WHERE id_combinacion = '$id_combinacion'";
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

    function searchCombinacion ($valores) {
		$connection = conn();
		try {
			//Verificar se já existe uma combinação 
			$atributos_valor = "";
			foreach ($valores as $valor) {
				if ($atributos_valor == "") {
					$atributos_valor .= "";
				} else {
					$atributos_valor .= ", ";
				}
				$atributos_valor .= $valor;
			}

			$sql = "SELECT tb_producto_combinacion.* FROM tb_producto_combinacion WHERE tb_producto_combinacion.id_producto_atr_valor IN ($atributos_valor) ORDER BY tb_producto_combinacion.id_combinacion";
			$query = $connection->prepare($sql);
			$query->execute();

			$combinacion = $query->fetchAll();

			$total_atributos = sizeof($valores);
			$confirmados = 0;
			$aux = $combinacion[0]['id_combinacion'];
			$correto = "";

			foreach ($combinacion as $combo) {
				if ($aux != $combo['id_combinacion']) {
					//verifica se confirmamos todos
					if ($confirmados == $total_atributos) {
						$correto = $aux;
						break;
					} else {
						$correto = "";
						$confirmados = 0;
						$aux = $combo['id_combinacion'];
					}
				}
				
				foreach ($valores as $val) {
					if ($val == $combo['id_producto_atr_valor']) {
						$confirmados++;
					}	
				}
			}
			//caso seja o último
			if ($confirmados == $total_atributos) {
				$correto = $aux;
			}

			if ($correto != "") { //existe uma combinação
				$result = $correto;
			} else { //não existe uma combinação
				$result = null;
			}
		} catch (\Exception $e) {
			$result = "Erro ->".$e;
		}

		$connection = disconn($connection);
		return $result;
	}
    
    $opcao = strip_tags($_GET["parametro"]);

    if ( $opcao == "0"){
        $producto = strip_tags($_GET["producto"]);
        $result = getStockProducto ($producto);

        $response_array['status'] = 'success'; /* match error string in jquery if/else */ 
        $response_array['message'] = $result;   /* add custom message */ 
        header('Content-type: application/json');
        echo json_encode($response_array);//O retorno vai ser um json
    } else if ( $opcao == "1"){
        $producto = strip_tags($_GET["producto"]);
        $result = getAtributos ($producto);

        $response_array['status'] = 'success'; /* match error string in jquery if/else */ 
        $response_array['message'] = $result;   /* add custom message */ 
        header('Content-type: application/json');
        echo json_encode($response_array);//O retorno vai ser um json
    } else if ( $opcao == "2"){
        $dependencia = strip_tags($_GET["dependencia"]);
        $atributo = strip_tags($_GET["atributo"]);
        $result = getValores ($dependencia, $atributo);

        $response_array['status'] = 'success'; /* match error string in jquery if/else */ 
        $response_array['message'] = $result;   /* add custom message */ 
        header('Content-type: application/json');
        echo json_encode($response_array);//O retorno vai ser um json
    } else if ( $opcao == "3"){
        $valores = strip_tags($_GET["valores"]);
        $result = getCtdStok ($valores);

        $response_array['status'] = 'success'; /* match error string in jquery if/else */ 
        $response_array['message'] = $result;   /* add custom message */ 
        header('Content-type: application/json');
        echo json_encode($response_array);//O retorno vai ser um json
    }

?>
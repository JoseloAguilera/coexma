<?php 
	include_once "conn.php";
	// include_once "./objs/funcoes.php";
	

	function getAllPedidos () {
		$connection = conn();
		$sql = "SELECT tb_pedido.*, tb_cliente.nombre, tb_cliente.apellido, tb_met_pago.descripcion AS MET_PAGO, tb_met_envio.descripcion AS MET_ENVIO, tb_ped_status.descripcion AS STATUS_PED FROM tb_pedido
                LEFT JOIN tb_cliente ON tb_pedido.id_cliente = tb_cliente.id 
                LEFT JOIN tb_met_pago ON tb_pedido.id_met_pago = tb_met_pago.id 
                LEFT JOIN tb_met_envio ON tb_pedido.id_met_envio = tb_met_envio.id 
				LEFT JOIN tb_ped_status ON tb_pedido.status = tb_ped_status.id 
                ORDER BY id DESC";
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

	function countAllPedidos () {
		$connection = conn();
		$sql = "SELECT SUM(CASE 
							WHEN tb_pedido.status = 3 THEN 1
							ELSE 0
						END) AS FINALIZADOS,  
						SUM(CASE 
							WHEN tb_pedido.status != 3 THEN 1
							ELSE 0
						END) AS PENDIENTES
				FROM tb_pedido";
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


	function countPedidosClientes () {
		$connection = conn();
		$sql = "SELECT COUNT(tb_pedido.id) AS TOTAL, tb_cliente.nombre, tb_cliente.apellido FROM tb_pedido
                LEFT JOIN tb_cliente ON tb_pedido.id_cliente = tb_cliente.id 
                GROUP BY tb_pedido.id_cliente";
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

	function getPedidosPendientes () {
		$connection = conn();
		$sql = "SELECT tb_pedido.*, tb_cliente.nombre, tb_cliente.apellido, tb_ped_status.descripcion AS STATUS_PED FROM tb_pedido
                LEFT JOIN tb_cliente ON tb_pedido.id_cliente = tb_cliente.id 
				LEFT JOIN tb_ped_status ON tb_pedido.status = tb_ped_status.id 
                WHERE tb_pedido.status < 3";
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
	
	function getPedido ($codigo) {
		$connection = conn();
		$sql = "SELECT tb_pedido.*, tb_cliente.nombre, tb_cliente.apellido, tb_cliente.ruc, tb_cliente.documento, tb_cliente.razon_social, tb_cliente.mayorista, tb_met_pago.descripcion AS MET_PAGO, tb_met_envio.descripcion AS MET_ENVIO FROM tb_pedido 
                LEFT JOIN tb_cliente ON tb_pedido.id_cliente = tb_cliente.id 
                LEFT JOIN tb_met_pago ON tb_pedido.id_met_pago = tb_met_pago.id 
                LEFT JOIN tb_met_envio ON tb_pedido.id_met_envio = tb_met_envio.id 
				WHERE tb_pedido.id = '$codigo'";
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
	/*function getProdPedido ($codigo) {
		$connection = conn();
		$sql = "SELECT tb_ped_detalle.*, producto.referencia, producto.nombre, producto.url FROM tb_ped_detalle
                LEFT JOIN (SELECT tb_producto.id, tb_producto.referencia, tb_producto.nombre, tb_producto_img.url FROM tb_producto
						  LEFT JOIN tb_producto_img ON tb_producto.id = tb_producto_img.id_producto) AS producto 
						  ON tb_ped_detalle.id_producto = producto.id 
				WHERE tb_ped_detalle.id_pedido = '$codigo'";
		$query = $connection->prepare($sql);
		$query->execute();

		if ($query->rowCount() > 0) {
			$result= $query->fetchAll();
		} else {
			$result = null;
		}

		$connection = disconn($connection);
		return $result;
	}*/


	function getProdPedido ($codigo) {
		$connection = conn();
		$sql = "SELECT tb_ped_detalle.*, tb_producto_stock.id_combinacion FROM tb_ped_detalle 
				LEFT JOIN tb_producto_stock on tb_ped_detalle.id_stock = tb_producto_stock.id
				WHERE tb_ped_detalle.id_pedido = '$codigo'";
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

	function getAllStatus () {
		$connection = conn();
		$sql = "SELECT tb_ped_status.* FROM tb_ped_status";
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
	

	function savePedido ($id, $status) {
		$connection = conn();
		
		try {
			$sql = "SELECT * from tb_pedido WHERE id = $id";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$pedido = $query->fetch();
				// $stock = "NO STATUS";
				if ($pedido['status'] == 5) {//cancelado
					if ($status < 5) { //Não cancelado						
						$stock = actualizaStockCancelado($id, -1);
					}
				} else {
					if ($status == 5) {//Cancelado
						$stock = actualizaStockCancelado($id, +1);
					}
				}

				$sql = "UPDATE tb_pedido SET status = $status
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

	function actualizaStockCancelado ($id, $sinal) {
		$connection = conn();
		
		try {
			$sql = "SELECT * from tb_ped_detalle WHERE id_pedido = $id";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$pedidos = $query->fetchAll();
				$actualiza = 0;
				foreach ($pedidos AS $pedido) {
					$actualiza = $sinal*$pedido['ctd'];
					$result = actualizaStock($pedido['id_stock'], $actualiza);
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

	function actualizaStock ($codigo, $stock) {
		$connection = conn();
		try {
			$sql = "SELECT * from tb_producto_stock WHERE id = '$codigo'";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$newstock = $query->fetch();
				$newstock = $newstock['stock'];
				$newstock = $newstock + $stock;
				$sql = "UPDATE tb_producto_stock SET stock = '$newstock'
	 					WHERE id = '$codigo'";
				$query = $connection->prepare($sql);
				$query->execute();

				// $result = $newstock;
				if ($query->rowCount() > 0) {
					$result = $codigo;
				} else {
					$result = $codigo; //Sem alteração
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

	function getAllPedidosExpress () {
		$connection = conn();
		$sql = "SELECT * FROM tb_pedido_express ORDER BY id DESC";
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
	

	function deletePedidoExpress ($id) {
		$connection = conn();
		try {
			$sql = "SELECT id from tb_pedido_express WHERE id = '$id'";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
                $sql = "DELETE FROM tb_pedido_express WHERE id = '$id'";
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



	function getAllPedidosWhatsApp() {
		$connection = conn();
		$sql = "SELECT * FROM tb_pedido_express WHERE url_desde = 'WhatsApp' ORDER BY id DESC";
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

	function countWhatsApp () {
		$connection = conn();
		$sql = "SELECT COUNT(tb_pedido_express.id) AS TOTAL FROM tb_pedido_express where url_desde = 'WhatsApp'";
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


		function getAllPedidosForm() {
			$connection = conn();
			$sql = "SELECT * FROM tb_pedido_express WHERE url_desde = 'Formulario' ORDER BY id DESC";
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

		function countReservasForm () {
			$connection = conn();
			$sql = "SELECT COUNT(tb_pedido_express.id) AS TOTAL FROM tb_pedido_express where url_desde = 'Formulario'";
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


			function getVendedor($id) {
				$connection = conn();
				$sql = "SELECT * FROM tb_vendedores WHERE id = '$id'";
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
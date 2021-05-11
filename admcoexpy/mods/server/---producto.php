<?php 
	include_once "conn.php";
	// include_once "./objs/funcoes.php";

	function getAllProductos () {
		$connection = conn();
		$sql = "SELECT tb_producto.*, tb_marca.nombre AS marca FROM tb_producto LEFT JOIN tb_marca ON tb_producto.id_marca = tb_marca.id ORDER BY id ASC";
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




	function countAllProductos () {
		$connection = conn();
		$sql = "SELECT SUM(CASE 
							WHEN tb_producto_stock.stock > 0 THEN 1
							ELSE 0
						END) AS EnStock,  
						SUM(CASE 
							WHEN tb_producto_stock.stock = 0 THEN 1
							ELSE 0
						END) AS OutStock
				FROM tb_producto_stock";
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


	function getAllProductoStock () {
		$connection = conn();
		$sql = "SELECT tb_producto_stock.*, tb_producto.nombre AS PROD, tb_producto.unique_hits, tb_producto.total_hits FROM tb_producto_stock 
				LEFT JOIN tb_producto ON tb_producto_stock.id_producto = tb_producto.id";
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
	
	function getProducto ($codigo) {
		$connection = conn();
		$sql = "SELECT tb_producto.* FROM tb_producto WHERE tb_producto.id = '$codigo'";
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
	function getProductoImg ($codigo) {
		$connection = conn();
		$sql = "SELECT tb_producto_img.url FROM tb_producto_img WHERE tb_producto_img.id_producto = '$codigo'";
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

	function getProdbyCategoria ($categoria) {
		$connection = conn();
		if($categoria != 'ALL') {
			$sql = "SELECT tb_producto.*, tb_producto_categoria.id_categoria FROM tb_producto_categoria 
			LEFT JOIN tb_producto ON tb_producto_categoria.id_producto = tb_producto.id
			LEFT JOIN tb_categoria ON tb_producto_categoria.id_categoria = tb_categoria.id
			WHERE tb_producto.activo = 1 AND tb_categoria.activo = 1 AND tb_producto_categoria.id_categoria = $categoria ORDER BY tb_producto.nombre";
		} else {
			$sql = "SELECT tb_producto.*, tb_producto_categoria.id_categoria FROM tb_producto_categoria 
			LEFT JOIN tb_producto ON tb_producto_categoria.id_producto = tb_producto.id
			WHERE tb_producto.activo = 1 ORDER BY tb_producto.nombre";
		}

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

	function newProducto ($referencia, $nombre, $descripcion, $detallada, $precio, $descuento, $categorias, $cod_marca, $atributos, $destacado, $activo) {
		$connection = conn();
		
		try {
			$sql = "INSERT INTO tb_producto (referencia, nombre, descripcion_corta, descripcion_detallada, precio, valor_descuento, id_marca, activo, destaque)
		 			VALUES ('$referencia', '$nombre', '$descripcion', '$detallada', $precio, $descuento, $cod_marca, $activo, $destacado)";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$codigo = $connection->lastInsertId();

				$prodCat = saveProdCategoria ($categorias, $codigo);

				if ($prodCat == $codigo ) {
					$result = $codigo;
				} else {
					$result = 'Erro en las categorias.';
				}

				// if ($result == $codigo) {
				// 	if ($atributos != null) {
				// 		$prodAtr = saveProdAtributo ($atributos, $codigo);

				// 		if ($prodAtr == $codigo ) {
				// 			$result = $codigo;
				// 		} else {
				// 			$result = 'Erro en los atributos.';
				// 		}	
				// 	} else {
				// 		$result = $codigo;
				// 	}
				// }
			} else {
				$result = null;
			}
		} catch (\Exception $e) {
			$result = $e;
		}

		$connection = disconn($connection);
		return $result;
	}

	function saveProducto ($codigo, $referencia, $nombre, $descripcion, $detallada, $precio, $descuento, $categorias, $cod_marca, $atributos, $destacado, $activo) {
		$connection = conn();
		try {
			$sql = "SELECT * from tb_producto WHERE id = '$codigo'";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$sql = "UPDATE tb_producto SET referencia = '$referencia', nombre = '$nombre', descripcion_corta = '$descripcion', descripcion_detallada = '$detallada', precio = '$precio', valor_descuento = '$descuento', id_marca = $cod_marca, activo = $activo, destaque = $destacado
	 					WHERE id = '$codigo'";
				$query = $connection->prepare($sql);
				$query->execute();

				if ($query->rowCount() > 0) {
					$result = $codigo;
				} else {
					$result = $codigo; //Sem alteração
				}

				if ($result == $codigo) {
					$prodCat = saveProdCategoria ($categorias, $codigo);

					if ($prodCat == $codigo ) {
						$result = $codigo;
					} else {
						$result = 'Erro en las categorias.';
					}
				}

				// if ($result == $codigo) {
				// 	if ($atributos != null) {
				// 		$prodAtr = saveProdAtributo ($atributos, $codigo);

				// 		if ($prodAtr == $codigo ) {
				// 			$result = $codigo;
				// 		} else {
				// 			$result = 'Erro en los atributos.';
				// 		}	
				// 	} else {
				// 		$result = $codigo;
				// 	}
				// }
			} else {
				$result = null;
			}			
		} catch (\Exception $e) {
			$result = $e;
		}
		$connection = disconn($connection);
		return $result;
	}

	function deleteProducto ($codigo) {
		$connection = conn();
		try {
			$sql = "SELECT * from tb_producto_img WHERE id_producto = '$codigo'";
			$query = $connection->prepare($sql);
			$query->execute();
			$images = $query->fetchAll();

			//Apaga as imagens da pasta
			foreach ($images as $img) {
				if (!unlink("img/productos/".$img['url'])) {  
					return $img['url']." cannot be deleted due to an error";  
				} 
			}
			//Delete Imagenes
			$sql = "DELETE FROM tb_producto_img WHERE id_producto = '$codigo'";
			$query = $connection->prepare($sql);
			$query->execute();

			//Delete Atributos
			$sql = "DELETE FROM tb_producto_atributo WHERE id_producto = '$codigo'";
			$query = $connection->prepare($sql);
			$query->execute();

			//Delete Categoria
			$sql = "DELETE FROM tb_producto_categoria WHERE id_producto = '$codigo'";
			$query = $connection->prepare($sql);
			$query->execute();

			//Delete Stock
			$sql = "DELETE FROM tb_producto_stock WHERE id_producto = '$codigo'";
			$query = $connection->prepare($sql);
			$query->execute();

			// //Delete Stock Valor
			// $sql = "DELETE FROM tb_stock_valor WHERE id_producto = '$codigo'";
			// $query = $connection->prepare($sql);
			// $query->execute();

			//Delete Producto
			$sql = "DELETE FROM tb_producto WHERE id = '$codigo'";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$result = $codigo;
			} else {
				$result = null;
			}
		} catch (\Exception $e) {
			$result = $e;
		}

		$connection = disconn($connection);
		return $result;
	}

	function saveProdCategoria ($categorias, $producto) {
		$connection = conn();
		$result = null;
		try {
			$result = $producto;
			$sql = "DELETE FROM tb_producto_categoria WHERE id_producto = '$producto'";
			$query = $connection->prepare($sql);
			$query->execute();

			foreach ($categorias as $categoria) {
				$sql = "INSERT INTO tb_producto_categoria (id_producto, id_categoria)
				VALUES ('$producto', '$categoria')";

				$query = $connection->prepare($sql);
				$query->execute();

				if ($query->rowCount() <= 0) {
					$result = null;
				}
			}

			$sql = "SELECT * FROM tb_categoria WHERE tb_categoria.id IN (SELECT id_categoria FROM tb_producto_categoria WHERE id_producto = '$producto')";
			$query = $connection->prepare($sql);
			$query->execute();
			$cats = $query->fetchAll();

			foreach ($cats as $cat) {
				if ($cat['id_padre'] != null) { //categoria é uma subcategoria
					$id_padre = $cat['id_padre'];
					$sql = "SELECT id_categoria FROM tb_producto_categoria WHERE id_producto = '$producto' AND id_categoria = '$id_padre'";
					$query = $connection->prepare($sql);
					$query->execute();
					
					// Caso no esté registrado, registra categoria padre
					if ($query->rowCount() <= 0) {
						$sql = "INSERT INTO tb_producto_categoria (id_producto, id_categoria)
						VALUES ('$producto', '$id_padre')";

						$query = $connection->prepare($sql);
						$query->execute();
					}
				}				
			}

		} catch (\Exception $e) {
			$result = $e;
		}
		$connection = disconn($connection);
		return $result;
	}

	//ATRIBUTOS DE PRODUCTO

	function getProdAllAtributos ($producto) {
		$connection = conn();
		$sql = "SELECT tb_producto_atributo.*, tb_atributo.nombre AS atributo FROM tb_producto_atributo 
				LEFT JOIN tb_atributo ON tb_producto_atributo.id_atributo =  tb_atributo.id
				WHERE id_producto = '$producto' ORDER BY tb_atributo.nombre";
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

	function newProdAtributo ($producto, $atributo) {
		$connection = conn();
		try {
			$sql = "INSERT INTO tb_producto_atributo (id_producto, id_atributo, activo)
		 			VALUES ('$producto', '$atributo', 1)";
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

	function saveProdAtributo ($id, $activo) {
		$connection = conn();
		
		try {
			$sql = "SELECT * from tb_producto_atributo WHERE id = $id";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$sql = "UPDATE tb_producto_atributo SET activo = '$activo'
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

	function deleteProdAtributo ($id) {
		$connection = conn();
		
		try {
			$sql = "SELECT * from tb_producto_atributo WHERE id = $id";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$sql = "SELECT * from tb_producto_combinacion WHERE id_producto_atr_valor IN 
						( SELECT id from tb_producto_atr_valor WHERE id_atributo = $id )";
				$query = $connection->prepare($sql);
				$query->execute();
	
				if ($query->rowCount() > 0) {
					$result = "**stock**";
				} else {
					$sql = "DELETE FROM tb_producto_atributo WHERE id = '$id'";
					$query = $connection->prepare($sql);
					$query->execute();
		
					if ($query->rowCount() > 0) {
						$sql = "DELETE FROM tb_producto_atr_valor WHERE id_atributo = '$id'";
						$query = $connection->prepare($sql);
						$query->execute();
							
						$result = $id;
					} else {
						$result = null;
					}    
					}
			} else {
				$result = "Atributo no encontrado!";
			}			
		} catch (\Exception $e) {
			$result = $e;
		}
		$connection = disconn($connection);
		return $result;
	}

	function getProdAtributosValoresByStock ($combinacion) {
		$connection = conn();
		$sql = "SELECT tb_producto_combinacion.*, tb_producto_atr_valor.id_atributo, tb_atr_valor.nombre AS valor FROM tb_producto_combinacion 
				LEFT JOIN tb_producto_atr_valor ON tb_producto_combinacion.id_producto_atr_valor = tb_producto_atr_valor.id
				LEFT JOIN tb_atr_valor ON tb_producto_atr_valor.id_atr_valor = tb_atr_valor.id
				WHERE tb_producto_combinacion.id_combinacion = $combinacion ORDER BY tb_producto_atr_valor.id_atributo, tb_atr_valor.nombre";
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

	function getProdAtributosValores ($atributo) {
		$connection = conn();
		$sql = "SELECT tb_producto_atr_valor.*, tb_atr_valor.nombre AS valor FROM tb_producto_atr_valor 
				LEFT JOIN tb_atr_valor ON tb_producto_atr_valor.id_atr_valor = tb_atr_valor.id
				WHERE tb_producto_atr_valor.id_atributo = '$atributo' ORDER BY tb_atr_valor.nombre";
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

	function newProdAtributoValor ($valor, $atributo) {
		$connection = conn();
		try {
			$sql = "INSERT INTO tb_producto_atr_valor (id_atr_valor, id_atributo, activo)
		 			VALUES ($valor, $atributo, 1)";
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

	function saveProdAtributoValor ($id, $activo) {
		$connection = conn();
		
		try {
			$sql = "SELECT * from tb_producto_atr_valor WHERE id = $id";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$sql = "UPDATE tb_producto_atr_valor SET activo = '$activo'
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
	
	function deleteProdAtributoValor ($id) {
		$connection = conn();
		
		try {
			$sql = "SELECT * from tb_producto_atr_valor WHERE id = $id";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$sql = "SELECT * from tb_producto_combinacion WHERE id_producto_atr_valor = $id";
				$query = $connection->prepare($sql);
				$query->execute();
	
				if ($query->rowCount() > 0) {
					$result = "**stock**";
				} else {
					$sql = "DELETE FROM tb_producto_atr_valor WHERE id = '$id'";
					$query = $connection->prepare($sql);
					$query->execute();
		
					if ($query->rowCount() > 0) {
						$result = $id;
					} else {
						$result = null;
					}    	
				}

			} else {
				$result = "Valor no encontrado!";
			}			
		} catch (\Exception $e) {
			$result = $e;
		}
		$connection = disconn($connection);
		return $result;
	}

	function getProductoStock ($producto) {
		$connection = conn();
		$sql = "SELECT tb_producto_stock.* FROM tb_producto_stock WHERE tb_producto_stock.id_producto = '$producto'";
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

	function getStockValor ($stock) {
		$connection = conn();
		$sql = "SELECT * FROM tb_stock_valor LEFT JOIN tb_atr_valor ON tb_stock_valor.id_atr_valor = tb_atr_valor.id WHERE tb_stock_valor.id_stock = '$stock' ORDER BY tb_atr_valor.id_atributo";
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

	function newStock ($valores, $producto, $stock, $precio, $descuento) {
		$connection = conn();
		try {

			if ($valores == "NULL") {
				$sql = "SELECT * from tb_producto_stock WHERE id_combinacion IS NULL AND id_producto = '$producto'";
				$query = $connection->prepare($sql);
				$query->execute();
				
				if ($query->rowCount() > 0) {  //stock ya fue creado
					$stock_producto = $query->fetch();
					$id_stock = $stock_producto['id'];
					$total = $stock_producto['stock'] + $stock; //atualiza stock
					$sql = "UPDATE tb_producto_stock SET stock = '$total', precio = $precio, valor_descuento = $descuento
							WHERE id = $id_stock";
					$query = $connection->prepare($sql);
					$query->execute();
	
					if ($query->rowCount() > 0) {
						$result = $producto;
					} else {
						$result = $producto; //Sem alteração
					}
				} else { //stock no fue creado
					$sql = "INSERT INTO tb_producto_stock (id_producto, id_combinacion, stock, precio, valor_descuento, activo)
							VALUES ('$producto', NULL, '$stock', $precio, $descuento,  1)";
					$query = $connection->prepare($sql);
					$query->execute();

					if ($query->rowCount() > 0) {
						$result = $producto;//$connection->lastInsertId();
					} else {
						$result = null;
					}
				}
			} else {
				$id_combinacion = searchCombinacion ($valores);
				if ($id_combinacion != null) { //existe uma combinação
					$sql = "SELECT * from tb_producto_stock WHERE id_combinacion = '$id_combinacion' AND id_producto = '$producto'";
					$query = $connection->prepare($sql);
					$query->execute();
					
					if ($query->rowCount() > 0) {  //stock ya fue creado
						$stock_producto = $query->fetch();
						$id_stock = $stock_producto['id'];
						$total = $stock_producto['stock'] + $stock; //atualiza stock
						$sql = "UPDATE tb_producto_stock SET stock = '$total', precio = $precio, valor_descuento = $descuento
								WHERE id = $id_stock";
						$query = $connection->prepare($sql);
						$query->execute();
		
						if ($query->rowCount() > 0) {
							$result = $producto;
						} else {
							$result = $producto; //Sem alteração
						}
					} else { //stock no fue creado
						$sql = "INSERT INTO tb_producto_stock (id_producto, id_combinacion, stock, precio, valor_descuento, activo)
								VALUES ('$producto', $id_combinacion, '$stock', $precio, $descuento,  1)";
						$query = $connection->prepare($sql);
						$query->execute();

						if ($query->rowCount() > 0) {
							$result = $producto;//$connection->lastInsertId();
						} else {
							$result = null;
						}
					}
				} else { //não existe uma combinação

					$new_combinacion = 0;
					$sql = "SELECT IFNULL(MAX(id_combinacion),0) AS id_combinacion FROM tb_producto_combinacion";
					$query = $connection->prepare($sql);
					$query->execute();
					
					if ($query->rowCount() > 0) {
						$new_combinacion = $query->fetch();
						$new_combinacion = $new_combinacion['id_combinacion'];
						$new_combinacion++; //nova combinacion

						//Para cada novo valor
						foreach ($valores as $valor) {
							$sql = "INSERT INTO tb_producto_combinacion (id_combinacion, id_producto_atr_valor)
									VALUES ('$new_combinacion', $valor)";
							$query = $connection->prepare($sql);
							$query->execute();
						}

						//novo stock baseado na nova combinacão
						$sql = "INSERT INTO tb_producto_stock (id_producto, id_combinacion, stock, precio, valor_descuento, activo)
								VALUES ('$producto', '$new_combinacion', '$stock', $precio, $descuento,  1)";
						$query = $connection->prepare($sql);
						$query->execute();

						if ($query->rowCount() > 0) {
							$result = $producto;//$connection->lastInsertId();
						} else {
							$result = null;
						}

						$result = $producto;//$connection->lastInsertId();
					} else {
						$result = null;
					}
				}
			}

			//Caso tenga stock y no tenga los precios en el producto, actualiza
			$sql = "SELECT * from tb_producto WHERE id = '$producto'";
			$query = $connection->prepare($sql);
			$query->execute();
			
			if ($query->rowCount() > 0) {  
				$prod = $query->fetch();
				if ($prod['precio'] == "0") {
					$sql = "UPDATE tb_producto SET precio = $precio, valor_descuento = $descuento
						WHERE id = $producto";
					$query = $connection->prepare($sql);
					$query->execute();
				} 
			}
			
		} catch (\Exception $e) {
			$result = "Erro ->".$e;
		}

		$connection = disconn($connection);
		return $result;
	}

	function saveStock ($codigo, $stock, $precio, $descuento) {
		$connection = conn();
		try {
			$sql = "SELECT * from tb_producto_stock WHERE id = '$codigo'";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$sql = "UPDATE tb_producto_stock SET stock = '$stock', precio = '$precio', valor_descuento = '$descuento'
	 					WHERE id = '$codigo'";
				$query = $connection->prepare($sql);
				$query->execute();

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

	function deleteStock ($codigo) {
		$connection = conn();
		try {
			$sql = "SELECT * from tb_producto_stock WHERE id = '$codigo'";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$stock = $query->fetch();

				$combinacion = $stock['id_combinacion'];
				//Verifica se tem combinações
				$sql = "SELECT * from tb_producto_combinacion WHERE id_combinacion = '$combinacion'";
				$query = $connection->prepare($sql);
				$query->execute();

				// Deleta combinaciones si hay
				if ($query->rowCount() > 0) {
					$sql = "DELETE FROM tb_producto_combinacion WHERE id_combinacion = '$combinacion'";
					$query = $connection->prepare($sql);
					$query->execute();	
				}

				$sql = "DELETE FROM tb_producto_stock WHERE id = '$codigo'";
				$query = $connection->prepare($sql);
				$query->execute();

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
			if ($combinacion != NULL) {
				$aux = $combinacion[0]['id_combinacion'];
			} else {
				$aux = $valores[0];
			}

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


	function countAllProductosActivos () {
		$connection = conn();
		$sql = "SELECT COUNT(tb_producto.id) AS TOTAL FROM tb_producto WHERE tb_producto.activo=1";
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
	
	
	function actualizaStock ($id_combinacion, $ctd) {
	$connection = conn();
	try {
		$sql = "SELECT * from tb_producto_stock WHERE id_combinacion = '$id_combinacion'";
		$query = $connection->prepare($sql);
		$query->execute();

		if ($query->rowCount() > 0) {
			$stock = $query->fetch();
			$new = $stock['stock']-$ctd;

			$sql = "UPDATE tb_producto_stock SET stock = '$new'
					 WHERE id_combinacion = '$id_combinacion'";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$result = $id_combinacion;
			} else {
				$result = $id_combinacion; //Sem alteração
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

function savePedidos ($id, $id_met_pago, $id_met_envio, $total, $observacion, $total_envio){
	$connection = conn();
	try {
			$sql = "INSERT INTO tb_pedido (id_cliente, id_met_pago, id_met_envio, total, observacion, total_envio)
				 VALUES ('$id', '$id_met_pago', '$id_met_envio','$total', '$observacion', '$total_envio')";
			$query = $connection->prepare($sql);
			$query->execute();
			$id_ult_pd= $connection->lastInsertId();

			if ($query->rowCount() > 0) {
				$result = $id_ult_pd;
			} else {
				$result = null;
	   } 
				   
					
	} catch (\Exception $e) {
		$result = $e;
	}
	$connection = disconn($connection);
	return $result;
}

function saveDetallePedidos ($id_pedido, $id_producto, $id_combinacion, $combinacion, $valor_unitario, $ctd, $descuento, $valor_total) {
	$connection = conn();
	try {

		if ($combinacion == "") {
			$sql = "SELECT * from tb_producto_stock WHERE id_producto = '$id_producto'";
			$query = $connection->prepare($sql);
			$query->execute();	
		} else {
			$sql = "SELECT * from tb_producto_stock WHERE id_producto = '$id_producto' AND id_combinacion = '$id_combinacion'";
			$query = $connection->prepare($sql);
			$query->execute();	
		}

		if ($query->rowCount() > 0) {
			$stock = $query->fetch();
			$id_stock = $stock['id'];
		} else {
			return null;
		}

		$sql = "INSERT INTO tb_ped_detalle (id_pedido, id_producto, valor_unitario, id_stock, combinacion, ctd, descuento, valor_total)
			VALUES ('$id_pedido', '$id_producto', '$valor_unitario', $id_stock, '$combinacion', '$ctd', '$descuento', '$valor_total')";
		$query = $connection->prepare($sql);
		$query->execute();
		
		if ($query->rowCount() > 0) {
			$result = $id_pedido;
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
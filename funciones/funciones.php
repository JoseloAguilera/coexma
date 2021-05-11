<?php
	include_once "conn/conn.php";
	
	function getAllMenuCategorias ($tienda, $posicion) {
		$connection = conn();
		if ($posicion == 'menu') {
			$sql = "SELECT * FROM tb_categoria WHERE activo = '1' AND menu='1' AND id_padre='$tienda'  ORDER BY orden ASC";
		}else{$sql = "SELECT * FROM tb_categoria WHERE activo = '1' AND id_padre='$tienda'  ORDER BY orden ASC";}
		
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
    //OBTIENE LISTA DE PRODUCTOS DESTACADOS //
    function getProductosDestacados($tienda, $limit) {
		$connection = conn();
		//$sql = "SELECT tb_producto.* FROM tb_producto WHERE tb_producto.destaque = '1' AND tb_producto.activo = '1' AND ORDER BY RAND() LIMIT 12";
		$sql ="SELECT tb_producto.id as id, 
		tb_producto.nombre as nombre, 
		tb_producto.precio as precio 
		FROM tb_producto_categoria, tb_producto 
		WHERE tb_producto_categoria.id_producto = tb_producto.id 
		AND tb_producto_categoria.id_categoria = '$tienda' 
		AND tb_producto.activo = '1' AND tb_producto.destaque = '1' ORDER BY tb_producto.oden_destaque ASC limit ".$limit;
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

	function getProductosRelacionados($categoria) {
		$connection = conn();
		if($categoria != 'ALL') {
			$sql = "SELECT tb_producto_categoria.*, tb_producto.* FROM tb_producto_categoria 
					LEFT JOIN tb_producto ON tb_producto_categoria.id_producto=tb_producto.id 
					/*LEFT JOIN tb_producto_img ON tb_producto_img.id_producto = tb_producto.id */
					WHERE tb_producto.activo = 1 AND tb_producto_categoria.id_categoria = '$categoria' GROUP BY tb_producto.id ORDER BY id_marca ASC, nombre ASC LIMIT 4";
		} else {
			$sql = "SELECT tb_producto.* FROM tb_producto WHERE tb_producto.activo = 1 AND tb_producto.id_categoria IN (SELECT id FROM tb_categoria WHERE tb_categoria.activo = 1) ORDER BY id_marca, nombre LIMIT 4";
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
	function GetCategoriasProducto($id) {
		$connection = conn();
		//$sql = "SELECT tb_producto.* FROM tb_producto WHERE tb_producto.destaque = '1' AND tb_producto.activo = '1' AND ORDER BY RAND() LIMIT 12";
		$sql ="SELECT * FROM tb_producto_categoria 
		WHERE tb_producto_categoria.id_producto = '$id'";
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
		$sql = "SELECT tb_producto.* FROM tb_producto WHERE tb_producto.id = '$codigo' AND  tb_producto.activo = '1'";
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

	function getMails ($codigo) {
		$connection = conn();
		$sql = "SELECT mail_config.* FROM mail_config WHERE mail_config.id = '$codigo'";
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
	//OBTENER IMAGENES DE TODOS LOS PRODUCTOS
	function getProdImages ($producto) {
		$connection = conn();
		$sql = "SELECT * FROM tb_producto_img WHERE tb_producto_img.id_producto = '$producto' ORDER BY orden asc";
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

    //OBTIENE UNA IMAGEN DEL PRODUCTO//
	function getProdImage($producto) {
		$connection = conn();
		$sql = "SELECT * FROM tb_producto_img WHERE tb_producto_img.id_producto = '$producto'  ORDER BY orden asc LIMIT 1";
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
	


    
	function getProdbyCategoria ($categoria, $offset, $limit) {
		$connection = conn();
		if($categoria != 'ALL') {
			$sql = "SELECT tb_producto_categoria.*, tb_producto.* FROM tb_producto_categoria 
					LEFT JOIN tb_producto ON tb_producto_categoria.id_producto=tb_producto.id 
					/*LEFT JOIN tb_producto_img ON tb_producto_img.id_producto = tb_producto.id */
					WHERE tb_producto.activo = 1 AND tb_producto_categoria.id_categoria = '$categoria' GROUP BY tb_producto.id ORDER BY id_marca ASC, id_linea ASC,  modelo ASC, nombre ASC LIMIT $offset, $limit";
		} else {
			$sql = "SELECT tb_producto.* FROM tb_producto WHERE tb_producto.activo = 1 AND tb_producto.id_categoria IN (SELECT id FROM tb_categoria WHERE tb_categoria.activo = 1) ORDER BY id_marca, id_linea ASC, modelo ASC, nombre LIMIT $offset, $limit";
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

	function getSubCategorias ($categoria) {
		$connection = conn();
		$sql = "SELECT * FROM tb_categoria WHERE id_padre = '$categoria' ORDER BY nombre ASC";
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

	
	/*OBTIENE PRODUCTOS POR CATEGORIA */
	
    function getProdbyCategoriaHome ($categoria, $limit) {
        $connection = conn();
        if ($limit>0) {
            $limit = "LIMIT 4";
        }else{ $limit ='';}

		if($categoria != 'ALL') {
            $sql ="SELECT tb_producto.id as id,
			 tb_producto.nombre as nombre,
			 tb_producto.precio as precio
            FROM tb_producto_categoria, tb_producto
            WHERE tb_producto_categoria.id_producto = tb_producto.id 
			AND tb_producto_categoria.id_categoria = '$categoria' AND tb_producto.activo = '1' AND tb_producto.recomendado = '1'
			ORDER BY recomendado DESC  ".$limit;
            
           } else {

            $sql ="SELECT tb_producto.id as id, tb_producto.nombre as nombre, tb_producto.precio as precio, tb_categoria.nombre as nombre_categoria, tb_categoria.descripcion as descripcion_categoria 
            FROM tb_producto_categoria, tb_producto, tb_categoria
            WHERE tb_producto_categoria.id_producto = tb_producto.id AND tb_producto_categoria.id_categoria = '$categoria' ORDER BY tb_producto.id  AND tb_producto.activo = '1' ASC ".$limit;
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

	/************************ SAVE PEDIDO EXPRESS ******************/	    
    function savePedidoExpress ($nombre, $telefono, $email, $ciudad, $id, $mensaje){
		$connection = conn();
		try {
                $sql = "INSERT INTO tb_pedido_express (nombre, telefono, email, ciudad, id_producto, mensaje)
		 			VALUES ('$nombre', '$telefono', '$email','$ciudad', '$id', '$mensaje')";
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


    function saveMensaje ($nombre, $telefono, $email, $asunto, $mensaje){
		$connection = conn();
		try {
                $sql = "INSERT INTO tb_contacto (nombre, telefono, email, asunto, mensaje)
		 			VALUES ('$nombre', '$telefono', '$email','$asunto', '$mensaje')";
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


	function  saveNewsletter($email) {
		$connection = conn();
		try {
                $sql = "INSERT INTO tb_newsletter(email)
		 			VALUES ('$email')";
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
	function getCategoria ($categoria) {
		$connection = conn();
		$sql = "SELECT * FROM tb_categoria WHERE id = '$categoria' ";
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

		//OBTENER IMAGENES DE TODOS LOS PRODUCTOS
		function getUnidades () {
			$connection = conn();
			$sql = "SELECT * FROM tb_unidades WHERE activo= '1' ORDER BY id ASC";
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
		function getUnidadesWhats ($tienda) {
			$connection = conn();
			$sql = "SELECT * FROM tb_unidades WHERE tienda= '$tienda' ORDER BY id ASC";
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
		function getunidadesEmpresa () {
			$connection = conn();
			$sql = "SELECT * FROM tb_unidades WHERE activo= '1' AND id != '4' ORDER BY id ASC";
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

		function getVendedores($unidad) {
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
		function getVendedor($id) {
			$connection = conn();
			$sql = "SELECT * FROM tb_vendedores WHERE id = '$id' ";
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


		function getPreguntas() {
			$connection = conn();
			$sql = "SELECT * FROM tb_preguntas WHERE activo = '1' ORDER BY ID ASC";
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
		function getPreguntasOpciones($id) {
			$connection = conn();
			$sql = "SELECT * FROM tb_preguntas_opciones WHERE id_pregunta = '$id' ORDER BY ID DESC";
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

		function saveEncuesta ($idcliente, $pregunta, $respuesta){
			$connection = conn();
			try {
					$sql = "INSERT INTO tb_preguntas_respuestas (id, id_pregunta, id_respuesta)
						 VALUES ('$idcliente','$pregunta', '$respuesta')";
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


		function getProdbySearch ($busca) {
			$connection = conn();
			$sql = "SELECT tb_producto.* FROM tb_producto WHERE tb_producto.nombre LIKE '%$busca%' AND tb_producto.activo = 1 ORDER BY nombre ASC";
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

		
		function countProdbySearch ($busca) {
			$connection = conn();
			$sql = "SELECT COUNT(tb_producto.id) FROM tb_producto WHERE tb_producto.nombre LIKE '%$busca%' AND tb_producto.activo = 1 ORDER BY nombre ASC";
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

	
		

		function getBanners ($posicion) {
			$connection = conn();
			$sql = "SELECT * FROM tb_banner WHERE posicion = '$posicion' AND activo = '1'";
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
	
 // Toma todo el string y solo deja los numeros y en caso de que devuelva menos de seis digitos lo reemplaza por nada.
 function limpiar($str) {
	return $str = preg_replace('([^A-Za-z0-9])', '', $str);
  return $str;
  }
  function countCart() {
	$total=0;
	if (isset($_SESSION['cart'])) {
		foreach ($_SESSION['cart'] as $counter) { 				
			$total++;		
		}
		$_SESSION['total_item_cart'] = $total;
		return $total;
	} else {
		return $total;
	}
	
}

  function getTotalCart(){
	$total=0;
	if (isset($_SESSION['cart'])) {
		foreach ($_SESSION['cart'] as $TotalProducto) { 					
			$TotalItem = $TotalProducto['qty']*$TotalProducto['precio'];
			$total = $total + $TotalItem;
			$_SESSION['total'] = $total;
			
		}
		countCart();
		if ($_SESSION['total_item_cart'] == 0) {
			$_SESSION['total'] = 0;
			unset($_SESSION['cart']);
		}
	} else {
		$_SESSION['total'] = 0;
	}
	return $_SESSION['total'];
}


/* insertar nuevo cliente */
//$incluir = newUsuario ($_POST['nombre'], $_POST['apellido'], $_POST['email'], $contrasena, $_POST['telefono']) ;

function newUsuario ($nombre, $apellido, $email, $contrasena, $telefono) {
	$connection = conn();
	try {
		$sql = "INSERT INTO tb_cliente (nombre, apellido, email, telefono, mayorista)
				 VALUES ('$nombre', '$apellido', '$email','$telefono', 0)";
		$query = $connection->prepare($sql);
		$query->execute();

		if ($query->rowCount() > 0) {
			$id_cliente = $connection->lastInsertId();

			$sql = "INSERT INTO tb_usuario_cliente (id_cliente, email, contrasena, creado_en)
				 VALUES ('$id_cliente', '$email', '$contrasena', NOW())";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$result = $id_cliente;
			} else {
				$result = null;
			}	
		} else {
			$result = null;
		}
	} catch (\Exception $e) {
		$result = "Erro ->".$e;
	}

	$connection = disconn($connection);
	return $result;
}

function getUsuario ($email, $contrasena) {
	$connection = conn();

	$sql= "SELECT tb_usuario_cliente.*, tb_cliente.* from tb_usuario_cliente 
	LEFT JOIN tb_cliente ON tb_usuario_cliente.id_cliente = tb_cliente.id 
	WHERE tb_usuario_cliente.email = '$email' AND contrasena = '$contrasena'";

	$query= $connection->prepare($sql);
	$query->execute();
	$result = null;

	if ($query->rowCount() > 0) {
		$result = $query->fetch();
	} else {
		$result = null;
	}

	$connection = disconn($connection);

	return $result;
}

function getClienteDireccion($id) {
	$connection = conn();
	$sql = "SELECT * FROM tb_cli_direccion WHERE id_cliente = '$id' LIMIT 1";
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


	
function getMetodosDePago() {
	$connection = conn();
	$sql = "SELECT * FROM tb_met_pago WHERE activo = '1' ORDER BY id ASC";
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

function getMetodoEnvio($id) {
	$connection = conn();
	$sql = "SELECT * FROM tb_met_envio WHERE id = '$id'";
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

function getMetodoPago($id) {
	$connection = conn();
	$sql = "SELECT * FROM tb_met_pago WHERE id = '$id'";
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

function getMetodosDeEnvio() {
	$connection = conn();
	$sql = "SELECT * FROM tb_met_envio WHERE activo = '1' ORDER BY id ASC";
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




function getDepartamentos() {
	$connection = conn();
	$sql = "SELECT * FROM tb_departamento ORDER BY id ASC";
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



function getDepartamento($id) {
	$connection = conn();
	$sql = "SELECT * FROM tb_departamento WHERE id = '$id' LIMIT 1	";
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

function getCiudades($id) {
	$connection = conn();
	$sql = "SELECT * FROM tb_ciudad WHERE id_departamento = '$id' ORDER BY id ASC";
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

function getCiudad($id) {
	$connection = conn();
	$sql = "SELECT * FROM tb_ciudad WHERE id = '$id' LIMIT 1";
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

function getDireccion ($id) {
	$connection = conn();
	$sql = "SELECT * FROM tb_cli_direccion 
			WHERE tb_cli_direccion.id_cliente = $id";
	
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

function saveCliente ($id, $nombre, $apellido, $doc, $ruc, $razonsocial, $telefono, $email, $depart, $ciudad, $calle, $referencias) {
	$connection = conn();
	try {
		$sql = "SELECT * from tb_cliente WHERE id = '$id'";
		$query = $connection->prepare($sql);
		$query->execute();

		if ($query->rowCount() > 0) {
			$sql = "UPDATE tb_cliente SET nombre = '$nombre', nombre = '$nombre', apellido = '$apellido', documento = '$doc', ruc = '$ruc', razon_social = '$razonsocial', telefono = '$telefono', email = '$email'
					 WHERE id = '$id'";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$result = $id;
			} else {
				$result = $id; //Sem alteração
			}

			if ($result == $id) {
				$direccion = saveCliDireccion ($id, $depart, $ciudad, $calle, $referencias);

				if ($direccion == $id ) {
					$result = $id;
				} else {
					$result = 'Erro al guardar la direccion del cliente.';
				}
			} else {
				$result = 'Erro al guardar los datos del cliente.';
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

function saveCliDireccion ($id, $depart, $ciudad, $calle, $referencias) {
	$connection = conn();
	try {
		$sql = "SELECT * from tb_cli_direccion WHERE id_cliente = '$id'";
		$query = $connection->prepare($sql);
		$query->execute();

		if ($query->rowCount() > 0) {
			$sql = "UPDATE tb_cli_direccion SET departamento = '$depart', ciudad = '$ciudad', calle = '$calle', referencia = '$referencias'
					 WHERE tb_cli_direccion.id_cliente = '$id'";
			$query = $connection->prepare($sql);
			$query->execute();

			if ($query->rowCount() > 0) {
				$result = $id;
			} else {
				$result = $id; //Sem alteração
			}
		} else {
			$sql = "INSERT INTO tb_cli_direccion (id_cliente, departamento, ciudad, calle, referencia, favorito)
				 VALUES ('$id', '$depart', '$ciudad', '$calle', '$referencias', 1)";
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


function getMetEnvioCiudad($id_met_envio, $id_ciudad) {
	$connection = conn();
	$sql = "SELECT * FROM tb_met_envio_costo WHERE id_met_envio = '$id_met_envio' AND id_ciudad = '$id_ciudad' LIMIT 1";
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

function getMetodosDeEnvioDefault($id_met_envio) {
	$connection = conn();
	$sql = "SELECT * FROM tb_met_envio WHERE id = '$id_met_envio' LIMIT 1";
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

function getPedidosbyCliente ($id_cliente) {
	$connection = conn();
	$sql = "SELECT tb_pedido.*, tb_cliente.nombre, tb_cliente.apellido, tb_met_pago.descripcion AS MET_PAGO, tb_met_envio.descripcion AS MET_ENVIO, tb_ped_status.descripcion AS STATUS_PED FROM tb_pedido
			LEFT JOIN tb_cliente ON tb_pedido.id_cliente = tb_cliente.id 
			LEFT JOIN tb_met_pago ON tb_pedido.id_met_pago = tb_met_pago.id 
			LEFT JOIN tb_met_envio ON tb_pedido.id_met_envio = tb_met_envio.id 
			LEFT JOIN tb_ped_status ON tb_pedido.status = tb_ped_status.id 
			WHERE tb_pedido.id_cliente = $id_cliente
			ORDER BY tb_pedido.fecha DESC";
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

function getProdPedido ($codigo) {
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
}

function getpedido($id) {
	$connection = conn();
	$sql = "SELECT * FROM tb_pedido WHERE id = $id";
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

function getSlider() {
	$connection = conn();
	try {
		$sql = "SELECT * FROM tb_banner WHERE tb_banner.activo = 1 AND tb_banner.posicion = 0 ORDER BY orden";
		$query = $connection->prepare($sql);
		$query->execute();
		
		if ($query->rowCount() > 0) {
			$result = $query->fetchAll();
		} else {
			$result = null;
		}                	
	} catch (\Exception $e) {
		$result = $e;
	}
	$connection = disconn($connection);
	return $result;
}

function getSliderMovil() {
	$connection = conn();
	try {
		$sql = "SELECT * FROM tb_banner WHERE tb_banner.activo = 1 AND tb_banner.posicion = 2 ORDER BY orden";
		$query = $connection->prepare($sql);
		$query->execute();
		
		if ($query->rowCount() > 0) {
			$result = $query->fetchAll();
		} else {
			$result = null;
		}                	
	} catch (\Exception $e) {
		$result = $e;
	}
	$connection = disconn($connection);
	return $result;
}

function getBanner() {
	$connection = conn();
	try {
		$sql = "SELECT * FROM tb_banner WHERE tb_banner.activo = 1 AND tb_banner.posicion = 1 ORDER BY orden LIMIT 2";
		$query = $connection->prepare($sql);
		$query->execute();
		
		if ($query->rowCount() > 0) {
			$result = $query->fetchAll();
		} else {
			$result = null;
		}                	
	} catch (\Exception $e) {
		$result = $e;
	}
	$connection = disconn($connection);
	return $result;
}

function visit ($producto) {
	$connection = conn();
	
	try {
		$sql = "SELECT * from tb_producto WHERE id = '$producto'";
		$query = $connection->prepare($sql);
		$query->execute();

		if ($query->rowCount() > 0) {
			$result = $query->fetch();
			$total = $result['total_hits'] + 1;
			$unique = $result['unique_hits'];
			if (isNewVisitor($producto)) {
				$unique = $unique + 1;
			}
			$sql = "UPDATE tb_producto SET total_hits = $total, unique_hits = $unique
					 WHERE id = '$producto'";
			$query = $connection->prepare($sql);
			$query->execute();
		} 		
	} catch (\Exception $e) {
		$result = $e;
	}
	$connection = disconn($connection);
	return $producto;
}

function isNewVisitor ($producto) {
	$visited = array_key_exists('visited'.$producto, $_SESSION);
	if ($visited == false) {
		$_SESSION['visited'.$producto] = true;
	}
	return !$visited;
}

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



	/************************ SAVE curriculum ******************/	    
    function saveCurriculum ($nombre, $apellido, $cedula, $email, $ciudad, $departamento, $area, $telefono, $newFileName){
		$connection = conn();
		try {
                $sql = "INSERT INTO tb_curriculum (nombre, apellido, cedula, email, id_ciudad, id_departamento, area, telefono, url_cv)
		 			VALUES ('$nombre', '$apellido', '$cedula','$email', '$ciudad', '$departamento', '$area', '$telefono', '$newFileName')";
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


	/************************ SAVE curriculum ******************/	   
//	$guardarexp = saveCurriculumExperiencia ($guardarpedido, $_POST['empresa_'.$i], $_POST['antiguedad-desde_'.$i],  $_POST['antiguedad-hasta_'.$i], $_POST['cargo_'.$i]);
 
    function saveCurriculumExperiencia ($idcurriculum, $empresa, $desde, $hasta, $cargo){
		$connection = conn();
		try {
                $sql = "INSERT INTO tb_curriculum_experiencia (id_curriculum, empresa, desde, hasta, cargo)
		 			VALUES ('$idcurriculum','$empresa', '$desde', '$hasta','$cargo')";
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


	function countProdbyCategoria ($categoria) {
		$connection = conn();
		if($categoria != 'ALL') {
			$sql = "SELECT COUNT(tb_producto_categoria.id_producto) FROM tb_producto_categoria 
					LEFT JOIN tb_producto ON tb_producto_categoria.id_producto=tb_producto.id 
					WHERE tb_producto.activo = 1 AND tb_producto_categoria.id_categoria = '$categoria' GROUP BY (tb_producto.id) ORDER BY id_marca ASC, nombre ASC";
		// } else {
		// 	$sql = "SELECT tb_producto.*, tb_producto_img.url as img, tb_producto_img.orden as orden FROM tb_producto LEFT JOIN tb_producto_img ON tb_producto_img.id_producto = tb_producto.id WHERE tb_producto.activo = 1 AND tb_producto.id_categoria IN (SELECT id FROM tb_categoria WHERE tb_categoria.activo = 1) ORDER BY nombre ASC";
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

	function getMarcas() {
		$connection = conn();
		$sql = "SELECT * FROM tb_marca WHERE activo = '1' ORDER BY id ASC";
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



	function getMarcasByCategory ($categoria) {
		$connection = conn();

		/*$sql= "SELECT m.id as id_marca, m.nombre as marca, p.id as id_producto, p.nombre as producto, cp.id_categoria as cat 
	    FROM tb_producto_categoria cp, tb_producto as p, tb_marca as m where m.id = p.id_marca AND cp.id_categoria = '$categoria' LIMIT 15";*/
	
			$sql= "SELECT 
			m.id as id_marca,
			m.nombre as nombre_marca,
			m.url as link_imagen_marca,  
			p.id as id_producto, 
			p.nombre as nombre_producto, 
			pc.id_categoria as cat ,
            COUNT(p.id) as cant_producto
	        
			FROM
            tb_producto as p 
			left JOIN tb_marca as m ON m.id = p.id_marca 
            left join tb_producto_categoria as pc ON p.id = pc.id_producto 
            WHERE pc.id_categoria = '$categoria' GROUP BY id_marca";

		$query= $connection->prepare($sql);
		$query->execute();
		$result = null;
	
		if ($query->rowCount() > 0) {
			$result = $query->fetchAll();
		} else {
			$result = null;
		}
	
		$connection = disconn($connection);
	
		return $result;
	}


	function getProdbyCategoriaMarca ($categoria, $marca, $offset, $limit) {
		$connection = conn();
		if($categoria != 'ALL') {
			$sql = "SELECT tb_producto_categoria.*, tb_producto.*, tb_producto_img.url as img, tb_producto_img.orden as orden FROM tb_producto_categoria 
					LEFT JOIN tb_producto ON tb_producto_categoria.id_producto=tb_producto.id 
					LEFT JOIN tb_producto_img ON tb_producto_img.id_producto = tb_producto.id 
					WHERE tb_producto.activo = 1 AND tb_producto.id_marca = '$marca' AND (tb_producto_categoria.id_categoria = '$categoria') GROUP BY (tb_producto.id) ORDER BY nombre ASC LIMIT $offset, $limit";
/*
if($categoria != 'ALL') {
	$sql = "SELECT tb_producto_categoria.*, tb_producto.*, tb_producto_img.url as img, tb_producto_img.orden as orden FROM tb_producto_categoria 
			LEFT JOIN tb_producto ON tb_producto_categoria.id_producto=tb_producto.id 
			LEFT JOIN tb_producto_img ON tb_producto_img.id_producto = tb_producto.id 
			WHERE tb_producto.activo = 1 AND tb_producto.id_marca = '$marca' AND (tb_producto_categoria.id_categoria = '$categoria' OR tb_producto_categoria.id_categoria IN (SELECT id FROM tb_categoria WHERE id_padre = '$categoria')) GROUP BY (tb_producto.id) ORDER BY nombre ASC LIMIT $offset, $limit";*/
		} else {
			$sql = "SELECT tb_producto.*, tb_producto_img.url as img, tb_producto_img.orden as orden FROM tb_producto LEFT JOIN tb_producto_img ON tb_producto_img.id_producto = tb_producto.id WHERE tb_producto.activo = 1 AND tb_producto.id_categoria IN (SELECT id FROM tb_categoria WHERE tb_categoria.activo = 1) ORDER BY nombre ASC LIMIT $offset, $limit";
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


	  //OBTIENE UNA IMAGEN DEL PRODUCTO//
	  function getProdMarca($cod) {
		$connection = conn();
		$sql = "SELECT * FROM tb_marca WHERE tb_marca.id = '$cod'  ORDER BY id asc LIMIT 1";
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
	


	function countProdbyCategoriaMarca ($categoria, $marca) {
		$connection = conn();
		if($categoria != 'ALL') {
			$sql = "SELECT COUNT(tb_producto_categoria.id_producto) FROM tb_producto_categoria 
					LEFT JOIN tb_producto ON tb_producto_categoria.id_producto=tb_producto.id 
				    WHERE tb_producto.activo = 1 AND tb_producto_categoria.id_categoria = '$categoria' AND tb_producto.id_marca = '$marca' GROUP BY (tb_producto.id) ORDER BY id_marca ASC, id_linea ASC, nombre ASC";
		// } else {
		// 	$sql = "SELECT tb_producto.*, tb_producto_img.url as img, tb_producto_img.orden as orden FROM tb_producto LEFT JOIN tb_producto_img ON tb_producto_img.id_producto = tb_producto.id WHERE tb_producto.activo = 1 AND tb_producto.id_categoria IN (SELECT id FROM tb_categoria WHERE tb_categoria.activo = 1) ORDER BY nombre ASC";
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
	
		function buscaCombinacion ($valores) {
		$connection = conn();
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

		$connection = disconn($connection);
		return $result;
	}

	function getProdAtributosValoresByStock ($combinacion) {
		$connection = conn();
		$sql = "SELECT tb_producto_combinacion.*, tb_atr_valor.nombre, tb_producto_atr_valor.id_atributo, tb_atributo.nombre AS atributo FROM tb_producto_combinacion 
				LEFT JOIN tb_producto_atr_valor ON tb_producto_combinacion.id_producto_atr_valor = tb_producto_atr_valor.id
				LEFT JOIN tb_atr_valor ON tb_producto_atr_valor.id_atr_valor = tb_atr_valor.id
				LEFT JOIN tb_producto_atributo ON tb_producto_atr_valor.id_atributo = tb_producto_atributo.id
				LEFT JOIN tb_atributo ON tb_producto_atributo.id_atributo = tb_atributo.id
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
	
	//OBTIENE UNA IMAGEN DEL PRODUCTO//
	function getStock($producto) {
		$connection = conn();
		$sql = "SELECT SUM(stock) AS stock FROM tb_producto_stock WHERE tb_producto_stock.id_producto = '$producto' GROUP BY tb_producto_stock.id_producto";
		// $sql = "SELECT stock FROM tb_producto_stock WHERE tb_producto_stock.id_producto = '$producto'";
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
	
	function actualizaStock ($id_producto, $id_combinacion, $ctd) {
	$connection = conn();
	try {
		if ($id_combinacion =="" OR $id_combinacion ="NULL") {
			$sql = "SELECT * from tb_producto_stock WHERE id_producto=  '$id_producto'";
		}else {
			$sql = "SELECT * from tb_producto_stock WHERE id_combinacion = '$id_combinacion'";
		}
		
		$query = $connection->prepare($sql);
		$query->execute();

		if ($query->rowCount() > 0) {
			$stock = $query->fetch();
			$new = $stock['stock']-$ctd;

			if ($id_combinacion =="" OR $id_combinacion ="NULL") {
			         $sql = "UPDATE tb_producto_stock SET stock = '$new'
					 WHERE id_producto = '$id_producto'";
					
				} else {
						$sql = "UPDATE tb_producto_stock SET stock = '$new'
						WHERE id_combinacion = '$id_combinacion'";
                    }		
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
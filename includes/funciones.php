<?php
	include_once "conn/conn.php";
	
	function getAllMenuCategorias ($tienda, $posicion) {
		$connection = conn();
		if ($posicion == 'menu') {
			$sql = "SELECT * FROM tb_categoria WHERE activo = '1' AND menu='1' AND id_padre='$tienda'";
		}else{$sql = "SELECT * FROM tb_categoria WHERE activo = '1' AND id_padre='$tienda'";}
		
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
		AND tb_producto.activo = '1' ORDER BY tb_producto.id ASC limit ".$limit;
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
	//OBTENER IMAGENES DE TODOS LOS PRODUCTOS
	function getProdImages ($producto) {
		$connection = conn();
		$sql = "SELECT * FROM tb_producto_img WHERE tb_producto_img.id_producto = '$producto' ORDER BY orden DESC";
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
		$sql = "SELECT * FROM tb_producto_img WHERE tb_producto_img.id_producto = '$producto'  ORDER BY id DESC LIMIT 1";
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
    

    /*OBTIENE PRODUCTOS POR CATEGORIA */
    function getProdbyCategoria ($categoria, $limit) {
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
			AND tb_producto_categoria.id_categoria = '$categoria' AND tb_producto.activo = '1'
			ORDER BY tb_producto.id ASC ".$limit;
            
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
    function savePedidoExpress ($nombre, $telefono, $email, $id, $mensaje){
		$connection = conn();
		try {
                $sql = "INSERT INTO tb_pedido_express (nombre, telefono, email, id_producto, mensaje)
		 			VALUES ('$nombre', '$telefono', '$email','$id', '$mensaje')";
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
			$sql = "SELECT tb_producto.*, tb_producto_img.url as img, tb_producto_img.orden as orden FROM tb_producto
			LEFT JOIN tb_producto_img ON tb_producto_img.id_producto = tb_producto.id 
			WHERE (tb_producto.nombre LIKE '%$busca%' AND tb_producto.activo = 1) AND tb_producto.activo = 1 ORDER BY nombre ASC";
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
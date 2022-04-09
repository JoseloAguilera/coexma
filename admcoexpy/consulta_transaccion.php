<?php 
	session_start();
	if (!isset($_SESSION['logueado'])) {
		header('Location: login.php');
	}
?>
<!DOCTYPE html>
<html>
<head>
    <title><?php echo $_SESSION['empresa'];?> | Pagopar</title>
	<?php include 'includes/head.php'; ?>
</head>
<body>
	
<?php	
		if(isset($_GET['hash'])){
            $hash=$_GET['hash'];
        }
        $token_privado='a0ea36cf253a8748d18d39b2a91ed5b2';
		$token_publico='0b07af6efcd53213f69e4079df9dfac8';
        $ok=0;
        $token=Sha1($token_privado.'CONSULTA');
        //var_dump($token);

        $enviar['hash_pedido']=$hash;
        $enviar['token']=$token;
        $enviar['token_publico']=$token_publico;

        
        $url = "https://api.pagopar.com/api/pedidos/1.1/traer";
        $postdata = json_encode($enviar);
        //var_dump($postdata);
        $ch = curl_init($url);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $postdata);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
		curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
        $result = json_decode(curl_exec($ch), true);
	   // var_dump($result);
	   	if(curl_errno($ch))	{
    		echo 'Curl error: ' . curl_error($ch);  		}
    	else{ 
        	if($result["respuesta"]==true){
                $ok=1;
                $pagado=$result['resultado'][0]['pagado'];
                $forma_pago=$result['resultado'][0]['forma_pago'];
                $fecha_pago=$result['resultado'][0]['fecha_pago'];
                $monto=$result['resultado'][0]['monto'];
                $fecha_maxima_pago=$result['resultado'][0]['fecha_maxima_pago'];
                $hash_pedido=$result['resultado'][0]['hash_pedido'];
                $numero_pedido=$result['resultado'][0]['numero_pedido'];
                $cancelado=$result['resultado'][0]['cancelado'];
                $forma_pago_identificador=$result['resultado'][0]['forma_pago_identificador'];
                $token=$result['resultado'][0]['token'];
				actualizarPagopar($pagado, $forma_pago, $fecha_pago, $numero_pedido, $cancelado, $forma_pago_identificador, $hash_pedido);
				//echo "El hash es ".$hash_pedido;
				//echo "pagado".$pagado;
				if($pagado==1){
					//echo "holaaa";
					$num_ped= obtenerPedido($hash_pedido);
					//echo "numero de pedido ".$num_ped['id'];
					actualizarPago($num_ped['id']);
				}
                			
        	}else{
                $ok=0;
        	}
     	}
		curl_close($ch);
    ?>
	<!-- Header section end -->
	
    
	<!-- Page -->
	<div class="page-area product-page spad">
		<div class="container">
            <div class="register-box" id="register">
                <div class="register-logo">
                </div>
				<div>
					<a type="button" href="consultapagopar.php" class="btn btn-primary" style="margin-bottom: 5px; text-aling: center;">Volver</a>
				</div>
                <div class="register-box-body">
                    <?php
                   if($ok==1){

                                         
                    ?>
                    <h2>CONSULTA DEL PEDIDO</h2>
                    <p>
                    La forma de pago seleccionada: <?php echo $forma_pago; ?>
                    <hr>
                    El nro. de Pedido en Pagopar: <?php echo  $numero_pedido;?>
                    <hr>
                    La fecha maxima de pago: <?php echo  $fecha_maxima_pago;?>
                    <hr>
                    Total: <?php echo  $monto;?>
                    <hr>
                    Pagado: <?php if($pagado==1){ echo 'Si'; }else{echo 'No';}?>
                    <hr>
                    Fecha de Pago: <?php echo  $fecha_pago;?>
                    <hr><hr>
                    <?php 
                    }else{
                    ?>
                    
                    <h2>LO SENTIMOS, HUBO UN ERROR</h2><br>
                    <h2>POR FAVOR, COMUNIQUESE CON EL SOPORTE</h2>
                    
                    <?php    
                    }
                ?>
                   
                    </p>
                
                    
                </div> <!-- /.form-box -->
                
            </div> <!-- /.register-box -->
		</div>
	</div>
    <!-- Page end -->
		<?php include "includes/footer.php"; ?>
		<!-- ./FOOTER -->
	

	<!-- SCRIPTS (js) -->
	<script type="text/javascript">
		<?php //include_once "mods/js/consultapagopar.js"; ?>
	</script>
	<?php //include "includes/scripts.php"; ?>
	<!-- ./SCRIPTS (js) -->

	<?php 
		//include_once "mods/server/conn.php";
		function conn () {	
		
		// server
		$user = 'coexmaco_coexmausu_DB'; //usuario
    	$password = '%ws;;WIkhIvF'; //senha
		$host = 'localhost'; //hosts
		$dbname = 'coexmaco_coexmanew_DB'; //nombre da base de dados
		
		$parametros = array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'UTF8'"); //caso os dados estejam com acentos ou ç
		try {
			//criando conexão usado PDO
			$connection = new PDO("mysql:host=$host;dbname=$dbname;", $user, $password, $parametros);
			//setando atributos
			$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			return $connection;

		} catch (PDOException $e) {
			echo $e->getMessage();
		}
	}

	function disconn ($connection) {
		if ($connection != null) {
			$connection = null;
		}
	}
		function actualizarPagopar($pagado2, $forma_pago2, $fecha_pago2, $numero_pedido2, $cancelado2, $forma_pago_identificador2, $hash_pedido2){
			//echo "Para saber si esta pagado";
			//var_dump($pagado);
			/*if($pagado2==true){
				$pago=1;
				//actualizarPago($hash_pedido2);
			}else{
				$pago=0;
			}
			if($cancelado2==true){
				$cancel=1;
			}else{
				$cancel=0;
			}*/
			$connection = conn();
			try{
				$sql = "UPDATE transactions SET pagado = '$pagado2', forma_pago = '$forma_pago2', numero_pedido = '$numero_pedido2', cancelado = '$cancel', forma_pago_identificador = '$forma_pago_identificador2', updated = 'current_timestamp' WHERE hash_pedido = '$hash_pedido2'";
						
					$query = $connection->prepare($sql);
					$query->execute();
	               
				} catch (\Exception $e) {
					$result = $e;
					echo "Error, contacte al administrador. Error -> ".$result;
				}
				$connection = disconn($connection);
		}
	
	    function obtenerPedido($hash){
			$connection = conn();
	
			$sql= "SELECT id FROM transactions WHERE hash_pedido = '"."$hash'";
			$query = $connection->prepare($sql);
			$query->execute();
			if ($query->rowCount() > 0) {
				$result= $query->fetch();
			} else {
				$result = null;
			}
			return $result;
	
			$connection = disconn($connection);
	
		}
	
	
		function actualizarPago($pedido_id){
			$connection = conn();
			try{
				$sql = "UPDATE tb_pedido SET status = '2' WHERE id = '$pedido_id'";
					$query = $connection->prepare($sql);
					$query->execute();
	
				} catch (\Exception $e) {
					$result = $e;
					echo "Error, contacte al administrador. Error -> ".$result;
				}
				$connection = disconn($connection);
	
		}

	?>
</body>
</html>
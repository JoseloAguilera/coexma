<?php 
	session_start();
?>
<!DOCTYPE html>
<html lang="zxx">
<?php 
	// session_start();
	include("includes/head.php");
	include("funciones/funciones.php");
    include("includes/cart.php");
     ?>
<body>
		
	<!-- Header section -->
	<?php include("includes/header.php"); 
    if(isset($_GET['hash'])){
        $hash=$_GET['hash'];
    }
    $token_privado='cd164afdd444e7243016f0a0c2aa4492';
    $token_publico='5b4624d6c17d7358044472d3632f548b';
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
            if($pagado==1){
                $num_ped= obtenerPedido($hash_pedido);
                actualizarPago($num_ped['id']);
            }
                        
        }else{
            $ok=0;
        }
     }
    curl_close($ch);
    ?>
	<!-- Header section end -->


	<!-- Page Info -->
    <section id="page-info">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <a href="index.php">Inicio / </a><a href="login.php">Mi Pedido </a> 
                </div>
            </div>
        </div>
    </section > 
    <!-- Page Info end -->
    
	<!-- Page -->
	<div class="page-area product-page spad">
    <br><br>
		<div class="container pago-completado">
            <div class="col-md-12 col-xs-12">
            <div class="register-box" id="register">
                <div class="register-logo">
                </div>

                <div class="register-box-body">
                <?php
                   if($ok==1){

                    unset($_SESSION['cart']);
                        
                    ?>
                    <h2>GRACIAS POR REALIZAR TU PEDIDO!</h2>
                    <p><?php echo getMetodoPago($pedido['id_met_pago'])['instrucciones'];?></p>
                    <p>
                    Usted seleccionó <?php echo $forma_pago; ?> como medio de pago en PAGOPAR.
                    <hr>
                    Su nro. de Pedido es: <?php echo  $numero_pedido;?>
                    <hr>
                    La fecha maxima de pago: <?php echo  $fecha_maxima_pago;?>
                    <hr>
                    Total: <?php echo  $monto;?>
                    <hr>
                    Pagado: <?php if($pagado==true){ echo 'Si'; }else{echo 'No';}?>
                    <hr>
                    Fecha de Pago: <?php echo  $fecha_pago;?>
                    <hr><hr>
                    <?php 
                    }else{
                    ?>
                    
                    <h2>LO SENTIMOS, HUBO UN ERROR</h2><br>
                    <h2>POR FAVOR, COMUNIQUESE CON EL SOPORTE DE NUESTRA TIENDA</h2>
                    
                    <?php    
                    }
                ?>
                    <div class="col-lg-12">
				<a href="perfil.php"><div class="site-btn btn-continue">Ver Mis Pedidos</div></a>
				</div>
                    </p>   
                
                    </div>
                </div> <!-- /.form-box -->
            </div> <!-- /.register-box -->
		</div>
	</div>
    <!-- Page end -->
    
	<!-- Footer top section -->	
	<?php include("includes/footer.php");?>
</script>
</html>
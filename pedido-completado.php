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
	<?php include("includes/header.php"); ?>
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
                    $pedido = getpedido($_GET['ped']);
                        unset($_SESSION['cart']);
                    ?>
                        <h2>GRACIAS POR REALIZAR TU PEDIDO!</h2>
                        <p><?php echo getMetodoPago($pedido['id_met_pago'])['instrucciones'];?></p>
                        <p>
                        <b>Nro. de Pedido:</b> <?php echo  $pedido['id'] ?>
                        <hr>
                        <b>Total: </b><?php echo  number_format($pedido['total'], 0, ',', '.')." Gs";?> 
                        <hr>
                        <b>Metodo de Envio:</b> <?php echo getMetodoEnvio($pedido['id_met_envio'])['descripcion'];?>
                        <hr>
                        <b>Costo de Envio:</b> <?php 
                        if ($pedido['total_envio'] == "0") {
                            echo "Envio a Coordinar con el Vendedor" ;
                        } else {
                            
                            echo  number_format($pedido['total_envio'], 0, ',', '.')." Gs";
                        }
                        
                      ?> 
                        <hr>
                        <b>Total A Pagar:</b> <?php echo   number_format($pedido['total'] +$pedido['total_envio'], 0, ',', '.')." Gs"; ?>
                        <hr>
                    <!--div class="col-lg-12">
				<a href="perfil.php"><div class="site-btn btn-continue">Ver Mis Pedidos</div></a>
				</div-->
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
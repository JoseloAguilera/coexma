<?php 
	session_start();
	if (!isset($_SESSION['logueado'])) {
		header('Location: login.php');
	}

?>

<!DOCTYPE html>
<html>
<head>
	<title><?php echo $_SESSION['empresa'];?> | Inicio</title>
	<?php include 'includes/head.php'; ?>
</head>
<body class="hold-transition skin-green sidebar-mini sidebar-collapse">
	<div class="wrapper">
		<!-- MAIN HEADER -->
		<?php include 'includes/header.php'; ?>
		<!-- MAIN HEADER END -->

		<!-- ASIDE BAR -->
		<?php include 'includes/aside.php'; ?>
		<!-- ASIDE BAR END -->

		<?php include 'mods/objs/index.php'; ?>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Cabicera de Contenido (Título) -->
			<section class="content-header">
				<h1>
					Dashboard 
					<small>Panel administrativo.</small>
				</h1>
			</section>
			<!-- Contenido Principal -->
			<section class="content">
				<div class="modal fade modal-mensaje" id="modal-mensaje" tabindex="-1" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header modal-mensaje-<?php echo $tipomensaje;?>" > <!-- modal-mensaje-success or modal-mensaje-error -->
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h1 class="modal-title text-center">
									<?php if ($tipomensaje == 'success') {?>
										<img src="img/success-icon.png"> 
									<?php } else { ?>
										<img src="img/error-icon.png">
									<?php }?>
								</h1>
							</div>
							<div class="modal-body text-center">
								<p> <?php echo $mensaje; ?></p>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-green">
							<div class="inner">
								<h3>
									<?php  
										if ($ctd_whatsapp['TOTAL'] != null) { 
											echo $ctd_whatsapp['TOTAL']; 
										} else { 
											echo "0"; 
										}	 
									?> 
								</h3>
								<p>Mensajes WhatsApp</p>
							</div>
							<div class="icon">
								<i class="fa fa-whatsapp"></i>
							</div>
							<a href="pedidos_whatsapp.php" class="small-box-footer">Ver Mensajes <i class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>



					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-red">
							<div class="inner">
								<h3>
									<?php  
										if ($ctd_pedidos['PENDIENTES'] != null) { 
											echo $ctd_pedidos['PENDIENTES']; 
										} else { 
											echo "0"; 
										}	 
									?> 
								</h3>
								<p>Pedidos Pendientes (Carrito)</p>
							</div>
							<div class="icon">
								<i class="fa fa-shopping-cart"></i>
							</div>
							<a href="pedido.php" class="small-box-footer">Ver Pedidos de Carrito de Compras <i class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>

				
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-yellow">
							<div class="inner">
								<h3>
									<?php  
										if ($ctd_formulario['TOTAL'] != null) { 
											echo $ctd_formulario['TOTAL']; 
										} else { 
											echo "0"; 
										}	 
									?> 
								</h3>
								<p>Cons. del Formulario de Producto</p>
							</div>
							<div class="icon">
								<i class="fa fa-envelope-o"></i>
							</div>
							<a href="pedido_express.php" class="small-box-footer">Ver Pedidos de Boton "Consultar Producto" <i class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>

					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-aqua">
							<div class="inner">
								<h3>
									<?php  
										if ($ctd_formularioContacto['TOTAL'] != null) { 
											echo $ctd_formularioContacto['TOTAL']; 
										} else { 
											echo "0"; 
										}	 
									?> 
								</h3>
								<p>Cons. del Formulario de Contacto</p>
							</div>
							<div class="icon">
								<i class="fa fa-envelope-o"></i>
							</div>
							<a href="contacto.php" class="small-box-footer">Ver Consultas enviadas desde el Formulario de Contacto<i class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>



					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-green">
							<div class="inner">
								<h3>
									<?php  
										if ($ctd_clientes['TOTAL'] != null) { 
											echo $ctd_clientes['TOTAL']; 
										} else { 
											echo "0"; 
										}	 
									?> 
								</h3>
								<p>Clientes Registrados</p>
							</div>
							<div class="icon">
								<i class="fa fa-user"></i>
							</div>
							<a href="cliente.php" class="small-box-footer">Ver Clientes <i class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-red">
							<div class="inner">
								<h3> 
									<?php  
								//if ($ctd_productos['TOTAL'] != null) { 
											echo $ctd_productos['TOTAL']; 
										
								//} else { 
								//		echo "0"; 
								//	}	 
									?> 
								</h3> 
								<p>Productos Activos</p>
							</div>
							<div class="icon">
								<i class="fa fa-star"></i>
							</div>
							<a href="producto.php" class="small-box-footer">Ver Productos <i class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-yellow">
							<div class="inner">
								<h3> 
								<?php  
									if ($ctd_encuestas['TOTAL'] != null) { 
										echo $ctd_encuestas['TOTAL']; 
										
									} else { 
										echo "0"; 
									}	 
								?> 
									<!-- Encuesta -->
								</h3> 
								<p>¿Cuántas encuestas fueron contestadas?</p>
								<!-- <p>Que tan Satisfechos estan los clientes? </p> -->
							</div>
							<div class="icon">
								<i class="fa fa-bar-chart"></i>
							</div>
							<a href="encuesta.php" class="small-box-footer">Ver Resultados de Encensta <i class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
				</div>
				
			
			</section>

		</div> <!-- /.content-wrapper -->
		

		<!-- FOOTER -->
		<?php include "includes/footer.php"; ?>
		<!-- ./FOOTER -->
	</div> <!-- ./Contenido -->
	
	<!-- SCRIPTS (js) -->
	<script type="text/javascript">
		<?php include_once "mods/js/index.js"; ?>
	</script>
	<?php include "includes/scripts.php"; ?>
	<!-- ./SCRIPTS (js) -->
</body>
</html>
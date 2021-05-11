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
<body class="hold-transition skin-green sidebar-mini">
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
						<div class="small-box bg-yellow">
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
								<p>Pedidos Pendientes</p>
							</div>
							<div class="icon">
								<i class="fa fa-truck"></i>
							</div>
							<a href="pedido.php" class="small-box-footer">Ver Pedidos <i class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-yellow">
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
								<p>Clientes</p>
							</div>
							<div class="icon">
								<i class="fa fa-user"></i>
							</div>
							<a href="cliente.php" class="small-box-footer">Ver Clientes <i class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-yellow">
							<div class="inner">
								<h3> 
									<?php  
										if ($ctd_productos['EnStock'] != null) { 
											echo $ctd_productos['EnStock']; 
										} else { 
											echo "0"; 
										}	 
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
										if ($ctd_productos['OutStock'] != null) { 
											echo $ctd_productos['OutStock']; 
										} else { 
											echo "0"; 
										}	 
									?> 
								</h3> 
								<p>Productos Sin Stock</p>
							</div>
							<div class="icon">
								<i class="fa fa-star-o"></i>
							</div>
							<a href="producto.php" class="small-box-footer">Ver Productos <i class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
				</div>
				<div class="row">
            		<div class="col-md-6">
						<!-- Caja de Texto de color gris (Default) -->
						<div class="box">
							<div class="box-header with-border">
								<h3>Pedidos pendientes</h3>
							</div>
							<!-- Corpo de Caja -->
							<div class="box-body">
								<div class="box-body table-responsive">
									<table class="table table-striped table-bordered display nowra" id="tablapedidos">
									<thead>
										<tr>
											<th>Fecha</th>
											<th>Cliente</th>
											<th>Status</th>
										</tr>
									</thead>
									<tbody>
										<?php
											if ($pedidos_pendientes != null) {
												foreach ($pedidos_pendientes as $row) {	
										?>
										<tr onclick="window.location.href = 'pedido_detalle.php?pedido=<?php echo $row['id'];?>';">
											<td><?php echo substr($row['fecha'], 0, 10);?></td>
											<td><?php echo $row['nombre']." ".$row['apellido'];?></td>
											<td><?php echo $row['STATUS_PED'];?></td>
										</tr>
										<?php 
												} //END FOREACH
											} //END IF
										?>
									</tbody>
									</table>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.Caja de Texto de color gris (Default) -->
					</div>
					<div class="col-md-6">
						<!-- Caja de Texto de color gris (Default) -->
						<div class="box">
							<div class="box-header with-border">
								<h3>Los productos con menor Stock</h3>
							</div>
							<!-- Corpo de Caja -->
							<div class="box-body">
								<div class="box-body table-responsive">
									<table class="table table-striped table-bordered display nowra" id="tablastock">
									<thead>
										<tr>
											<th>Producto</th>
											<th>Stock</th>
										</tr>
									</thead>
										<tbody>
											<?php
												if ($productos_stock != null) {
													foreach ($productos_stock as $row) {	
											?>
											<tr>
												<td><?php echo $row['PROD'];?></td>
												<td><?php echo $row['stock'];?></td>
											</tr>
											<?php 
													} //END FOREACH
												} //END IF
											?>
										</tbody>
									</table>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.Caja de Texto de color gris (Default) -->
					</div>
				</div>
				<div class="row">
            		<div class="col-md-6">
						<!-- Caja de Texto de color gris (Default) -->
						<div class="box">
							<div class="box-header with-border">
								<h3>Los clientes que hacen más compras</h3>
							</div>
							<!-- Corpo de Caja -->
							<div class="box-body">
								<div class="box-body table-responsive">
									<table class="table table-striped table-bordered display nowra" id="tablacliente">
									<thead>
										<tr>
											<th>Cliente</th>
											<th>Ctd Pedidos</th>
										</tr>
									</thead>
									<tbody>
										<?php
											if ($pedidos_clientes != null) {
												foreach ($pedidos_clientes as $row) {	
										?>
										<tr>
											<td><?php echo $row['nombre']." ".$row['apellido'];?></td>
											<td><?php echo $row['TOTAL'];?></td>
										</tr>
										<?php 
												} //END FOREACH
											} //END IF
										?>
									</tbody>
									</table>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.Caja de Texto de color gris (Default) -->
					</div>
					<div class="col-md-6">
						<!-- Caja de Texto de color gris (Default) -->
						<div class="box">
							<div class="box-header with-border">
								<h3>Los productos más visitados</h3>
							</div>
							<!-- Corpo de Caja -->
							<div class="box-body">
								<div class="box-body table-responsive">
									<table class="table table-striped table-bordered display nowra" id="tablavisitas">
									<thead>
										<tr>
											<th>Producto</th>
											<th>Ctd de Visitas</th>
											<th>Ctd de Cliques</th>
										</tr>
									</thead>
										<tbody>
											<?php
												if ($productos_stock != null) {
													foreach ($productos_stock as $row) {	
											?>
											<tr>
												<td><?php echo $row['PROD'];?></td>
												<td><?php echo $row['unique_hits'];?></td>
												<td><?php echo $row['total_hits'];?></td>
											</tr>
											<?php 
													} //END FOREACH
												} //END IF
											?>
										</tbody>
									</table>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.Caja de Texto de color gris (Default) -->
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
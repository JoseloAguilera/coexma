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
<body class="hold-transition skin-green sidebar-mini">
	<div class="wrapper">
		<!-- MAIN HEADER -->
		<?php include 'includes/header.php'; ?>
		<!-- MAIN HEADER END -->

		<!-- ASIDE BAR -->
		<?php include 'includes/aside.php'; ?>
		<!-- ASIDE BAR END -->

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Cabicera de Contenido (Título) -->
			<section class="content-header">
				<h1>
					Consulta de las Transacciones de Pagopar
				</h1>
			</section>

			<!-- Contenido Principal -->
			<section class="content">
				<?php
				$transacciones = getAllTransactions();
				?>
				<!-- Caja de Texto de color gris (Default) -->
				<div class="box">
					<div class="box-header with-border">
						<!-- Botón para crear más cursos -->
						
					</div>
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
									<p>  <?php echo $mensaje; ?></p>
								</div>
							</div>
						</div>
					</div>
					<!-- Corpo de Caja -->
					<div class="box-body">
						<div class="box-body table-responsive">
							<table class="table table-striped table-bordered display nowra" id="tabladatos">
							<thead>
								<tr>
									<th>Id Pedido</th>
									<th>Cliente</th>
									<th>Pagado</th>
									<th>Forma de Pago</th>
									<th>Fecha de Pago</th>
									<th>Monto</th>
									<th>Nro. Pedido Pagopar</th>
									<th>Cancelado</th>
									<th>Accion</th>
								</tr>
							</thead>
							<tbody>
								<?php 
									if ($transacciones != null) { 
									   
										foreach ($transacciones as $row) {
										    
								?>
								<tr>
									<td><?php echo $row['id'];?></td>
									<td><?php echo $row['nombre']." ".$row['apellido'];?></td>
									<td> <?php  if($row['pagado']==1){
											echo "SI";
										}else{
											echo "NO";
										}
										?>
									</td>
									<td> <?php echo $row['forma_pago'];?>
									<td> <?php echo $row['fecha_pago'];?>
									<td> <?php echo $row['monto'];?>
									<td> <?php echo $row['numero_pedido'];?>
									<td> <?php  if($row['cancelado']==1){
											echo "SI";
										}else{
											echo "NO";
										}
										?>
									</td>
									<td><a class="btn btn-warning btn-sm" href="consulta_transaccion.php?hash=<?php echo $row['hash_pedido']; ?>"> <i class="fa fa-eye"></i></a><td>
									<!-- <td>0</td> -->
								</tr>
								<?php }}?>
							</tbody>
							</table>
						</div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.Caja de Texto de color gris (Default) -->

				<!-- AddModal -->
				<div class="modal fade" tabindex="-1" role="dialog" id="AddModal">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title">Nueva Marca</h4>
							</div>
							<form action="" method="POST" enctype="multipart/form-data" autocomplete="off">
								<div class="modal-body">
									<div class="row">
										<div class="col-md-5 text-center">
											<img src="img/marcas/no-image.png" class="img-fluid img-thumbnail img-modal" alt="no-image" id="img">
										</div>
										<div class="col-md-7">
											<div class="form-group">
												<label for="nombre">Nombre</label>
												<input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre de la Marca" maxlength="80" required>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label for="fileToUpload"></label>
												<input type="file"  name="fileToUpload" id="fileToUpload">
											</div>
										</div>
									</div> <!-- row -->
								</div> <!-- modal-body -->
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
									<button type="submit" class="btn btn-primary" name="nuevo">Guardar</button>
								</div>
							</form>
						</div><!-- /.modal-content -->
					</div><!-- /.modal-dialog -->
				</div><!-- /.modal -->
				<!-- ./AddModal -->	

				<!-- AltModal -->
				<div class="modal fade" tabindex="-1" role="dialog" id="AltModal">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title">Consulta en tiempo real</h4>
							</div>
							<form action="" method="POST" enctype="multipart/form-data" autocomplete="off">
								<div class="modal-body">
									<div class="row">
										<input type="hidden" class="form-control" id="codigo" name="codigo" required>
										<input type="hidden" class="form-control" id="imgurl" name="imgurl" required>
										<div class="col-md-5 text-center">
											<img src="img/marcas/no-image.png" class="img-fluid img-thumbnail img-modal" alt="no-image" id="img-alt">
										</div>
										<div class="col-md-7">
											<div class="form-group">
												<label for="nombre">Nombre</label>
												<input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre de la Categoría" maxlength="80" required>
											</div>
										</div>
										<div class="col-md-3">
											<label for="activo">Activo</label>
											<div class="row">
												<div class="col-md-12">
													<input type="checkbox" name="activo" id="activo" data-toggle="toggle" data-on="Sí" data-off="No" data-onstyle="success" data-offstyle="warning" data-width="100%" data-height="35" checked>
												</div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label for="fileToUpload"></label>
												<input type="file"  name="fileToUpload" id="fileToUpload">
											</div>
										</div>
									</div> <!-- row -->
								</div> <!-- modal-body -->
								<div class="modal-footer">
									<button type="button" class="btn btn-danger pull-left" name="excluir" id="btn-confirmar">Excluir</button>
									<button type="submit" class="btn" name="excluir" id="btn-excluir" style="display: none;">Submit Excluir</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
									<button type="submit" class="btn btn-primary" name="guardar">Guardar</button>
								</div>
							</form>
						</div><!-- /.modal-content -->
					</div><!-- /.modal-dialog -->
				</div><!-- /.modal -->
				<!-- ./AltModal -->	

				<!-- Confirmación Modal (para excluisiones) -->
				<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="mi-modal">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" id="myModalLabel">¿Deseas eliminar este registro?</h4>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" id="modal-btn-si">Sí</button>
								<button type="button" class="btn btn-primary" id="modal-btn-no">No</button>
							</div>
						</div>
					</div>
				</div>
				<!-- Confirmación Modal (para excluisiones) -->
			</section>
		</div> <!-- /.content-wrapper -->

		<!-- FOOTER -->
		<?php 
		include_once "mods/server/conn.php";
		function getAllTransactions () {
			$connection = conn();
			$sql = "SELECT transactions.*, tb_cliente.nombre, tb_cliente.apellido FROM transactions
					LEFT JOIN tb_cliente ON transactions.compradorId = tb_cliente.id
					ORDER BY transactions.id DESC";
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
		<?php include "includes/footer.php"; ?>
		<!-- ./FOOTER -->
	</div>
	<!-- ./Contenido -->

	<!-- SCRIPTS (js) -->
	<script type="text/javascript">
		<?php include_once "mods/js/consultapagopar.js"; ?>
	</script>
	<?php include "includes/scripts.php"; ?>
	<!-- ./SCRIPTS (js) -->
</body>
</html>
<?php 
	session_start();
	if (!isset($_SESSION['logueado'])) {
		header('Location: login.php');
	}
?>
<!DOCTYPE html>
<html>
<head>
    <title><?php echo $_SESSION['empresa'];?> | Cad. Clientes</title>
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

		<?php include_once "mods/objs/cliente.php";?>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Cabicera de Contenido (Título) -->
			<section class="content-header">
				<h1>
					Clientes
					<small>Registro de los clientes.</small>
				</h1>
			</section>

			<!-- Contenido Principal -->
			<section class="content">
				<div class="box">
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
									<th>Tipo</th>
									<th>Nombre Completo</th>
									<th>Razón Social</th>
									<th>Tipo Documento</th>
									<th>Nro Documento</th>
									<th>Telefono</th>
									<th>Email</th>
								</tr>
							</thead>
							<tbody>
                                <?php 
									if ($clientes != null) { 
										foreach ($clientes as $row) {											
								?>
								<tr data-toggle="modal" data-target="#AltModal" data-codigo="<?php echo $row['id'];?>" data-nombre="<?php echo $row['nombre'];?>" data-apellido="<?php echo $row['apellido'];?>" data-razon="<?php echo $row['razon_social'];?>" data-tipo="<?php echo $row['ruc'];?>" data-numero="<?php echo $row['documento'];?>" data-mayorista="<?php echo $row['mayorista'];?>"; data-telefono="<?php echo $row['telefono'];?>" data-email="<?php echo $row['email'];?>">
									<td>
										<?php 
											$mayorista = "";
											if ($row['mayorista'] == 0) {
												$mayorista = "Minorista";
											} else {
												$mayorista = "Mayorista";
											}
											echo $mayorista;?>
									</td>
									<td><?php echo $row['nombre']." ".$row['apellido'];?></td>
									<td><?php echo $row['razon_social'];?></td>
									<td><?php echo $row['ruc'];?></td>
									<td>
										<?php 
											$nro_documento = "";
											if ($row['ruc'] == "RUC") {
												$lastnum = strlen($row['documento']) - 1;
												$nro_documento = substr($row['documento'],0,$lastnum)."-".substr($row['documento'],$lastnum,1);
											} else if ($row['ruc'] == "CI") {
												$nro_documento = $row['documento'];
											} else {
												$nro_documento = $row['documento'];
											}
											echo $nro_documento;?>
									</td>
									<td><?php echo $row['telefono'];?></td>
									<td><?php echo $row['email'];?></td>
								</tr>
								<?php }}?>
							</tbody>
							</table>
						</div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.Caja de Texto de color gris (Default) -->

				<!-- AltModal -->
				<div class="modal fade" tabindex="-1" role="dialog" id="AltModal">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title">Cliente</h4>
							</div>
							<form action="" method="POST" autocomplete="off">
								<div class="modal-body">
									<div class="row">
										<input type="hidden" class="form-control" id="codigo" name="codigo" required>
										<div class="col-md-6">
											<div class="form-group">
												<label for="nombre">Nombre</label>
												<input type="text" class="form-control" id="nombre" value="" readonly>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="nombre">Apellido</label>
												<input type="text" class="form-control" id="apellido" value="" readonly>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label for="nombre">Razón Social</label>
												<input type="text" class="form-control" id="razon" value="" readonly>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-3">
											<div class="form-group">
												<label for="nombre">Tipo Doc.</label>
												<input type="text" class="form-control" id="tipo" value="" readonly>
											</div>
										</div>
										<div class="col-md-5">
											<div class="form-group">
												<label for="nombre">Número Doc.</label>
												<input type="text" class="form-control" id="numero" value="" readonly>
											</div>
										</div>
										<div class="col-md-4">
											<label for="activo">Tipo</label>
											<div class="row">
												<div class="col-md-12">
													<input type="checkbox" id="toggle" name="mayorista" data-toggle="toggle" data-on="Mayorista" data-off="Minorista" data-onstyle="success" data-offstyle="warning" data-width="100%" data-height="35">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<label for="telefono">Telefono</label>
												<input type="text" class="form-control" id="telefono" value="" readonly>
											</div>
										</div>
										<div class="col-md-8">
											<div class="form-group">
												<label for="email">Email</label>
												<input type="text" class="form-control" id="email" value="" readonly>
											</div>
										</div>
									</div> <!-- row --> 
								</div> <!-- modal-body -->
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
									<button type="submit" class="btn btn-primary" name="guardar">Guardar</button>
								</div>
							</form>
						</div><!-- /.modal-content -->
					</div><!-- /.modal-dialog -->
				</div><!-- /.modal -->
				<!-- ./AltModal -->	
			</section>
		</div> <!-- /.content-wrapper -->

		<!-- FOOTER -->
		<?php include "includes/footer.php"; ?>
		<!-- ./FOOTER -->
	</div>
	<!-- ./Contenido -->

	<!-- SCRIPTS (js) -->
	<script type="text/javascript">
		<?php include_once "mods/js/cliente.js"; ?>
	</script>
	<?php include "includes/scripts.php"; ?>
	<!-- ./SCRIPTS (js) -->
</body>
</html>
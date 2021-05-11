<?php 
	session_start();
	if (!isset($_SESSION['logueado'])) {
		header('Location: login.php');
	}
?>
<!DOCTYPE html>
<html>
<head>
    <title><?php echo $_SESSION['empresa'];?> | Cad. Atributos</title>
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

		<?php include_once "mods/objs/atributo.php";?>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Cabicera de Contenido (Título) -->
			<section class="content-header">
				<h1>
					Atributos
					<small>Registro de los atributos de los productos y sus respectivos valores.</small>
				</h1>
			</section>

			<!-- Contenido Principal -->
			<section class="content">				
				<!-- Caja de Texto de color gris (Default) -->
				<div class="box">
					<div class="box-header with-border">
						<!-- Botón para crear más cursos -->
						<div class="col-md-3 pull-left">
							<button id="btnAdd" type="button" class="btn btn-primary" data-toggle="modal" data-target="#AddModal" style="margin-bottom: 5px;">+ Nueva</button>
						</div>
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
									<th>Atributo</th>
									<th>Valor</th>
									<th>Activo</th>
								</tr>
							</thead>
							<tbody>
								<?php 
									if ($atributos != null) { 
										foreach ($atributos as $row) {
											$valores = getAtributosValores($row['id']);
											$tableVlr = "";
											if ($valores != null) {
												foreach ($valores as $linea) {
													if ($tableVlr == "") {
														$tableVlr = $linea['id'].";".$linea['nombre'].";".$linea['activo'];
													} else {
														$tableVlr = $tableVlr."*".$linea['id'].";".$linea['nombre'].";".$linea['activo'];
													}
												}
											} 
								?>
								<tr data-toggle="modal" data-target="#AltModal" data-codigo="<?php echo $row['id'];?>" data-nombre="<?php echo $row['nombre'];?>" data-activo="<?php echo $row['activo'];?>" data-valores="<?php echo $tableVlr;?>">
									<td><?php echo $row['nombre'];?></td>
									<td>
									<?php 
										$valores = getAtributosValores($row['id']);
										if ($valores != null) {
											foreach ($valores as $linea) {
												echo $linea['nombre']."<br>";
											}
										}
									?>
									</td>
									<td>
									<?php
										$circle_color = "";
										if ($row['activo'] == 1) {
											echo '<span style="color: white">S</span><i class="fa fa-check text-success"></i>';
										} else {
											echo '<span style="color: white">N</span><i class="fa fa-close text-danger"></i>';
										}
									?>
									</td>
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
								<h4 class="modal-title">Nuevo Atributo</h4>
							</div>
							<form action="" method="POST" autocomplete="off">
								<div class="modal-body">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label for="nombre">Nombre</label>
												<input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del Atributo" maxlength="80" required>
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
								<h4 class="modal-title">Alteración Atributo</h4>
							</div>
							<form action="" method="POST" autocomplete="off">
								<div class="modal-body">
									<div class="row">
										<input type="hidden" class="form-control" id="codigo" name="codigo" required>
										<div class="col-md-9">
											<div class="form-group">
												<label for="nombre">Nombre</label>
												<input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del Atributo" maxlength="80" required>
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
									</div><!-- row -->
									<div class="row">
										<div class="col-md-12 text-center">
											<h4><b>Valores</b></h4>		
										</div> <!-- col-md-12 -->
										<div class="col-md-12">
											<table class="table table-striped" id="tbvalores">
												<thead>
													<tr class="active">
														<th>Nombre</th>
														<th>Activo</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
											</table>
										</div> <!-- col-md-12 -->
										<div class="col-md-12 text-center">
											<button type="button" class="btn btn-primary" id="nuevovlr" data-toggle="modal" data-target="#AddValorModal" data-codigo="">Nuevo Valor</button>
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

				<!-- AddValorModal -->
				<div class="modal fade" tabindex="-1" role="dialog" id="AddValorModal">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title">Nuevo Valor</h4>
							</div>
							<form action="" method="POST" autocomplete="off">
								<input type="hidden" class="form-control" id="codigo" name="codigo" required>
								<div class="modal-body">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label for="nombre">Nombre</label>
												<input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del Atributo" maxlength="80" required>
											</div>
										</div>
									</div> <!-- row -->
								</div> <!-- modal-body -->
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
									<button type="submit" class="btn btn-primary" name="nuevovlr">Guardar</button>
								</div>
							</form>
						</div><!-- /.modal-content -->
					</div><!-- /.modal-dialog -->
				</div><!-- /.modal -->
				<!-- ./AddValorModal -->
				
				<!-- AltModal -->
				<div class="modal fade" tabindex="-1" role="dialog" id="AltValorModal">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title">Alteración Valor</h4>
							</div>
							<form action="" method="POST" autocomplete="off">
								<div class="modal-body">
									<div class="row">
										<input type="hidden" class="form-control" id="codigo" name="codigo" required>
										<div class="col-md-9">
											<div class="form-group">
												<label for="nombre">Nombre</label>
												<input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del Atributo" maxlength="80" required>
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
									</div><!-- row -->
								</div> <!-- modal-body -->
								<div class="modal-footer">
									<button type="button" class="btn btn-danger pull-left" name="excluir" id="btn-confirmar-vlr">Excluir</button>
									<button type="submit" class="btn" name="excluirvlr" id="btn-excluir-vlr" style="display: none;">Submit Excluir</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
									<button type="submit" class="btn btn-primary" name="guardarvlr">Guardar</button>
								</div>
							</form>
						</div><!-- /.modal-content -->
					</div><!-- /.modal-dialog -->
				</div><!-- /.modal -->
				<!-- ./AltModal -->	

				<!-- Confirmación Modal (para excluisiones) -->
				<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="mi-modal-vlr">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" id="myModalLabel">¿Deseas eliminar este registro?</h4>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" id="modal-btn-si-vlr">Sí</button>
								<button type="button" class="btn btn-primary" id="modal-btn-no-vlr">No</button>
							</div>
						</div>
					</div>
				</div>
				<!-- Confirmación Modal (para excluisiones) -->

			</section>
		</div> <!-- /.content-wrapper -->

		<!-- FOOTER -->
		<?php include "includes/footer.php"; ?>
		<!-- ./FOOTER -->
	</div>
	<!-- ./Contenido -->

	<!-- SCRIPTS (js) -->
	<script type="text/javascript">
		<?php include_once "mods/js/atributo.js"; ?>
	</script>
	<?php include "includes/scripts.php"; ?>
	<!-- ./SCRIPTS (js) -->
</body>
</html>
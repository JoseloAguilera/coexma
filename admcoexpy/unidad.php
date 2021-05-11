<?php 
	session_start();
	if (!isset($_SESSION['logueado'])) {
		header('Location: login.php');
	}
?>
<!DOCTYPE html>
<html>
<head>
    <title><?php echo $_SESSION['empresa'];?> | Cad. Unidad</title>
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
                    Unidad
					<small>Registro de las sucursales.</small>
				</h1>
			</section>

			<!-- Contenido Principal -->
			<section class="content">
				<?php include_once "mods/objs/unidad.php";?>
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
									<th></th>
									<th>Nombre</th>
                                    <th>Dirección</th>
                                    <th>Horarios</th>
                                    <th>Teléfonos</th>
									<th>Activo</th>
								</tr>
							</thead>
							<tbody>
								<?php 
									if ($unidades != null) { 
										foreach ($unidades as $row) {
                                            if (file_exists('../img/unidades/'.$row['img_url'])) {
                                                $url = $row['img_url'];
                                            } else {
                                                $url = "no-image.png";
                                            } 
								?>
								<tr data-toggle="modal" data-target="#AltModal" data-codigo="<?php echo $row['id'];?>" data-nombre="<?php echo $row['nombre'];?>" data-url="<?php echo $url;?>" data-direccion="<?php echo $row['direccion'];?>" data-telefonos="<?php echo $row['telefonos'];?>" data-horarios="<?php echo $row['horarios'];?>" data-activo="<?php echo $row['activo'];?>">
                                    <td><img src="../img/unidades/<?php echo $url;?>" class="img-fluid img-thumbnail" alt="unidad" style="max-width: 150px;"></td>
									<td> <?php echo $row['nombre'];?>
                                    <td> <?php echo $row['direccion'];?>
                                    <td> <?php echo $row['horarios'];?>
                                    <td> <?php echo $row['telefonos'];?>
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
								<h4 class="modal-title">Nueva Unidad</h4>
							</div>
							<form action="" method="POST" enctype="multipart/form-data" autocomplete="off">
								<div class="modal-body">
									<div class="row">
										<div class="col-md-5 text-center">
											<img src="../img/unidades/no-image.png" class="img-fluid img-thumbnail img-modal" alt="no-image" id="img">
										</div>
										<div class="col-md-7">
											<div class="form-group">
												<label for="nombre">Nombre</label>
												<input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre de la Unidad" maxlength="80" required>
											</div>
										</div>
                                        <div class="col-md-7">
											<div class="form-group">
                                                <label for="direccion">Dirección</label>
                                                <textarea class="form-control" rows="4" id="direccion" name="direccion" placeholder="Dirección de la Unidad" maxlength="255"></textarea>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label for="fileToUpload"></label>
												<input type="file"  name="fileToUpload" id="fileToUpload">
											</div>
										</div>
                                        <div class="col-md-12">
											<div class="form-group">
												<label for="telefonos">Teléfonos</label>
												<input type="text" class="form-control" id="telefonos" name="telefonos" placeholder="Teléfonos de la Unidad" maxlength="80" required>
											</div>
										</div>
                                        <div class="col-md-12">
											<div class="form-group">
                                                <label for="horarios">Horarios de Atención</label>
                                                <textarea class="form-control" rows="3" id="horarios" name="horarios" placeholder="Horarios de Atención de la Unidad" maxlength="255"></textarea>
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
								<h4 class="modal-title">Alteración Unidad</h4>
							</div>
							<form action="" method="POST" enctype="multipart/form-data" autocomplete="off">
								<div class="modal-body">
									<div class="row">
										<input type="hidden" class="form-control" id="codigo" name="codigo" required>
										<input type="hidden" class="form-control" id="imgurl" name="imgurl" required>
										<div class="col-md-5 text-center">
											<img src="../img/unidades/no-image.png" class="img-fluid img-thumbnail img-modal" alt="no-image" id="img-alt">
										</div>
										<div class="col-md-7">
											<div class="form-group">
												<label for="nombre">Nombre</label>
												<input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre de la Categoría" maxlength="80" required>
											</div>
										</div>
                                        <div class="col-md-7">
											<div class="form-group">
                                                <label for="direccion">Dirección</label>
                                                <textarea class="form-control" rows="4" id="direccion" name="direccion" placeholder="Dirección de la Unidad" maxlength="255"></textarea>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label for="fileToUpload"></label>
												<input type="file"  name="fileToUpload" id="fileToUpload">
											</div>
										</div>
                                        <div class="col-md-9">
											<div class="form-group">
												<label for="telefonos">Teléfonos</label>
												<input type="text" class="form-control" id="telefonos" name="telefonos" placeholder="Teléfonos de la Unidad" maxlength="80" required>
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
                                                <label for="horarios">Horarios de Atención</label>
                                                <textarea class="form-control" rows="3" id="horarios" name="horarios" placeholder="Horarios de Atención de la Unidad" maxlength="255"></textarea>
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
		<?php include "includes/footer.php"; ?>
		<!-- ./FOOTER -->
	</div>
	<!-- ./Contenido -->

	<!-- SCRIPTS (js) -->
	<script type="text/javascript">
		<?php include_once "mods/js/unidad.js"; ?>
	</script>
	<?php include "includes/scripts.php"; ?>
	<!-- ./SCRIPTS (js) -->
</body>
</html>
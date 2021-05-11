<?php 
	session_start();
	if (!isset($_SESSION['logueado'])) {
		header('Location: login.php');
	}
?>
<!DOCTYPE html>
<html>
<head>
    <title><?php echo $_SESSION['empresa'];?> | Cad. Vendedores</title>
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
					Vendedores
					<small>Registro de los vendedores de la tienda.</small>
				</h1>
			</section>

			<!-- Contenido Principal -->
			<section class="content">
				<?php include_once "mods/objs/vendedor.php";?>
				<!-- Caja de Texto de color gris (Default) -->
				<div class="box">
					<div class="box-header with-border">
						<!-- Botón para crear más cursos -->
						<div class="col-md-3 pull-left">
							<button id="btnAdd" type="button" class="btn btn-primary" data-toggle="modal" data-target="#AddModal" style="margin-bottom: 5px;">+ Nuevo</button>
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
									<th>Unidad</th>
									<th>Nombre</th>
									<th>Email</th>
                                    <th>Telefono</th>
                                    <th>Whatsapp</th>
								</tr>
							</thead>
							<tbody>
								<?php 
									if ($vendedores != null) { 
										foreach ($vendedores as $row) {
                                ?>
								<tr data-toggle="modal" data-target="#AltModal" data-codigo="<?php echo $row['id'];?>" data-foto="<?php echo $row['foto'];?>" data-nombre="<?php echo $row['nombre'];?>" data-email="<?php echo $row['email'];?>" data-telefonoa="<?php echo $row['telefono_a'];?>" data-telefonob="<?php echo $row['telefono_b'];?>" data-skype="<?php echo $row['skype'];?>" data-whatsapp="<?php echo $row['whatsapp'];?>" data-unidad="<?php echo $row['unidad'];?>" data-espanol="<?php echo $row['espanol'];?>" data-portugues="<?php echo $row['portugues'];?>" data-ingles="<?php echo $row['ingles'];?>">
									<td><?php echo $row['UNIDAD'];?></td>
									<td><?php echo $row['nombre'];?></td>
									<td><?php echo $row['email'];?></td>
                                    <td><?php echo $row['telefono_a']." / ".$row['telefono_b'];?></td>
                                    <td><?php echo $row['whatsapp'];?></td>
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
								<h4 class="modal-title">Nuevo Vendedor</h4>
							</div>
							<form action="" method="POST" enctype="multipart/form-data" autocomplete="off">
								<div class="modal-body">
									<div class="row">
									<input type="hidden" class="form-control" id="imgurl" name="imgurl" required>
										<div class="row">
											<div class="col-md-3"></div>
											<div class="col-md-6 text-center">
												<img src="../img/vendedores/no-image.png" class="img-fluid img-thumbnail" style="width: 250px; height: 250px;" alt="no-image" id="img">
											</div>
											<div class="col-md-3"></div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label for="fileToUpload"></label>
												<input type="file"  name="fileToUpload" id="fileToUpload">
											</div>
										</div>
										<div class="col-md-8">
											<div class="form-group">
												<label for="nombre">Nombre</label>
												<input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del Vendedor" maxlength="80" required>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="unidad">Unidad</label>
												<select class="selectpicker" id="unidad" name="unidad" data-width="100%">
													<?php
														if ($unidades != null) {
															foreach ($unidades as $row) {	
													?>
																<option value="<?php echo $row['id'];?>"><?php echo $row['nombre'];?></option> 
													        <?php 
															} //END FOREACH
														} //END IF
													?>
												</select>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="email">Email</label>
												<input type="email" class="form-control" id="email" name="email" placeholder="Email de Contacto del Vendedor" maxlength="80" required>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="skype">Skype</label>
												<input type="text" class="form-control" id="skype" name="skype" placeholder="Usuario Skype del Vendedor" maxlength="80">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="telefonoa">Telefono 1</label>
												<input type="text" class="form-control" id="telefonoa" name="telefonoa" placeholder="Contacto Nro.1" maxlength="80">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="telefonob">Telefono 2</label>
												<input type="text" class="form-control" id="telefonob" name="telefonob" placeholder="Contacto Nro.2" maxlength="80">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="whatsapp">Whatsapp</label>
												<input type="text" class="form-control" id="whatsapp" name="whatsapp" placeholder="Contacto Whatsapp" maxlength="80">
											</div>
										</div>
										<div class="col-md-4">
											<label for="espanol">Habla Español</label>
											<div class="row">
												<div class="col-md-12">
													<input type="checkbox" name="espanol" id="espanol" data-toggle="toggle" data-on="Sí" data-off="No" data-onstyle="success" data-offstyle="warning" data-width="100%" data-height="35" checked>
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<label for="portugues">Habla Portugués</label>
											<div class="row">
												<div class="col-md-12">
													<input type="checkbox" name="portugues" id="portugues" data-toggle="toggle" data-on="Sí" data-off="No" data-onstyle="success" data-offstyle="warning" data-width="100%" data-height="35">
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<label for="ingles">Habla Inglés</label>
											<div class="row">
												<div class="col-md-12">
													<input type="checkbox" name="ingles" id="ingles" data-toggle="toggle" data-on="Sí" data-off="No" data-onstyle="success" data-offstyle="warning" data-width="100%" data-height="35">
												</div>
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
								<h4 class="modal-title">Alteración Vendedor</h4>
							</div>
							<form action="" method="POST" enctype="multipart/form-data" autocomplete="off">
								<div class="modal-body">
									<div class="row">
										<input type="hidden" class="form-control" id="codigo" name="codigo" required>
										<input type="hidden" class="form-control" id="imgurl" name="imgurl" required>
										<div class="row text-center">
											<div class="col-md-3"></div>
											<div class="col-md-6 text-center">
												<img src="../img/vendedores/no-image.png" class="img-fluid img-thumbnail" style="width: 250px; height: 250px;" alt="no-image" id="img-alt">
											</div>
											<div class="col-md-3"></div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label for="fileToUpload"></label>
												<input type="file"  name="fileToUpload" id="fileToUpload">
											</div>
										</div>
										<div class="col-md-8">
											<div class="form-group">
												<label for="nombre">Nombre</label>
												<input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del Vendedor" maxlength="80" required>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="unidad">Unidad</label>
												<select class="selectpicker" id="unidad" name="unidad" data-width="100%">
													<?php
														if ($unidades != null) {
															foreach ($unidades as $row) {	
													?>
																<option value="<?php echo $row['id'];?>"><?php echo $row['nombre'];?></option> 
													        <?php 
															} //END FOREACH
														} //END IF
													?>
												</select>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="email">Email</label>
												<input type="email" class="form-control" id="email" name="email" placeholder="Email de Contacto del Vendedor" maxlength="80" required>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="skype">Skype</label>
												<input type="text" class="form-control" id="skype" name="skype" placeholder="Usuario Skype del Vendedor" maxlength="80">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="telefonoa">Telefono 1</label>
												<input type="text" class="form-control" id="telefonoa" name="telefonoa" placeholder="Contacto Nro.1" maxlength="80">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="telefonob">Telefono 2</label>
												<input type="text" class="form-control" id="telefonob" name="telefonob" placeholder="Contacto Nro.2" maxlength="80">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="whatsapp">Whatsapp</label>
												<input type="text" class="form-control" id="whatsapp" name="whatsapp" placeholder="Contacto Whatsapp" maxlength="80">
											</div>
										</div>
										<div class="col-md-4">
											<label for="espanol">Habla Español</label>
											<div class="row">
												<div class="col-md-12">
													<input type="checkbox" name="espanol" id="espanol-alt" data-toggle="toggle" data-on="Sí" data-off="No" data-onstyle="success" data-offstyle="warning" data-width="100%" data-height="35" checked>
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<label for="portugues">Habla Portugués</label>
											<div class="row">
												<div class="col-md-12">
													<input type="checkbox" name="portugues" id="portugues-alt" data-toggle="toggle" data-on="Sí" data-off="No" data-onstyle="success" data-offstyle="warning" data-width="100%" data-height="35">
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<label for="ingles">Habla Inglés</label>
											<div class="row">
												<div class="col-md-12">
													<input type="checkbox" name="ingles" id="ingles-alt" data-toggle="toggle" data-on="Sí" data-off="No" data-onstyle="success" data-offstyle="warning" data-width="100%" data-height="35">
												</div>
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
		<?php include_once "mods/js/vendedor.js"; ?>
	</script>
	<?php include "includes/scripts.php"; ?>
	<!-- ./SCRIPTS (js) -->
</body>
</html>
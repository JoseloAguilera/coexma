<?php 

	session_start();

	if (!isset($_SESSION['logueado'])) {

		header('Location: login.php');

	}

?>

<!DOCTYPE html>

<html>

<head>

    <title><?php echo $_SESSION['empresa'];?> | Productos del Bloque</title>

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



		<?php include_once "mods/objs/bloques_producto.php";?>

		<!-- Content Wrapper. Contains page content -->

		<div class="content-wrapper">

			<!-- Cabicera de Contenido (Título) -->

			<section class="content-header">

				<h1>

					Productos en Bloque

					<small>Seleccion de productos en el bloque</small>

				</h1>

			</section>



			<!-- Contenido Principal -->

			<section class="content">

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

									<!-- <th>Tipo</th> -->

									<th>Id Bloque</th>

									<th>Ubicación</th>

									<th>Titulo</th>

									<th>Id Producto</th>

									<th>Ref. Producto</th>

									<th>Producto</th>


								</tr>

							</thead>

							<tbody>

                                <?php 

									if ($bloques_productos != null) { 

										foreach ($bloques_productos as $row) {											

								?>

								<tr data-toggle="modal" data-target="#AltModal" data-codigo_bloque="<?php echo $row['id_bloque'];?>" data-id_producto="<?php echo $row['id'];?>" >

									<!-- <td>

										<?php 

											// $mayorista = "";

											// if ($row['mayorista'] == 0) {

											// 	$mayorista = "Minorista";

											// } else {

											// 	$mayorista = "Mayorista";

											// }

											// echo $mayorista;

										?>

									</td> -->

									<td><?php echo $row['id_bloque'];?></td>

									<td><?php echo $row['ubicacion'];?></td>

									<td><?php echo $row['titulo'];?></td>

									<td><?php echo $row['id'];?></td>

									<td><?php echo $row['referencia'];?></td>

									<td><?php echo $row['nombre'];?></td>


									
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

								<h4 class="modal-title">Nuevo Producto en Bloque
								</h4>

							</div>

							<form action="" method="POST" enctype="multipart/form-data" autocomplete="off">

								<div class="modal-body">

									<div class="row">

										<div class="col-md-12">

											<div class="form-group">

												<label for="bloques">Bloque</label>

												<select class="selectpicker" id="codigo_bloque" name="codigo_bloque" data-width="100%">

													<?php

														if ($bloques != null) {

															foreach ($bloques as $row) {	

													?>

																<option value="<?php echo $row['id'];?>"><?php echo $row['titulo']." en ".$row['ubicacion'];?></option> 

													        <?php 

															} //END FOREACH

														} //END IF

													?>

												</select>

											</div>

										</div>
										<div class="col-md-12">

											<div class="form-group">

												<label for="bloques">Producto</label>

												<select class="selectpicker" id="codigo_producto" name="codigo_producto" data-width="100%" data-live-search="true">
													
													
													<?php

														if ($productos != null) {

															foreach ($productos as $row) {	

													?>

																<option value="<?php echo $row['id'];?>"><?php echo $row['referencia']." - ".$row['nombre'];?></option> 

													        <?php 

															} //END FOREACH

														} //END IF

													?>

												</select>

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

				<!-- ./AddModal -->	



				<!-- AltModal -->

				<div class="modal fade" tabindex="-1" role="dialog" id="AltModal">

					<div class="modal-dialog" role="document">

						<div class="modal-content">

							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

								<h4 class="modal-title">Producto en Bloque</h4>

							</div>

							<form action="" method="POST" enctype="multipart/form-data" autocomplete="off">

								<div class="modal-body">

									<div class="row">

										<!--input type="hidden" class="form-control" id="codigo_bloque" name="codigo_bloque" required>

										<input type="hidden" class="form-control" id="codigo_producto" name="codigo_producto" required-->

										<div class="col-md-12">

											<div class="form-group">

												<label for="bloques">Bloque</label>

												<select class="selectpicker" id="codigo_bloque" name="codigo_bloque" data-width="100%">

													<?php

														if ($bloques != null) {

															foreach ($bloques as $row) {	

													?>

																<option value="<?php echo $row['id'];?>"><?php echo $row['titulo']." en ".$row['ubicacion'];?></option> 

													        <?php 

															} //END FOREACH

														} //END IF

													?>

												</select>

											</div>

										</div>
										<div class="col-md-12">

											<div class="form-group">

												<label for="bloques">Producto</label>

												<select class="selectpicker" id="codigo_producto" name="codigo_producto" data-width="100%" data-live-search="true">
													
													
													<?php

														if ($productos != null) {

															foreach ($productos as $row) {	

													?>

																<option value="<?php echo $row['id'];?>"><?php echo $row['referencia']." - ".$row['nombre'];?></option> 

													        <?php 

															} //END FOREACH

														} //END IF

													?>

												</select>

											</div>

										</div>

									</div> <!-- row -->

								</div> <!-- modal-body -->

								<div class="modal-footer">

									<button type="button" class="btn btn-danger pull-left" name="excluir" id="btn-confirmar">Excluir</button>

									<button type="submit" class="btn" name="excluir" id="btn-excluir" style="display: none;">Submit Excluir</button>

									<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>

									<!--button type="submit" class="btn btn-primary" name="guardar">Guardar</button-->

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

		<?php include_once "mods/js/bloques_producto.js"; ?>

	</script>

	<?php include "includes/scripts.php"; ?>
	
	<!-- ./SCRIPTS (js) -->


</body>

</html>
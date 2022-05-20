<?php 

	session_start();

	if (!isset($_SESSION['logueado'])) {

		header('Location: login.php');

	}

?>

<!DOCTYPE html>

<html>

<head>

    <title><?php echo $_SESSION['empresa'];?> | Bloques</title>

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



		<?php include_once "mods/objs/bloques.php";?>

		<!-- Content Wrapper. Contains page content -->

		<div class="content-wrapper">

			<!-- Cabicera de Contenido (Título) -->

			<section class="content-header">

				<h1>

					Bloques

					<small>Configuración de los bloques</small>

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

									<!-- <th>Tipo</th> -->

									<!--th>ID</th-->

									<th>Ubicación</th>

									<th>Posicion</th>

									<th>Titulo</th>

									<th>Descripcion</th>

									<th>Color Fondo</th>

									<th>Color Titulo</th>

									<th>Color Desc.</th>

									<th>Activo</th>

								</tr>

							</thead>

							<tbody>

                                <?php 

									if ($bloques != null) { 

										foreach ($bloques as $row) {											

								?>

								<tr data-toggle="modal" data-target="#AltModal" data-codigo="<?php echo $row['id'];?>" data-ubicacion="<?php echo $row['ubicacion'];?>" data-titulo="<?php echo $row['titulo'];?>" data-descripcion="<?php echo $row['descripcion'];?>" data-fondo="<?php echo $row['fondo'];?>" data-color_tit="<?php echo $row['color_tit'];?>" data-color_desc="<?php echo $row['color_desc'];?>"; data-activo="<?php echo $row['activo'];?>" data-posicion="<?php echo $row['posicion'];?>">

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

									<!--td><?php //echo $row['id'];?></td-->

									<td><?php echo $row['ubicacion'];?></td>

									<td><?php echo $row['posicion'];?></td>

									<td><?php echo $row['titulo'];?></td>

									<td><?php echo $row['descripcion'];?></td>

									<td><?php echo $row['fondo'];?></td>

									<td><?php echo $row['color_tit'];?></td>

									<td><?php echo $row['color_desc'];?></td>

									<td>
										<?php

											$circle_color = "";

											if ($row['activo'] == 1) {

												echo '<span style="color: white">S</span><i class="fa fa-check text-success"></i>';

											} else {

												echo '<span style="color: white">N</span><i class="fa fa-close text-danger"></i>';

											}

										?>
									<td>
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

								<h4 class="modal-title">Bloques</h4>

							</div>

							<form action="" method="POST" autocomplete="off">

								<div class="modal-body">

									<div class="row">

										<input type="hidden" class="form-control" id="codigo" name="codigo" required>

										<div class="col-md-6">

											<div class="form-group">

												<label for="ubicacion">Ubicacion</label>

												<input type="text" readonly="readonly" class="form-control" id="ubicacion" value="" name="ubicacion">

											</div>

										</div>

										<div class="col-md-6">
											<div class="form-group">

												<label for="tipo">Posicion</label>

												<select class="selectpicker" id="posicion" name="posicion" data-width="100%" >

													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>

												</select>

											</div>

										</div>

									</div>

									<div class="row">

										<div class="col-md-12">

											<div class="form-group">

												<label for="titulo">Título</label>

												<input type="text" class="form-control" id="titulo" value="" name="titulo">

											</div>

										</div>

										<div class="col-md-12">

											<div class="form-group">

												<label for="descripcion">Descripcion</label>

												<input type="text" class="form-control" id="descripcion" value="" name="descripcion">

											</div>

										</div>

									</div>

									<div class="row">

										<div class="col-md-3">

											<div class="form-group">

												<label for="nombre">C. Fondo</label>

												<input type="color" class="form-control" id="fondo" value="" name="fondo">

											</div>

										</div>

										<div class="col-md-3">

											<div class="form-group">

												<label for="nombre">C. Titulo</label>

												<input type="color" class="form-control" id="color_tit" value="" name="color_tit">

											</div>

										</div>

										<div class="col-md-3">

											<div class="form-group">

												<label for="nombre">C. Desc.</label>

												<input type="color" class="form-control" id="color_desc" value="" name="color_desc">

											</div>

										</div>

										<!-- <div class="col-md-4">

											<label for="activo">Tipo</label>

											<div class="row">

												<div class="col-md-12">

													<input type="checkbox" id="toggle" name="mayorista" data-toggle="toggle" data-on="Mayorista" data-off="Minorista" data-onstyle="success" data-offstyle="warning" data-width="100%" data-height="35">

												</div>

											</div>

										</div> -->

										<div class="col-md-3">

											<label for="activo">Activo</label>

											<div class="row">

												<div class="col-md-12">

													<input type="checkbox" name="activo" id="activo" data-toggle="toggle" data-on="Sí" data-off="No" data-onstyle="success" data-offstyle="warning" data-width="100%" data-height="35" checked>

												</div>

											</div>

										</div>
									</div>

									

								</div> <!-- modal-body -->

								<div class="modal-footer">

									<!--button type="button" class="btn btn-danger pull-left" name="excluir" id="btn-confirmar">Excluir</button-->

									<!--button type="submit" class="btn" name="excluir" id="btn-excluir" style="display: none;">Submit Excluir</button-->

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

			</section>

		</div> <!-- /.content-wrapper -->



		<!-- FOOTER -->

		<?php include "includes/footer.php"; ?>

		<!-- ./FOOTER -->

	</div>

	<!-- ./Contenido -->



	<!-- SCRIPTS (js) -->

	<script type="text/javascript">

		<?php include_once "mods/js/bloques.js"; ?>

	</script>

	<?php include "includes/scripts.php"; ?>

	<!-- ./SCRIPTS (js) -->

</body>

</html>
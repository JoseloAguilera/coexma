<?php 

	session_start();

	if (!isset($_SESSION['logueado'])) {

		header('Location: login.php');

	}

?>

<!DOCTYPE html>

<html>

<head>

    <title><?php echo $_SESSION['empresa'];?> | Pedidos</title>

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



		<?php include_once "mods/objs/pedido.php";?>

		<!-- Content Wrapper. Contains page content -->

		<div class="content-wrapper">

			<!-- Cabicera de Contenido (Título) -->

			<section class="content-header">

				<h1>

					Pedidos

					<small>Registro de los pedidos de los clientes.</small>

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

									<th>Nro.</th>

									<th>Fecha</th>

									<th>Nombre Cliente</th>

									<th>Met. Pago</th>

									<th>Met. Envio</th>

									<th>Total Pedido</th>

									<th>Status</th>

								</tr>

							</thead>

							<tbody>

                                <?php 

									if ($pedidos != null) { 

										foreach ($pedidos as $row) {											

                                ?>

                                <tr onclick="window.location.href = 'pedido_detalle.php?pedido=<?php echo $row['id'];?>';">

                                    <td><?php echo $row['id'];?></td>									

                                    <td><?php echo substr($row['fecha'], 0, 10);?></td>									

									<td><?php echo $row['nombre']." ".$row['apellido'];?></td>

									<td><?php echo $row['MET_PAGO'];?></td>

                                    <td><?php echo $row['MET_ENVIO'];?></td>

                                    <td><?php echo number_format(($row['total']+$row['total_envio']), 0, ',', '.')." Gs";?></td>



									<?php if ($row['STATUS_PED'] == "Pendiente") { ?>

										 <td><span class="label label-warning"><?php echo $row['STATUS_PED'];?></span></td>

									<?php  } else if($row['STATUS_PED'] == "En Revisión") { ?>

										<td><span class="label label-info"><?php echo $row['STATUS_PED'];?></span></td>

									<?php  } else if($row['STATUS_PED'] == "Aprobado") { ?>

										<td><span class="label label-success"><?php echo $row['STATUS_PED'];?></span></td>

									<?php  } else if($row['STATUS_PED'] == "Enviado") { ?>

										<td><span class="label label-success"><?php echo $row['STATUS_PED'];?></span></td>

									<?php  } else if($row['STATUS_PED'] == "Entregado") { ?>

									<td><span class="label label-success"><?php echo $row['STATUS_PED'];?></span></td>				

									<?php  } else if($row['STATUS_PED'] == "Cancelado") { ?>

									<td><span class="label label-danger"><?php echo $row['STATUS_PED'];?></span></td>											

								   							

								    <?php }else{ ?>										<td><?php echo $row['STATUS_PED'];?></td>	



								    <?php } ?>



								

								</tr>

								<?php }}?>

							</tbody>

							</table>

						</div>

					</div>

					<!-- /.box-body -->

				</div>

				<!-- /.Caja de Texto de color gris (Default) -->

			</section>

		</div> <!-- /.content-wrapper -->



		<!-- FOOTER -->

		<?php include "includes/footer.php"; ?>

		<!-- ./FOOTER -->

	</div>

	<!-- ./Contenido -->



	<!-- SCRIPTS (js) -->

	<script type="text/javascript">

		<?php include_once "mods/js/pedido.js"; ?>

	</script>

	<?php include "includes/scripts.php"; ?>

	<!-- ./SCRIPTS (js) -->

</body>

</html>
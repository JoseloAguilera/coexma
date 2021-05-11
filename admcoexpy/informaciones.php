<?php 
	session_start();
	if (!isset($_SESSION['logueado'])) {
		header('Location: login.php');
	}
?>
<!DOCTYPE html>
<html>
<head>
	<title><?php echo $_SESSION['empresa'];?> | Informaciones</title>
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

		<?php include 'mods/objs/informacion.php'; ?>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Cabicera de Contenido (Título) -->
			<section class="content-header">
				<h1>
					Informaciones
					<small>Página de informaciones institucionales.</small>
				</h1>
			</section>

            <?php
				$empresa = "";
				$terminos = "";
				$pagos = "";

				if (isset($_SESSION['info_tab'])) {
					if ($_SESSION['info_tab'] == "empresa") {
						$empresa = "active";
					} else if ($_SESSION['info_tab'] == "terminos") {
						$terminos = "active";
					} else if ($_SESSION['info_tab'] == "formas") {
						$pagos = "active";
					} else {
						$empresa = "active";
					}
				} else {
					$empresa = "active";
				}
			?>

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

			<!-- Contenido Principal -->
			<section class="content">
				<div class="nav-tabs-custom">
					<ul class="nav nav-tabs">
						<li class="<?php echo $empresa;?>"><a href="#tab_1" data-toggle="tab">Empresa</a></li>
						<li class="<?php echo $terminos;?>"><a href="#tab_2" data-toggle="tab">Terminos y Condiciones</a></li>
						<li class="<?php echo $pagos;?>"><a href="#tab_3" data-toggle="tab">Formas de Pago</a></li>
						<!-- <li class="pull-right"><a href="#" class="text-muted"><i class="fa fa-gear"></i></a></li> -->
					</ul>
					<div class="tab-content">
						<div class="tab-pane <?php echo $empresa;?>" id="tab_1">
							<?php include_once "mods/tab_info_empresa.php";?>
						</div><!-- /.tab-pane -->
						<div class="tab-pane <?php echo $terminos;?>" id="tab_2">
							<?php include_once "mods/tab_info_terminos.php";?>
						</div><!-- /.tab-pane -->
						<div class="tab-pane <?php echo $pagos;?>" id="tab_3">
							<?php include_once "mods/tab_info_pago.php";?>
						</div><!-- /.tab-pane -->
					</div><!-- /.tab-content -->
				</div><!-- nav-tabs-custom -->
			</section><!-- /.content -->
		</div> <!-- /.content-wrapper -->
		
		<!-- FOOTER -->
		<?php include "includes/footer.php"; ?>
		<!-- ./FOOTER -->

	</div>
	<!-- ./Contenido -->

	<!-- SCRIPTS (js) -->
	<script type="text/javascript">
		<?php include_once "mods/js/informaciones.js"; ?>
	</script>
	<?php include "includes/scripts.php"; ?>
	<!-- ./SCRIPTS (js) -->
</body>
</html>
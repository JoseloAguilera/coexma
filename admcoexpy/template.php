<?php 
	session_start();
	if (!isset($_SESSION['logueado'])) {
		header('Location: ../login.php');
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

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Cabicera de Contenido (Título) -->
			<section class="content-header">
				<h1>
					Titulo
					<small>Subtitulo</small>
				</h1>
			</section>

			<!-- Contenido Principal -->
			<section class="content">
				<!-- Caja de Texto de color gris (Default) -->
				<div class="box">
					<div class="box-header with-border">
						<!-- Título de Caja -->
						<h3 class="box-title">Titulo de la caja (opcional) </h3>
						<!-- Botones de cerrar y recojer caja -->
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
							title="Collapse">
							<i class="fa fa-minus"></i></button>
							<button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
							<i class="fa fa-times"></i></button>
						</div>
					</div>
					<!-- Corpo de Caja -->
					<div class="box-body">
						Contenido de la caja
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						Pie de la caja (opcional)<br>Se pueden usar botones acá también
					</div> <!-- /.box-footer-->
				</div> <!-- /.Caja de Texto de color gris (Default) -->
			</section><!-- /.content -->
		</div> <!-- /.content-wrapper -->
		

		<!-- FOOTER -->
		<?php include "includes/footer.php"; ?>
		<!-- ./FOOTER -->

	</div>
	<!-- ./Contenido -->

	<!-- SCRIPTS (js) -->
	<?php include "includes/scripts.php"; ?>
	<!-- ./SCRIPTS (js) -->
</body>
</html>
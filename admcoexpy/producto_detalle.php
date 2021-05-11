<?php 
	session_start();
	if (!isset($_SESSION['logueado'])) {
		header('Location: login.php');
	}
?>
<!DOCTYPE html>
<html>
<head>
    <title><?php echo $_SESSION['empresa'];?> | Cad. Productos</title>
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

		<?php include_once "mods/objs/producto_detalle.php";?>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Cabicera de Contenido (Título) -->
			<section class="content-header">
				<h1>
					<?php
						if (isset($_GET['producto'])) {
							if ($producto['referencia'] != null) {
								echo "[REF.".$producto['referencia']."] ".$producto['nombre'];
							} else {
								echo "[COD.".$producto['id']."] ".$producto['nombre'];
							}	
						} else {
							echo "Nuevo Producto";
						}
					?>
					<small>Detalle del producto y sus imagenes.</small>
					<a type="button" class="btn btn-primary" href="producto.php"><i class="fa fa-arrow-circle-left"></i> Atrás</a>
				</h1>
				
			</section>
			<!-- Modal de Mensagns Sucess and Error -->
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
			<?php
				$detalles = "";
				$imagens = "";
				$stocks = "";
				$tab_img = "";
				$tab_stock = "";
				$tab_img2 = '';

				if (isset($_SESSION['prod_tab'])) {
					if ($_SESSION['prod_tab'] == "detalles") {
						$detalles = "active";
					} else if ($_SESSION['prod_tab'] == "imagenes") {
						$imagens = "active";
					} else if ($_SESSION['prod_tab'] == "stock") {
						$stocks = "active";
					} else {
						$detalles = "active";
					}
				} else {
					$detalles = "active";
				}

				if (!isset($_GET['producto'])) {
					$imagens = "disabled";
					$stocks = "disabled";
					$tab_img = "#";
					$tab_stock = "#";
				} else {
					$tab_img = "#tab_2";
					$tab_img2 = 'data-toggle="tab"';
					$tab_stock = "#tab_3";
				}
			?>
			<section class="content">
				<div class="nav-tabs-custom">
					<ul class="nav nav-tabs">
						<li class="<?php echo $detalles;?>"><a href="#tab_1" data-toggle="tab">Detalles</a></li>
						<li class="<?php echo $imagens;?>"><a href="<?php echo $tab_img;?>" <?php echo $tab_img2; ?>>Imagenes</a></li>
						<li class="<?php echo $stocks;?>"><a href="<?php echo $tab_stock;?>" <?php echo $tab_img2; ?>>Stock</a></li>
						<!-- <li class="pull-right"><a href="#" class="text-muted"><i class="fa fa-gear"></i></a></li> -->
					</ul>
					<div class="tab-content">
						<div class="tab-pane <?php echo $detalles;?>" id="tab_1">
							<?php include_once "mods/tab_prod_detalle.php";?>
						</div><!-- /.tab-pane -->
						<div class="tab-pane <?php echo $imagens;?>" id="tab_2">
							<?php include_once "mods/tab_prod_imagen.php";?>
						</div><!-- /.tab-pane -->
						<div class="tab-pane <?php echo $stocks;?>" id="tab_3">
							<?php include_once "mods/tab_prod_stock.php";?>
						</div><!-- /.tab-pane -->
					</div><!-- /.tab-content -->
				</div><!-- nav-tabs-custom -->

			</section>
		</div> <!-- /.content-wrapper -->

		<!-- FOOTER -->
		<?php include "includes/footer.php"; ?>
		<!-- ./FOOTER -->
	</div>
	<!-- ./Contenido -->

    <script type="text/javascript">
        <?php include_once "mods/js/producto_detalle.js"; ?>
    </script>
	<!-- SCRIPTS (js) -->
	<?php include "includes/scripts.php"; ?>
	<!-- ./SCRIPTS (js) -->
</body>
</html>
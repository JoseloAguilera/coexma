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

        <?php include_once "mods/objs/pedido.php";
        include_once "mods/objs/producto.php";
            $pedidoexpress= getAllPedidosExpress();
        ?>
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
									<th>Fecha.</th>
									<th>URL Desde</th>
								
									<th>Nombre Cliente</th>
									<th>Email</th>
									<th>telefono</th>
                                    <th>Producto.</th>
									<th>Mensaje</th>
									<th>Full URL</th>
								</tr>
							</thead>
							<tbody>
                                <?php 
									if ($pedidoexpress != null) { 
										foreach ($pedidoexpress as $row) {											
                                ?>
                                <tr>
                                    <td><?php echo $row['id'];?></td>	
																	
                                    <td><?php echo substr($row['fecha']);?></td>
									<td><?php echo $row['url_desde'];?></td>										
									<td><?php echo $row['nombre'];?></td>
									<td><?php echo $row['email'];?></td>
                                    <td><?php echo $row['telefono'];?></td>
									<td><?php echo $row['full_url'];?></td>
                                    <td>
                                    <a target="_blank" href="http://coexma.com.py/producto.php?id=<?php echo $row['id_producto'];?>">
                                    <?php echo $row['id_producto'];?>- <?php echo getProducto($row['id_producto'])['nombre'];?>
                                    </a>
                                    </td>
                                    <td><?php echo $row['mensaje'];?></td>
                                   
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
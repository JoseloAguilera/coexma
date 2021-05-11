<?php 
	session_start();
	if (!isset($_SESSION['logueado'])) {
		header('Location: login.php');
    }
?>
<!DOCTYPE html>
<html>
<head>
    <title><?php echo $_SESSION['empresa'];?> | Pedidos Express</title>
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

        <?php include_once "mods/objs/pedido_express.php";?>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Cabicera de Contenido (Título) -->
			<section class="content-header">
				<h1>
					Pedidos Express
					<small>Registro de los pedidos enviados via formulário de los clientes.</small>
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
									<th>DESDE.</th>
								
									<th>Nombre Cliente</th>
									<th>Email</th>
									<th>Ciudad</th>
									<th>telefono</th>
                                    <th>Producto.</th>
									
									<th>Full URL</th>
									<th>Mensaje</th>
								</tr>
							</thead>
							<tbody>
                                <?php 
									if ($pedidoexpress != null) { 
										foreach ($pedidoexpress as $row) {											
                                ?>
                                <tr data-toggle="modal" data-target="#AltModal" data-codigo="<?php echo $row['id'];?>" data-nombre="<?php echo $row['nombre'];?>" data-fecha="<?php echo putMySQlToData(substr($row['fecha'], 0, 10));?>" data-email="<?php echo $row['email'];?>"  data-ciudad="<?php echo $row['ciudad'];?>" data-telefono="<?php echo $row['telefono'];?>" data-producto="<?php echo $row['id_producto'];?> - <?php echo getProducto($row['id_producto'])['nombre'];?>" data-link="http://coexma.com.py/producto.php?id=<?php echo $row['id_producto'];?>" data-mensaje="<?php echo $row['mensaje'];?>">
								<td><?php echo $row['id'];?></td>	
																	
																	<td><?php echo substr($row['fecha'], 0, 10);?></td>	
																	<td><?php echo $row['url_desde'];?></td>									
																	<td><?php echo $row['nombre'];?></td>
																	<td><?php echo $row['email'];?></td>
																	<td><?php echo $row['ciudad'];?></td>
																	<td><?php echo $row['telefono'];?></td>
																	
																	<td>
																	<a target="_blank" href="http://coexma.com.py/producto.php?id=<?php echo $row['id_producto'];?>">
																	<?php echo $row['id_producto'];?>- <?php echo getProducto($row['id_producto'])['nombre'];?>
																	</a>
																	</td>
																	<td>
																	<a target="_blank" href="<?php echo $row['full_url'];?>">
																	<?php echo $row['full_url'];?>
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
        
        <!-- AltModal -->
        <div class="modal fade" tabindex="-1" role="dialog" id="AltModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Alteración Pedido</h4>
                    </div>
                    <form action="" method="POST" autocomplete="off">
                        <div class="modal-body">
                            <div class="row">
                                <input type="hidden" class="form-control" id="codigo" name="codigo" required>
                                <div class="col-md-9">
                                    <div class="form-group">
                                        <label for="nombre">Nombre</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del Cliente" maxlength="80" readonly>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="fecha">Fecha</label>
                                        <input type="text" class="form-control" id="fecha" name="fecha" placeholder="Fecha del Pedido" maxlength="80" readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input type="text" class="form-control" id="email" name="email" placeholder="Email del Cliente" maxlength="80" readonly>
                                    </div>
								</div>
								<div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ciudad">Ciudad</label>
                                        <input type="text" class="form-control" id="ciudad" name="ciudad" placeholder="Ciudad del Cliente" maxlength="80" readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="telefono">Telefono</label>
                                        <input type="text" class="form-control" id="telefono" name="telefono" placeholder="Telefono del Cliente" maxlength="80" readonly>
                                    </div>
                                </div>
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <label for="producto">Producto</label>
                                        <input type="text" class="form-control" id="producto" name="producto" placeholder="Producto" maxlength="80" readonly>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label for="prodlink"><br></label>
                                        <a href="#" class="form-control btn btn-info" target="_blank" id="prodlink">Ver</a>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="mensaje">Mensaje</label>
                                        <textarea class="form-control" name="mensaje" id="mensaje" cols="30" rows="5" readonly></textarea>
                                    </div>
                                </div>
                            </div> <!-- row -->
                        </div> <!-- modal-body -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger pull-left" name="excluir" id="btn-confirmar">Excluir</button>
                            <button type="submit" class="btn" name="excluir" id="btn-excluir" style="display: none;">Submit Excluir</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
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
                
		<!-- FOOTER -->
		<?php include "includes/footer.php"; ?>
		<!-- ./FOOTER -->
	</div>
	<!-- ./Contenido -->

	<!-- SCRIPTS (js) -->
	<script type="text/javascript">
		<?php include_once "mods/js/pedido_express.js"; ?>
	</script>
	<?php include "includes/scripts.php"; ?>
	<!-- ./SCRIPTS (js) -->
</body>
</html>
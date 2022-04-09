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
        
        <?php include_once "mods/objs/pedido_detalle.php";?>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Cabicera de Contenido (Título) -->
			<section class="content-header">
				<h1>
					Pedido <?php echo 'Nro. '.$pedido['id'];?>
					<small>Registro de los pedidos de los clientes.</small>
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
			<section class="content">
                <!-- Caja de Texto de color gris (Default) -->
                <div class="box">
                    <div class="box-header with-border">
						<div class="col-md-3 pull-left">
                            <button type="button" class="btn btn-default" onclick="window.location.href = 'pedido.php';">Volver</button>
                        </div>
                        <div class="col-md-9">
                            <h3 class="box-title pull-right" style="font-size:1.6em; margin-top:5px;"><b>Dados del Pedido</b></h3>
                        </div>
                    </div>
                    <!-- Corpo de Caja -->
                    <div class="box-body">
                        <form action="" method="POST" autocomplete="off">
                            <div class="modal-body">
                                <div class="row">
                                    <input type="hidden" class="form-control" id="codigo" name="codigo" value="<?php echo $pedido['id'];?>" readonly>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="fecha">Fecha Pedido</label>
                                            <input type="text" class="form-control" id="fecha" name="fecha" maxlength="20" value="<?php echo putMySQlToData($pedido['fecha']);?>" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="nombre">Nombre Cliente</label>
                                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del Cliente" maxlength="80" value="<?php echo $pedido['nombre']." ".$pedido['apellido'];?>" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="documento">Nro. Documento</label>
                                            <input type="text" class="form-control" id="documento" name="documento" maxlength="20" value="<?php echo $pedido['ruc']." ".$pedido['documento'];?>" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="razonsocial">Razón Social</label>
                                            <input type="text" class="form-control" id="razonsocial" name="razonsocial" placeholder="Razón Social" maxlength="80" value="<?php echo $pedido['razon_social'];?>" readonly>
                                        </div>
                                    </div>
                                </div> <!-- row -->
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="departamento">Departamento</label>
                                            <input type="text" class="form-control" id="departamento" name="departamento" placeholder="Departamento" maxlength="80" value="<?php echo $dirrecion['DEPART_DESC'];?>" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="ciudad">Ciudad</label>
                                            <input type="text" class="form-control" id="ciudad" name="ciudad" placeholder="Ciudad" maxlength="80" value="<?php echo $dirrecion['CIUDAD_DESC'];?>" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="calle">Calle</label>
                                            <input type="text" class="form-control" id="calle" name="calle" placeholder="Calle" maxlength="80" value="<?php echo $dirrecion['calle'];?>" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <?php 
                                                if ($pedido['mayorista'] == 0) {
                                                    $mayorista = "Minorista";
                                                } else {
                                                    $mayorista = "Mayorista";
                                                }
                                            ?>
                                            <label for="mayorista">Mayorista</label>
                                            <input type="text" class="form-control" id="mayorista" name="mayorista" placeholder="Metodo de Pago" maxlength="80" value="<?php echo $mayorista;?>" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="metpago">Metodo de Pago</label>
                                            <input type="text" class="form-control" id="metpago" name="metpago" placeholder="Metodo de Pago" maxlength="80" value="<?php echo $pedido['MET_PAGO'];?>" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="metenvio">Metodo de Envio</label>
                                            <input type="text" class="form-control" id="metenvio" name="metenvio" placeholder="Calle" maxlength="80" value="<?php echo $pedido['MET_ENVIO'];?>" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="status">Status</label>
                                            <select class="selectpicker" id="status" name="status" data-width="100%">
                                                <?php
                                                    if ($status != null) {
                                                        $selected = "";
                                                        foreach ($status as $row) {	
                                                            if ($row['id'] == $pedido['status']) {
                                                                $selected = " selected";
                                                            } else {
                                                                $selected = "";
                                                            }
                                                ?>
                                                    <option value="<?php echo $row['id'];?>" <?php echo $selected;?>><?php echo $row['descripcion'];?></option> 
                                                <?php 
                                                        } //END FOREACH
                                                    } //END IF
                                                ?>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div> <!-- modal-body -->
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary" name="guardar">Guardar</button>
                            </div>
                        </form>
                    </div> <!-- box-body -->
                </div>
                <!-- /.Caja de Texto de color gris (Default) -->   

                <!-- Caja de Texto de color gris (Default) -->
                <div class="box">
                    <div class="box-header with-border">
						<div class="col-md-3 pull-left">
                            <button type="button" class="btn btn-default" onclick="window.location.href = 'pedido.php';">Volver</button>
                        </div>
                        <div class="col-md-9">
                            <h3 class="box-title pull-right" style="font-size:1.6em; margin-top:5px;"><b>Productos</b></h3>
                        </div>
                    </div>
                    <!-- Corpo de Caja -->
                    <div class="box-body">
                        <div class="box-body table-responsive">
							<table class="table table-striped table-bordered display nowra" id="tabladatos">
							<thead>
								<tr>
                                    <th>Ref.</th>
                                    <th>Imagen</th>
									<th>Descripción</th>
									<th>Valor Unidad</th>
									<th>Ctd.</th>
									<th>Valor Total</th>
								</tr>
							</thead>
							<tbody>
                                <?php 
									if ($productos != null) { 
										foreach ($productos as $row) {											
                                ?>
                                <tr>
                                    <td>
                                        <?php echo getProducto ($row['id_producto'])['referencia'] ;?>
                                        </br>
                                        </br>
                                        <?php 
                                            if ($row['combinacion'] == "" OR $row['combinacion'] == NULL) {
                                                echo 'UNICO'; //Unico
                                            } else {
                                                echo $row['combinacion'];
                                            }

                                            // $combinacion = getStockValor ($row['id_stock']);
                                            // if ($combinacion != null) { 
                                            //     foreach ($combinacion as $linea) {
                                            //         echo '<span class="label label-primary" style="font-size:10pt; margin-right: 5px;">'.$linea['nombre'].'</span>';
                                            //     }
                                            // } else {
                                            //     echo 'UNICO'; //Unico
                                            // }
                                            // if ($row['id_combinacion'] == "") {
                                            //     echo '';
                                            // } else {
                                            //     $valores = getProdAtributosValoresByStock ($row['id_combinacion']);
                                            //     if ($valores != null) { 
                                            //         foreach ($valores as $linea) {
                                            //             echo '<span class="label label-primary" style="font-size:10pt;">'.$linea['nombre'].'</span> ';
                                            //         }
                                            //     } else {
                                            //         echo 'UNICO';
                                            //     }    
                                            // }
                                        ?>
                                    </td>
                                    <td><img src="../img/productos/<?php echo getProductoImg ($row['id_producto'])['url'] ;?>" class="img-fluid img-thumbnail" alt="marca" style="max-width: 150px;"></td>
                                    <td><?php echo getProducto ($row['id_producto'])['nombre'] ;?></td>
                                    <td><?php echo $row['valor_unitario'];?></td>
                                    <td><?php echo $row['ctd'];?></td>
                                    <td><?php echo $row['valor_total'];?></td>
								</tr>
								<?php }}?>
							</tbody>
							</table>
                        </div>
                        <div class="box-footer">
                            <div class="row">
                                <div class="col-md-4 text-center"><h4>Total del Pedido: <b><?php echo "G$ ".number_format($pedido['total'], 0, ',', '.');?></b></h4></div>
                                <div class="col-md-4 text-center"><h4>Total del Envio: <b><?php echo "G$ ".number_format($pedido['total_envio'], 0, ',', '.');?></b></h4></div>
                                <div class="col-md-4 text-center"><h4>Total del Pedido: <b><?php echo "G$ ".number_format(($pedido['total']+$pedido['total_envio']), 0, ',', '.');?></b></h4></div>
                            </div>
                        </div> <!-- /.box-footer-->
                    </div> <!-- box-body -->
                </div>
                <!-- /.Caja de Texto de color gris (Default) -->   
			</section>
		</div>
		<!-- FOOTER -->
		<?php include "includes/footer.php"; ?>
		<!-- ./FOOTER -->

	</div>
	<!-- ./Contenido -->

    <!-- SCRIPTS (js) -->
    <script type="text/javascript">
        <?php include_once "mods/js/pedido_detalle.js"; ?>
    </script>
        
	<!-- SCRIPTS (js) -->
	<?php include "includes/scripts.php"; ?>
	<!-- ./SCRIPTS (js) -->
</body>
</html>
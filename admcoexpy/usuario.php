<?php 
	session_start();
	if (!isset($_SESSION['logueado'])) {
		header('Location: login.php');
	} else {
        if ($_SESSION['tipo'] != 0) {
            header('Location: index.php');
        }
    }
?>
<!DOCTYPE html>
<html>
<head>
	<title><?php echo $_SESSION['empresa'];?> | Cad. Usuarios</title>
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
        
        <?php include_once "mods/objs/usuario.php";?>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Cabicera de Contenido (Título) -->
			<section class="content-header">
				<h1>
                    Usuarios
					<small>Registro de los usuarios del sistema.</small>
				</h1>
			</section>

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
						<!-- Botón para crear más cursos -->
						<div class="col-md-3 pull-left">
							<button id="btnAdd" type="button" class="btn btn-primary" data-toggle="modal" data-target="#AddModal" data-tipo="admin" style="margin-bottom: 5px;">+ Nuevo</button>
                        </div>
                        <div class="col-md-9">
                            <h3 class="box-title pull-right" style="font-size:1.6em; margin-top:5px;"><b>Administradores</b></h3>
                        </div>
                        <p><div id="ajaxload2"></div></p>
					</div>
					<!-- Corpo de Caja -->
					<div class="box-body">
						<div class="box-body table-responsive">
							<table class="table table-striped table-bordered display nowra" id="tabladatos">
							<thead>
								<tr>
									<th>Usuario</th>
                                    <th>Nombre</th>
                                    <th>Tipo</th>
								</tr>
							</thead>
							<tbody>
                                <?php 
									if ($usuarios != null) { 
										foreach ($usuarios as $row) {
                                ?>
								<tr data-toggle="modal" data-target="#AltModal" data-codigo="<?php echo $row['id'];?>" data-usuario="<?php echo $row['usuario'];?>" data-nombre="<?php echo $row['nombre'];?>">
									<td><?php echo $row['usuario'];?></td>
                                    <td><?php echo $row['nombre'];?></td>
                                    <td>
                                        <?php 
                                            $tipo = "";
                                            if ($row['tipo'] == 0) {
                                                $tipo = "Admin";
                                            } else {
                                                $tipo = "Usuário";
                                            }
                                            echo $tipo;
                                        ?>
                                    </td>
								</tr>
								<?php }}?>
							</tbody>
							</table>
						</div>
					</div>
					<!-- /.box-body -->
				</div>
                <!-- /.Caja de Texto de color gris (Default) -->
			</section><!-- /.content -->
		</div> <!-- /.content-wrapper -->
		
        <!-- AddModal -->
        <div class="modal fade" tabindex="-1" role="dialog" id="AddModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Nuevo Usuario</h4>
                    </div>
                    <form action="" method="POST" autocomplete="off">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="cedula">Usuario</label>
                                        <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Usuario" maxlength="20" required>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label for="nombre">Nombre Completo</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del Usuario" maxlength="80" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="nombre">Contraseña</label>
                                        <input type="password" class="form-control" id="contrasena1" name="contrasena1" placeholder="Contraseña" maxlength="80" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="nombre">Repetir la Contraseña</label>
                                        <input type="password" class="form-control" id="contrasena2" name="contrasena2" placeholder="Repetir la Contraseña" maxlength="80" required>
                                    </div>
                                </div>
                                <div class="col-md-12 text-center" id="alerta"></div>
                                <!-- <span id='message'></span> -->
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
                        <h4 class="modal-title">Alteración Usuario</h4>
                    </div>
                    <form action="" method="POST" autocomplete="off">
                        <div class="modal-body">
                            <div class="row">
                                <input type="hidden" class="form-control" id="codigo" name="codigo" required>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="cedula">Usuario</label>
                                        <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Usuario" maxlength="20" required readonly>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label for="nombre">Nombre Completo</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del Usuario" maxlength="80" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="nombre">Contraseña</label>
                                        <input type="password" class="form-control" id="contrasena1-alt" name="contrasena1" placeholder="Contraseña" maxlength="80">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="nombre">Repetir la Contraseña</label>
                                        <input type="password" class="form-control" id="contrasena2-alt" name="contrasena2" placeholder="Repetir la Contraseña" maxlength="80">
                                    </div>
                                </div>
                                <div class="col-md-12 text-center" id="alerta2"></div>
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
        <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="ExcModal">
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
        <?php include_once "mods/js/usuario.js"; ?>
	</script>
	<!-- SCRIPTS (js) -->
	<?php include "includes/scripts.php"; ?>
	<!-- ./SCRIPTS (js) -->
</body>
</html>
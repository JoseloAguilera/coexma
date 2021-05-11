<?php 
	session_start();
	if (!isset($_SESSION['logueado'])) {
		header('Location: login.php');
	}
?>
<!DOCTYPE html>
<html>
<head>
	<title><?php echo $_SESSION['empresa'];?> | Curriculum</title>
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
        
        <?php include_once "mods/objs/curriculum_detalle.php";?>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Cabicera de Contenido (Título) -->
			<section class="content-header">
				<h1>
					Curriculum <?php echo $curriculum['nombre']." ".$curriculum['apellido'];?>
					<small>Detalles del curriculum del postulante.</small>
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
                            <!-- <button type="button" class="btn btn-default" onclick="window.location.href = 'curriculum.php';">Volver</button> -->
                            <?php
                                if (file_exists('../img/upload/'.$curriculum['url_pdf']) && $curriculum['url_pdf'] != "") {
                            ?>
                                <button type="submit" class="btn btn-success" onclick="window.open('../img/upload/<?php echo $curriculum['url_pdf'];?>')">Download PDF</button>
                            <?php
                                }
                            ?>
                        </div>
                        <div class="col-md-9">
                            <h3 class="box-title pull-right" style="font-size:1.6em; margin-top:5px;"><b>Dados Personales</b></h3>
                        </div>
                    </div>
                    <!-- Corpo de Caja -->
                    <div class="box-body">
                        <form action="" method="POST" autocomplete="off">
                            <div class="modal-body">
                                <div class="row">
                                    <input type="hidden" class="form-control" id="codigo" name="codigo" value="<?php echo $curriculum['id'];?>" readonly>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="area">Area</label>
                                            <input type="text" class="form-control" id="area" maxlength="20" value="<?php echo $curriculum['area'];?>" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="departamento">Departamento</label>
                                            <input type="text" class="form-control" id="departamento" maxlength="20" value="<?php echo $curriculum['id_departamento'];?>" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="ciudad">Ciudad</label>
                                            <input type="text" class="form-control" id="ciudad" maxlength="20" value="<?php echo $curriculum['id_ciudad'];?>" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="telefono">Teléfono</label>
                                            <input type="text" class="form-control" id="telefono" maxlength="20" value="<?php echo $curriculum['telefono'];?>" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="nombre">Nombre Completo</label>
                                            <input type="text" class="form-control" id="nombre" maxlength="20" value="<?php echo $curriculum['nombre']." ".$curriculum['apellido'];?>" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="ci">C.I.</label>
                                            <input type="text" class="form-control" id="ci" maxlength="20" value="<?php echo $curriculum['cedula'];?>" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="email">E-mail</label>
                                            <input type="text" class="form-control" id="email" maxlength="20" value="<?php echo $curriculum['email'];?>" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                           
                                            <h3><a target="_blank" href="../img/upload/<?php echo $curriculum['url_cv'];?>">Descargar Curriculum</a></h3>
                                        </div>
                                    </div>
                                </div> <!-- row -->
                                <div class="row">

                                </div>
                            </div> <!-- modal-body -->
                        </form>
                    </div> <!-- box-body -->
                </div>
                <!-- /.Caja de Texto de color gris (Default) -->   

                <!-- Caja de Texto de color gris (Default) -->
                <div class="box">
                    <div class="box-header with-border">
						<div class="col-md-3 pull-left">
                            <button type="button" class="btn btn-default" onclick="window.location.href = 'curriculum.php';">Volver</button>
                        </div>
                        <div class="col-md-9">
                            <h3 class="box-title pull-right" style="font-size:1.6em; margin-top:5px;"><b>Experiencia Laboral</b></h3>
                        </div>
                    </div>
                    <!-- Corpo de Caja -->
                    <div class="box-body">
                        <div class="box-body table-responsive">
							<table class="table table-striped table-bordered display nowra" id="tabladatos">
							<thead>
								<tr>
                                    <th>Desde.</th>
                                    <th>Hasta</th>
									<th>Empresa</th>
									<th>Cargo</th>
								</tr>
							</thead>
							<tbody>
                                <?php 
									if ($experiencia != null) { 
										foreach ($experiencia as $row) {											
                                ?>
                                <tr>
                                    <td><?php echo $row['desde'];?></td>
                                    <td><?php echo $row['hasta'];?></td>
                                    <td><?php echo $row['empresa'];?></td>
                                    <td><?php echo $row['cargo'];?></td>
								</tr>
								<?php }}?>
							</tbody>
							</table>
                        </div>
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
        <?php include_once "mods/js/curriculum_detalle.js"; ?>
    </script>
        
	<!-- SCRIPTS (js) -->
	<?php include "includes/scripts.php"; ?>
	<!-- ./SCRIPTS (js) -->
</body>
</html>
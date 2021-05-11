<?php 
	include_once "./mods/server/usuario.php";
	
	if ($_SERVER['REQUEST_METHOD'] == "POST") {
		if (isset($_POST['alt-user'])) {
			// var_dump($_POST);
			if($_POST['contrasena1'] ==  $_POST['contrasena2']) {
				if ($_POST['contrasena1'] == "") {
					$contrasena = null;
				} else {
					$contrasena = md5($_POST['contrasena1']);
				}

				$guardar = saveUser ($_POST['codigo'], $_POST['nombre'], $contrasena);
				if ($guardar == $_POST['codigo']) {
					$tipomensaje = 'success';
					$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron actualizados correctamente.</p>';
					$_SESSION['nome_usuario'] = $_POST['nombre'];
					
					echo "<script type='text/javascript'>document.location.href='index.php';</script>";
				} else if ($guardar == null) {
					$tipomensaje = 'success';
					$mensaje = '<h3>Perfecto!</h3><p>No hubo alteración en los datos.</p>';
				} else {
					$tipomensaje = 'error';
					$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error->"'.$guardar.'"</p>';
				}
			} else {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Revise las contraseñas</p>';
			}
		}	
	}
?>

<header class="main-header">
	<a href="index.php" class="logo">
		<span class="logo-mini"><?php echo $_SESSION['empresa-mini'];?></span>
		<span class="logo-lg"><?php echo $_SESSION['empresa-menu'];?></span>
	</a>

	<nav class="navbar navbar-static-top">
		<!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
			<span class="sr-only">Toggle navigation </span>
		</a>

		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<!-- User Account: style can be found in dropdown.less -->
				<li class="dropdown user user-menu">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<img src="../img/logo.png" class="user-image" alt="User Image">
						<span class="hidden-xs"><?php echo $_SESSION['nome_usuario'];?></span>
					</a>
					<ul class="dropdown-menu">
						<!-- User image -->
						<li class="user-header">
							<img src="../img/logo.png" class="img-rounded" alt="User Image">
							<p>
								<?php echo $_SESSION['nome_usuario'];?>
								<!-- <small>Member since Nov. 2012</small> -->
							</p>
						</li>
						<!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-left">
								<?php
									if ($_SESSION['tipo'] == 0) {
								?>
									<a href="usuario.php" class="btn btn-default btn-flat">Perfil</a>
								<?php
									} else {
								?>
									<!-- <a href="index.php" class="btn btn-default btn-flat" data-toggle="modal" data-target="#AltModalUsu" data-codigo="<?php echo $_SESSION['logueado'];?>" data-usuario="<?php echo $_SESSION['usuario'];?>" data-nombre="<?php echo $_SESSION['nome_usuario'];?>">Perfil</a> -->
									<button class="btn btn-default btn-flat" data-toggle="modal" data-target="#AltModalUsu" data-codigo="<?php echo $_SESSION['logueado'];?>" data-usuario="<?php echo $_SESSION['usuario'];?>" data-nombre="<?php echo $_SESSION['nome_usuario'];?>">Perfil</button>
								<?php
									}
								?>
							</div>
							<div class="pull-right">
								<a href="salir.php" class="btn btn-default btn-flat">Salir</a>
							</div>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>	
</header>
<!-- AltModal -->
<div class="modal fade" tabindex="-1" role="dialog" id="AltModalUsu">
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
					<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
					<button type="submit" class="btn btn-primary" name="alt-user">Guardar</button>
				</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- ./AltModal -->

<script> 
$(document).ready(function(){
    $(document).on('shown.bs.modal','#AltModalUsu', function (event) {
        var button = $(event.relatedTarget) // objeto que disparó el modal
        var codigo = button.data('codigo')
        var usuario = button.data('usuario')
        var nombre = button.data('nombre')
        var tipo = button.data('mesa')

        // Actualiza los datos del modal
        var modal = $(this)
        modal.find('.modal-title').text('Usuario ' + usuario);
        modal.find('#codigo').val(codigo);
        modal.find('#usuario').val(usuario);
        modal.find('#nombre').val(nombre);
	})
});
</script>
<?php
	session_start();
	include_once "mods/objs/login.php";
?>
<!DOCTYPE html>
<html>
<head>
	<title><?php echo $_SESSION['empresa'];?></title>
	<?php include 'includes/head.php'; ?>
</head>

<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo text-center">
			<a href="index.php"><img src="../img/logo.png" class="img-responsive" alt="Logo" style="width: 300px;"><br></a>
		</div> <!-- /.login-logo -->

	 	<div class="login-box-body">
			<p class="login-box-msg">Ingrese su Usuario y Contraseña</p>
			<?php
				if (isset($mensaje)) {
					echo $mensaje; //mensaje de error
				}
			?>
			<form action="" method="post" autocomplete="off">
				<div class="form-group has-feedback">
					<input type="text" name="usuario" class="form-control" placeholder="Usuário" required>
					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="contrasena" class="form-control" placeholder="Contraseña" required>
					 <span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="row">
					<div class="col-xs-6 col-xs-offset-3">
						<button type="submit" class="btn btn-primary btn-block btn-flat">Entrar</button>
					</div>
				</div>
			</form>
		</div> <!-- /.login-box-body -->
	</div><!-- /.login-box -->

	<!-- SCRIPTS (js) -->
	<?php include "includes/scripts.php"; ?>
	<!-- ./SCRIPTS (js) -->
<script>
	
</script>
</body>
</html>
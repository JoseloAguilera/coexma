<?php 
    session_start();
?>
<!DOCTYPE html>
<html lang="zxx">
<?php 
	include("includes/head.php");
	include("funciones/funciones.php");
    include("includes/cart.php");
    if (isset($_GET['redirect'])) {
        $redirect=$_GET['redirect'];
    }else {$redirect="perfil.php";}
    
    if($_SERVER['REQUEST_METHOD'] == "POST") {
		if (isset($_POST['login'])){
            // var_dump($_POST);
            if(isset($_POST['email']) && $_POST['email'] != '' && isset($_POST['contrasena']) &&  $_POST['contrasena'] != '' ) {
                $contrasena = md5($_POST['contrasena']);
                $login = getUsuario ($_POST['email'], $contrasena);

                if (!is_array($login)) {
                    if (substr($login,0,1) == "E") {
                        $mensaje = '<p class="text-center alert alert-danger">Consulte al administrador de sistemas.<br>Error->"'.$login.'"</p>';
                    } else if (substr($login,0,1) == "D") {
                        $mensaje = '<p class="text-center alert alert-danger">Consulte nuestra administración para reactivar tus datos de Login.</p>';
                    }else {
                        $mensaje = '<p class="text-center alert alert-danger">¡Verifique sus datos! Su autentificación ha fracasado.</p>';
                    }
                } else {	
                    $_SESSION['id_cliente'] = $login['id_cliente'];		
                    $_SESSION['email'] = $_POST['email'];
                    $_SESSION['usuario'] = $login['nombre'];
                    $_SESSION['apellido'] = $login['apellido'];
                    /*$_SESSION['tipo_documento'] = $login['tipo_documento'];
                    $_SESSION['nro_documento'] = $login['nro_documento'];
                    $_SESSION['razon_social'] = $login['razon_social'];*/
                    //$_SESSION['mayorista'] = $login['mayorista'];

                    // var_dump($redirect);
                    
                    // echo "<script type='text/javascript'>document.location.href='".$redirect."';</script>";
                    if (isset($_GET['redirect'])) {
                        echo "<script type='text/javascript'>document.location.href='".$redirect."';</script>";
                    }else{
                        echo "<script type='text/javascript'>document.location.href='index.php';</script>";
                    }
                    
                }                
            } else {
                $mensaje = '<p class="alert alert-danger">Por favor, ¡Ingrese Todos los Datos!</p>';
            }
        }
    }
 ?>
<body>
		
	<!-- Header section -->
	<?php include("includes/header.php"); ?>
	<!-- Header section end -->


	<!-- Page Info -->
    <section id="page-info">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <a href="index.php">Inicio / </a><a href="login.php">Iniciar Sesión </a> 
                </div>
            </div>
        </div>
    </section > 
    
	<!-- Page -->
	<div class="page-area product-page spad">
		<div class="container">
            <br><br>
			<div class="login-box" id="login">
                <div class="register-logo">
                    <h3 class="text-center">Iniciar Sesión</h3>
                    <hr><br><br>
                    <?php //var_dump($_SESSION);?>
                </div>
                <div class="login-box-body">
                    <p class="login-box-msg">Ingrese su email y contraseña</p>
                    <?php
                        if (isset($mensaje)) {
                            echo $mensaje; //mensaje de error
                        }
                    ?>
                    <form action="" method="post" autocomplete="off">
                        <div class="form-group has-feedback">
                            <input type="email" name="email" class="form-control" placeholder="Email" required>
                            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <input type="password" id="contrasena" name="contrasena" class="form-control" placeholder="Contraseña" required>
                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                          
                        </div>
                        <div class="row">
                            <div class="col"></div>
                            <div class="col-xs-6 col-xs-offset-3">
                                <button type="submit" class="btn btn-primary btn-block btn-flat" name="login">Iniciar Sesión</button>
                            </div>
                            <div class="col"></div>
                        </div>
                    </form>
                    <!--div class="social-auth-links text-center">
                        <br>
                        <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Entrá usando
                            Facebook</a>
                        <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Entrá usando
                            Google+</a>
                    </div-->
                    <br>
                    <div class="text-center">
                        <!--a href="reset.php">¿Olvidaste tu contraseña?</a><br-->
                        <?php if (isset($_GET['redirect'])) { ?>
                           <a href="registro.php?redirect=<?php echo $_GET['redirect'];?>" style="font-size:32px; color:red">¿Aún no te has registrado?</a>
                           <?php } else { ?> 
                                  <a href="registro.php" style="font-size:32px; color:red">¿Aún no te has registrado?</a>
                          <?php  } ?>
                     
                        <!-- <a nohref class="text-center" onClick="viewForgot()" style="cursor:pointer;">¿Olvidaste tu contraseña?</a><br>
                        <a nohref class="text-center" onClick="viewRegister()" style="cursor:pointer;">¿Aún no te has registrado?</a> -->
                    </div>
                </div> <!-- /.login-box-body -->
            </div> <!-- /.login-box -->
		</div>
	</div>
	<!-- Page end -->

	<!-- Footer top section -->	
	<?php include("includes/footer.php");?>
</script>

<script src="js/bootstrap.min.js"></script>
    <script src="js/holder.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    

<?php include("includes/scripts.php"); ?>


</html>
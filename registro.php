<?php 
	session_start();
?>
<!DOCTYPE html>
<html lang="zxx">
<?php 
	// session_start();
	include("includes/head.php");
	include("funciones/funciones.php");
    include("includes/cart.php");
    
    if($_SERVER['REQUEST_METHOD'] == "POST") {
		if (isset($_POST['nuevo'])){
            // var_dump($_POST);
            if(isset($_POST['email']) && $_POST['email'] != '' && isset($_POST['contrasena']) &&  $_POST['contrasena'] != '' ) {
                if ($_POST['contrasena'] == $_POST['contrasena2']) {
                    $contrasena = md5($_POST['contrasena']);
                    $incluir = newUsuario ($_POST['nombre'], $_POST['apellido'], $_POST['email'], $contrasena, $_POST['telefono']) ;
                    if (substr($incluir,0,1) == "E") {
                        $mensaje = '<p class="text-center alert alert-danger">Consulte al administrador de sistemas.<br>Error->"'.$incluir.'"</p>';
                    } else if ($incluir == null) {
                        $mensaje = '<p class="text-center alert alert-danger">Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
                    } else {			
                        $_SESSION['email'] = $_POST['email'];
                        $_SESSION['usuario'] = $_POST['nombre'];
                        $_SESSION['id_cliente'] = $incluir;
                        $_SESSION['mayorista'] = 0;
                            if (isset($_GET['redirect'])) { 
                                $redirect = $_GET['redirect'];
                                echo "<script type='text/javascript'>document.location.href='$redirect';</script>";
                            } else { 
                                echo "<script type='text/javascript'>document.location.href='index.php';</script>";
                            } 
                        
                    }    
                } else {
                    $mensaje = '<p class="text-center alert alert-danger">¡Verifique sus datos! Las contraseñas no coinciden.</p>';
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
    <!-- Page Info end -->
    
	<!-- Page -->
	<div class="page-area product-page spad">
		<div class="container">
            <div class="register-box" id="register">
                <div class="register-logo">
                   <br> <hr>
                    <h3 class="text-center">Aún no tienes una cuenta? Regístrese</h3>
                    <hr>
                </div>

                <div class="register-box-body">
                    <p class="login-box-msg">Ingrese sus datos</p>
                    <?php
                        if (isset($mensaje)) {
                            echo $mensaje; //mensaje de error                            
                        }
                    ?>
                    
                    <form method="post" autocomplete="off">
                        <div class="form-group has-feedback">
                            <input type="text" class="form-control" placeholder="Nombre" name="nombre" required>
                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <input type="text" class="form-control" placeholder="Apellido" name="apellido" required>
                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <input type="email" class="form-control" placeholder="Email" name="email" required>
                            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <input type="text" class="form-control" placeholder="Telefono" name="telefono" required>
                            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <input type="password" class="form-control" placeholder="Contraseña" name="contrasena" id="contrasena" required>
                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                            <small id="passstrength"></small>
                        </div>
                        <div class="form-group has-feedback">
                            <input type="password" class="form-control" placeholder="Repita la contraseña" name="contrasena2" id="contrasena2" onKeyUp="habilitar()" required>
                            <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
                            <small id="pass2"></small>
                        </div>
                        <div class="row">
                            <div class="col"></div>
                            <div class="col-xs-4">
                                <button type="submit" class="btn btn-primary btn-block btn-flat btn-lg" name="nuevo" id="nuevo">Registrarme Ahora</button>
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
                    <!-- /.social-auth-links -->
                    <br>
                    <div class="text-center">
                        <a href="login.php"  style="font-size:32px; color:red">¡Ya Estoy registrado! Iniciar sesión</a><br><br>
                        <!-- <a nohref class="text-center" onClick="viewLogin()" style="cursor:pointer;">¡Estoy registrado!</a> -->
                    </div>
                </div> <!-- /.form-box -->
            </div> <!-- /.register-box -->
		</div>
	</div>
    <!-- Page end -->
    
	<!-- Footer top section -->	
	<?php include("includes/footer.php");?>
</script>

<?php include("includes/scripts.php"); ?>

<script>
$('#contrasena').keyup(function(e) {
     var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
     var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
     var enoughRegex = new RegExp("(?=.{6,}).*", "g");
     if (false == enoughRegex.test($(this).val())) {
                      document.getElementById("contrasena").className = "pass-error form-control ";
                      $('#passstrength').html('Inserte Más caracteres.');
                      document.getElementById('nuevo').disabled=true;

     } else if (strongRegex.test($(this).val())) {
        document.getElementById("contrasena").className = "pass-ok form-control ";
            
             $('#passstrength').html('Nivel de Seguridad de seña: Fuerte!');
             document.getElementById('nuevo').disabled=false;
     } else if (mediumRegex.test($(this).val())) {
        document.getElementById("contrasena").className = "pass-alert form-control ";
            
             $('#passstrength').html('Nivel de Seguridad de seña: Medio! Inserte Mayusculas / Minusculas / Numeros y Simbolos');
             document.getElementById('nuevo').disabled=false;
     } else {
        document.getElementById("contrasena").className = "pass-error form-control ";
             $('#passstrength').html('Nivel de Seguridad de seña: Débil! Inserte Mayusculas / Minusculas / Numeros y Simbolos');
             document.getElementById('nuevo').disabled=true;
     }
     return true;
});
</script>

<script type="text/javascript">

    function habilitar()

    {

        var camp1= document.getElementById('contrasena');
        var camp2= document.getElementById('contrasena2');
       // var boton= document.getElementById('boton');

        if (camp1.value != camp2.value) {
            document.getElementById("contrasena2").className = "pass-no-identico form-control ";
            $('#pass2').html('Las contraseñas no son iguales');
            document.getElementById('nuevo').disabled=true;

           
        }else {
            document.getElementById("contrasena2").className = "pass-identico form-control ";
            $('#pass2').html('');
            document.getElementById('nuevo').disabled=false;
        }
    }



</script>


</html>
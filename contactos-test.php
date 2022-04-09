<?php session_start();?>
<!doctype html>
<html lang="es">
<?php 
	require "funciones/funciones.php";
    include("includes/head.php"); 
    if(isset($_GET['id'])){
        $id=$_GET['id'];
    }else{$id='1';}

// Varios destinatarios
$para  = 'capacitcursoscde@gmail.com' . ', '; // atención a la coma
$para .= 'diego.martinez@coexma.com.py';

// título
$título = 'Recordatorio de cumpleaños para Agosto';
			if (isset($_POST['nombre'])) {
                $guardarmensaje = 2;
				if ($guardarmensaje > 1) {
					$tipomensaje = 'success';		   
					$mensaje= '<p class="text-center alert alert-success">Tu mensaje se envió de forma exitosa, en breve nos pondremos en contacto contigo :) </p>';


                       // the message
                       $prod= "Mensaje enviado desde (Formulario de Contactos)";
                       $link="www.coexma.com.py/contactos.php";
                       $nombre=  "Nombre: ". $_POST['nombre'];
                       $telefono= "Telefono: ".$_POST['telefono'];
                       $email= "Email: ".$_POST['email'];
                       $assunto= "Assunto: ".$_POST['asunto'];
                       $mensajeform = "Mensaje: ".$_POST['mensaje'];
                       $msg = $nombre."\n".$telefono."\n".  $email."\n".$mensajeform."\n".$prod." \n".$link."\n";
   
                       // use wordwrap() if lines are longer than 70 characters
                       // $msg = wordwrap($msg,300);
                       // send email
                       //    mail("capacitcursoscde@gmail.com","Nuevo Pedido Express",$msg);
   
                    



                       // Para enviar un correo HTML, debe establecerse la cabecera Content-type
$headers  = 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

// Cabeceras adicionales
$headers .= 'To: Mary <capacitcursoscde@gmail.com>, Kelly <diego.martinez@coexma.com.py>' . "\r\n";
$headers .= 'From: Recordatorio <coexma@coexma.com.py>' . "\r\n";
$headers .= 'Cc: birthdayarchive@example.com' . "\r\n";
$headers .= 'Bcc: birthdaycheck@example.com' . "\r\n";

// Enviarlo
mail('diego.martinez@coexma.com.py', $título, $mensaje, $headers);
                       
					//echo "<script type='text/javascript'>document.location.href='pedido-completado.php?ped=".$guardarpedido."';</script>";
				}	else if ($guardarmensaje == null) {
					$tipomensaje = 'error';
					$mensaje = '<p class="text-center alert alert-danger">Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
				} else {
					$tipomensaje = 'error';
					$mensaje = '<p class="text-center alert alert-danger">Consulte al administrador de sistemas.<br>Error->"'.$guardar.'"</p>';
                }
                
            }

         //   $producto =getProducto($id);
			
		      
?>
  <body>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<!-- Header section -->
	<?php include("includes/header.php"); ?>
	<!-- Header section end -->
    <main role="main">
    <section id="page-info">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <a href="index.php">Inicio / </a><a href="#">Contactos</a> 
                </div>
            </div>
        </div>
    </section > 
    <section class="page-section"> 
    <div class="container">

    <?php if (isset($mensaje)) {
        
         echo $mensaje;
     
    } ?>


        
<div class="container spad">
    <div class="text-center">
    <h2 class="h3 titulo-seccion text-center ">Formulario de Contacto</h2>
    <hr>
                            <small >
                              <p class="text-center">Complete el siguiente formulario.</p>
                            </small>
    </div>
</div>

    <div class="row">
    <!--div class="col-md-4">
    <div class="container contact-info-warp">
            <div class="contact-card">
                <div class="contact-info">
                    <h4>CIUDAD DEL ESTE</h4>
                    <p><span>Dirección:</span>   Avda. Dr. Guido Boggiani 7489 c/ Eusebio Ayala</p>
                    <p><span>Telefono 01:</span>    061 500972</p>  
                    <p><span>Telefono 02:</span>    061 509035</p>    
                </div>
                <div class="contact-info">
                    <h4>ASUNCION</h4>
                    <p><span>Dirección:</span>  Avda. Alejo Garcia c/ Tte. Cabello - Ciudad del Este - PY</p>
                    <p><span>Telefono 01:</span>   +595 21 510111</p>   
                </div>
                <div class="contact-info">
                    <h4>SAN LORENZO</h4>
                    <p><span>Dirección: </span>  Atilio Galfre Casi Yta Ybate, km 8,5 – San Lorenzo – PY</p>
                    <p><span>Telefono 01: </span>    +595 21 507050</p>  
                    <p><span>Telefono 02:</span>    +595 986 700180</p>      
                </div>
            </div>
        </div>
    </div-->


<div class="col-md-12">
        <form method= "POST">
        <br><br>
        <div class="form-group">
            <label for="nombre">Nombre</label>
            <input type="text" class="form-control" id="nombre"  name="nombre" aria-describedby="nombreHelp" placeholder="Ingrese su Nombre" required> 
           
        </div>
        <div class="form-group">
            <label for="nombre">Teléfono</label>
            <input type="text" class="form-control" id="telefono"  name="telefono" aria-describedby="nombreHelp" placeholder="Ingrese su Telefono" required>
           
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1">Email</label>
            <input type="email" class="form-control" id="email"   name="email" aria-describedby="emailHelp" placeholder="Ingrese su email" required>
           
        </div>
        <div class="form-group">
            <label for="nombre">Asunto</label>
            <input type="text" class="form-control" id="asunto" name="asunto" aria-describedby="asuntoHelp" placeholder="Ingrese un tema a tratar" required> 
         </div>
         <div class="form-group">
            <label for="mensaje">Mensaje</label>
            <textarea class="form-control" id="mensaje" name="mensaje" rows="3"></textarea>
        </div>

  
        <button type="submit" class="btn btn-primary">Enviar mensaje</button>
        </form>
</div>
    </div>

</div> 

    </section>

    <?php include "includes/unidades.php"; ?>





<!-- Header section -->
<?php include("includes/footer.php"); ?>
<!-- Header section end -->	    
        </main>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>

<script src="js/bootstrap.min.js"></script>
<script src="js/holder.min.js"></script>       
<script src="js/owl.carousel.min.js"></script>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script>
$('#owl-product').owlCarousel({
loop:true,
margin:0,
dots:false,
lazyLoad:true,
autoplay:true,
nav:true,
navText : ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>'],
responsive:{
    0:{
        items:1
    },
    600:{
        items:1
    },
    1000:{
        items:1
    }
}



})
</script>

<?php include("includes/scripts.php"); ?>


</body>
</html>
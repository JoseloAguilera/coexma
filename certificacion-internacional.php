<?php session_start();?>
<!doctype html>
<html lang="es">
<?php 
	require "funciones/funciones.php";
    include("includes/head.php"); 
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
                    <a href="index.php">Inicio / </a><a href="#">Empresa Certificada ISO 9001-2015</a> 
                </div>
            </div>
        </div>
    </section > 
    <section class="page-section"> 
    <div class="container">      
        <div class="container spad">
            <div class="text-center">
                     <h2 class="h3 titulo-seccion text-center ">Certificación Internacional</h2>
            <hr>
                           
        </div>
    </div>

    <div class="row">


    <div class="col-md-12">
    <div class="row">
    <div class="col-md-4">
        <img src="img/upload/certificacion-iso-9001-2015.JPG" style="max-height:400px" alt="certificacion-iso-9001-2015">

    </div>
    <div class="col-md-8">
    <small >
        <p class="text-left">Aqui te mostramos nuestra certificación ISO 9001:2015</p>
        </small>
        <p>Hemos recibido con mucho orgullo nuestra certificación Internacional ISO 9001:2015 Staregister respaldando el trabajo que ofrecemos.</p>
        <a href="https://drive.google.com/file/d/1yGyW0a4dGAnzwb85crgExR6-NsWYWMyv/view" class="button btn btn-success" target="_blank">Ver certificado aqui!</a>
        </div>
        </div>
        </div>
        </div>
    </div> 

    </section>

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
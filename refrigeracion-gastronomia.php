<?php session_start();?>

<!doctype html>

<html lang="es">

<meta http-equiv=��Content-Type�� content=��text/html; charset=UTF-8�� />

<?php 

	require "funciones/funciones.php";

  include("includes/head.php"); 

  $_SESSION['tienda'] = 2;

?>

  <body>

	<!-- Header section -->

  <?php include("includes/header.php");  ?>

    <main role="main">

    <?php include("includes/mensaje.php"); 

    $banners = getBanners(0);
    $bloque5= getBloque(5);
    $bloque6= getBloque(6);
    $bloque7= getBloque(7);
    $bloque8= getBloque(8);

    ?>

	<!-- Hero section -->

	<section style="padding:0px !important;">

			<div class="container-fluid ">

                <div class="row">

                	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">

						<ol class="carousel-indicators">

            

            <?php 

            $i=1;

            foreach ($banners as $banner) { ?> 

            <li data-target="#carouselExampleIndicators" data-slide-to="<?php echo $i; ?>" class="active"></li>

            <?php $i= $i+1; } ?>

				 	</ol>

           <div class="carousel-inner">

           <?php $x= 1;  ?>   

            <?php foreach ($banners as $banner) { ?> 

           

            <div class="carousel-item <?php if($x== '1' ){?> active  <?php } ?>">

              <img class="d-block w-100" src="img/banners/<?php echo $banner["img"]; ?>" alt="Slide-Muebles de Oficina">

            </div>

            <?php $x= $i+1;  ?>

            <?php } ?>

              </div>







				  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">

				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>

				    <span class="sr-only">Previous</span>

				  </a>

				  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">

				    <span class="carousel-control-next-icon" aria-hidden="true"></span>

				    <span class="sr-only">Next</span>

				  </a>

				</div>

                </div>

            </div>

		</section>

    <?php 
    //$bloque1= getBloque(1);
    //var_dump($bloque1);
    if(($bloque5['posicion']=='1') AND ($_SESSION['tienda']=='2')){
      ob_start();
      include( "bloque5.php" );
      $impresion = ob_get_clean(); 
      echo $impresion;
    }elseif (($bloque6['posicion']=='1') AND ($_SESSION['tienda']=='2')){
      ob_start();
      include( "bloque6.php" );
      $impresion = ob_get_clean();
      echo $impresion; 
    }elseif (($bloque7['posicion']=='1') AND ($_SESSION['tienda']=='2')){
      ob_start();
      include( "bloque7.php" );
      $impresion = ob_get_clean();
      echo $impresion; 
    }elseif (($bloque8['posicion']=='1') AND ($_SESSION['tienda']=='2')){
      ob_start();
      include( "bloque8.php" );
      $impresion = ob_get_clean();
      echo $impresion;
    } 
     ?>

    <?php 
    //$bloque1= getBloque(1);
    //var_dump($bloque1);
    if(($bloque5['posicion']=='2') AND ($_SESSION['tienda']=='2')){
      ob_start();
      include( "bloque5.php" );
      $impresion = ob_get_clean(); 
      echo $impresion;
    }elseif (($bloque6['posicion']=='2') AND ($_SESSION['tienda']=='2')){
      ob_start();
      include( "bloque6.php" );
      $impresion = ob_get_clean();
      echo $impresion; 
    }elseif (($bloque7['posicion']=='2') AND ($_SESSION['tienda']=='2')){
      ob_start();
      include( "bloque7.php" );
      $impresion = ob_get_clean();
      echo $impresion; 
    }elseif (($bloque8['posicion']=='2') AND ($_SESSION['tienda']=='2')){
      ob_start();
      include( "bloque8.php" );
      $impresion = ob_get_clean();
      echo $impresion;
    } 
     ?>




    <section id="proyectos-destacados" class="n-padding">



<div id="banner" class="banner" style="

 background:url(img/refrigeracion-gastronomia.jpg);width: 100%;

 height: 100%;

 background-attachment: fixed;

 background-position: center center;

 background-size: cover; ">

  

  

  <div class="gradient-bg">      

    <div class="container">

      <div class="row">

        <div class="banner-info">

          <div class="banner-logo text-center">

            <img src="" class="img-responsive">

          </div>



            <div class="banner-text text-center" style="padding-top:200px">

              <h2 class="white midle">PROYECTOS EXCLUSIVOS</h2>

              <p class="white">Tienda de Conveniencia & Supermercado</p>

              <a href="categoria.php?cat=8" class="btn btn-success white">Ver Catalogo</a>

            </div>



          <div class="overlay-detail text-center">

            <a href="categoria.php?cat=168"></a>

          </div>



        </div>

      </div>

    </div>

  </div>



  </div>





</section>


<?php 
    //$bloque1= getBloque(1);
    //var_dump($bloque1);
    if(($bloque5['posicion']=='3') AND ($_SESSION['tienda']=='2')){
      ob_start();
      include( "bloque5.php" );
      $impresion = ob_get_clean(); 
      echo $impresion;
    }elseif (($bloque6['posicion']=='3') AND ($_SESSION['tienda']=='2')){
      ob_start();
      include( "bloque6.php" );
      $impresion = ob_get_clean();
      echo $impresion; 
    }elseif (($bloque7['posicion']=='3') AND ($_SESSION['tienda']=='2')){
      ob_start();
      include( "bloque7.php" );
      $impresion = ob_get_clean();
      echo $impresion; 
    }elseif (($bloque8['posicion']=='3') AND ($_SESSION['tienda']=='2')){
      ob_start();
      include( "bloque8.php" );
      $impresion = ob_get_clean();
      echo $impresion;
    } 
     ?>

    <?php 
    //$bloque1= getBloque(1);
    //var_dump($bloque1);
    if(($bloque5['posicion']=='4') AND ($_SESSION['tienda']=='2')){
      ob_start();
      include( "bloque5.php" );
      $impresion = ob_get_clean(); 
      echo $impresion;
    }elseif (($bloque6['posicion']=='4') AND ($_SESSION['tienda']=='2')){
      ob_start();
      include( "bloque6.php" );
      $impresion = ob_get_clean();
      echo $impresion; 
    }elseif (($bloque7['posicion']=='4') AND ($_SESSION['tienda']=='2')){
      ob_start();
      include( "bloque7.php" );
      $impresion = ob_get_clean();
      echo $impresion; 
    }elseif (($bloque8['posicion']=='4') AND ($_SESSION['tienda']=='2')){
      ob_start();
      include( "bloque8.php" );
      $impresion = ob_get_clean();
      echo $impresion;
    } 
     ?>





    <?php 

      include("includes/marcas.php"); 

      include("includes/newsletter.php");

      include("includes/footer.php"); 

      ?>

                    



    </main>



    <!-- Bootstrap core JavaScript

    ================================================== -->

    <!-- Placed at the end of the document so the pages load faster -->

       

    <script src="js/bootstrap.min.js"></script>

    <script src="js/holder.min.js"></script>

    <script src="js/owl.carousel.min.js"></script>

    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->

  

  </body>



   

    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->

    <script>$('.carousel').carousel();

      </script>





    <script>

    

$('#owl-marca').owlCarousel({

    loop:true,

    margin:0,

	dots:false,

	lazyLoad:true,

	autoplay:true,

    nav:true,

	navText : ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>'],

    responsive:{

        0:{

            items:2

        },

        600:{

            items:6

        },

        1000:{

            items:6

        }

    }



})


$('#owl-bloque1').owlCarousel({
    loop:true,
    margin:0,
    dots:false,
	lazyLoad:true,
	autoplay:true,
    nav:true,
	navText : ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>'],
    responsive:{
        0:{
            items:2
        },
        600:{
            items:4
        },
        1000:{
            items:4
        }
      }
})
  $('#owl-bloque2').owlCarousel({
    loop:true,
    margin:0,
    dots:false,
	lazyLoad:true,
	autoplay:true,
    nav:true,
	navText : ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>'],
    responsive:{
        0:{
            items:2
        },
        600:{
            items:4
        },
        1000:{
            items:4
        }
      }
})

$('#owl-bloque3').owlCarousel({
    loop:true,
    margin:0,
    dots:false,
	lazyLoad:true,
	autoplay:true,
    nav:true,
	navText : ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>'],
    responsive:{
        0:{
            items:2
        },
        600:{
            items:4
        },
        1000:{
            items:4
        }
      }
})

$('#owl-bloque4').owlCarousel({
    loop:true,
    margin:0,
    dots:false,
	lazyLoad:true,
	autoplay:true,
    nav:true,
	navText : ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>'],
    responsive:{
        0:{
            items:2
        },
        600:{
            items:4
        },
        1000:{
            items:4
        }
      }
})


</script>






<?php include("includes/scripts.php"); ?>

</html>
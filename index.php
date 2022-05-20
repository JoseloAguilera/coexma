<?php session_start();?>
<!doctype html>
<html lang="es">
<?php 

	require "funciones/funciones.php";
  include("includes/head.php"); 

  

  if (isset($_GET['tienda'])) {
    $_SESSION['tienda'] = $_GET['tienda'];
  }

  if (!isset($_SESSION['tienda'])) { ?>
    <script>
      window.location = 'tiendas.php';
    </script>
  <?php }  ?>
  <?php 
  if ($_SESSION['tienda'] == 2) {?>
    <script>
      window.location = 'refrigeracion-gastronomia.php';
    </script>
   <?php } 
  ?>
  <body>
    
 
	<!-- Header section -->
	<?php include("includes/header.php"); ?>
	<!-- Header section end -->
  <main role="main">
    <?php  include("includes/mensaje.php"); 
    $banners = getBanners(1);
    $bloque1= getBloque(1);
    $bloque2= getBloque(2);
    $bloque3= getBloque(3);
    $bloque4= getBloque(4);
    ?>
	<!-- Hero section -->
	<section style="padding:0px !important;"  data-aos="fade-up"
     data-aos-duration="3000">
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
    if(($bloque1['posicion']=='1') AND ($_SESSION['tienda']=='1')){
      ob_start();
      include( "bloque1.php" );
      $impresion = ob_get_clean(); 
      echo $impresion;
    }elseif (($bloque2['posicion']=='1') AND ($_SESSION['tienda']=='1')){
      ob_start();
      include( "bloque2.php" );
      $impresion = ob_get_clean();
      echo $impresion; 
    }elseif (($bloque3['posicion']=='1') AND ($_SESSION['tienda']=='1')){
      ob_start();
      include( "bloque3.php" );
      $impresion = ob_get_clean();
      echo $impresion; 
    }elseif (($bloque4['posicion']=='1') AND ($_SESSION['tienda']=='1')){
      ob_start();
      include( "bloque4.php" );
      $impresion = ob_get_clean();
      echo $impresion;
    } 
     ?>
   
    <?php// $destacados = getProductosDestacados($_SESSION['tienda'],16);?>
    <!--section  data-aos="fade-up"
     data-aos-duration="3000">
        <div class="container">
            <div class="row">
                <div class="container text-center">
                  <hr>
                 <?php  //$textos = getTitulos();  ?>
                <h3 class="h3 titulo-seccion">Promociones Semanales<?php //echo $textos['t1']  ?></h3>
                <hr>
                <p></p>
                    <div class="owl-carousel owl-theme" id="owl-primero">
                      <?php// foreach ($destacados as $row) { ?>
                        <div class ="item">  
                        
                            
                            <div class="product-grid">
                                <div class="product-image">
                                <a href="producto.php?id=<?php //echo $row['id']; ?>">


                                        <?php// if (isset(getProdImage($row['id'])['url'])) { ?>
                                          <figure class="imghvr-fold-right">  

                                           <img src="img/productos/<?php //echo getProdImage($row['id'])['url']; ?>">
                                           <figcaption>
                                             <p>
                                                <?php// if (isset(getProdImagesecundaria($row['id'])['url'])) { ?>
                                                   <img src="img/productos/<?php// echo getProdImagesecundaria($row['id'])['url']; ?>">
                                                 <?php // } else { ?> 
                                                    <img src="img/productos/<?php //echo getProdImage($row['id'])['url']; ?>">
                                              <?php //} ?>
                                           </figcaption>
                                          
                                           </p>
                                          </figure>
                                        
                                       <?php // } else { ?> 
                                       <img class="" src="img/productos/no-image.png">
                                       <?php //} ?>
                                           
                                        </a>
                                    <a class="add-to-cart" href="producto.php?id=<?php //echo $row['id']; ?>">Ver mas..</a>
                                </div>
                                <div class="product-content">
                                    <h3 class="title"><a href="producto.php?id=<?php //echo $row['id']; ?>"><?php //echo $row['nombre']; ?></a></h3>
                                    <span class="price"><?php// if(($row['precio']>0)){ echo number_format($row['precio'], 0, ',', '.')." gs"; } else{ echo "<span class='price-consult'>Sobre Consulta</span>";} ?></span>
                              </div>
                            </div>
                          
                        </div>
                      <?php //} ?>

                  
                  </div>
            </div>            
        </div>
    </section-->

    <?php 
    //$bloque1= getBloque(1);
    //var_dump($bloque1);
    if(($bloque1['posicion']=='2') AND ($_SESSION['tienda']=='1')){
      ob_start();
      include( "bloque1.php" );
      $impresion = ob_get_clean(); 
      echo $impresion;
    }elseif (($bloque2['posicion']=='2') AND ($_SESSION['tienda']=='1')){
      ob_start();
      include( "bloque2.php" );
      $impresion = ob_get_clean();
      echo $impresion; 
    }elseif (($bloque3['posicion']=='2') AND ($_SESSION['tienda']=='1')){
      ob_start();
      include( "bloque3.php" );
      $impresion = ob_get_clean();
      echo $impresion; 
    }elseif (($bloque4['posicion']=='2') AND ($_SESSION['tienda']=='1')){
      ob_start();
      include( "bloque4.php" );
      $impresion = ob_get_clean();
      echo $impresion;
    } 
     ?>
    

  <section id="proyectos-destacados" class="n-padding"  data-aos="fade-up"
     data-aos-duration="3000"> 

  <div id="banner" class="banner" style="
   background:url(img/banners/muebles-de-oficina.jpg);width: 100%;
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
            <div class="banner-text text-center" style="padding-top:150px">
              <h2 class="white midle">Proyectos Exclusivos</h2>
              
              <p class="white">Centro de Llamadas, Oficinas, Sala de Reuniones</p>
              <a href="categoria.php?cat=168" class="btn btn-success white">Ver Catalogo</a>
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
    if(($bloque1['posicion']=='3') AND ($_SESSION['tienda']=='1')){
      ob_start();
      include( "bloque1.php" );
      $impresion = ob_get_clean(); 
      echo $impresion;
    }elseif (($bloque2['posicion']=='3') AND ($_SESSION['tienda']=='1')){
      ob_start();
      include( "bloque2.php" );
      $impresion = ob_get_clean();
      echo $impresion; 
    }elseif (($bloque3['posicion']=='3') AND ($_SESSION['tienda']=='1')){
      ob_start();
      include( "bloque3.php" );
      $impresion = ob_get_clean();
      echo $impresion; 
    }elseif (($bloque4['posicion']=='3') AND ($_SESSION['tienda']=='1')){
      ob_start();
      include( "bloque4.php" );
      $impresion = ob_get_clean();
      echo $impresion;
    } 
     ?>

  <?php 
    //$bloque1= getBloque(1);
    //var_dump($bloque1);
    if(($bloque1['posicion']=='4') AND ($_SESSION['tienda']=='1')){
      ob_start();
      include( "bloque1.php" );
      $impresion = ob_get_clean(); 
      echo $impresion;
    }elseif (($bloque2['posicion']=='4') AND ($_SESSION['tienda']=='1')){
      ob_start();
      include( "bloque2.php" );
      $impresion = ob_get_clean();
      echo $impresion; 
    }elseif (($bloque3['posicion']=='4') AND ($_SESSION['tienda']=='1')){
      ob_start();
      include( "bloque3.php" );
      $impresion = ob_get_clean();
      echo $impresion; 
    }elseif (($bloque4['posicion']=='4') AND ($_SESSION['tienda']=='1')){
      ob_start();
      include( "bloque4.php" );
      $impresion = ob_get_clean();
      echo $impresion;
    } 
     ?>

   

    

     <!-- footer section -->
     <!-- Button trigger modal -->



     <?php include("includes/marcas.php"); ?>
      <?php include("includes/newsletter.php"); ?>
      
	    <?php include("includes/footer.php"); ?>
    	<!-- footer section end -->	    

                 

    </main>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  
  
      
    <script src="js/bootstrap.min.js"></script>
    <script src="js/holder.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
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
  
  </body>
  <?php include("includes/scripts.php"); ?>


</html>
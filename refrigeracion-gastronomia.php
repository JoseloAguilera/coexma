<?php session_start();?>
<!doctype html>
<html lang="es">
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
    $destacados = getProductosDestacados($_SESSION['tienda'],8);?>
    <section>
    <?php  include("includes/mensaje.php"); ?>
        <div class="container">
            <div class="row">
                <div class="container text-center">
                <hr>
                            <h3 class="h3 titulo-seccion">Productos Destacados</h3>
                            <hr>
                <p></p>
                    <div class="row">
                      <?php foreach ($destacados as $row) { ?>
                        <div class="col-md-3 col-sm-6">
                                <div class="product-grid">
                                    <div class="product-image">
                                    <a href="producto.php?id=<?php echo $row['id']; ?>">
                                        <?php if (isset(getProdImage($row['id'])['url'])) { ?>

                                           <img class="pic-1" src="img/productos/<?php echo getProdImage($row['id'])['url']; ?>">
                                           <img class="pic-2" src="img/productos/<?php echo getProdImage($row['id'])['url']; ?>">
                                        
                                       <?php  } else { ?> 
                                       <img class="" src="img/productos/no-image.png">
                                       <?php } ?>
                                           
                                        </a>
                                        <a class="add-to-cart" href="producto.php?id=<?php echo $row['id']; ?>">Ver mas..</a>
                                    </div>
                                    <div class="product-content">
                                        <h3 class="title"><a href="producto.php?id=<?php echo $row['id']; ?>"><?php echo $row['nombre']; ?></a></h3>
                                        <span class="price"><?php if(($row['precio']>0)){ echo number_format($row['precio'], 0, ',', '.')." gs"; } else{ echo "<span class='price-consult'>Sobre Consulta</span>";} ?></span>
                                        
                                  </div>
                                </div>
                            </div>
                      <?php } ?>

                  
                  </div>
            </div>            
        </div>
    </section>


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




    




    <?php $categorya = getProdbyCategoriaHome(7,4);?>
    <section class="section-dark">
        <div class="container">
            <div class="row">
                <div class="container text-center">
                        <div class="row">
                          <!--div class="col-md-3">
                            <figure><img src="" alt=""></figure>
                          </div-->
                          <div class="col-md-12">
                          <hr>
                            <h3 class="h3 titulo-seccion">Refrigeración & Gastronomia</h3>
                            <hr>
                            <p>Los mejores productos para equipar tu supermercado</p>
                              <div class="row">
                              <?php 
                              foreach ($destacados as $row) { ?>
                        <div class="col-md-3 col-sm-6">
                                <div class="product-grid">
                                    <div class="product-image">
                                    <a href="producto.php?id=<?php echo $row['id']; ?>">
                                        <?php if (isset(getProdImage($row['id'])['url'])) { ?>

                                           <img class="pic-1" src="img/productos/<?php echo getProdImage($row['id'])['url']; ?>">
                                           <img class="pic-2" src="img/productos/<?php echo getProdImage($row['id'])['url']; ?>">
                                        
                                       <?php  } else { ?> 
                                       <img class="" src="img/productos/no-image.png">
                                       <?php } ?>
                                           
                                        </a>
                                        <a class="add-to-cart" href="producto.php?id=<?php echo $row['id']; ?>">Ver mas..</a>
                                    </div>
                                    <div class="product-content">
                                        <h3 class="title"><a href="producto.php?id=<?php echo $row['id']; ?>"><?php echo $row['nombre']; ?></a></h3>
                                        <span class="price"><?php if(($row['precio']>0)){ echo number_format($row['precio'], 0, ',', '.')." gs"; } else{ echo "<span class='price-consult'>Sobre Consulta</span>";} ?></span>
                                        
                                  </div>
                                </div>
                            </div>
                              <?php 
                            } ?>  
                          </div>
                        </div>
                
                </div>
            </div>            
        </div>
    </section>










    <?php $categoryc = getProdbyCategoriaHome(6,4);?>
    <!--section class="section-white">
        <div class="container">
            <div class="row">
                <div class="container text-center">
                        <div class="row">
                         
                          <div class="col-md-12">
                            <h3 class="h3">Muebles para Bar</h3>
                            <p>La armonia perfecta entre la versatilidad y ligereza con un impresionandte toque de elegancia</p>
                              <div class="row">
                              <?php foreach ($categoryc as $row) { ?>
                                <div class="col-md-3 col-sm-6">
                                <div class="product-grid">
                                    <div class="product-image">
                                    <a href="producto.php?id=<?php echo $row['id']; ?>">
                                        <?php if (isset(getProdImage($row['id'])['url'])) { ?>

                                           <img class="pic-1" src="img/productos/<?php echo getProdImage($row['id'])['url']; ?>">
                                           <img class="pic-2" src="img/productos/<?php echo getProdImage($row['id'])['url']; ?>">
                                        
                                       <?php  } else { ?> 
                                       <img class="" src="img/productos/no-image.png">
                                       <?php } ?>
                                           
                                        </a>
                                        <a class="add-to-cart" href="producto.php?id=<?php echo $row['id']; ?>">Ver mas..</a>
                                    </div>
                                    <div class="product-content">
                                        <h3 class="title"><a href="producto.php?id=<?php echo $row['id']; ?>"><?php echo $row['nombre']; ?></a></h3>
                                        <span class="price"><?php if(($row['precio']>0)){ echo number_format($row['precio'], 0, ',', '.')." gs"; } else{ echo "<span class='price-consult'>Sobre Consulta</span>";} ?></span>
                                        
                                  </div>
                                </div>
                            </div>
                              <?php } ?>  
                          </div>
                        </div>
                
                </div>
            </div>            
        </div>
    </section -->

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
</script>
|



<?php include("includes/scripts.php"); ?>
</html>
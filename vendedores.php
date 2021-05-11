<?php session_start(); ?>
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
                    <a href="index.php">Inicio/</a><a href="">Vendedores</a>
                </div>
            </div>
        </div>
    </section > 
      <!-- Team -->
     
<section id="team" class="pb-5">
<?php  include("includes/mensaje.php"); ?>

  <?php $unidades = getUnidades(); 
    foreach ($unidades as $unidad){ ?>

   <div class="container-fluid">
    <div class="container">
        <hr>
        <h5 class="section-title h1"><?php echo $unidad['nombre']; ?></h5>
        <hr>
        <div class="row">
           
           
           <?php $vendedores = getVendedores($unidad['id']);
           if (isset($vendedores)) {

            foreach ($vendedores as $vendedor) { ?>
                              <!-- Team member -->    
            <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class=" img-fluid" src="img/vendedores/<?php echo $vendedor['foto']; ?>" alt="card image"></p>
                                    <h4 class="card-title"> <?php echo $vendedor['nombre']; ?></h4>
                                    <p class="card-text"> <?php echo $vendedor['cargo']; ?></p>
                                    <a href="#" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title">INFORMACIÓN</h4>
                                    <p class="card-text"><span>Email:</span><a href="<?php echo $vendedor['link_email']; ?>"> <?php echo $vendedor['email']; ?></a></p>
                                    <hr>
                                    <p class="card-text"><span>Skype:</span> <a href="<?php echo $vendedor['link_skype']; ?>"><?php echo $vendedor['skype']; ?></a></p>
                                    <hr>
                                    <p class="card-text"><span>Telefono:</span><a href="<?php echo $vendedor['link_telefono_a']; ?>"> <?php echo $vendedor['telefono_a']; ?></a></p>
                                    <?php if (isset($vendedor['telefono_b'])){ ?>
                                    <hr>
                                    <p class="card-text"><span>Telefono</span><a href="<?php echo $vendedor['link_telefono_b']; ?>"><?php echo $vendedor['telefono_b']; ?></a></p>
                                    <?php }?>
                                    <hr>
                                    <p class="card-text"><span>WhatsApp:</span><a href="<?php echo $vendedor['link_whatsapp']; ?>"><?php echo $vendedor['whatsapp']; ?></a></p>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ./Team member -->          
              <?php }} ?>

        </div>
    
    </div>
    </div>
    <?php } ?>



    
</section>
   



    	<!-- Header section -->
	    <?php include("includes/footer.php"); ?>
    	<!-- Header section end -->	    

                 

    </main>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    
    <script src="js/bootstrap.min.js"></script>
    <script src="js/holder.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <?php include("includes/scripts.php"); ?>
  
  </body>
</html>

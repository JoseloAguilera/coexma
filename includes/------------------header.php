<?php 

if (isset($_POST['boletin'])) {
  $guardarnewsletter = saveNewsletter ($_POST['email']);
   if ($guardarnewsletter > 1) {
    $tipomensaje = 'success';			   
    $mensaje= '<p class="text-center alert alert-success"> Gracias por suscribirte a nuestro boletin de Noticias :)</p>';
//echo "<script type='text/javascript'>document.location.href='pedido-completado.php?ped=".$guardarpedido."';</script>";
   }	else if ($guardarnewsletter == null) {
      $tipomensaje = 'error';
      $mensaje = '<p class="text-center alert alert-danger">Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
      } else {
      $tipomensaje = 'error';
      $mensaje = '<p class="text-center alert alert-danger">Consulte al administrador de sistemas.<br>Error->"'.$guardarnewsletter.'"</p>';
        }  
    }

    $unidades = getUnidadesWhats($_SESSION['tienda']);

?>
 <?php $menu = getAllMenuCategorias( $_SESSION['tienda'], 'menu');?>
 
 

<header>

<div class="row">
<div class="col-md-12 info-contact-header d-block d-sm-block d-md-none mobile-cart-menu">
        <div class="dropdown show">                     

              <?php	if (!isset($_SESSION['usuario'])){?>
                <a href="login.php" class="user-menu register icon-link"> <i class="fa fa-user-o" aria-hidden="true"></i> Login</a>	
                <a href="registro.php" class="user-menu register icon-link" style="margin-left: 0px;">Registrarme</a>	
                <?php } else { ?>
                <a class="btn btn-transparent dropdown-toggle icon-link" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-user-o"  aria-hidden="true"></i>  Hola <?php echo $_SESSION['usuario'];?> :)                  
                </a>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                  <a href="salir.php" class="dropdown-item"  href="#" >Salir</a>
                </div>
              <?php } ?>
           
        		<a href="carrito.php" class="card-bag"><i class="fa fa-shopping-cart" aria-hidden="true"></i>
         <span><?php echo countCart(); ?></span></a>								
         </div>

         </div>

    </ul>
  

</div> <!-- navbar-collapse.// -->
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-light">

<a class="navbar-brand" href="index.php"><img src="img/logo.png" alt="" class="img-fluid"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main_nav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="main_nav">
 
  <ul class="navbar-nav">

	<li class="nav-item "> <a class="nav-link" href="index.php">Inicio </a> </li>
  <?php 
  if ($_SESSION['tienda'] == 1){ ?>
   <li class="nav-item "> <a class="nav-link" href="refrigeracion-gastronomia.php">Refrigeración y Gastronomia </a> </li>
    
      <?php  }else{ ?>
        <li class="nav-item "> <a class="nav-link" href="index.php?tienda=1">Muebles de Oficina </a> </li>
      <?php  } ?>

  

	

	<li class="nav-item dropdown has-megamenu">
		<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"> Productos  </a>
	    <div class="dropdown-menu megamenu" role="menu">
                    <div class="row">                    
                    <?php foreach ($menu as $mainmenu) { ?>  
                        <div class="col-md-3">
                            <div class="col-megamenu">
                            	<h6 class="title"><?php echo $mainmenu['nombre']; ?></h6>
	                            <ul class="list-unstyled">
                              <?php
                              $submenu = getAllMenuCategorias($mainmenu['id'],'menu');
                                  if ($submenu) {
                                      foreach ($submenu as $subm) { ?>
                                          <li style="border-bottom: 1px solid #dae0e0;padding: 5px;">
                                          <a href="categoria.php?cat=<?php echo $subm['id'] ?>" <?php if ($subm['id'] == 166) { echo "style='font-weight: 800;color: var(--danger);' ";}?>><?php echo $subm['nombre'] ?>
                                          </a>
                                          </li>
                                          
                                  <?php } ?>
                                 <?php  } ?>
	                            </ul>
                            </div>  <!-- col-megamenu.// -->
                        </div><!-- end col-3 -->
                        <?php  } ?>
                    </div><!-- end row --> 
        </div> <!-- dropdown-mega-menu.// -->
	</li>
  <li class="nav-item"><a class="nav-link" href="quienes-somos.php"> Quienes Somos </a></li>
  <li class="nav-item"><a class="nav-link" href="contactos.php"> Contactos </a></li>
  
</ul>

        <div class="col-md-4 col-sm-12 info-contact-header">
          <form class="form-inline mt-2 mt-md-0" method="GET" action="categoria.php">
            <input class="form-control mr-sm-2" type="text" placeholder="Que estas buscando?" aria-label=" Que estas Buscando?" name="search"  required>
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><i class="fa fa-search" aria-hidden="true"></i>
            </button>
          </form>
        </div>

<ul class="navbar-nav ml-auto">
<div class="col-md-12 info-contact-header">
        <div class="dropdown show">                     

              <?php	if (!isset($_SESSION['usuario'])){?>
                <a href="login.php" class="user-menu register icon-link"> <i class="fa fa-user-o" aria-hidden="true"></i> Login</a>	
                <a href="registro.php" class="user-menu register icon-link" style="margin-left: 0px;">Registrarme</a>	
                <?php } else { ?>
                <a class="btn btn-transparent dropdown-toggle icon-link" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-user-o"  aria-hidden="true"></i>  Hola <?php echo $_SESSION['usuario'];?> :)                  
                </a>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                  <a href="salir.php" class="dropdown-item"  href="#" >Salir</a>
                </div>
              <?php } ?>
           
        		<a href="carrito.php" class="card-bag"><i class="fa fa-shopping-cart" aria-hidden="true"></i>
         <span><?php echo countCart(); ?></span></a>								
         </div>

         </div>

    </ul>

</div> <!-- navbar-collapse.// -->

</nav>









  <?php $menu = getAllMenuCategorias( $_SESSION['tienda'], 'menu');?>

      <!--nav class="navbar navbar-expand-md navbar-dark " >     
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
                  
                 <?php //foreach ($menu as $mainmenu) {
                    //if (getAllMenuCategorias($mainmenu['id'],'menu')) {  ?>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                            <?php/// echo $mainmenu['nombre'] ?> 
                            </a>
                          <div class="dropdown-menu" aria-labelledby="navbarDropdown">                        
                              <?php /*
                              $submenu = getAllMenuCategorias($mainmenu['id'],'menu');
                              foreach ($submenu as $subm) { ?>
                                  <a class="dropdown-item" href="categoria.php?cat=<?php echo $subm['id'] ?>"><?php echo $subm['nombre'] ?> </a>
                              <?php } ?>
                           </div>
                        </li>                
                    <?php } else { ?>
                      <li class="nav-item">
                        <a class="nav-link" href="categoria.php?cat=<?php echo $mainmenu['id'] ?>"><?php echo $mainmenu['nombre'] ?> </a>
                      </li>
                    <?php } ?>
                 <?php  } */ ?>
           
          
          </ul>

                 
                    
          <?php  /*
           if ($_SESSION['tienda'] == 1) { ?>
             
               <a class="nav-link nav-tienda" href="refrigeracion-gastronomia.php"> <i class="fa fa-snowflake-o" aria-hidden="true"></i>
                  </i>  Refrigeración y Gastronomía </a>
           
          <?php } else { ?>
            
                  <a class="nav-link nav-tienda" href="index.php?tienda=1"> <i class="nav-icon fa fa-reply" aria-hidden="true"></i> Muebes de Oficina</a>
         

            <?php } */?>  

           
            </div>
        </div!-->
       
            <a data-toggle="modal" data-target="#whatsmodal" class="whatsapp" > <i class="fa fa-whatsapp whatsapp-icon parpadea"></i></a>


      
      
     
     <div class="col-md-6">
  
     </div>
      <a id="button"></a>
    </header>


          <div class="modal fade" id="whatsmodal" tabindex="-1" role="dialog" aria-labelledby="whatsmodallabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="whatsmodallabel">Vendedores Online</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                <form method="post">
                  <div class="row">
                    <div class="form-group col-md-6">
                      <input type="text" class="form-control" id="whats_nombre" name="whats_nombre" placeholder="Su Nombre">
                    </div>
                  <div class="form-group col-md-6">
                    <input type="text" class="form-control" id="whats_nro" name="whats_nro" placeholder="Su Whatsapp">
                  </div>
                
                </div>

                  <div class="form-group">
                      <label for="unidades">Seleccione Una Localidad</label>
                      <select class="form-control" id="unidades" name= "unidades">
                          <option value="">Seleccione una Localidad:</option>
                            <?php foreach ($unidades as $unidad) { ?>  
                           <option value="<?php echo $unidad["id"] ?>">-<?php echo $unidad["nombre"] ?></option>
                        <?php } ?>      
                      </select>
                      <?php
                      //$vendedores = getVendedores($unidad); 
                      //foreach ($vendedores as $vendedor) { ?>
                  
                    <div class="col-md-12" id="vendedores"></div><!-- FIN COL-12-->
                 </div> <!-- FIN FORM-GROUP-->
              </form>

                </div>
            
              </div>
            </div>
          </div>




  
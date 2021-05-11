<?php session_start();?>
<!doctype html>
<html lang="es">
<?php 
	require "funciones/funciones.php";
  include("includes/head.php"); 

  /*ini_set('display_errors',1);
ini_set('display_startup_erros',1);
error_reporting(E_ALL);*/

    //Crea una variable para saber en que pagina estás
    if (isset($_GET['pageno'])) {
      $pageno = $_GET['pageno'];
    } else {
      $pageno = 1;
      }
      
    $prod_por_pag = 18;
    $offset = ($pageno-1) * $prod_por_pag; 
  
    $auxiliar = "";
  
   /**************/
   /* PAGINACION */
   /**************/
   define('NUM_ITEMS_BY_PAGE', 18);
	 $totalSubCategorias = 0;


   //si existe una marca y una categoria  
  if (isset($_GET['cat']) && isset($_GET['idm'])) {
    $categoria = $_GET['cat'];
    $marca = $_GET['idm'];
    $productos = getProdbyCategoriaMarca($categoria, $marca, $offset, $prod_por_pag);
    //paginacion
    $total_pag = countProdbyCategoriaMarca($categoria, $marca);
    $total_pag = sizeof($total_pag);
    $auxiliar = "cat=".$_GET['cat']."&idm=".$_GET['idm']."&";;
   //sino y si solo existe una categoria  
	} else if (isset($_GET['cat']) && $_GET['cat'] > 0) {
    
		$categoria = $_GET['cat'];
    $productos = getProdbyCategoria($categoria,$offset, $prod_por_pag);
    //paginacion
    $total_pag = countProdbyCategoria($categoria);
    $total_pag = sizeof($total_pag);
    $auxiliar = "cat=".$_GET['cat']."&";

 //si no existe ninguna categoria en la url
	} else {
    $categoria = $_SESSION['tienda'];
    $productos = getProdbyCategoria($_SESSION['tienda'],$offset, $prod_por_pag);

    //paginacion
    $total_pag = countProdbyCategoria($categoria);
    $total_pag = sizeof($total_pag);
    $auxiliar = "cat=".$_GET['cat']."&";
  }
  
  if ($productos != null) {
		//Divide las cantidades de productos por la cantidade que puede mostrar en página
		$total_pag = ceil($total_pag / $prod_por_pag);
	} else {
		$total_pag = null;
  }
  


	//ordenar productos
	$orderby='id';
  $order='DESC';
  
	if (isset($_GET['search'])) {
		$search=$_GET['search'];
    $productos = getProdbySearch($search,$offset, $prod_por_pag);
    
    $total_pag = countProdbySearch($search);
    $total_pag = sizeof($total_pag);
    $auxiliar = "cat=".$_GET['cat']."&";
    
  }
  
	if (isset($_GET['orderby']) && isset($_GET['order'])) {
		$orderby=$_GET['orderby'];
		$order=$_GET['order'];
		//validacion
		if ($_GET['order'] != 'DESC' && $_GET['order'] != 'ASC') {
			$order='DESC';
    }
    
	}


?>
  <body>

	<!-- Header section -->
	<?php include("includes/header.php"); ?>
	<!-- Header section end -->
    <main role="main">
    <section id="page-info">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                   <a href="index.php">Inicio / </a> <a href="categoria.php?cat=<?php echo $_SESSION['tienda']; ?>">Categorias / </a> <a href=""><?php echo getCategoria($categoria)['nombre']; ?></a>
                </div>
            </div>
        </div>








    </section > 

    <?php if (!isset($_GET['idm'])) {?>
      <!--section style="
      background: #e6e6e6;
      ">
      <div class="container">
        <div class="row">
            <?php 
          
            $marcas = getMarcasByCategory($_GET['cat']);?>
            
               <div class="col-md-12">
               <hr>
                  <h3 class="text-center">Marcas de la Categoria</h3>
                  <hr>
               <div class="row">
                
                <?php if ($marcas) {?>
        
                 <?php foreach ($marcas as $marca) { ?>
                   <div class="col-md-4">
                   <a href="categoria.php?cat=<?php echo $_GET['cat']; ?>&idm=<?php echo  $marca['id_marca']; ?>">
                       <div class="block-marcas-cateegory">
                       <?php if ($marca['link_imagen_marca'] == "no-image.png") { ?>
                         <p class="titulo-marca"><?php echo  $marca['nombre_marca']; ?></p>
                         <?php } else{?>
                          <figure>
                              <img src="img/marcas/<?php echo  $marca['link_imagen_marca']; ?>" alt="">
                          </figure>
                          <?php }?>
                          <p class="text-center"><small><?php echo  $marca['cant_producto']; ?> Productos Disponibles</small> </p>
                       </div>

                       </a>
                   </div>
                <?php } } ?>
                </div>
               
               </div>
            
           <?php  ?>
            </div>
  </div>
</section--!>

<?php }?>

        <section id="product-area">
            <div class="container">

           
            
            <div class="row">

  <?php
    $subcategorias = getSubCategorias($_GET['cat']);
     if (isset($subcategorias)) { ?>

      <!--div class="">   
      <div class="row">   
      <?php  
      foreach ($subcategorias as $row) {?>
       
        <div class="col-md-3">
        <a href="categoria.php?cat=<?php echo  $row['id'];?>">
           <div class="categoria-m3">
           <?php if ($row['url'] == "") {?>
              <img src="img/categorias/no-image.png" alt="" class="img-fluid img-sub-cat">
              <?php  } else {?>
              <img src="img/categorias/<?php echo  $row['url'];?>" alt="" class="img-fluid img-sub-cat">
           <?php } ?>
              
              <?php echo  $row['nombre'];?>
           </div>
           </a>
        </div> 
        

        <?php }
      ?>
      </div-->     
      
      <?php  } ?>             
                <!--hr>
                  <h3>Productos de la Categoria</h3>
                <hr-->  
                <div class="col-md-3">   
                <?php 
                

                if ($categoria != $_SESSION['tienda']) {
                  
               
                
                $menu = getAllMenuCategorias($categoria, 'cat'); ?>             
                <!-- MENU CATEGORIAS -->
                    
                 
                 <?php if (isset($menu)) {?> 
                    <div class="aside">   
                        <h4 style="text-transform:uppercase"><?php echo getCategoria($categoria)['nombre']; ?></h4>
                        <hr>
                      <?php foreach ($menu as $menuitem) { ?> 
                      <?php 
                      $submenu = getAllMenuCategorias($menuitem['id'], 'cat');
                        if (($submenu != NULL)) { ?>
                            <div class="accordion-wrap">
                            <div class="accordion-item">
                              <p class="accordion-header"> <?php echo $menuitem['nombre'];?> <i class="fa fa-angle-down" aria-hidden="true"></i> </p>
                            </div>
                            <div class="accordion-text">
                                <?php  foreach ($submenu as $submenu_item) { ?>                           
                                  <p><a href="categoria.php?cat=<?php echo $submenu_item['id'];?> "><?php echo $submenu_item['nombre'];?> </a></p>                           
                                <?php } ?>
                            </div>
                            </div>
                        <?php } else { ?> 
                          <div class="accordion-item accordion-header accordion-wrap">
                             <p class="category-menu"><a href="categoria.php?cat=<?php echo $menuitem['id'];?> "><?php echo $menuitem['nombre'];?> </a></p>   
                          </div>
                        <?php } }?>
                      </div>
                      <?php } 
                      
                        }
                      
                   ?>

                  <br>
                                    
                 <?php 

                 $menu = getAllMenuCategorias($_SESSION['tienda'], 'cat');                  
                 if (isset($menu)) {?> 

                    <div class="aside">   
                       <h4 style="text-transform:uppercase">Categorias</h4>
                       <hr>
                       <?php
                       foreach ($menu as $menuitem) { ?> 
                       <?php 
                       $submenu = getAllMenuCategorias($menuitem['id'], 'cat');
                          if (($submenu != NULL)) { ?>
                              <div class="accordion-wrap">
                                 <div class="accordion-item">
                                    <p class="accordion-header"> <?php echo $menuitem['nombre'];?> <i class="fa fa-angle-down" aria-hidden="true"></i> </p>
                                 </div>
                                 <div class="accordion-text">
                                   <?php  foreach ($submenu as $submenu_item) { ?>                           
                                      <p><a href="categoria.php?cat=<?php echo $submenu_item['id'];?> "><?php echo $submenu_item['nombre'];?> </a></p>                           
                                   <?php } ?>
                                 </div>
                              </div>
                            <?php } else { ?> 
                            <div class="accordion-item accordion-header accordion-wrap">
                                <p class="category-menu"><a href="categoria.php?cat=<?php echo $menuitem['id'];?> "><?php echo $menuitem['nombre'];?> </a></p>   
                            </div>
                           <?php } 
                         } ?>
                     </div>


                   <?php } ?>   
                   
              <br>
                   <div class="aside">
            <?php 

            
          
                   $marcas = getMarcasByCategory($_GET['cat']);?>
            
               
            
                  <h4 class="text-center" style="text-transform:uppercase">Marcas</h4>
                  <hr>
                             
                
                <?php if ($marcas) {?>
        
                 <?php foreach ($marcas as $marca) { ?>
                
                 
                   <a href="categoria.php?cat=<?php echo $_GET['cat']; ?>&idm=<?php echo  $marca['id_marca']; ?>">
                       <div class="block-marcas-category">
                          <?php if ($marca['link_imagen_marca'] == "no-image.png") { ?>
                            <p class="titulo-marca"><?php echo  $marca['nombre_marca']; ?></p>
                          <?php } else{?>
                          <figure>
                              <img src="img/marcas/<?php echo  $marca['link_imagen_marca']; ?>" alt="" style="
    max-width: 200px;
">
                          </figure>
                          <?php }?>
                          <!--p class="text-center"><small><?php echo  $marca['cant_producto']; ?> Productos Disponibles</small> </p-->
                       </div>

                       </a>
                  
                <?php } 
              
              } ?>
             
         

             </div>


                   

               
               </div>

                <!-- PRODUCTOS DE CATEGORIA -->
                <div class=" <?php if (isset($menu)) { ?> col-md-9 <?php }else { ?> col-md-12 <?php } ?>">
                    <div class="row">
                    
                    <?php 
                        if ($productos == NULL){
                      ?>
                      <div class="alert alert-danger" role="alert">
                        Ops! No encontramos ningun producto en tu busqueda :D<br>
                        <a href="index.php" style="color: black">Volver al <a href="index.php">Inicio</a>
                      </div>
                      
                        <?php } else { 
                          $cantProd = count($productos);
                          foreach ($productos as $row) {?>
                          <div class="<?php if (isset($menu)) { ?> col-md-4 col-sm-6<?php }else { ?> col-md-3 col-sm-6 <?php } ?>"">
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
                                    <small style="background: #dad7d7;color: white; text-transform: uppercase;  padding: 2px;"><?php echo getProdMarca($row['id_marca'])['nombre']; ?></small>
                                    <h3 class="title"><a href="producto.php?id=<?php echo $row['id']; ?>"><?php echo $row['nombre']; ?></a></h3>
                                    <span class="price"><?php if(($row['precio']>0)){ echo number_format($row['precio'], 0, ',', '.')." gs"; } else{ echo "<span class='price-consult'>Sobre Consulta</span>";} ?></span>
                              </div>
                            </div>
                        </div>

                      

                        <?php }  
                        if ($total_pag != null){ //IF PAGINACION
                          ?>
                          <div class="col-md-12">
                            <nav aria-label="Page navigation example">
                              <ul class="pagination justify-content-center">
                                <li class="page-item <?php if($pageno <= 1){ echo 'disabled'; } ?>">
                                  <a class="page-link" href="<?php if($pageno <= 1){ echo '#'; } else { echo "?".$auxiliar."pageno=".($pageno - 1); } ?>" tabindex="-1" aria-disabled="true"><</a>
                                </li>
                                <?php
                                  for ($pag = 0; $pag < $total_pag; $pag++) {
                                    if ($pag+1 == $pageno){
                                      $active = " active";
                                    } else { 
                                      $active = "";
                                    }
                                ?>
                                  <li class="page-item <?php echo $active;?>"><a class="page-link" href="<?php echo "?".$auxiliar."pageno=".($pag + 1);?>"><?php echo $pag+1;?></a></li>
                                <?php
                                  }
                                ?>
                                <li class="page-item <?php if($pageno >= $total_pag){ echo 'disabled'; } ?>">
                                  <a class="page-link" href="<?php if($pageno >= $total_pag){ echo '#'; } else { echo "?".$auxiliar."pageno=".($pageno + 1); } ?>">></a>
                                </li>
                              </ul>
                            </nav>
                          </div>
                          <?php
                              } //END IF PAGINACION
                            } //END IF $productos
                          //} //END IF PAGINACION
                            ?> 

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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    
    <script src="js/bootstrap.min.js"></script>
    <script src="js/holder.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->

    <script>
    
    $(".accordion-wrap").on("click", function(){   
      $(this).children().eq(1).slideToggle(300);  
      $(this).children().eq(0).toggleClass("accordion-no-bar");
      $(this).siblings().find(".accordion-header").removeClass("accordion-gold");
      $(this).siblings().find(".accordion-header i").removeClass("rotate-fa");
      $(this).find(".accordion-header").toggleClass("accordion-gold");
      $(this).find(".fa").toggleClass("rotate-fa");

    $(".accordion-wrap .accordion-text").not($(this).children().eq(1)).slideUp(300);
});


    </script>

<?php include("includes/scripts.php"); ?>

  </body>
</html>

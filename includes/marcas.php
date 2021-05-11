<section class="section-dark">
    <div class="container">
    <h3 class="titulo-seccion text-center">Nuestras Marcas</h3>
    <hr>
    <?php 
       // $marcas =getMarcas(); 
        $marcas = getMarcasByCategory($_SESSION['tienda']);?>
       
        <div class="owl-carousel owl-theme" id="owl-marca">
        <?php foreach ($marcas as $marca) { ?>
            <div class="item"> 
            
            <a href="categoria.php?cat=<?php echo $_SESSION['tienda']; ?>&idm=<?php echo  $marca['id_marca']; ?>">
                       <div class="block-marcas-cateegory">
                       <?php if ($marca['link_imagen_marca'] == "no-image.png") { ?>
                         <p class="titulo-marca" style="font-size:21px"><?php echo  $marca['nombre_marca']; ?></p>
                         <?php } else{?>
                          <figure>
                              <img src="img/marcas/<?php echo  $marca['link_imagen_marca']; ?>" alt="">
                          </figure>
                          <?php }?>
                          <!--p class="text-center"><small><?php //echo  $marca['cant_producto']; ?> Productos Disponibles</small> </p-->
                       </div>

                       </a>
            
            </div>
            <?php } ?>  
        </div>
    
    </div>
</section>


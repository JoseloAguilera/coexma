<?php 
    //$bloque1= getBloque(1);
    //var_dump($bloque1);
    if($bloque1['activo'] == '1'){
     // var_dump($_SESSION['tienda']);
    $productos_bloque1 = getProductosBloque($_SESSION['tienda'],1,16);?>
    <section  data-aos="fade-up"
     data-aos-duration="3000" style="background:<?php echo $bloque1['fondo'] ?>!important">
        <div class="container">
            <div class="row">
                <div class="container text-center">
                  <hr>
                 <?php  //$textos = getTitulos();  ?>
                <h3 class="h3 titulo-seccion" style="color:<?php echo $bloque1['color_tit'] ?> !important"><?php echo $bloque1['titulo']  ?></h3>
                <hr>
                <p style="color:<?php echo $bloque1['color_desc'] ?> !important" > <?php echo $bloque1['descripcion']  ?> </p>
                    <div class="owl-carousel owl-theme" id="owl-bloque1">
                      <?php foreach ($productos_bloque1 as $row) { ?>
                        <div class ="item">  
                        
                            
                            <div class="product-grid">
                                <div class="product-image">
                                <a href="producto.php?id=<?php echo $row['id']; ?>">


                                        <?php if (isset(getProdImage($row['id'])['url'])) { ?>
                                          <figure class="imghvr-fold-right">  

                                           <img src="img/productos/<?php echo getProdImage($row['id'])['url']; ?>">
                                           <figcaption>
                                             <p>
                                                <?php if (isset(getProdImagesecundaria($row['id'])['url'])) { ?>
                                                   <img src="img/productos/<?php echo getProdImagesecundaria($row['id'])['url']; ?>">
                                                 <?php  } else { ?> 
                                                    <img src="img/productos/<?php echo getProdImage($row['id'])['url']; ?>">
                                              <?php } ?>
                                           </figcaption>
                                          
                                           </p>
                                          </figure>
                                        
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
    <?php } ?>
   
   
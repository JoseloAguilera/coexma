<section data-aos="fade-up"
     data-aos-duration="3000" id="parallax-institucional" class="banner" style="background-image: url(img/banners/banner-corporativo-2.jpg)">
    <div class="bg-color-institucional">      
      <div class="container">
        <div class="row">
          <div class="banner-unidades">
            <div class="banner-logo text-center">
              <img src="" class="img-responsive">
            </div>
            <div class="banner-text text-center">
            <hr>
            <i class="fa fa-building-o icono" aria-hidden="true"></i>
              <h3 class="white midle">Unidades</h3> 
              <small>Conozca Nuestras Sucursales</small>
              <hr>
              <div class="row">
                <?php 
                $unidades = getunidadesEmpresa();
                foreach ($unidades as $unidad) {?>  
                    
                  
                <div class="col-md-4" data-aos="fade-up"
     data-aos-duration="3000">
                    <div class="unidades">
                        <figure>
                            <img src="img/unidades/<?php echo $unidad["img_url"]; ?>" alt="" class="img-fluid">
                        </figure>
                        <div class="contact-info">
                            <h4><?php echo $unidad["nombre"]; ?></h4>
                            <hr>
                            <p><span>Dirección:</span> <?php echo $unidad["direccion"]; ?></p>
                            <p><span>Telefonos:</span> <?php echo $unidad["telefonos"]; ?></p> 
                            <p><span>Horarios:</span>  <?php echo $unidad["horarios"]; ?></p>       
                        </div>
                    </div>
                </div>  

                <?php } ?> 
            

             
            </div>
            <div class="overlay-detail text-center">
              <a href="#service"></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

<?php session_start();?>
<!doctype html>
<html lang="es">
<?php 
ini_set('display_errors', 0);
ini_set('display_startup_errors', 0);
error_reporting(E_ALL);
	require "funciones/funciones.php";
    include("includes/head.php");
    
  if (isset($_GET['tienda'])) {
    $_SESSION['tienda'] = $_GET['tienda'];
  }else{ $_SESSION['tienda'] = 1;
  }
  
 
?>
  <body>
	<!-- Header section -->
	<?php include("includes/header.php"); ?>
	<!-- Header section end -->
    <main role="main">
    <?php  include("includes/mensaje.php"); ?>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <!-- Hero section -->
    
    <section id="proyectos-destacados" class="n-padding">

<div id="banner" class="banner" style="
 background:url(img/banners/muebles-de-oficina-quienes-somos.jpg);width: 100%;
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
          <div class="banner-text text-center" style="padding-top:150px" data-aos="zoom-in-down">
            <h2 class="white midle">COEXMA S.R.L</h2>
            
            <p class="white">
               <h3 style="font-size:35px; text-transform:uppercase">Sinónimo de prestigio y seguridad a su negocio, creando ambientes corporativos desde 1998</H3></p>
            
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



<!-- Hero section end -->	

    <!--section>
        <div class="container">
        <br>
        <div class="row">
            <div class="col-md-4">
                <figure>
                    <img src="https://goya.everthemes.com/demo-decor/wp-content/uploads/sites/2/2019/07/norm-clock-gallery4-1024x683.jpg" alt="" class="img-fluid ">
                </figure>
            </div>
            <div class="col-md-4">
                <figure>
                    <img src="https://goya.everthemes.com/demo-decor/wp-content/uploads/sites/2/2019/07/norm-clock-gallery4-1024x683.jpg" alt="" class="img-fluid ">
                </figure>
            </div>
            <div class="col-md-4">
                <figure>
                    <img src="https://goya.everthemes.com/demo-decor/wp-content/uploads/sites/2/2019/07/norm-clock-gallery4-1024x683.jpg" alt="" class="img-fluid ">
                </figure>
            </div>
        </div>
        </div>    
    </section-->

    
    <section class="section-institucional" data-aos="fade-up"
     data-aos-duration="3000">
        <div class="container">
            <div class="row">
                <div class="container text-center">
                <i class="fa fa-heart-o icono" aria-hidden="true"></i>
                <hr>
                <h3 class="h3  titulo-seccion">Bienvenidos a Coexma</h3>
                <hr>
                        <div class="row text-center">

                        <p class="text-center">
<b>COEXMA S.R.L</b> Te da la más cordial bienvenida a ti que a partir de hoy, te incorporas a nuestro grupo de trabajo, llegas en un momento de transformación, de grandes retos.

                            Nos hemos comprometido como empresa a<b> “PRESTAR MÁS Y MEJORES SERVICIOS DE CALIDAD”</b>, a convertirnos en ejemplo de eficiencia y honestidad. Tenemos una muy importante misión por delante.

                            Esto solo podemos lograrlo con tu voluntad, entusiasmo e inteligencia, tú te has convertido en parte importante de la empresa, eres el motor de cambio.

                            <br><br><b>COEXMA S.R.L</b> se compromete a brindarte todos los recursos que estén al  alcance, para que puedas dar lo mejor de ti.
                            De ti solo pido que compartas nuestros ideales, nuestra visión y si así fuera, desde hoy, tu y yo hemos hecho un pacto y somos parte de la misma misión.
                          <br><br><b>Juntos somos un equipo<b>
                        
                        </p>
                    
                      
                        </div>                  
                    </div>
            </div>            
        </div>
    </section>

        <!--section id="parallax-institucional" class="banner" style="background-image: url(img/banners/banner-corporativo-2.jpg)">
    <div class="bg-color-institucional">      
      <div class="container">
        <div class="row">
          <div class="banner-info">
            <div class="banner-logo text-center">
              <img src="" class="img-responsive">
            </div>
            <div class="banner-text text-center">
              <h2 class="white midle">Showroom Ciudad del Este</h2>  
              <p class="white">Visítenos y Conozca nuestro amplio showroom</p>        
             
            </div>
            <div class="overlay-detail text-center">
              <a href="#service"></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section-->

  <?php include "includes/unidades.php"; ?>
  
  <section class="section-dark section-institucional" data-aos="fade-up"
     data-aos-duration="3000">
        <div class="container">
            <div class="row">
                <div class="container text-center">
                <hr>
                <h3 class="h3 titulo-seccion">Sobre Nosotros</h3>
                <hr>
             <br>
                    <div class="row">                
                   
                        <div class="col-md-4" data-aos="fade-up"  data-aos-duration="3000" > 
                        <div data-aos="fade-up" data-aos-anchor-placement="top-center">
                            <div class="block-corporativo">
                            <i class="fa fa-line-chart" aria-hidden="true"></i>
                            <h4>Misión</h4>
                                <p>  Cumplir con las expectativas de nuestros clientes, ofreciendo y garantizando calidad en nuestros productos y servicios, enmarcándonos en la búsqueda de la mejora continua de todos nuestros procesos.
                                </p>
                            </div>                    
                        </div>
                    </div>

                    <div class="col-md-4" data-aos="fade-up"  data-aos-duration="3000">
                        <div class="block-corporativo">
                            <i class="fa fa-eye" aria-hidden="true"></i>
                            <h4>Visión</h4>
                            <p> Ser una empresa que se destaque por ofrecer conceptos innovadores 	 en todos sus productos y servicios, marcar la diferencia al ayudar a 	 construir una comunidad más sostenible y en donde el factor humano    se sienta inspirado para brindar cada día lo mejor de sí.
                            </p>
                        </div> 
                    </div>
                    <div class="col-md-4" data-aos="fade-up">
                        <div class="block-corporativo">
                            <i class="fa fa-handshake-o" aria-hidden="true"></i>
                            <h4>Valores</h4>
                            <p>  Compromiso - Ética Empresarial - Experiencia -
                                Integridad - Servicio - Pasión - Diversidad -
                                Calidad - Responsabilidad Social Empresarial

                            </p>
                            </div> 
                    </div>


                    
                        </div>                  
                    </div>
            </div>            
        </div>
    </section>

    <section id="parallax-institucional" >
    <div id="banner" class="banner" style="
   background:url(img/bg-section-01.JPG);width: 100%;
   height: 100%;
   background-attachment: fixed;
   background-position: center center;
   background-size: cover; " data-aos="fade-up"
     data-aos-duration="3000">
    
    
    <div class="gradient-bg">    
<?php
 // include("includes/timeline.php"); 
?>

        <div class="container">
            <div class="row">
                <div class="container text-center">
                <i class="fa fa-calendar icono white" aria-hidden="true"></i>
                <hr>
                <h3 class="h3 titulo-seccion white" >Time Line</h3>
                <hr>
                <p></p>
                
                    <div class="row">
                    
<ul class="timeline">

<!-- Item 1 -->
<li>
    <div class="direction-r" data-aos="fade-left"
     data-aos-offset="300"
     data-aos-easing="ease-in-sine">
        <div class="flag-wrapper">
            <span class="flag">1977</span>
            <span class="time-wrapper"><span class="time"></span></span>
        </div>
        <div class="desc">Comercio Exclusivo de Máquinas</div>
    </div>
</li>

<!-- Item 2 -->
<li>
    <div class="direction-l" data-aos="fade-right"
     data-aos-offset="300"
     data-aos-easing="ease-in-sine">
        <div class="flag-wrapper">
            <span class="flag">1978</span>
            <span class="time-wrapper"><span class="time"></span></span>
        </div>
        <div class="desc">Coexma exportadora de maquinas.</div>
    </div>
</li>
<!-- Item 3 -->
<li>
    <div class="direction-r" data-aos="fade-left"
     data-aos-offset="300"
     data-aos-easing="ease-in-sine">
        <div class="flag-wrapper">
            <span class="flag">1980</span>
            <span class="time-wrapper"><span class="time"></span></span>
        </div>
        <div class="desc">Coexma Equipamientos para Oficina</div>
    </div>
</li>
<!-- Item 3 -->
<li>
    <div class="direction-l" data-aos="fade-right"
     data-aos-offset="300"
     data-aos-easing="ease-in-sine">
        <div class="flag-wrapper">
            <span class="flag">1983</span>
            <span class="time-wrapper"><span class="time"></span></span>
        </div>
        <div class="desc">Coextecnica Limitada Asistenacia Técnica</div>
    </div>
</li>

<li>
    <div class="direction-r"data-aos="fade-left"
     data-aos-offset="300"
     data-aos-easing="ease-in-sine">
        <div class="flag-wrapper">
            <span class="flag">1998</span>
            <span class="time-wrapper"><span class="time"></span></span>
        </div>
        <div class="desc">Llegada de Carlos P. a Paraguay.
        Venta de muebles, mamparas y persianas</div>
    </div>
</li>
<li>
    <div class="direction-l" data-aos="fade-right"
     data-aos-offset="300"
     data-aos-easing="ease-in-sine">
        <div class="flag-wrapper">
            <span class="flag">2000</span>
            <span class="time-wrapper"><span class="time"></span></span>
        </div>
        <div class="desc">Mudanza a Avda. Alejo garcia c/ Monseñor Zedcich. Ciudad del Este. 
        Venta de muebles, mamparas y persianas</div>
    </div>
</li>
<li>
    <div class="direction-r" data-aos="fade-left"
     data-aos-offset="300"
     data-aos-easing="ease-in-sine">
        <div class="flag-wrapper">
            <span class="flag">2008</span>
            <span class="time-wrapper"><span class="time"></span></span>
        </div>
        <div class="desc">Se construye Coexma S.R.L, con la Incorporación de Rogerio Modalozzo.</div>
    </div>
</li>

<li>
    <div class="direction-l" data-aos="fade-right"
     data-aos-offset="300"
     data-aos-easing="ease-in-sine"> 
        <div class="flag-wrapper">
            <span class="flag">2010</span>
            <span class="time-wrapper"><span class="time"></span></span>
        </div>
        <div class="desc">Mudanza a local propio y Show Room</div>
    </div>
</li>
<li>


</ul>
                        </div>                  
                    </div>
            </div>            
        </div>
    </section>


    <section class="section-institucional section-white" data-aos="fade-up"
     data-aos-duration="3000">
        <div class="container">
            <div class="row">
                <div class="container text-center">
                <i class="fa fa-check-circle-o icono" aria-hidden="true"></i>
                 <hr>   
                <h3 class="h3 titulo-seccion">Política de Calidad</h3>
                <hr>
                        <div class="row text-center">

                        <p class="text-center"><b>COEXMA S.R.L</b> dedicada a la importación, distribución y comercialización de variedad de <b>mobiliarios para oficinas</b> y <b>equipamientos de refrigeración y gastronomía</b> para instalaciones comerciales, ha decidido implantar un Sistema de Gestión de Calidad basado en la norma ISO 9001 2015, basado en la planificación, ejecución, revisión y mejora continua, teniendo presente en todo el momento el contexto de la organización.
<br>
La política de <b>calidad</b> de <b>COEXMA S.R.L</b> se fundamenta principalmente con el compromiso de toda la organización para el logro de la satisfacción de los clientes, con el mismo énfasis nos comprometemos con la sociedad y el medio ambiente cumpliendo con rigor los requisitos legales aplicables mediante el desarrollo de prevención de riesgos y de contaminación y la definición de objetivos y metas que fomenten la utilización de los recursos.
<br>
Desde la Dirección de <b>COEXMA S.R.L</b> nos comprometemos a realizar una correcta
implantación de la política de calidad a todos los niveles de la empresa, proporcionado
los recursos necesarios para su efectividad y teniendo en cuenta que la mejora es 	responsabilidad de todos los integrantes de la empresa empezando desde arriba.	
<br>
                    <br>
                    <small>Ciudad del Este, 06 de enero de 2020</small><br>
                    <small>Rev 01</small>
                    <br>
                    <a class="btn btn-success" href="img/upload/Política-de-Calidad-Rev-01.pdf" target="blank">DESCARGAR POLÍTICA DE CALIDAD</a>
                    <br>
                    <br>
                    </p>
                    <hr>
    </div>   
 <div class="text-center">
                      <p  class=" text-center">

                        Ya sos Cliente? 
                        <a href="formulario.php">Evalue nuestros servicios!</a>
                        </p>
                    
                      
                        </div>                  
                    </div>
            </div>            
        </div>
        </div>
    </section>

    <?php 
      include("includes/newsletter.php");
      include("includes/footer.php"); 
    ?>
                 

    </main>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  
    <script src="js/bootstrap.min.js"></script>
    <script src="js/holder.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
  
  </body>


<?php include("includes/scripts.php"); ?>
</html>
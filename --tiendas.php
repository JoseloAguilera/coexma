<?php session_start();?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="img/favi.png">


    <title>Coexma S.R.L - Muebles de Oficina & Equipamientos de Gastronomia & Refrigeración - Paraguay</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/carousel/">
    <link rel="shortcut icon" href="img/favi.png">

    <!--link rel="stylesheet" href="css/timeline.scss"/-->

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/carousel.css" rel="stylesheet">
	<link rel="stylesheet" href="css/font-awesome.css"/>
	<link rel="stylesheet" href="css/owl.carousel.css"/>
    <link rel="stylesheet" href="css/owl.theme.default.css"/>

     <!-- Facebook Pixel Code -->
     <script>
          !function(f,b,e,v,n,t,s)
          {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
          n.callMethod.apply(n,arguments):n.queue.push(arguments)};
          if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
          n.queue=[];t=b.createElement(e);t.async=!0;
          t.src=v;s=b.getElementsByTagName(e)[0];
          s.parentNode.insertBefore(t,s)}(window, document,'script',
          'https://connect.facebook.net/en_US/fbevents.js');
          fbq('init', '961665801084764');
          fbq('track', 'PageView');
          </script>
          <noscript><img height="1" width="1" style="display:none"
          src="https://www.facebook.com/tr?id=961665801084764&ev=PageView&noscript=1"
          /></noscript>
          <!-- End Facebook Pixel Code -->

    
    

      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://use.fontawesome.com/8f42ea5c61.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  
    <!--script src="sweetalert2.all.min.js"></script-->
    <!-- Optional: include a polyfill for ES6 Promises for IE11 -->
    <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
    <style>
    .photo {
    display: table;
}
.photo a {
    vertical-align: middle;
    display: table-cell;
}
.photo img {
    display: block;
    height: auto;
  
    padding:20px;
    align-items: center;margin-left: auto;margin-right: auto;

}
.img-section{background:black;}
.img-section img {
    opacity: 0.4;
    height: 100%;
    width: 100%;
}
.img-section img:hover {
   /* opacity:0.8;*/
}


/*.btn {
    position: absolute;
    top: 50%;
    
    margin: auto;
    width: 250px;
    height: 55px;
    background: #fffffff2;
    border: 2px solid green;
    border-radius: 0;
    color: green;
    font-size: 21px;
    text-transform: uppercase;
    font-weight: 700;
    padding: 5px 0;
}*/
.logo-t {
    position: absolute;
    z-index: 1000;
    text-align: center;
    padding: 0 15% 0;
    width: 100%;
    background: no-repeat;
}

.btn {
    position: absolute;
    top: 55%;
    left: 50%;
    transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);
    background-color: #4CAF50;
    color: white;
    font-size: 16px;
    padding: 15px !important;
    border: none;
    cursor: pointer;
    text-transform: uppercase;
    border-radius: 0;
    z-index:2000
}

h2 {
    position: absolute;
    top: 45%;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: 2000;
    text-transform: uppercase;
    font-size: 35px;
    font-weight: 700;
    text-align: center;
    color: #4a4e4a;
    color:white;
    z-index:100;
}
a.btn {
    padding: 5px;
    padding: 25px !important;
    font-size: 18px;
    border-radius: 10px;
    background: #005b00;
    border: 2px solid wheat;
}
span {
    padding: 0 25px;
    margin: 0;
}



@media screen and (min-width: 300px) and (max-width: 660px) {
    a.btn.btn-success {
    padding: 10px !important;
    top: 70%;
}

.photo img {
    display: block;
    height: auto;
    position:relative;
    left:0;
    padding:20px;
    max-width:150px
}

.logo-t {
    position: relative;
    padding: 0 30% 0;
}

h2 {
    position: absolute;
    top: 30%;
}
}

.social-footer {
    position: absolute;
    bottom: 25px;
    right: 0;
    background: #1a1a1a;
    z-index:101;
}

/* footer social icons */
ul.social-network {
	list-style: none;
	display: inline;
	margin:0 !important;
	padding: 0;
}
ul.social-network li {
	display: inline;
	margin: 0 5px;
}


/* footer social icons */
.social-network a.icoFacebook {
	background-color:#007bff;
}


.social-network a.icoInstagram{
	background-color:#c13584;
} 




.social-network a.icoFacebook:hover {
	background-color:#3B5998;
}


.social-network a.icoInstagram:hover {
	background-color:#007bb7;
}
.social-network a.icoRss:hover i, .social-network a.icoFacebook:hover i, .social-network a.icoTwitter:hover i,
.social-network a.icoGoogle:hover i, .social-network a.icoVimeo:hover i, .social-network a.icoInstagram:hover i {
	color:#fff;
}
a.socialIcon:hover, .socialHoverClass {
	color:#44BCDD;
}

.social-circle li a {
	display:inline-block;
	position:relative;
	margin:0 auto 0 auto;
	-moz-border-radius:50%;
	-webkit-border-radius:50%;
	border-radius:50%;
	text-align:center;
	width: 50px;
	height: 50px;
	font-size:20px;
}
.social-circle li i {
	margin:0;
	line-height:50px;
	text-align: center;
}

.social-circle li a:hover i, .triggeredHover {
	-moz-transform: rotate(360deg);
	-webkit-transform: rotate(360deg);
	-ms--transform: rotate(360deg);
	transform: rotate(360deg);
	-webkit-transition: all 0.2s;
	-moz-transition: all 0.2s;
	-o-transition: all 0.2s;
	-ms-transition: all 0.2s;
	transition: all 0.2s;
}
.social-circle i {
	color: #fff;
	-webkit-transition: all 0.8s;
	-moz-transition: all 0.8s;
	-o-transition: all 0.8s;
	-ms-transition: all 0.8s;
	transition: all 0.8s;
}



@media screen and (min-width: 660px)  {
    a.btn.btn-success {
    padding: 10px !important;
    top: 60%;
}
}


.image {
  opacity: 1;
  display: block;
   height: auto;
  transition: .5s ease;
  backface-visibility: hidden;
}

.middle {
  transition: .5s ease;
  opacity: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  text-align: center;
}

.img-section:hover .image {
  opacity: 0.8;
}
.img-section:hover  {
  opacity: 0.8;
}



.text {
  background-color: #4CAF50;
  color: white;
  font-size: 16px;
  padding: 16px 32px;
}



</style>
  </head>
  <body>

    <header>
    
    </header>

    <main role="main">
    <section>
        <div class=" -fluid logo-t">
            <div class="row">
                <div class="col-md-12 taxt-center photo" >
                    <img src="img/logo2.png" alt="" style="max-height:150px;">
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                    <div class="col-md-6">
                        <div class="row img-section align-middle">
                            <h2><span>Muebles De Oficina</span></h2>
                            <img src="img/muebles-de-oficina.jpg" alt="" class="img-fluid image" style="">
                          

                        <a href="index.php?tienda=1" class="btn btn-success">Visitar Tienda</a>
                        </div>  
                        <div class="row">
                        <div class="col-12">
                        <div class="social-footer">
                            <ul class="social-network social-circle">
                                <li><a target="_blank" href="https://www.facebook.com/CoexmaParaguay/" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                <li><a target="_blank" href="https://www.instagram.com/coexmasrl/" class="icoInstagram" title="Instagram"><i class="fa fa-instagram"></i></a></li>
                            </ul>
                        </div>
                        </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="row img-section">
                           <img src="img/refrigeracion-gastronomia.jpg" alt="" class="img-fluid image; " style="">
                        
                                <h2><span>Refrigeración & Gastronomia</span></h2>
                                <a href="refrigeracion-gastronomia.php" class="btn btn-success">Visitar Tienda</a>
                            
                        </div>
                        </div>
                    </div>

                    <div class="social-footer">
                            <ul class="social-network social-circle">
                                <li><a target="_blank" href="https://www.facebook.com/CoexmaaPy" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                <li><a target="_blank" href="https://www.instagram.com/coexmapy/" class="icoInstagram" title="Instagram"><i class="fa fa-instagram"></i></a></li>
                            </ul>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
    
    
    </main>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
  </body>
</html>

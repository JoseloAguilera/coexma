<?php session_start();?>
<!doctype html>
<html lang="es">
<?php 
	require "funciones/funciones.php";
  include("includes/head.php"); 

  if (isset($_GET['preg_1'])) {
    $idcliente =  substr(md5(time()), 0, 16);
    for ($i=1; $i < 6 ; $i++) { 
      $guardarEncuesta = saveEncuesta ($idcliente, $_GET['preg_'.$i], $_GET['opcion_'.$i]);
      if ($guardarEncuesta =!NULL) {
          $tipomensaje = 'success';			   
          $mensaje= '<p class="text-center alert alert-success">Gracias por brindarnos tu calificación :)</p>';
          //echo "<script type='text/javascript'>document.location.href='pedido-completado.php?ped=".$guardarpedido."';</script>";
      }	else if ($guardarEncuesta == null) {
          $tipomensaje = 'error';
          $mensaje = '<p class="text-center alert alert-danger">Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
      } else {
          $tipomensaje = 'error';
          $mensaje = '<p class="text-center alert alert-danger">Consulte al administrador de sistemas.<br>Error->"'.$guardarEncuesta.'"</p>';
      }
    }
      
      
  }
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
                    <a href="index.php">Inicio</a><a href="#">>>Formulario de Evaluación</a>
                </div>
            </div>
        </div>
    </section> 

<section id="formulario-evaluacion">
  <div class="container">

<div class="col-md-12 ">
    <div class="row text-center">
        <div class="col-md-4"></div>
            <div class="col-md-4">
              <?php if (isset($mensaje)) {
              echo $mensaje;}?>
            </div>
        <div class="col-md-4"></div>
      </div>
    </div>


<?php if (!isset($mensaje)) {?>
  

<div class="col-md-11 ">
<form id="regForm" action="" method="get">
  <h1>Califique nuestra atención:</h1>
  <!-- One "tab" for each step in the form: -->

            <!-- One "tab" for each step in the form: -->
            <?php $preguntas = getPreguntas();
           if (isset($preguntas)) {
            /*PREGUNTA */
            foreach ($preguntas as $pregunta) { ?>
                <div class="tab">
              
                
                      <h4 class="pregunta"><?php echo $pregunta['pregunta']; ?></h4> <br>          
                      <?php $opciones = getPreguntasOpciones($pregunta['id']) ;?>
                  
                      <input type="text" value="<?php echo $pregunta['id']; ?>" style=" visibility: hidden;" name="preg_<?php echo $pregunta['id']; ?>" id="preg_<?php echo $pregunta['id']; ?>">
                 
                        <?php  foreach ($opciones as $opcion) { ?>
                            <div class="form-check">
                            <input class="form-check-input" type="radio" name="opcion_<?php echo $pregunta['id']; ?>" id="opcion_<?php echo $opcion['id']; ?>" value="<?php echo $opcion['id']; ?>">
          
                                <label class="form-check-label respuesta" for="opcion_<?php echo $opcion['id']; ?>"><?php echo $opcion['valor']; ?>&nbsp;
                                &nbsp;&nbsp;
                                &nbsp;

 </label>
                            </div>
                           <hr>
                        <?php  }  ?>                   
                </div>
                
              
               <?php  
               }
            }
       ?>  


  <div style="overflow:auto;">
    <div style="float:right;">
      <button type="button" id="prevBtn" onclick="nextPrev(-1)">Anterior</button>
      <button type="button" id="nextBtn" onclick="nextPrev(1)">Siguiente</button>
    </div>
  </div>
  <!-- Circles which indicates the steps of the form: -->
  <div style="text-align:center;margin-top:40px;">
    <span class="step"></span>
    <span class="step"></span>
    <span class="step"></span>
    <span class="step"></span>
    <span class="step"></span>
  </div>
</form>
</div>
<?php } else { ?>
  <a class="btn btn-danger" href="formulario.php">Volver al Formulario</a>
  <a  class="btn btn-success" href="index.php">Volver al Inicio</a>

  <?php }//fin--mensaje ?>




    
</div>

</section>

   



    	<!-- Header section -->
	    <?php include("includes/footer.php"); ?>
    	<!-- Header section end -->	    

                 

    </main>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  
    
    <script src="js/bootstrap.min.js"></script>

    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
  
  </body>

  <script>
var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the current tab

function showTab(n) {
  // This function will display the specified tab of the form...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  //... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (x.length - 1)) {
    document.getElementById("nextBtn").innerHTML = "ENVIAR RESPUESTAS";
  } else {
    document.getElementById("nextBtn").innerHTML = "SIGUIENTE";
  }
  //... and run a function that will display the correct step indicator:
  fixStepIndicator(n)
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !validateForm()) return false;
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  // if you have reached the end of the form...
  if (currentTab >= x.length) {
    // ... the form gets submitted:
    document.getElementById("regForm").submit();
    return false;
  }
  // Otherwise, display the correct tab:
  showTab(currentTab);
}

function validateForm() {
  // This function deals with validation of the form fields
  var num = "opcion_".concat(currentTab+1);
  //(!$("input[name='name']:checked").val()
  if(!$("input[name='"+num+"']:checked").val()){
    alert('Favor de seleccionar una opción');
    return false;
  }else{return true;}

}

function fixStepIndicator(n) {
  // This function removes the "active" class of all steps...
  var i, x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class on the current step:
  x[n].className += " active";
}
</script>

<?php include("includes/scripts.php"); ?>
  
</html>
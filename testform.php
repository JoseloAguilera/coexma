<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<?php 
	require "funciones/funciones.php";
    include("includes/head.php"); 

    if (isset($_POST['preg_1'])) {
      for ($i=1; $i < 6 ; $i++) { 
        $guardarEncuesta = saveEncuesta ($_GET['preg_1'], $_GET['opcion_1']);
        if ($guardarEncuesta > 1) {
            $tipomensaje = 'success';			   
            $mensaje= '<p class="text-center alert alert-success">Tu pedido se generó de forma exitosa, en breve nos pondremos en contacto contigo :). Su Numero de pedido es:'.$guardarpedido.'</p>';
            //echo "<script type='text/javascript'>document.location.href='pedido-completado.php?ped=".$guardarpedido."';</script>";
        }	else if ($guardarEncuesta == null) {
            $tipomensaje = 'error';
            $mensaje = '<p class="text-center alert alert-danger">Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
        } else {
            $tipomensaje = 'error';
            $mensaje = '<p class="text-center alert alert-danger">Consulte al administrador de sistemas.<br>Error->"'.$guardarpedido.'"</p>';
        }
      }
        
        
    }
?>
<style>
* {
  box-sizing: border-box;
}

body {
  background-color: #f1f1f1;
}


</style>
<body>


 
       ?>  
   
        <form id="regForm" action="" method="get">
  <h1>Califique nuestra atención:</h1>
  <!-- One "tab" for each step in the form: -->

            <!-- One "tab" for each step in the form: -->
            <?php $preguntas = getPreguntas();
           if (isset($preguntas)) {
            /*PREGUNTA */
            foreach ($preguntas as $pregunta) { ?>
                <div class="tab">
              
               
                <h4><?php echo $pregunta['pregunta']; ?></h4> <br>          
                  <?php $opciones = getPreguntasOpciones($pregunta['id']) ;?>
                  <input type="text" value="<?php echo $pregunta['id']; ?>">
                  <table class="table table-border">
                        <?php  foreach ($opciones as $opcion) { ?>
                            <tr> 
                            <td> <p><?php echo $opcion['valor']; ?></p> </td> 
                            <td><input class="" oninput="this.className = ''" type="radio" name="<?php echo $pregunta['id']; ?>" value="<?php echo $opcion['id']; ?>"></td>
                            </tr> 
                        <?php  }  ?> 
                   </table>
                  
                </div>
                

               <?php  
               }
            }
       ?>  


  <div style="overflow:auto;">
    <div style="float:right;">
      <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
      <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
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
    document.getElementById("nextBtn").innerHTML = "Submit";
  } else {
    document.getElementById("nextBtn").innerHTML = "Next";
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
  var x, y, i, valid = true;
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("input");
  // A loop that checks every input field in the current tab:
  for (i = 0; i < y.length; i++) {
    // If a field is empty...
    if (y[i].value == "") {
      // add an "invalid" class to the field:
      y[i].className += " invalid";
      // and set the current valid status to false
      valid = false;
    }
  }
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
    document.getElementsByClassName("step")[currentTab].className += " finish";
  }
  return valid; // return the valid status
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

</body>
</html>
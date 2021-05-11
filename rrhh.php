<?php session_start();?>
<!doctype html>
<html lang="es">
<?php 
	require "funciones/funciones.php";
  include("includes/head.php");
 

  
?>
  <body>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<!-- Header section -->
  <?php include("includes/header.php");
  
  if (isset($_POST['SubmitBtn'])) {


    $fileName=$_FILES["resume"]["name"];
    $fileSize=$_FILES["resume"]["size"]/1024;
    $fileType=$_FILES["resume"]["type"];
    $fileTmpName=$_FILES["resume"]["tmp_name"];  
  
    if($fileType=="application/pdf"){
      
      if($fileSize<=2000){
  
        //New file name
        $random=rand(1111,9999);
  
        $fileNameCmps = explode(".", $fileName);
        $fileExtension = strtolower(end($fileNameCmps));
  
        $newFileName = md5(time() . $fileName) . '.' . $fileExtension;
  
        //$newFileName=$random.$fileName;
  
        //File upload path
        $uploadPath="img/upload/".$newFileName;
  
        //function for upload file
        if(move_uploaded_file($fileTmpName,$uploadPath)){
          $mensaje ='CURRICULUM SUBIDO EXITOSAMENTE.';
        
      $guardarpedido = saveCurriculum ($_POST['nombre'], $_POST['apellido'], $_POST['cedula'],$_POST['email'], $_POST['ciudad'], $_POST['departamento'], $_POST['area'], $_POST['telefono'], $newFileName);
      
            if ($guardarpedido > 0) {

              for ($i=1; $i < 4; $i++) { 
                if ($_POST['empresa_'.$i] != "") {
                  $guardarexp = saveCurriculumExperiencia ($guardarpedido, $_POST['empresa_'.$i], $_POST['antiguedad-desde_'.$i],  $_POST['antiguedad-hasta_'.$i], $_POST['cargo_'.$i]);
                  }
                } 
        
                if ($guardarexp > 0) {
                  $tipomensaje = 'success';			   
                  $mensaje= '<p class="text-center alert alert-success">Tu Curriculum fue guardado de forma exitosa en nuestra base de datos. :) </p>';
          
                } else if ($guardarexp == null) {
                  $tipomensaje = 'error';
                  $mensaje = '<p class="text-center alert alert-danger">Csdonsulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
              } else {
                  $tipomensaje = 'error';
                  $mensaje = '<p class="text-center alert alert-success">sdsdsdConsulte al administrador de sistemas>Error->"'.$guardarpedido.'"</p>';
              }
        
            //echo "<script type='text/javascript'>document.location.href='pedido-completado.php?ped=".$guardarpedido."';</script>";
            }	else if ($guardarpedido == null) {
                $tipomensaje = 'error';
                $mensaje = '<p class="text-center alert alert-danger">Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
            } else {
                $tipomensaje = 'error';
                $mensaje = '<p class="text-center alert alert-success">Consulte al administrador de sistemas>Error->"'.$guardarpedido.'"</p>';
            }     
 
  
  
        }
      }
      else{
        echo "Maximum upload file size limit is 200 kb";
      }
    }
    else{
      echo "No es un archivo PDF Valido";
    }  
  
    
  }
  
  ?>

  
	<!-- Header section end -->
    <main role="main">
    <section id="page-info">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <a href="index.php">Inicio</a><a href="#"> > RECURSOS HUMANOS</a>
                </div>
            </div>
        </div>
    </section> 

<section id="formulario-evaluacion" class="page-section">
  <div class="container">

                            <h2 class="h3 titulo-seccion text-center ">Recursos Humanos</h2>
                            <small >
                              <p class="text-center">Queres ser parte de nuestro equipo de trabajo? Complete el formulario de postulación.</p>
                            </small>
                           

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


<?php if (!isset($mensaje)) { } ?>
  

<form action="" method="post" enctype="multipart/form-data" name="form1">
<div class="row">
   <!-- titulo -->
  <div class="col-md-12">
    <hr>
      <h4>DATOS Personales</h4>
    <hr>
  </div>

 <!-- datos personales -->
  <div class="form-group col-md-6">
    <label for="Nombre">Nombre</label>
    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Tu Nombre" required="true">
   </div>

  <div class="form-group col-md-6">
    <label for="Apellido">Apellido</label>
    <input type="text" class="form-control" id="apellido" name="apellido"  placeholder="Tu Apellido"  required="true"> 
  </div>

  <div class="form-group col-md-6">
    <label for="exampleFormControlInput1">Nro. de Cedula</label>
    <input type="text" class="form-control" id="cedula" name="cedula" placeholder="Nro. de Cédula"  required="true">
  </div>

  <div class="form-group col-md-6">
    <label for="exampleFormControlInput1">Email </label>
    <input type="email" class="form-control" id="email" name="email" placeholder="Email"  required="true"  required="true">
  </div>

  <div class="form-group col-md-6">
    <label for="exampleFormControlInput1">Departamento</label>
    <input type="text" class="form-control" id="departamento"  name="departamento"  placeholder="Departamento"  required="true"> 
  </div>

  <div class="form-group col-md-6">
    <label for="exampleFormControlInput1">Ciudad</label>
    <input type="text" class="form-control" id="ciudad" name="ciudad"  placeholder="Ciudad"  required="true">
  </div>

  <div class="form-group col-md-6">
    <label for="exampleFormControlInput1">Telefono</label>
    <input type="text" class="form-control" id="telefono" name="telefono" placeholder="Teléfono"  required="true">
  </div>

  <div class="form-group col-md-6">
    <label for="exampleFormControlSelect1" >Area de Postulación</label>
    <select class="form-control" id="area" name="area"  required="true">
      <option>Ventas</option>
      <option>Marketing</option>
      <option>Administrativo</option>
      <option>Producción</option>
      <option>Depósito</option>
      <option>Entrega - Chofer</option>
    </select>
  </div>
  
  <div class="col-md-12">
    <hr>
      <h4>Experiencia</h4>
    <hr>
  </div>

 <!-- EXPERIENCIA 1 -->
  <div class="form-group col-md-3">
    <label for="empresa_1">Empresa</label>
    <input type="text" class="form-control" id="empresa_1" name="empresa_1" placeholder=""  required="true">
  </div>

  <div class="form-group col-md-3">
  <label for="antiguedad-desde_1" class="col-2 col-form-label">Desde</label>
    <input class="form-control" type="date" value="2011-08-19" id="antiguedad-desde_1" name="antiguedad-desde_1"  required="true">
  </div>

  <div class="form-group col-md-3">
  <label for="antiguedad-hasta_1" class="col-2 col-form-label">Hasta</label> 
    <input class="form-control" type="date" value="2020-08-19" id="antiguedad-hasta_1"  name="antiguedad-hasta_1"  required="true">  
  </div>

  <div class="form-group col-md-3">
    <label for="cargo_1">Cargo</label>
    <input type="text" class="form-control" id="cargo_1" name="cargo_1"  placeholder=""  required="true">
  </div>



   <!-- EXPERIENCIA 2 -->
   <div class="form-group col-md-3">
    <label for="empresa_2">Empresa</label>
    <input type="text" class="form-control" id="empresa_2" name="empresa_2" placeholder="">
  </div>

  <div class="form-group col-md-3">
  <label for="antiguedad-desde_2" class="col-2 col-form-label">Desde</label>
    <input class="form-control" type="date" value="2011-08-19" id="antiguedad-desde_2" name="antiguedad-desde_2">
  </div>

  <div class="form-group col-md-3">
  <label for="antiguedad-hasta_2" class="col-2 col-form-label">Hasta</label> 
    <input class="form-control" type="date" value="2020-08-19" id="antiguedad-hasta_2"  name="antiguedad-hasta_2">  
  </div>

  <div class="form-group col-md-3">
    <label for="cargo_2">Cargo</label>
    <input type="text" class="form-control" id="cargo_2" name="cargo_2"  placeholder="">
  </div>

  <!-- EXPERIENCIA 3 -->
  <div class="form-group col-md-3">
    <label for="empresa_3">Empresa</label>
    <input type="text" class="form-control" id="empresa_3" name="empresa_3" placeholder="">
  </div>

  <div class="form-group col-md-3">
  <label for="antiguedad-desde_3" class="col-2 col-form-label">Desde</label>
    <input class="form-control" type="date" value="2011-08-19" id="antiguedad-desde_3" name="antiguedad-desde_3">
  </div>

  <div class="form-group col-md-3">
  <label for="antiguedad-hasta_3" class="col-2 col-form-label">Hasta</label> 
    <input class="form-control" type="date" value="2020-08-19" id="antiguedad-hasta_3"  name="antiguedad-hasta_3">  
  </div>

  <div class="form-group col-md-3">
    <label for="cargo_3">Cargo </label>
    <input type="text" class="form-control" id="cargo_3" name="cargo_3"  placeholder="">
  </div>

    <div class="form-group col-md-12">
       <label for="resume">Seleccione Tu Curriculum En formato PDF</label>
       <!--input type="file" class="form-control-file" id="uploadedFile" name="uploadedFile"-->
       <hr>
      <input type="file" name="resume" id="resume" required="true">
      <hr>
      <input id="SubmitBtn" name="SubmitBtn" type="submit" value="Enviar Curriculum" class="btn btn-success"  >
</form>






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


<?php include("includes/scripts.php"); ?>
  
</html>
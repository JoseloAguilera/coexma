   

<?php 
echo "hola";
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
        echo  $mensaje;
       // $guardarpedido = saveCurriculum ($_POST['nombre'], $_POST['apellido'], $_POST['cedula'],$_POST['email'], $_POST['ciudad'], $_POST['departamento'], $_POST['area']);
        /*if ($guardarpedido > 0) {
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
*/


      }
    }
    else{
      echo "Maximum upload file size limit is 200 kb";
    }
  }
  else{
    echo "You can only upload a Word doc file.";
  }  

  
}

?>
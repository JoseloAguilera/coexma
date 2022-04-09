<?php 
	session_start();
	if (!isset($_SESSION['logueado'])) {
		header('Location: ../login.php');
	}
?>
<!DOCTYPE html>
<html>
<head>
    
	<title><?php echo $_SESSION['empresa'];?> | Encuesta</title>
    <?php include 'includes/head.php'; ?>
    <?php include 'mods/server/encuesta.php'; ?>
    
    <style>
    .chart-container {
    border: 1px solid grey;
    min-width: 300px;
    min-height: 350px;
    margin-bottom: 25px;
}
    #chartContainer {
  width: 100%
};


</style>
    
   
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-datalabels/2.0.0/chartjs-plugin-datalabels.min.js" integrity="sha512-R/QOHLpV1Ggq22vfDAWYOaMd5RopHrJNMxi8/lJu8Oihwi4Ho4BRFeiMiCefn9rasajKjnx9/fTQ/xkWnkDACg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    
    
</head>
<body class="hold-transition skin-green sidebar-mini"  >
	<div class="wrapper" >
		<!-- MAIN HEADER -->
		<?php include 'includes/header.php'; ?>
		<!-- MAIN HEADER END -->

		<!-- ASIDE BAR -->
		<?php include 'includes/aside.php'; ?>
		<!-- ASIDE BAR END -->

		<?php include_once "mods/objs/cliente.php";?>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Cabicera de Contenido (Título) -->
			<section class="content-header">
				<h1>
                    Encuesta 
					
				</h1>
			</section>

			<!-- Contenido Principal -->
			<section class="content" id="reportPage" >
				<div class="box">
                    <div class="box-header with-border">
						<!-- Botón para crear más cursos -->
						<div class="pull-right">
							<button id="btnPrint" type="button" class="btn btn-success" style="margin-bottom: 5px;" onClick="window.print()">Imprimir</button>
						
						
							<!--a href="#" id="downloadPdf">Download Report Page as PDF</a-->
						

						</div>
					</div>
					<!-- Corpo de Caja -->
					<div class="box-body" >
			
					       
				
					    
					         <h3>
                             Encuesta de Satisfaccion del Cliente
				           	 <small>Esta encuesta es Anonima.</small>
				              </h3>
				              
				         <div class="col-md-12">
				             
                                <div class="col-md-3">
                                    <div class="chart-container" style="position: relative;  width:260px">
                                         <canvas id="bar-chart" width="100%" ></canvas>
                                    </div>
                                </div><!-- col-md-6 -->
                        
                                <div class="col-md-3">
                                   <div class="chart-container" style="position: relative;  width:260px">
                                         <canvas id="bar-chart2" width="100%" ></canvas>
                                   </div>
                                </div><!-- col-md-6 -->
                        
                                <div class="col-md-3">
                                    <div class="chart-container" style="position: relative; width:260px; padding-top: 30px; ">
                                      <canvas id="bar-chart3" width="100%" ></canvas>
                                    </div>
                                </div><!-- col-md-6 -->
                                     
                                <div class="col-md-3">
                                    <div class="chart-container" style="position: relative;  width:245px; padding-top: 30px;">
                                        <canvas id="bar-chart4" width="100%" ></canvas>
                                    </div>
                                </div><!-- col-md-6 -->
                                
                                </div>
                                
                                 <div class="col-md-12">
                                     <div class="">
                                        <div class="col-md-3">
                                            <div class="chart-container" style="position: relative;  width:245px; ">
                                                <canvas id="bar-chart5" width="100%" ></canvas>
                                            </div>
                                        </div><!-- col-md-6 -->
                                 </div><!-- col-md-12 -->

                                </div><!-- col-md-12 -->
                                
                                
                                </hr> </br> </br>
                        
                         </div> <!-- box-body -->
                         
					<!-- /.box-body -->
				
				<!-- /.Caja de Texto de color gris (Default) -->
			</section>
		</div> <!-- /.content-wrapper -->

		<!-- FOOTER -->
		<?php include "includes/footer.php"; ?>
		<!-- ./FOOTER -->
        <script>
        
        
         new Chart(document.getElementById("bar-chart"), {
                type: 'doughnut',
                data: {
                labels: ["<?php echo getOpcion(1,1)["valor"]; ?>", "<?php echo getOpcion(2,1)["valor"]; ?>", "<?php echo getOpcion(3,1)["valor"]; ?>", "<?php echo getOpcion(4,1)["valor"]; ?>"],
                datasets: [{
                    // First dataset.
                  datalabels: {
                    color: 'white',
                    font: {
                          weight: 'bold',
                          size:'12px',
                        }
                    
                    },
                    label: "Personas Encuestadas (únicas)",
                    backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9"],
                    data: [ <?php echo getRespuesta(1,1)["cantidad"]; ?>, <?php echo getRespuesta(1,2)["cantidad"]; ?>, <?php echo getRespuesta(1,3)["cantidad"]; ?>, <?php echo getRespuesta(1,4)["cantidad"]; ?>]
                    }]
                },
                 plugins: [ChartDataLabels],
                options: {
                    legend: { display: false },
                    title: {
                        display: true,
                        text: ' <?php echo getPregunta(1)["pregunta"]; ?>'
                    }
                }
            });
            
            new Chart(document.getElementById("bar-chart2"), {
                type: 'doughnut',
                data: {
                labels: ["<?php echo getOpcion(5,2)["valor"]; ?>", "<?php echo getOpcion(6,2)["valor"]; ?>", "<?php echo getOpcion(7,2)["valor"]; ?>", "<?php echo getOpcion(8,2)["valor"]; ?>"],
                datasets: [{
                    datalabels: {
                    color: 'white',
                    font: {
                          weight: 'bold',
                          size:'12px',
                        }
                    
                    },
                    label: "Personas Encuestadas (únicas)",
                    backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9"],
                    data: [ <?php echo getRespuesta(2,5)["cantidad"]; ?>, <?php echo getRespuesta(2,6)["cantidad"]; ?>, <?php echo getRespuesta(2,7)["cantidad"]; ?>, <?php echo getRespuesta(2,8)["cantidad"]; ?>]
                    }]
                },
                plugins: [ChartDataLabels],
                options: {
                    legend: { display: true },
                    title: {
                        display: true,
                        text: ' <?php echo getPregunta(2)["pregunta"]; ?>'
                    }
                }
                
            });
            new Chart(document.getElementById("bar-chart3"), {
                type: 'doughnut',
                data: {
                labels: ["<?php echo getOpcion(9,3)["valor"]; ?>", "<?php echo getOpcion(10,3)["valor"]; ?>", "<?php echo getOpcion(11,3)["valor"]; ?>", "<?php echo getOpcion(12,3)["valor"]; ?>"],
                datasets: [{
                    datalabels: {
                    color: 'white',
                    font: {
                          weight: 'bold',
                          size:'12px',
                        }
                    
                    },
                    label: "Personas Encuestadas (únicas)",
                    backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9"],
                    data: [ <?php echo getRespuesta(3,9)["cantidad"]; ?>, <?php echo getRespuesta(3,10)["cantidad"]; ?>, <?php echo getRespuesta(3,11)["cantidad"]; ?>, <?php echo getRespuesta(3,12)["cantidad"]; ?>]
                    }]
                },
                 plugins: [ChartDataLabels],
                options: {
                    legend: { display: true },
                    title: {
                        display: true,
                        text: ' <?php echo getPregunta(3)["pregunta"]; ?>'
                    }
                }
            });
            new Chart(document.getElementById("bar-chart4"), {
                type: 'doughnut',
                data: {
                    
                labels: ["<?php echo getOpcion(13,4)["valor"]; ?>", "<?php echo getOpcion(14,4)["valor"]; ?>", "<?php echo getOpcion(15,4)["valor"]; ?>", "<?php echo getOpcion(16,4)["valor"]; ?>"],
                datasets: [{
                    datalabels: {
                    color: 'white',
                    font: {
                          weight: 'bold',
                          size:'12px',
                        }
                    
                    },
                    label: "Personas Encuestadas (únicas)",
                    backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9"],
                    data: [ <?php echo getRespuesta(4,13)["cantidad"]; ?>, <?php echo getRespuesta(4,14)["cantidad"]; ?>, <?php echo getRespuesta(4,15)["cantidad"]; ?>, <?php echo getRespuesta(4,16)["cantidad"]; ?>]
                    }]
                },
                 plugins: [ChartDataLabels],
                options: {
                    legend: { display: true },
                    title: {
                        display: true,
                        text: ' <?php echo getPregunta(5)["pregunta"]; ?>'
                    }
                }
            });
            new Chart(document.getElementById("bar-chart5"), {
                type: 'doughnut',
                data: {
                labels: ["<?php echo getOpcion(17,5)["valor"]; ?>", "<?php echo getOpcion(18,5)["valor"]; ?>", "<?php echo getOpcion(19,5)["valor"]; ?>", "<?php echo getOpcion(20,5)["valor"]; ?>"],
                datasets: [{
                    datalabels: {
                    color: 'white',
                    font: {
                          weight: 'bold',
                          size:'12px',
                        }
                    
                    },
                    label: "Personas Encuestadas (únicas)",
                    backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9"],
                    data: [ <?php echo getRespuesta(5,17)["cantidad"]; ?>, <?php echo getRespuesta(5,18)["cantidad"]; ?>, <?php echo getRespuesta(5,19)["cantidad"]; ?>, <?php echo getRespuesta(5,20)["cantidad"]; ?>]
                    }]
                },
                 plugins: [ChartDataLabels],
                options: {
                    legend: { display: true },
                    title: {
                        display: true,
                        text: ' <?php echo getPregunta(5)["pregunta"]; ?>'
                    }
                }
            });
            
        </script>
	</div>
	<!-- ./Contenido -->

	<!-- SCRIPTS (js) -->
	<?php include "includes/scripts.php"; ?>
	
<script>
$('#downloadPdf').click(function(event) {
  // get size of report page
  var reportPageHeight = $('#reportPage').innerHeight();
  var reportPageWidth = $('#reportPage').innerWidth();
  
  
  // create a new canvas object that we will populate with all other canvas objects
  var pdfCanvas = $('<canvas />').attr({
    id: "canvaspdf",
    width: reportPageWidth,
    height: reportPageHeight
  });
  
  // keep track canvas position
  var pdfctx = $(pdfCanvas)[0].getContext('2d');
  var pdfctxX = 0;
  var pdfctxY = 0;
  var buffer = 100;
  
  // for each chart.js chart
  $("canvas").each(function(index) {
    // get the chart height/width
    var canvasHeight = $(this).innerHeight();
    var canvasWidth = $(this).innerWidth();
    
    // draw the chart into the new canvas
    pdfctx.drawImage($(this)[0], pdfctxX, pdfctxY, canvasWidth, canvasHeight);
    pdfctxX += canvasWidth + buffer;
    
    // our report page is in a grid pattern so replicate that in the new canvas
    if (index % 2 === 1) {
      pdfctxX = 0;
      pdfctxY += canvasHeight + buffer;
    }
  });
  
  // create new pdf and add our new canvas as an image
  
  
  

  var pdf = new jsPDF('p','pt','a4');
  pdf.addImage($(pdfCanvas)[0], 'PNG', 0, 0);
  
  // download the pdf
  pdf.save('filename.pdf');
});
</script>
	<!-- ./SCRIPTS (js) -->
</body>
</html>
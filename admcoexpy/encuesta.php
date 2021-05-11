<?php 
	session_start();
	if (!isset($_SESSION['logueado'])) {
		header('Location: ../login.php');
	}
?>
<!DOCTYPE html>
<html>
<head>
	<title><?php echo $_SESSION['empresa'];?> | Inicio</title>
    <?php include 'includes/head.php'; ?>
    <?php include 'mods/server/encuesta.php'; ?>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

</head>
<body class="hold-transition skin-green sidebar-mini">
	<div class="wrapper">
		<!-- MAIN HEADER -->
		<?php include 'includes/header.php'; ?>
		<!-- MAIN HEADER END -->

		<!-- ASIDE BAR -->
		<?php include 'includes/aside.php'; ?>
		<!-- ASIDE BAR END -->

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Cabicera de Contenido (Título) -->
			<section class="content-header">
				<h1>
					Titulo
					<small>Subtitulo</small>
				</h1>
			</section>

			<!-- Contenido Principal -->
			<section class="content">
				<!-- Caja de Texto de color gris (Default) -->
				<div class="box">
					<div class="box-header with-border">
						<!-- Título de Caja -->
						<h3 class="box-title">Encuesta de Satisfaccion del Cliente</h3>
						<!-- Botones de cerrar y recojer caja -->
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
							title="Collapse">
							<i class="fa fa-minus"></i></button>
							<button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
							<i class="fa fa-times"></i></button>
						</div>
					</div>
					<!-- Corpo de Caja -->
					<div class="box-body">  
                        <div class="col-md-8"><canvas id="bar-chart" width="800" height="600"></canvas></div>
                        <div class="col-md-8"><canvas id="bar-chart2" width="800" height="600"></canvas></div>
                        <div class="col-md-8"><canvas id="bar-chart3" width="800" height="600"></canvas></div>
                        <div class="col-md-8"><canvas id="bar-chart4" width="800" height="600"></canvas></div>
                        <div class="col-md-8"><canvas id="bar-chart5" width="800" height="600"></canvas></div>
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						Esta encuesta es Anonima<br>
					</div> <!-- /.box-footer-->
				</div> <!-- /.Caja de Texto de color gris (Default) -->
			</section><!-- /.content -->
		</div> <!-- /.content-wrapper -->
		

		<!-- FOOTER -->
        <?php include "includes/footer.php"; ?>
        <script>
            // Bar chart
            new Chart(document.getElementById("bar-chart"), {
            type: 'bar',
            data: {
            labels: ["<?php echo getOpcion(1,1)["valor"]; ?>", "<?php echo getOpcion(2,1)["valor"]; ?>", "<?php echo getOpcion(3,1)["valor"]; ?>", "<?php echo getOpcion(4,1)["valor"]; ?>"],
            datasets: [
                {
                label: "Personas Encuestadas (únicas)",
                backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9"],
                data: [ <?php echo getRespuesta(1,1)["cantidad"]; ?>, <?php echo getRespuesta(1,2)["cantidad"]; ?>, <?php echo getRespuesta(1,3)["cantidad"]; ?>, <?php echo getRespuesta(1,4)["cantidad"]; ?>]
                }
            ]
            },
            options: {
            legend: { display: false },
            title: {
                display: true,
                text: ' <?php echo getPregunta(1)["pregunta"]; ?>'
            }
            }
        });
        </script>

<!-- ---------------------------------------------------  -->
<!-- ./ PREGUNTA 2-->
<!-- ---------------------------------------------------  -->
<script>
            // Bar chart
     new Chart(document.getElementById("bar-chart2"), {
     type: 'bar',
     data: {
      labels: ["<?php echo getOpcion(5,2)["valor"]; ?>", "<?php echo getOpcion(6,2)["valor"]; ?>", "<?php echo getOpcion(7,2)["valor"]; ?>", "<?php echo getOpcion(8,2)["valor"]; ?>"],
      datasets: [
        {
          label: "Personas Encuestadas (únicas)",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9"],
          data: [ <?php echo getRespuesta(2,5)["cantidad"]; ?>, <?php echo getRespuesta(2,6)["cantidad"]; ?>, <?php echo getRespuesta(2,7)["cantidad"]; ?>, <?php echo getRespuesta(2,8)["cantidad"]; ?>]
        }
      ]
    },
    options: {
      legend: { display: false },
      title: {
        display: true,
        text: ' <?php echo getPregunta(2)["pregunta"]; ?>'
      }
    }
});
        </script>

<!-- ---------------------------------------------------  -->
<!-- ./ PREGUNTA 3 -->
<!-- ---------------------------------------------------  -->
<script>
            // Bar chart
     new Chart(document.getElementById("bar-chart3"), {
     type: 'bar',
     data: {
      labels: ["<?php echo getOpcion(9,3)["valor"]; ?>", "<?php echo getOpcion(10,3)["valor"]; ?>", "<?php echo getOpcion(11,3)["valor"]; ?>", "<?php echo getOpcion(12,3)["valor"]; ?>"],
      datasets: [
        {
          label: "Personas Encuestadas (únicas)",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9"],
          data: [ <?php echo getRespuesta(3,9)["cantidad"]; ?>, <?php echo getRespuesta(3,10)["cantidad"]; ?>, <?php echo getRespuesta(3,11)["cantidad"]; ?>, <?php echo getRespuesta(3,12)["cantidad"]; ?>]
        }
      ]
    },
    options: {
      legend: { display: false },
      title: {
        display: true,
        text: ' <?php echo getPregunta(3)["pregunta"]; ?>'
      }
    }
});
        </script>

		<!-- ---------------------------------------------------  -->
<!-- ./ PREGUNTA 4 -->
<!-- ---------------------------------------------------  -->
<script>
            // Bar chart
     new Chart(document.getElementById("bar-chart4"), {
     type: 'bar',
     data: {
      labels: ["<?php echo getOpcion(13,4)["valor"]; ?>", "<?php echo getOpcion(14,4)["valor"]; ?>", "<?php echo getOpcion(15,4)["valor"]; ?>", "<?php echo getOpcion(16,4)["valor"]; ?>"],
      datasets: [
        {
          label: "Personas Encuestadas (únicas)",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9"],
          data: [ <?php echo getRespuesta(4,13)["cantidad"]; ?>, <?php echo getRespuesta(4,14)["cantidad"]; ?>, <?php echo getRespuesta(4,15)["cantidad"]; ?>, <?php echo getRespuesta(4,16)["cantidad"]; ?>]
        }
      ]
    },
    options: {
      legend: { display: false },
      title: {
        display: true,
        text: ' <?php echo getPregunta(5)["pregunta"]; ?>'
      }
    }
});
        </script>

<!-- ---------------------------------------------------  -->
<!-- ./ PREGUNTA 4 -->
<!-- ---------------------------------------------------  -->
<script>
            // Bar chart
     new Chart(document.getElementById("bar-chart5"), {
     type: 'bar',
     data: {
      labels: ["<?php echo getOpcion(17,5)["valor"]; ?>", "<?php echo getOpcion(18,5)["valor"]; ?>", "<?php echo getOpcion(19,5)["valor"]; ?>", "<?php echo getOpcion(20,5)["valor"]; ?>"],
      datasets: [
        {
          label: "Personas Encuestadas (únicas)",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9"],
          data: [ <?php echo getRespuesta(5,17)["cantidad"]; ?>, <?php echo getRespuesta(5,18)["cantidad"]; ?>, <?php echo getRespuesta(5,19)["cantidad"]; ?>, <?php echo getRespuesta(5,20)["cantidad"]; ?>]
        }
      ]
    },
    options: {
      legend: { display: false },
      title: {
        display: true,
        text: ' <?php echo getPregunta(5)["pregunta"]; ?>'
      }
    }
});
        </script>
		<!-- ./FOOTER -->

	</div>
	<!-- ./Contenido -->

	<!-- SCRIPTS (js) -->
	<?php include "includes/scripts.php"; ?>
	<!-- ./SCRIPTS (js) -->
</body>
</html>
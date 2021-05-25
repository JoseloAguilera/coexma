<?php session_start();?>
<!doctype html>
<html lang="es">

<?php 


  require "funciones/funciones.php";
  include("includes/head.php"); 
  include("includes/cart.php");
?>
  <body>
      
  <?php 
  if (isset($_SESSION['cart'])) {
	$cart= $_SESSION['cart'];
    } else { echo "<script type='text/javascript'>document.location.href='index.php';</script>";}
    
    $met_pagos= getMetodosDePago();
    $calc_envio= getMetodosDeEnvio();
    $cart= $_SESSION['cart'];






if($_SERVER['REQUEST_METHOD'] == "POST") {	
	if (isset($_POST['guardar'])){
		/* ****************************************** */		
		/* ****************************************** */
			$ruc = ($_POST['ruc']);
			$id_met_pago = $_POST['met_pag'];
			$id_met_envio =substr($_POST['calc_envio'], -1);
			$id_cliente = $_SESSION['id_cliente'];			
			$total_envio =  $_SESSION['costo_envio'];
			$total = $_SESSION['total'];
		/* ****************************************** */		
		/* ****************************************** */

		//SAVE
		$guardar = saveCliente ($_SESSION['id_cliente'], $_POST['nombre'], $_POST['apellido'], $_POST['documento'], $ruc, $_POST['razon_social'], $_POST['telefono'], $_POST['email'], $_POST['departamentos'], $_POST['ciudades'], $_POST['calle'], $_POST['referencias']);

		if ($guardar == $_SESSION['id_cliente']) {
			$guardarpedido = savepedidos ($id_cliente, $id_met_pago, $id_met_envio, $total, $_POST['observacion'], $total_envio);
			
			if ($guardarpedido > 1) {
				foreach ($cart as $carrito) {
					$totalitem = $carrito['qty'] * $carrito['precio'];
					
					$combinacion = $carrito['combinacion'];

					if ($combinacion == "") {
						$combinacion = '';
					} else {
						$valores = getProdAtributosValoresByStock ($combinacion);
						if ($valores != null) { 
							$combinacion = "";
							foreach ($valores as $linea) {
								$combinacion = $combinacion.'<b>'.$linea['atributo'].":</b> ".$linea['nombre'].'<br>';
							}
						} 
					}
					
					$teste = saveDetallePedidos ($guardarpedido, $carrito['idproducto'], $carrito['combinacion'], $combinacion, $carrito['precio'], $carrito['qty'],'0', $totalitem);
					
					actualizaStock($carrito['idproducto'], $carrito['combinacion'], $carrito['qty']);				


				}

			$mail =getMails(1); 
   
            $to = $mail['email_to'];
            $subject = "Carrito de Compras (Nuevo Pedido)";
            $headers = "MIME-Version: 1.0" . "\r\n";
            $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
			$headers .= "From:".$mail['email_from']. "\r\n" .
                    "CC:".$mail['email_cc'];  

			$pedido = getpedido($guardarpedido);
			$clienteMail = getCliente($_SESSION['id_cliente']);
			       
            $message = "
            <html>
            <head>
            <title>Carrito de Compras</title>
            </head>
            <body>";
            $body = "<h3>Carrito de Compras</h3><hr>";
			$body .= "<p><b>Nro. de Pedido: </b>".$pedido['id']."</p>";
			$body .= "<p><b>Cliente: </b>".$clienteMail['nombre']." ".$clienteMail['apellido']."</p>";
			$body .= "<p><b>Nro. de Cedula: </b>".$clienteMail['documento']."</p>";
			$body .= "<p><b>Telefono: </b>".$clienteMail['telefono']."</p>";
			$body .= "<p><b>Email: </b>".$clienteMail['email']."</p>";
			$body .= "<p><b>Metodo de Pago: </b>".getMetodoPago($pedido['id_met_pago'])['descripcion']."</p>";
			$body .= "<p><b>Metodo de Envio: </b>".getMetodoEnvio($pedido['id_met_envio'])['descripcion']."</p>";

       

            $body .= "<table class='TFtable' border='1' style='width':100%;'border': 1px solid black>"; //starts the table tag
            $body .= "<tr>
			<td>Referencia</td>
			<td>Nombre</td>
			<td>Precio Plate</td>
			<td>Qty</td>
			<td>Sub Total</td>
			
			</tr>"; //sets headings
            foreach($cart  as $carrito) { //loops for each result
				$subtotal= $carrito['qty']*$carrito['precio'];
				$subtotal =number_format($subtotal, 0, ',', '.')." Gs";
            $body .= "
			<tr>
			<td>".$carrito['referencia']."</td>
			<td>".$carrito['nombre']."</td>
			<td>".$carrito['precio']."</td>
			<td>".$carrito['qty']. "</td>
			<td>".$subtotal. "</td>
			</tr>";
            }
			$body .= "</table>"; 
			$body .= "<hr>Total: ".number_format($total, 0, ',', '.')." Gs <hr>
			*<h2>Verifique el administrador del Sitio web para consultar mayores detalles sobre el pedido.<h2>*"; 
            $message .= $body . "
            </body>
            </html>";
            $message = wordwrap($message, 70);    
            mail($to,$subject,$message,$headers);
       





				// $tipomensaje = 'success';			   
				// $mensaje= '<p class="text-center alert alert-success">Los datos fueron actualizados correctamente. Su Numero de pedido es:'.$guardarpedido.'</p>';
				if($id_met_pago==1){
					enviarPagopar($guardarpedido, $total_envio, $total, $id_cliente, $ruc, $_POST['email'], $_POST['nombre'], $_POST['apellido'], $_POST['telefono'],
									$_POST['calle'], $_POST['documento'], $_POST['razon_social']);
				}else{
					echo "<script type='text/javascript'>document.location.href='pedido-completado.php?ped=".$guardarpedido."';</script>";
				}
			}	else if ($guardarpedido == null) {
				$tipomensaje = 'error';
				$mensaje = '<p class="text-center alert alert-danger">Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
			} else {
				$tipomensaje = 'error';
				$mensaje = '<p class="text-center alert alert-danger">Consulte al administrador de sistemas.<br>Error->"'.$guardarpedido.'"</p>';
			}
			
			$cliente = getCliente($_SESSION['id_cliente']);
			$direccion = getDireccion($_SESSION['id_cliente']);
		} else if ($guardar == null) {
			$tipomensaje = 'error';
			$mensaje = '<p class="text-center alert alert-danger">Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
		} else {
			$tipomensaje = 'error';
			$mensaje = '<p class="text-center alert alert-danger">Consulte al administrador de sistemas.<br>Error->"'.$guardar.'"</p>';
		}
		// var_dump($guardar);
	}
}
?>
<script>
	// calc_env();
</script>

<body >
	<!-- Page Preloder >
	<div id="preloder">
		<div class="loader"></div>
	</div-->
	
	<!-- Header section -->
	<?php include("includes/header.php"); ?>
	<!-- Header section end -->

	<!-- Page Info -->
	<section id="page-info">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <a href="index.php">Inicio / </a><a href="carrito.php">Carrito </a> <a href="#"> / Envío </a>
                </div>
            </div>
        </div>
    </section > 
	<!-- Page Info end -->

    <!-- Page -->
    

	<?php 
	 if (isset($_SESSION['usuario'])) {
		 $cliente = getCliente($_SESSION['id_cliente']);
     } else {  ?>
     
			<script type = "text/javascript">
			  window.location = "login.php?redirect=direccion.php"
			</script>
     <?php }
     




	 ?>
	<div class="page-area cart-page spad">
		<form class="checkout-form" method="POST">
			<div class="container">
				<?php
					if (isset($mensaje)) {
						echo $mensaje; //mensaje de error
					}
				?>
				<div class="row">
					<div class="col-lg-12">
						<div class="row">
							<div class="col-md-6 col-sm-12">
								<hr>
								<h4 class="checkout-title">1) DATOS DE CLIENTE</h4>
								<hr>
								<div class="row">
									<div class="col-md-6">
                                    <label for="">Nombre</label>
										<input type="text"  class="form-control" name="nombre" placeholder="Nombre *" value="<?php echo $cliente['nombre'];?>" required>
                                        <br>
                                    </div>
									<div class="col-md-6">
                                    <label for="">Apellidos</label>
										<input type="text"  class="form-control" name="apellido" placeholder="Apellidos *" value="<?php echo $cliente['apellido'];?>" required>
                                        <br>	
									</div>
									<div class="col-md-12">
										<div class="row">
											<div class="col-md-4">
                                                <label for="">Telefono</label>
												<input type="text"  class="form-control" name="telefono" placeholder="Telefono *" value="<?php echo $cliente['telefono'];?>" required>
                                                <br>
                                            </div>
                                            
											<div class="col-md-4">
                                            <label for="">RUC (opcional)</label>
												<input type="text"  class="form-control" name="ruc" placeholder="RUC" value="<?php echo $cliente['ruc'];?>">
                                                <br>
                                            </div>
											<div class="col-md-4">
                                            <label for="">Nro. de Cédula</label>
												<input type="text"  class="form-control" name="documento" placeholder="Nro. de CI | RG | DNI" value="<?php echo $cliente['documento'];?>" required>
                                                <br>
                                            </div>
										</div>
										<div class="row">
											<div class="col-md-6">
                                            <label for="">Razón Social</label>
												<input type="text"  class="form-control" name="razon_social" placeholder="Razon Social" value="<?php echo $cliente['razon_social'];?>">
                                                <br>
                                            </div>
											<div class="col-md-6">
                                            <label for="">Email</label>
												<input type="email" name="email"   class="form-control" placeholder="E-mail *" value="<?php echo $cliente['email'];?>" required>
                                                <br>
                                            </div>
										</div>
										 
										<!-- DIRECCION DE ENVIO - CLIENTE  -->
										<?php 								
											$cli_direccion = getClienteDireccion($_SESSION['id_cliente']);				
										?>
										<!-- /* DIRECCION DE ENVIO - CLIENTE  -->
									</div>
								</div> <!-- .row -->
							</div>	<!-- .col-6 -->

							<div class="col-md-6 col-sm-12">
							<hr>
								<h4 class="checkout-title">2) DIRECCIÓN DE ENVIO</h4>	
								<hr>						
								<!-- //PAIS -->
								<br>
								<select name="pais" disabled="true"  class="form-control">
									<option disabled="true" >País *</option>
									<option value="1" selected="true" >Paraguay</option>
								</select>
							<div class="row">
							<div class="col-md-6">
								
								
								<!-- //DEPARTAMENTO -->
								<br>
								<label for="">Departamento</label>
								<select name="departamentos" id="departamentos" class="form-control" required>
									<?php if(isset($cli_direccion['departamento']) && $cli_direccion['departamento'] != "" ) { ?>
									<option value="<?php  echo $cli_direccion['departamento']; ?>">
										<?php echo getDepartamento($cli_direccion['departamento'])['nombre'];?>
									</option>
									<?php } ?>									
									
									<option value=''>Seleccione un Departamento *</option>
									<?php											
										$departamentos=getDepartamentos();
										foreach($departamentos as $departamento):
									?>							
										<option value="<?php echo $departamento['id'] ?>"><?php echo $departamento['nombre'] ?></option>
									<?php
										endforeach;
									?>
								</select>	
							</div><!--col md 6 -->
							<div class="col-md-6">
								<!-- //CIUDAD -->
								<br>
								<label for="">Ciudad</label>
								<select name="ciudades" id="ciudades" class="form-control" required>	
									<?php if (isset($cli_direccion['ciudad']) && $cli_direccion['ciudad'] != '') { ?>
									<option value="<?php  echo $cli_direccion['ciudad']; ?>"> <?php echo getCiudad($cli_direccion['ciudad'])['nombre'];?></option>
									<?php }   ?>
									<br>
									<option value=''>Seleccione una Ciudad *</option>
									<?php $ciudades=getCiudades($cli_direccion['departamento']);
										foreach($ciudades as $ciudad):
									?>	
										<option value="<?php echo $ciudad['id'] ?>"><?php echo $ciudad['nombre'] ?></option>
									<!-- } -->
									<?php
										endforeach;
									?>									
								</select>
								<!-- //CALLE // DIRECCION -->

														
							</div><!--col md 6 -->
							<div class="col-md-6">
							<br>
							<label for="">Nombre de la Calle.</label>
								<input name="calle"  class="form-control" value="<?php if(isset($cli_direccion['calle'])) { echo $cli_direccion['calle'];} ?>"type="text" placeholder="Calle o Avenida *" required>
							</div>
							<div class="col-md-6">
							<br>
							<label for="">Referencia</label>
								<input name="referencias"  class="form-control" value="<?php if(isset($cli_direccion['referencia'])) { echo $cli_direccion['referencia'];} ?>"type="text" placeholder="Referencia *">
							</div>
							</div><!-- row-->
							</div><!-- .col-6 -->
						</div><!-- .row -->
					</div><!-- .col-12-lg -->
				</div><!-- .row -->
						
				<div class="col-12">
				
					<div class="row">
						<div class="col-md-6">
							<div class="order-card">
								<div class="order-details">
									<div class="od-warp">	
										<div class="shipping-info">	
										    <hr>							
											<h4 class="checkout-title">3) MÉTODO DE ENVIO</h4>
											<p>Seleccione un método de envío</p>
											<hr>
											<?php foreach ($calc_envio as $metodos) { ?>										
												<div class="sc-item">
													<div class="col-md-12">
													<input type="radio"class="form-check-input"  name="calc_envio" id="m<?php echo $metodos['id'] ?>" value="<?php echo $metodos['id'] ?>" <?php if($metodos['default']=='1'){echo "checked";} ?> required>
													<label for="m<?php echo $metodos['id'] ?>">
													<!--onClick="document.getElementById('totalenvio').innerHTML = '' -->
													<?php echo $metodos['descripcion'] ?>
													<span id="sp-en-<?php echo $metodos['id'] ?>" style="color: green;font-weight: 800;">
													<?php if ($metodos['costo'] == 0) {
														echo "**A Coordinar**";
														$_SESSION['costo_envio'] = 0;
													} else {
														echo number_format($metodos['costo'], 0, ',', '.')." Gs";
														$_SESSION['costo_envio'] = $metodos['costo'];
													}
													?>
													</span></label>
													</div>

												</div>
											<?php  } ?>							
										</div> <!-- shipping-info -->	



										<!--h4>Cupon code</h4>
										<p>Enter your cupone code</p>
										<div class="cupon-input">
											<input type="text"  class="form-control">
											<button class="site-btn">Apply</button>
										</div-->
									</div> <!-- old-wrap -->						
								</div> <!-- order-details -->
							</div> <!-- order-card -->
						</div> <!-- col-6 -->

						<div class="col-md-6 col-sm-12">
							<div class="od-warp">	
								<div class="payment-mt">
								<hr>
								<h4 class="checkout-title">4) METODO DE PAGO</h4>
							
								<p>Seleccione un metodo de pago</p>
								<hr>
								<p  class="text-success" id="mp-sel"></p>
								<?php foreach ($met_pagos as $metodos) { ?>										
									<div class="pm-item">
										<input type="radio" name="met_pag" id="<?php echo $metodos['id'] ?>" value="<?php echo $metodos['id'] ?>" <?php if($metodos['default']=='1'){echo "checked";} ?> required>
										<label for=""><?php echo $metodos['descripcion'] ?></label>
									</div>
								<?php  } ?>											
							</div>
							
							<!--div class="checkbox-items">
								<div class="ci-item">
										<input type="checkbox" name="terminos" id="terminos" required>
										<label for="terminos">Acepto los terminos y condiciones</label>
										<br>
									</div>
								</div-->
							</div>


							</div> <!-- old-wrap -->
						</div> <!-- col-6 -->
					</div> <!-- row -->
				</div> <!-- col-12 -->
						
				<!-- </div>	?? -->
			</div> <!-- container -->
		<!-- </div>--> <!-- page-area -->

			<div class="container">
				<div class="col-12">
				<hr>
				<h4 class="checkout-title">5) RESUMEN DE COMPRA</h4>
				<hr>
								<table class="table order-table">
									<thead>
										<tr>
											<th>Producto</th>
											<th>Total</th>
										</tr>
									</thead>
									<tbody>
									<?php 
									if (isset($_SESSION['cart'])) {
										foreach ($_SESSION['cart'] as $cart) { 
									?>											
										<tr>
											<td><?php echo $cart['nombre'] ?>
											<p style="margin-left: 10%;">
											<?php
												if ($cart['combinacion'] == "") {
													echo '';
												} else {
													$valores = getProdAtributosValoresByStock ($cart['combinacion']);
													if ($valores != null) { 
														foreach ($valores as $linea) {
															echo '<span class="label label-primary" style="font-size:10pt;"><b>'.$linea['atributo'].":</b> ".$linea['nombre'].'</span><br>';
														}
													} 
												}
											?>
										</p>
											</td>
											<td><?php echo number_format($cart['precio'] *  $cart['qty'], 0, ',', '.')." Gs";?></td>
										</tr>																
									<?php } } ?>
										<tr class="cart-subtotal">
											<td style="float: right;">Total Envío (GS)</td>
											<td id="totalenvio">A Coordinar</td>
										</tr>
									</tbody>
									<tfoot>
										<tr class="order-total" style="
    background: #e1eeea;">
											<th>Total A Pagar (Gs.)</th>
											<?php $total= $_SESSION['total']; ?>
											<th id="total_pago"><?php echo number_format(getTotalCart(), 0, ',', '.')." Gs";?></th>
										</tr>
									</tfoot>
								</table>
								<br>
					<input class="form-control" name="observacion" type="text" placeholder="Observacion sobre el pedido(opcional)">	
				<br><br>
					<button type="submit" name="guardar" class="site-btn btn-success">Finalizar y Realizar Pedido</button>
					<hr>
					<br><br>
				</div--> <!-- col-12 ->
			</div--> <!-- container -->
		</form>
	</div> <!-- page-area -->
	<!-- </div> -->
	<!-- Page -->
	</div>

	<!-- Footer top section -->	
	<?php include("includes/footer.php");?>
	<?php include("includes/scripts.php");?>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>


	<script>
	 $(document).ready(function(e){
		calc_env();
		$('input[type=radio][name="met_pag"]').on('change', function() {
	        var id_met= $("input[name='met_pag']:checked").val();
			//alert(id_met);			
	 		$.ajax({
                data: { id: id_met },
                url:   'includes/met_pago.php',
                type:  'post',
                beforeSend: function () { },
                success:  function (response) {                	
                    $("#mp-sel").html(response);
                },
                error:function(){
                	alert("error")
                }
            });
		}); 

	 	$("#departamentos").change(function(){
	 		var parametros= "id="+$("#departamentos").val();
	 		$.ajax({
                data:  parametros,
                url:   'includes/ciudades.php',
                type:  'post',
                beforeSend: function () { },
                success:  function (response) {                	
                    $("#ciudades").html(response);
					
                },
                error:function(){
                	alert("error")
                }
            });
	 	});  
		
		$("#ciudades").change(function(){
			calc_env();
	 	});    

		$('input[type=radio][name="calc_envio"]').on('change', function() {
    		//alert(this.value);
			var ttl = <?php echo $total ?>;
			var id_calc_envio =this.value;
			var id_ciudad = document.getElementById("ciudades").value;
	 		$.ajax({
                data: { id: id_calc_envio, id_ciudad: id_ciudad },
                url:   'includes/calc_envio.php',
                type:  'post',
                beforeSend: function () { },
                success:  function (response) {                	
                   
					if (response == 0) {
					    $("#totalenvio").html("**A Coordinar**");
					    $("#sp-en-"+id_calc_envio+"").html("**A Coordinar**");
					} else {
						$("#totalenvio").html(response);
						$("#sp-en-"+id_calc_envio+"").html(response);
					}
					$("#total_pago").html((parseFloat(ttl)+parseFloat(response))+" Gs");
                },
                error:function(){
                	alert("error")
                }
            });
  		});  
    })
</script>

<script>
	function calc_env() {	
		var id_calc_envio = $("input[name='calc_envio']:checked").val();;
		var id_ciudad = document.getElementById("ciudades").value;
		var ttl = <?php echo $total ?>;
		//alert(id_calc_envio);
		//var parametros= "id="+ this.value + " ciu=" + id_ciudad" ";
		//alert(this.parametros);
		$.ajax({
			data: { id: id_calc_envio, id_ciudad: id_ciudad },
			url:   'includes/calc_envio.php',
			type:  'post',
			beforeSend: function () { },
			success:  function (response) {
				var respuesta= response;            	
				if (response == 0) {
					    $("#totalenvio").html("**A Coordinar**");
					    $("#sp-en-"+id_calc_envio+"").html("**A Coordinar**");
					} else {
						$("#totalenvio").html(response);
						$("#sp-en-"+id_calc_envio+"").html(response);
					}
					$("#total_pago").html((parseFloat(ttl)+parseFloat(response))+" Gs");
			},
			error:function(){
				alert("error en el calculo del envio")
			}
		});
	}

</script>
</body>
</html>
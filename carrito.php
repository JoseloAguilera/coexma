<?php session_start();?>
<!doctype html>
<html lang="es">
<?php 
  require "funciones/funciones.php";
  include("includes/head.php"); 
  include("includes/cart.php");
  if (isset($_SESSION['cart'])) { $cart = array($_SESSION['cart']); } else { echo "<script type='text/javascript'>document.location.href='index.php';</script>";}
  
?>
  <body>
  <?php include("includes/header.php"); ?>
  <main role="main">
    <section id="page-info">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <a href="index.php">Inicio / </a><a href="categoria.php">Productos / </a> <a href="#">Carrito de Compras</a>
                </div>
            </div>
        </div>
    </section > 


<div class="container">
<hr>
                    <h3 class="text-center">Carrito de Compras</h3>
                    <hr>

	<table id="cart" class="table table-hover table-condensed" style="margin-top: 50px;">
    				<thead>
						<tr>
							<th style="width:50%">PRODUCTO</th>
							<th style="width:10%">PRECIO</th>
							<th style="width:8%">CANT.</th>
							<th style="width:22%" class="text-center">SUB TOTAL</th>
							<th style="width:10%"></th>
						</tr>
					</thead>
					<tbody>
                       
                           
                    <?php foreach ($_SESSION['cart'] as $producto) { ?>	        
						<tr>
                        <form action=""  method="post" ?>
                        <input type="text" name="id" value="<?php echo $producto['idproducto'] ?>" class="d-none">
						<input type="text" name="combinacion" value="<?php echo $producto['combinacion'] ?>" class="d-none">

							<td data-th="Product">
								<div class="row">
									<div class="col-sm-3 hidden-xs"><img src="img/productos/<?php if (isset($producto['img_producto'])) {
										echo $producto['img_producto'];
									} else {
										echo "no-image.png";
									}?>" alt="..." class="img-responsive"/></div>
									<div class="col-sm-9">
										<h4 class="nomargin"><?php echo $producto['nombre'];?></h4>
										<p style="margin-left: 10%;">
											<?php
												if ($producto['combinacion'] == "") {
													echo '';
												} else {
													$valores = getProdAtributosValoresByStock ($producto['combinacion']);
													if ($valores != null) { 
														foreach ($valores as $linea) {
															echo '<span class="label label-primary" style="font-size:10pt;"><b>'.$linea['atributo'].":</b> ".$linea['nombre'].'</span><br>';
														}
													} 
												}
											?>
										</p>
										<!--p>Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet.</p-->
									</div>
								</div>
							</td>
							<td data-th="Price"><?php echo number_format($producto['precio'], 0, ',', '.')." Gs";?></td>
							<td data-th="Quantity">
							    
							<?php $cant =  getStock($producto['idproducto'])['stock']; ?>
							<select class="form-control form-control-lg"  name="qty"  >  
                                        <option value="<?php echo($producto['qty']) ?>"><?php echo($producto['qty']) ?></option>   
                                             <?php for ($i=1; $i <= $cant; $i++) { ?>                                      
                                                <option value="<?php echo $i;?>"><?php echo $i;?></option>
                                             <?php } ?>      
                                        </select>

								<!--input type="number" name="qty" class="form-control text-center" value="<?php //echo($producto['qty']) ?>"-->
                            </td>
                            <?php $precio = number_format($producto['qty']*$producto['precio'], 0, ',', '.')." Gs";?>
							<td data-th="Subtotal" class="text-center">	<?php echo $precio ?></td>
							<td class="actions" data-th="">
								<button type="submit" class="btn btn-info btn-sm" name="action" value="updatecart" ><i class="fa fa-refresh"></i></button>
								<button type="submit" class="btn btn-danger btn-sm" name="action" value="deletecart" ><i class="fa fa-trash-o"></i></button>								
                            </td>
                            
                            </form>	
                        </tr>


                    <?php } ?>   
					</tbody>
					<tfoot>
						<tr class="visible-xs">
							<td class="text-center"><strong>	<?php echo number_format(getTotalCart(), 0, ',', '.')." Gs";?></strong></td>
						</tr>
						<tr>
							<td><a href="#" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continuar Comprando</a></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center"><strong>Total <?php echo number_format(getTotalCart(), 0, ',', '.')." Gs";?></strong></td>
							<td><a href="direccion.php" class="btn btn-success btn-block">Finalizar Pedido <i class="fa fa-angle-right"></i></a></td>
						</tr>
					</tfoot>
                </table>
                




</div>

	<!-- Page end -->

	<!-- Footer top section -->	
	<?php include("includes/footer.php");?>
    </main>

<script src="js/bootstrap.min.js"></script>
    <script src="js/holder.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    

<?php include("includes/scripts.php"); ?>


</html>
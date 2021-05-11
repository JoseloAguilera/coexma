<?php
$sms= ' <script language="javascript">
Swal.fire({
	title: "CARRITO DE COMPRAS ",
	text: "¡Hemos añadido este producto a su carrito!",
	icon:"success",
	showCancelButton: true,
	confirmButtonText: "Finalizar Compra",
	cancelButtonText: "Continuar Comprando",
}).then((result) => {
	/* Read more about isConfirmed, isDenied below */
	if (result.isConfirmed) {
	window.location.href = "direccion.php";
	} else if (result.isDenied) {
	Swal.fire("Changes are not saved", "", "info")
	}
})
</script>';


if (isset($_POST['action']) && $_POST['action'] == 'addcart') {
	// $_SESSION['Carrito'] = array();

	// var_dump($_POST['atributo']);
	if (isset($_POST['atributo'])) {
		$combinacion = buscaCombinacion($_POST['atributo']);
		$precio =  $_POST['precio'];//$producto['precio'];
	} else {
		$combinacion = "";
		$precio = $producto['precio'];
	}

	$id =$_POST['id'];
	$qty=$_POST['qty'];
		
	//funcion que obtienen datos del producto
	$producto= getProducto($id);
	$imagen= getProdImage($id);
	
	// $_SESSION['total'];
	
	$newitem = array(
		'idproducto' => $id, 
		'combinacion' => $combinacion, 
		'referencia' => $producto['referencia'], 
		'nombre' => $producto['nombre'], 
		'descripcion' => $producto['descripcion_corta'], 
		'img_producto' => $imagen['url'], 
		'precio' =>  $precio, 
		'qty' => $qty
	);

	/*if not empty
	if(!empty($_SESSION['cart']))
	{    
		//and if session cart same 
		if(isset($_SESSION['cart'][$id]) == $id) {
			$_SESSION['cart'][$id]['qty']++;
		} else { 
			//if not same put new storing
			$_SESSION['cart'][$id] = $newitem;
		}
	} else  {
		$_SESSION['cart'] = array();
		$_SESSION['cart'][$id] = $newitem;
	}
	*/

	//if not empty
	if(!empty($_SESSION['cart']))
	{    
		//and if session cart same 
		if(isset($_SESSION['cart'][$id."-".$combinacion]) == $id."-".$combinacion) {
			$_SESSION['cart'][$id."-".$combinacion]['qty']= $_SESSION['cart'][$id."-".$combinacion]['qty']+$qty;
			echo $sms;

		} else { 
			//if not same put new storing
			$_SESSION['cart'][$id."-".$combinacion] = $newitem;
			echo $sms;
		}
	} else  {
		$_SESSION['cart'] = array();
		$_SESSION['cart'][$id."-".$combinacion] = $newitem;
		echo $sms;
	}
} else if (isset($_POST['action']) && $_POST['action'] == 'updatecart') {
	$id =$_POST['id'];
	$qty=$_POST['qty'];
	$combinacion = $_POST['combinacion'];
	
	if(isset($_SESSION['cart'][$id."-".$combinacion]) == $id."-".$combinacion) {
		$_SESSION['cart'][$id."-".$combinacion]['qty'] = $_POST['qty'];
	}
} else if(isset($_POST['action']) && $_POST['action'] == 'deletecart') {
	$id =$_POST['id'];
	$combinacion = $_POST['combinacion'];
	if(isset($_SESSION['cart'][$id."-".$combinacion]) == $id."-".$combinacion) {
		unset($_SESSION['cart'][$id."-".$combinacion]);
	}
}else{}
?>

<?php
    include_once "mods/server/pedido.php";
    include_once "mods/server/producto.php";
    include_once "mods/server/cliente.php";
    include_once "mods/server/funcs.php";

    if ($_SERVER['REQUEST_METHOD'] == "GET") {
		if (isset($_GET['pedido'])){
            $pedido = getPedido($_GET['pedido']);
            $dirrecion = getClienteDireccion($pedido['id_cliente']);
            $dirrecion = $dirrecion[0];
            $productos = getProdPedido($_GET['pedido']);
            $status = getAllStatus();
            // var_dump($dirrecion);
        } else {
            echo "<script type='text/javascript'>document.location.href='pedidos.php';</script>";
        }
    } else if ($_SERVER['REQUEST_METHOD'] == "POST") {
        if (isset($_POST['guardar'])){
            // var_dump($_POST);
            $guardar = savePedido ($_POST['codigo'], $_POST['status']);

			if ($guardar == $_POST['codigo']) {
				$tipomensaje = 'success';
				$mensaje= '<h3>Perfecto!</h3><p>Los datos fueron actualizados correctamente.</p>';
			} else if ($guardar == null) {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Registro NO ENCONTRADO</p>';
			} else {
				$tipomensaje = 'error';
				$mensaje = '<h3>Error!</h3><p>Consulte al administrador de sistemas.<br>Error->"'.$guardar.'"</p>';
			}
            
            $pedido = getPedido($_GET['pedido']);
            $dirrecion = getClienteDireccion($pedido['id_cliente']);
            $dirrecion = $dirrecion[0];
            $productos = getProdPedido($_GET['pedido']);
            $status = getAllStatus();
        }
    }	
?>
<?php
    include_once "mods/server/cliente.php";
    include_once "mods/server/producto.php";
    include_once "mods/server/pedido.php";
    include_once "mods/server/contacto.php";

    $ctd_clientes = countAllClientes ();
    $ctd_productos = countAllProductosActivos();
    $ctd_pedidos = countAllPedidos();
    $ctd_whatsapp = countWhatsApp();
    

    $ctd_formulario = countReservasForm();
    $ctd_formularioContacto = countAllContactos();


    $productos_stock = getAllProductoStock();
    $pedidos_pendientes = getPedidosPendientes();
    $pedidos_clientes = countPedidosClientes();
?>
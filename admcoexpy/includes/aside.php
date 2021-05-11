<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="../img/logo.png" class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p><?php echo $_SESSION['nome_usuario'];?></p>
				<!-- <a href="#"><i class="fa fa-circle text-success"></i> Online</a> -->
			</div>
		</div>
		<?php 
			$inicio = "";

			$catastro = "";
			$subcliente1 = "";
			$subcliente2 = "";
			$subcurriculum1 = "";
			$subcurriculum2 = ""; 					
			$subcategoria1 = "";
			$subcategoria2 = "";
			$submarca1 = "";
			$submarca2 = "";
			$sublinea1 = "";
			$sublinea2 = "";
			$subatributo1 = "";
			$subatributo2 = "";
			$subproducto1 = "";
			$subproducto2 = "";
			$subvendedor1 = "";
			$subvendedor2 = "";
			$subunidad1 = "";
			$subunidad2 = "";

			$ecommerce = "";
			$subbanner1 = "";
			$subbanner2 = "";
			$subcontacto1 = "";
			$subcontacto2 = "";
			$subpedidos1 = "";
			$subpedidos2 = "";
			
			$subpedidosexp1 = "";
			$subpedidosexp2 = "";

			$subpedidoswp1 = "";
			$subpedidoswp2 = "";

			$configuraciones = "";
			$subusuario1 = "";
			$subusuario2 = "";
			$subinfo1 = "";
			$subinfo2 = "";

			$reportes = "";
			$encuesta1 = "";
			$encuesta2 = "";

			if (strpos($_SERVER['REQUEST_URI'], 'cliente.php') !== false){
				$catastro = "active";
				$subcliente1 = "active";
				$subcliente2 = "text-aqua";
			} else if (strpos($_SERVER['REQUEST_URI'], 'curriculum.php') !== false OR strpos($_SERVER['REQUEST_URI'], 'curriculum_detalle.php') !== false){
				$catastro = "active";
				$subcurriculum1 = "active";
				$subcurriculum2 = "text-aqua";
			} else if (strpos($_SERVER['REQUEST_URI'], 'categoria.php') !== false){
				$catastro = "active";
				$subcategoria1 = "active";
				$subcategoria2 = "text-aqua";
			} else if (strpos($_SERVER['REQUEST_URI'], 'marca.php') !== false){
				$catastro = "active";
				$submarca1 = "active";
				$submarca2 = "text-aqua";
			} else if (strpos($_SERVER['REQUEST_URI'], 'linea.php') !== false){
				$catastro = "active";
				$submarca1 = "active";
				$submarca2 = "text-aqua";
			} else if (strpos($_SERVER['REQUEST_URI'], 'atributo.php') !== false){
				$catastro = "active";
				$subatributo1 = "active";
				$subatributo2 = "text-aqua";
			} else if (strpos($_SERVER['REQUEST_URI'], 'producto.php') !== false OR strpos($_SERVER['REQUEST_URI'], 'producto_detalle.php') !== false){
				$catastro = "active";
				$subproducto1 = "active";
				$subproducto2 = "text-aqua";
			} else if (strpos($_SERVER['REQUEST_URI'], 'vendedor.php') !== false){
				$catastro = "active";
				$subvendedor1 = "active";
				$subvendedor2 = "text-aqua";
			} else if (strpos($_SERVER['REQUEST_URI'], 'unidad.php') !== false){
				$catastro = "active";
				$subunidad1 = "active";
				$subunidad2 = "text-aqua";
			} else if (strpos($_SERVER['REQUEST_URI'], 'pedido.php') !== false OR strpos($_SERVER['REQUEST_URI'], 'pedido_detalle.php') !== false){
				$ecommerce = "active";
				$subpedidos1 = "active";
				$subpedidos2 = "text-aqua";
			} else if (strpos($_SERVER['REQUEST_URI'], 'pedido_express.php') !== false){
				$ecommerce = "active";
				$subpedidosexp1 = "active";
				$subpedidosexp2 = "text-aqua";
			} else if (strpos($_SERVER['REQUEST_URI'], 'pedidos_whatsapp.php') !== false){
				$ecommerce = "active";
				$subpedidoswp1 = "active";
				$subpedidoswp2 = "text-aqua";
			} else if (strpos($_SERVER['REQUEST_URI'], 'banner.php') !== false){
				$ecommerce = "active";
				$subbanner1 = "active";
				$subbanner2 = "text-aqua";
			} else if (strpos($_SERVER['REQUEST_URI'], 'contacto.php') !== false){
				$ecommerce = "active";
				$subcontacto1 = "active";
				$subcontacto2 = "text-aqua";
			} else if (strpos($_SERVER['REQUEST_URI'], 'usuario.php') !== false){
				$configuraciones = "active";
				$subusuario1 = "active";
				$subusuario2 = "text-aqua";
			} else if (strpos($_SERVER['REQUEST_URI'], 'informaciones.php') !== false){
				$configuraciones = "active";
				$subinfo1 = "active";
				$subinfo2 = "text-aqua";
			} else if (strpos($_SERVER['REQUEST_URI'], 'encuesta.php') !== false){
				$reportes = "active";
				$encuesta1 = "active";
				$encuesta2 = "text-aqua";			
			} else {
				$inicio = "active";
			}
		?>
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu" data-widget="tree">
			<li class="header">Menu de Navegación</li>
			<li class="<?php echo $inicio;?>">
				<a href="index.php">
					<i class="fa fa-home"></i> <span>Inicio</span>
				</a>
			</li>
			<li class="<?php echo $catastro;?> treeview">
				<a href="#">
					<i class="fa fa-pencil"></i> <span>Catastros</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">
					<li class="<?php echo $subcliente1;?>"><a href="cliente.php"><i class="fa fa-circle-o <?php echo $subcliente2;?>"></i> Clientes</a></li>
					<li class="<?php echo $subcurriculum1;?>"><a href="curriculum.php"><i class="fa fa-circle-o <?php echo $subcurriculum2;?>"></i> Curriculum</a></li>
					<li class="<?php echo $subcategoria1;?>"><a href="categoria.php"><i class="fa fa-circle-o <?php echo $subcategoria2;?>"></i> Categoria</a></li>
					<li class="<?php echo $submarca1;?>"><a href="marca.php"><i class="fa fa-circle-o <?php echo $submarca2;?>"></i> Marca</a></li>
					<li class="<?php echo $sublinea1;?>"><a href="linea.php"><i class="fa fa-circle-o <?php echo $sublinea2;?>"></i> Linea</a></li>
					<li class="<?php echo $subatributo1;?>"><a href="atributo.php"><i class="fa fa-circle-o <?php echo $subatributo2;?>"></i> Atributos</a></li>
					<li class="<?php echo $subproducto1;?>"><a href="producto.php"><i class="fa fa-circle-o <?php echo $subproducto2;?>"></i> Productos</a></li>
					<li class="<?php echo $subvendedor1;?>"><a href="vendedor.php"><i class="fa fa-circle-o <?php echo $subvendedor2;?>"></i> Vendedores</a></li>
					<li class="<?php echo $subunidad1;?>"><a href="unidad.php"><i class="fa fa-circle-o <?php echo $subunidad2;?>"></i> Unidades</a></li>
				</ul>
			</li>
			<li class="<?php echo $ecommerce;?> treeview">
				<a href="#">
					<i class="fa fa-laptop"></i> <span>E-commerce</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">
					<li class="<?php echo $subbanner1;?>"><a href="banner.php"><i class="fa fa-circle-o <?php echo $subbanner2;?>"></i> Banners</a></li>
					<li class="<?php echo $subcontacto1;?>"><a href="contacto.php"><i class="fa fa-circle-o <?php echo $subcontacto2;?>"></i> Formulario de Contactos</a></li>
					<li class="<?php echo $subpedidos1;?>"><a href="pedido.php"><i class="fa fa-circle-o <?php echo $subpedidos2;?>"></i> Carrito de Compras</a></li>
					<li class="<?php echo $subpedidosexp1;?>"><a href="pedido_express.php"><i class="fa fa-circle-o <?php echo $subpedidosexp2;?>"></i> Pedidos (Formulario)</a></li>
					<li class="<?php echo $subpedidoswp1;?>"><a href="pedidos_whatsapp.php"><i class="fa fa-circle-o <?php echo $subpedidoswp2;?>"></i> WhatsApp</a></li>
				</ul>
			</li>
			<li class="<?php echo $reportes;?> treeview">
				<a href="#">
					<i class="fa fa-bar-chart"></i> <span>Reportes</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">
					<li class="<?php echo $encuesta1;?>"><a href="encuesta.php"><i class="fa fa-circle-o <?php echo $encuesta2;?>"></i> Encuesta</a></li>
				</ul>
			</li>
			<?php
				if ($_SESSION['tipo'] == 0) {
			?>
			<li class="<?php echo $configuraciones;?> treeview">
				<a href="#">
					<i class="fa fa-gear"></i> <span>Configuraciones</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">
					<li class="<?php echo $subinfo1;?>"><a href="informaciones.php"><i class="fa fa-circle-o <?php echo $subinfo2;?>"></i> Informaciones</a></li>
					<li class="<?php echo $subusuario1;?>"><a href="usuario.php"><i class="fa fa-circle-o <?php echo $subusuario2;?>"></i> Usuario</a></li>
				</ul>
			</li>
			<?php
				}
			?>
		</ul>
	</section>
<!-- /.sidebar -->
</aside>
<header>
  <?php $menu = getAllMenuCategorias( $_SESSION['tienda']);?>
      <nav class="navbar navbar-expand-md navbar-dark fixed-top">
        <a class="navbar-brand" href="#"><img src="https://coexma.com.py/assets/site/imagens/coexma.png" alt="" class="img-fluid"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="index.php">Inicio <span class="sr-only">(current)</span></a>
            </li>
            <?php foreach ($menu as $mainmenu) {
              if (getAllMenuCategorias($mainmenu['id'])) {  ?>
              <li class="nav-item dropdown">

              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:rgb(40 40 40)">
              <?php echo $mainmenu['nombre'] ?> 
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              
              <?php 
              $submenu = getAllMenuCategorias($mainmenu['id']);
              foreach ($submenu as $subm) { ?>
                <a class="dropdown-item" href="categoria.php?cat=<?php echo $mainmenu['id'] ?>"><?php echo $subm['nombre'] ?> </a>
                <div class="dropdown-divider"></div>
                <?php } ?>
              </div>
            </li>
                
                <?php } else { ?>
                  <li class="nav-item">
                    <a class="nav-link" href="categoria.php?cat=<?php echo $mainmenu['id'] ?>"><?php echo $mainmenu['nombre'] ?> </a>
                  </li>
                <?php } ?>
             

           <?php  }
           if ($_SESSION['tienda'] == 1) { ?>
              <li class="nav-item">
                  <a class="nav-link" href="refrigeracion-gastronomia.php"> <i class="fa fa-reply" aria-hidden="true"></i> Refrigeración y Gastronomía </a>
              </li>
          <?php } else { ?>
              <li class="nav-item">
                  <a class="nav-link" href="index.php"> <i class="fa fa-reply" aria-hidden="true"></i> Muebes de Oficina</a>
              </li>

            <?php } ?>
           

           
          </ul>
          <form class="form-inline mt-2 mt-md-0">
            <input class="form-control mr-sm-2" type="text" placeholder="Que estas buscando?" aria-label=" Que estas Buscando?">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
          </form>
        </div>
      </nav>
    </header>
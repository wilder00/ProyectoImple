

<nav class="navbar navbar-expand-lg juan-valdez-background juan-valdez-text-color ">
  <a class="navbar-brand" href="#"><img src="http://www.juanvaldezcafe.com/sites/all/themes/bootstrap/jv_col/logo.png" alt="Juan Valdez"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon ">↕</span>
  </button>
  <div class="collapse navbar-collapse" id="navbarText">
    <ul class="navbar-nav mr-auto juan-valdez-list-group">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Features</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Pricing</a>
      </li>
    </ul>
    <?php if(isset($_SESSION['Usuario'])){//si ya esta logeado
	        echo '<span class="navbar-text">
            <a href="http://localhost/ProyectoImple/cerrarSesion.php">Cerrar Sesion</a>
            </span>';
          }else{
            echo '<span class="navbar-text">
            <a href="http://localhost/ProyectoImple/Intranet/login.php">Iniciar Sesion</a>
            </span>';
          }

    ?>

    
  </div>
</nav>
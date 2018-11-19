<DOCTYPE! HTML>
<meta charset = "utf8" />
<?php  
// crear conexion con oracle
$usuariomaster = "TODO"; //aqui debes poner el usuario master de la base de datos

try {
  $usuario = $_SESSION["Usuario"];
  $password = $_SESSION["Password"];
  echo '<div style="display: none">';
  $conn = oci_connect($usuario, $password, "localhost/XE");
  echo '</div>';
  
} catch (Exception $e) {
  echo 'Caught exception: ',  $e->getMessage(), "\n";
  
}




 
?>

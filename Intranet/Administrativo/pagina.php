<!DOCTYPE html>
<html lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Title Page</title>
        <?php include "../../bootstrap4/bootstrapCss.html" ?>
        <link rel="stylesheet" href="../../css/cajero.css">
    </head>
<body>

<table width="20%" height="50" border="1">
 <tr>
 <th>NOMBRE</th>
 </tr> 
 <?php
error_reporting(E_ALL ^ E_NOTICE);
$conn = oci_connect('BASES','progra');
$sql = "SELECT * FROM PHP";
$stmt = oci_parse($conn, $sql);
oci_execute($stmt);	
while ( $row = oci_fetch_assoc($stmt) ) {
 ?>
 <tr>
 <td><?php echo $row['NOMBRE']; ?></td>
 </tr>
 <?php } ?>
 </table>
<p>






<form id="form1" name="form1" method="post" action="">
  <label for="txt1">INGRESE NOMBRE</label>
   <input type="text" name="txt1" id="txt1" />
   <input type="submit" name="btn" id="btn" value="INGRESAR" />
</form>
<p>





<form id="form2" name="form2" method="post" action="">
  ELIMINAR NOMBRES
<select name="seleccion" id="seleccion" value="">
    <option  value="0" selected="selected">ELIJA NOMBRE A BORRAR</option>
    <?php 
error_reporting(E_ALL ^ E_NOTICE);
$conn = oci_connect('BASES','progra');
$sql = "SELECT * FROM PHP";
$stmt = oci_parse($conn, $sql);
oci_execute($stmt);	
while ( $row = oci_fetch_assoc($stmt) ) {
?>
    <option  value="<?php echo $row['NOMBRE']; ?>"><?php echo $row['NOMBRE']; ?></option>
    <?php }?>
  </select>
  <input type="submit" name="btn2" id="btn2" value="BORRAR" />
</form>
<p>
<form id="form3" name="form3" method="post" action="">
  BUSCAR NOMBRE
    <select name="seleccion2" id="seleccion2" value="">
    <option  value="0" selected="selected">ELIJA NOMBRE A BUSCAR</option>
    <?php 
error_reporting(E_ALL ^ E_NOTICE);
$conn = oci_connect('BASES','progra');
$sql = "SELECT * FROM PHP";
$stmt = oci_parse($conn, $sql);
oci_execute($stmt);	
while ( $row = oci_fetch_assoc($stmt) ) {
?>
    <option  value="<?php echo $row['NOMBRE']; ?>"><?php echo $row['NOMBRE']; ?></option>
    <?php }?>
  </select>
  <input type="submit" name="btn3" id="btn3" value="BUSCAR" />
  
  
  
  
  
  
  
</form>
<table width="20%" height="50" border="1">
  <tr>
    <th>NOMBRE</th>
  </tr>
  <?php
   $nombre_buscar =  htmlspecialchars($_POST["seleccion2"]);
error_reporting(E_ALL ^ E_NOTICE);
$conn = oci_connect('BASES','progra');
$sql = "SELECT * FROM PHP WHERE NOMBRE = '".$nombre_buscar."'";
$stmt = oci_parse($conn, $sql);
oci_execute($stmt);	
while ( $row = oci_fetch_assoc($stmt) ) {
 ?>
  <tr>
    <td><?php echo $row['NOMBRE']; ?></td>
  </tr>
  <?php } ?>
</table>
<p>
<p>
<p>





  <?php
  //INSERTAR
error_reporting(E_ALL ^ E_NOTICE);
$conn = oci_connect('BASES','progra');
$sql = "SELECT * FROM PHP";
$stmt = oci_parse($conn, $sql);
oci_execute($stmt);	

$nombre =  htmlspecialchars($_POST["txt1"]);

$sql = "INSERT INTO PHP( NOMBRE )
VALUES ('".$nombre."')";
$stmt = oci_parse($conn, $sql);
$rc=oci_execute($stmt);//EJECUTAMOS CONEXION
oci_commit($conn);
oci_free_statement($stmt);
oci_close($conn); //CERRAMOS CONEXION
?>
  
  
  <?php
//BORRAR
 $nombre_borrar =  htmlspecialchars($_POST["seleccion"]);
 
$conn = oci_connect('BASES','progra', 'localhost/XE');
$sql = "SELECT * FROM PHP WHERE NOMBRE = '".$nombre_borrar."'";
$stmt = oci_parse($conn, $sql);
oci_execute($stmt);

$sql = "DELETE FROM PHP WHERE NOMBRE = '".$nombre_borrar."'";
$stmt = oci_parse($conn, $sql);
$rc=oci_execute($stmt);
oci_commit($conn);
oci_free_statement($stmt);
oci_close($conn);
?>

  <?php
//BORRAR
 $nombre_borrar =  htmlspecialchars($_POST["seleccion"]);
 
$conn = oci_connect('BASES','progra', 'localhost/XE');
$sql = "SELECT * FROM PHP WHERE NOMBRE = '".$nombre_borrar."'";
$stmt = oci_parse($conn, $sql);
oci_execute($stmt);

$sql = "DELETE FROM PHP WHERE NOMBRE = '".$nombre_borrar."'";
$stmt = oci_parse($conn, $sql);
$rc=oci_execute($stmt);
oci_commit($conn);
oci_free_statement($stmt);
oci_close($conn);
?>
</body>
</html>


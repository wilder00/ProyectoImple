
<?php
/* Set oracle user login and password info */
session_start();
include "../funciones/funciones.php";
$mensaje = "";
$usuariomaster = "TODO"; //aqui debes poner el usuario master de la base de datos
if(isset($_SESSION['Usuario'])){//si ya esta logeado
	header('Location: ../Inicio.php');
}

    if(isset($_POST['submit']) ){
		if(!empty($_POST['Id']) && !empty($_POST['Usuario']) && !empty($_POST['Password'])){
			
			$_SESSION["Usuario"] = $_POST['Usuario'];
			$_SESSION["Password"] = $_POST['Password'];
			
			require "../oracle_conect.php";
			if(!$conn){
				session_unset();
 				session_destroy();
				$mensaje = '<div class="alert alert-danger" role="alert">
							dni,usuario o contraseña incorrecta
					  </div>';
					  //header('Location: login.php?mensaje='.$mensaje.'&enviado=true');
			  }else{
				//header('Location: Cajero/cajero.php');
					
					$existe = existeDni($_POST['Id']);//es de una funcion

					if($existe){
							// Preparar la sentencia
						$stid = oci_parse($conn, "SELECT PUESTO FROM $usuariomaster.TRABAJADOR WHERE DNI = :id");
						oci_bind_by_name($stid, ':id', $_POST['Id']);
						//oci_bind_by_name($stid, ':usuariomaster', $usuariomaster);
	
						if (!$stid) {
							$e = oci_error($conexión);
							trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
						}
	
	
	
						// Realizar la lógica de la consulta
						$r = oci_execute($stid);
						if (!$r) {
							$e = oci_error($stid);
							trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
						}
	
						// Obtener los resultados de la consulta
						// tal vez sirva para recorrer tablas tipo array
						/* 
						print "<table border='1'>\n";
						while ($fila = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS)) {
							print "<tr>\n";
							foreach ($fila as $elemento) {
								print "    <td>" . ($elemento !== null ? htmlentities($elemento, ENT_QUOTES) : "") . "</td>\n";
							}
							print "</tr>\n";
						}
						print "</table>\n";
	
						oci_free_statement($stid);
						oci_close($conn);
						*/
						oci_fetch($stid);
						$puesto = oci_result($stid, 'PUESTO');
	
						if($puesto == 'Cajero'){
							header('Location: Cajero/cajero.php');
						}elseif($puesto == 'Administrativo'){
							header('Location: Administrativo/administrativo.php');
						}else{
							header('Location: login.php');
						}
					}
					$mensaje = '<div class="alert alert-danger" role="alert">
					dni,usuario o contraseña incorrecta
					</div>';
					echo $mensaje;
					
	
					
	
	
	
			  }




		}else{
			$mensaje = '<div class="alert alert-danger" role="alert">
						todo los campos son requerido
					  	</div>';
		}
	}
	


?>



<!DOCTYPE html>
<meta charset="utf-8"/>
<html>
<head>
	<title>Iniciar sesion</title>
	
   <!--Made with love by Mutiullah Samim -->
   
	<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="../css/estilo.css">
</head>
<body>
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>Iniciar Sesión</h3>
				<?php if($mensaje!=""){echo $mensaje; }?>
			</div>
			<div class="card-body">
				<form method="POST" action="login.php">
				<div class="input-group form-group">

						<div class="input-group-prepend light">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="number" name="Id" class="form-control" placeholder="Id de trabajador" min="0">
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend light">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" name="Usuario" class="form-control" placeholder="Usuario">
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" name="Password" class="form-control" placeholder="Contraseña">
					</div>
					<div class="form-group">
						<input type="submit" value="Ingresar" name="submit" class="btn float-right login_btn">
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					¿No tienes una cuenta?<a href="#">Registrate</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
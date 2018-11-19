<?php

$conexión = oci_connect('hr', 'welcome', 'localhost/XE');
if (!$conexión) {
    $m = oci_error();
    trigger_error(htmlentities($m['message']), E_USER_ERROR);
}

$sql = 'SELECT * FROM Trabajador';
$stid = oci_parse($conexión, $sql);
oci_execute($stid);


$fila = oci_fetch_all($stid, $res);
 ?>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Lista de trabajadores</title>
    <link rel="stylesheet" href="../../css/cajero.css">
</head>
<body>
    <?php include 'cabecera.php' ?>
    <h2>Lista de usuarios</h2>

    <table style="width:100%; border-collapse:collapse;" border="1">
        <tr>
            <th>Nombre completo</th>
			<th>DNI</th>
			<th>Puesto</th>
			<th>Telefono</th>
            <th>Correo</th>
            <th>Direccion</th>
            <th>Fecha de contratacionn</th>
            <th>Edad</th>
			<th>sueldo</th>
        </tr>
    <?php if(count($fila) == 0) { ?>
        <tr>
            <td colspan="5"
            style="text-align:center;">No se encuentran usuarios registrados</td>
        </tr>
    <?php } ?>

    <?php foreach ($res as $u)  { ?>
    <tr>
        <td><?php echo $u["nombre"] ?> <?php echo $u["apel_mat"] ?><?php echo $u["apel_pat"] ?></td>
		<td><?php echo $u["dni"] ?></td>
		<td><?php echo $u["puesto"] ?></td>
		<td><?php echo $u["telefono"] ?></td>
        <td><?php echo $u["correo"] ?></td>
        <td><?php echo $u["direccion"] ?></td>
        <td><?php echo $u["fecha_contratacion"] ?></td>
		<td><?php echo $u["edad"] ?></td>
		<td><?php echo $u["sueldo"] ?></td>
	</tr>
	
    <?php oci_free_statement($stid); } ?>
    </table>
    
</body>
</html>	
		
		
		
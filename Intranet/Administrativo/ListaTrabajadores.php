<?php
session_start();


$mensaje = "";
if(isset($_SESSION['Usuario'])){
    if($_SESSION['tipo']=="Cajero"){
        header('Location: ../Cajero/cajero.php');


    }



}

require "../../oracle_conect.php";

$sql = "SELECT * FROM $usuariomaster.Trabajador";
$stid = oci_parse($conn, $sql);

oci_execute($stid);


$fila = oci_fetch_all($stid, $res, null, null, OCI_FETCHSTATEMENT_BY_ROW);
//var_dump($res);
 ?>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Lista de trabajadores</title>
    <link rel="stylesheet" href="../../css/cajero.css">
    <?php include "../../bootstrap4/bootstrapCss.html"?>
</head>
<body>
    <?php include "../../cabecera.php"?>
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
            <td colspan="9"
            style="text-align:center;">No se encuentran Trabajadores registrados</td>
        </tr>
    <?php }else{

            foreach ($res as $u)  { 
                echo "<tr>";
                echo "<td>".$u["NOMBRE"]." ".$u["APEL_MAT"]." ".$u["APEL_PAT"]."</td>\n";
                echo "<td>".$u["DNI"]."</td>\n";
                echo "<td>".$u["PUESTO"]."</td>\n";
                echo "<td>".$u["TELEFONO"]."</td>\n";
                echo "<td>".$u["CORREO"]."</td>\n";
                echo "<td>".$u["DIRECCION"]."</td>\n";
                echo "<td>".$u["FECHA_CONTRATACION"]."</td>\n";
                echo "<td>".$u["EDAD"]."</td>\n";
                echo "<td>".$u["SUELDO"]."</td>\n";
                echo "</tr>";


            } 

        } 
    
    oci_free_statement($stid);
    


    /*
        echo "<table border='1'>\n";
        foreach ($res as $col) {
            echo "<tr>\n";
            foreach ($col as $item) {
                echo "    <td>".($item !== null ? htmlentities($item, ENT_QUOTES) : "")."</td>\n";
            }
            echo "</tr>\n";
        }
        echo "</table>\n";

    }*/
    ?>
    </table>
    <?php include "../../bootstrap4/bootstrapjs.html"?>
    <?php include "../../pie.php"?>
    </body>
</html>	
		
		
		
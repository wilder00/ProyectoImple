
<?php
session_start();
if(isset($_SESSION['Usuario'])){

}else{
    header('Location: ../../Inicio.php');
}

?>



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
        <?php include "../../cabecera.php"?>





       <?php include "../../bootstrap4/bootstrapjs.html" ?>
    </body>
</html>

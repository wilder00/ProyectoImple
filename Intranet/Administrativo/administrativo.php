<?php
session_start();
if(isset($_SESSION['Usuario'])){
    if($_SESSION['tipo']=="Cajero"){
        header('Location: ../Cajero/cajero.php');
    }


}else{
    header('Location: ../../Inicio.php');
}




?>
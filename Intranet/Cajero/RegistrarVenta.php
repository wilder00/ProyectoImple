
<?php
session_start();
if(isset($_SESSION['Usuario'])){
    if($_SESSION['tipo']=="Administrativo"){
        header('Location: ../Administrativo/administrativo.php');
    }


    
    if(!empty($_POST['nombre']) && !empty($_POST['apel_mat']) &&  !empty($_POST['apel_pat']) && !empty($_POST['dni'])){
        $info = $_POST['fecha_nacimiento'];
        /*echo "
                <script>alert('feha: $info')</script>
            ";*/
        if(empty($_POST['telefono'])){
            $_POST['telefono'] = null;
        }
        if(empty($_POST['fecha_nacimiento'])){
            $_POST['fecha_nacimiento'] = null;
        }
        if(empty($_POST['correo'])){
            $_POST['correo'] = null;
        }

        $sql="INSERT INTO $usuariomaster.Cliente VALUES ($usuariomaster.cliente_id.NEXTVAL, :nombre, :apel_mat, :apel_pat, :dni, :telefono, to_date(:fecha_nacimiento, 'yyyy/mm/dd'), :correo , SYSDATE, :categoria_id)";
        $stid = oci_parse($conn, $sql);
        oci_bind_by_name($stid, ':nombre', $_POST['nombre']);
        oci_bind_by_name($stid, ':apel_mat', $_POST['apel_mat']);
        oci_bind_by_name($stid, ':apel_pat', $_POST['apel_pat']);
        oci_bind_by_name($stid, ':dni', $_POST['dni']);
        oci_bind_by_name($stid, ':telefono', $_POST['telefono']);
        oci_bind_by_name($stid, ':fecha_nacimiento', $_POST['fecha_nacimiento']);
        oci_bind_by_name($stid, ':correo', $_POST['correo']);
        oci_bind_by_name($stid, ':categoria_id', $_POST['categoria_id']);
        
        if(oci_execute($stid)){ // La fila se consolida y es visible inmediatamente a otros usuarios
            echo "
                <script>alert('se registró al cliente')</script>
            ";
            header('Location: RegistrarCliente.php');
        }else{
            echo "
                <script>alert('No se pudo registrar')</script>
            ";
        }
        



    }



    








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
            


        <div class="container mt-4">
    <div class="row justify-content-md-center">
        <div class="col col-lg-6">
            <h2>Registrar Ventas</h2>

            <form action="RegistrarVenta.php" method="post">

                <div class="form-group mt-4">
                  <label for="nombre"> </label>
                  <input type="text" class="form-control" name="nombre" id="" aria-describedby="emailHelpId" placeholder="Nombre del cliente">
                  <small id="emailHelpId" class="form-text text-muted"></small>
                </div>



            </form>
        </div>
    </div>
</div>





       <?php include "../../bootstrap4/bootstrapjs.html" ?>
    </body>
</html>

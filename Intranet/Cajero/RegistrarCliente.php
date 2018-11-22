
<?php
session_start();

require "../../oracle_conect.php";
$mensaje = "";
if(isset($_SESSION['Usuario'])){
    if($_SESSION['tipo']=="Administrativo"){
        header('Location: ../Administrativo/administrativo.php');
    }


    if(isset($_POST['submit'])){
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
            <h2>Registrar cliente</h2> 
            <form action="RegistrarCliente.php" method="post">

                <div class="form-group mt-4">
                  <label for="nombre">Nombre</label>
                  <input type="text" class="form-control" name="nombre" id="" aria-describedby="emailHelpId" placeholder="Nombre del cliente">
                  <small id="emailHelpId" class="form-text text-muted"></small>
                </div>

                <div class="form-group mt-4">
                  <label for="">Apellido Paterno</label>
                  <input type="text" class="form-control" name="apel_pat" id="" aria-describedby="emailHelpId" placeholder="Apellido Paterno">
                  <small id="emailHelpId" class="form-text text-muted"></small>
                </div>  

                <div class="form-group mt-4">
                  <label for="">Apellido Materno</label>
                  <input type="text" class="form-control" name="apel_mat" id="" aria-describedby="emailHelpId" placeholder="Apellido Materno">
                  <small id="emailHelpId" class="form-text text-muted"></small>
                </div>  

                <div class="form-group mt-4">
                  <label for="">DNI</label>
                  <input type="number" class="form-control" name="dni" id="" aria-describedby="emailHelpId" placeholder="D.N.I. de usuario" min="10000000" max="99999999">
                  <small id="emailHelpId" class="form-text text-muted"></small>
                </div> 

                <div class="form-group mt-4">
                  <label for="">Telefono</label>
                  <input type="number" class="form-control" name="telefono" id="" aria-describedby="emailHelpId" placeholder="telefono de usuario" min="1000000000" max="9999999999">
                  <small id="emailHelpId" class="form-text text-muted"></small>
                </div>

                <div class="form-group mt-4">
                  <label for="">Fecha de nacimiento</label>
                  <input type="date" class="form-control" name="fecha_nacimiento" id="" aria-describedby="emailHelpId" placeholder="Fecha de nacimiento">
                  <small id="emailHelpId" class="form-text text-muted"></small>
                </div>  


                <div class="form-group">
                  <label for="">Correo</label>
                  <input type="email" class="form-control" name="correo" id="" aria-describedby="emailHelpId" placeholder="Correo">
                  <small id="emailHelpId" class="form-text text-muted"></small>
                </div>


                <?php

                

                $sql = "select categoria_id, nombre from $usuariomaster.categoria";
                $stid = oci_parse($conn, $sql);

                // Las definiciones DEBEN realizarse antes de la ejecución
                oci_define_by_name($stid, 'CATEGORIA_ID',$categoria_id);
                oci_define_by_name($stid, 'NOMBRE',$categoria_nombre);
                
                oci_execute($stid);
                
                // Cada obtención rellena las variables anteriormente definidas con los datos de la siguiente fila
                echo '<div class="form-group">
                <label for="">Categoria de cliente</label>
                <select class="form-control" name="categoria_id" id="">';

                while (oci_fetch($stid)) {
                    echo "<option  value='".$categoria_id."'>".$categoria_nombre."</option>";
                }
                echo '</select>
                </div>';
                
                oci_free_statement($stid);
                oci_close($conn);
                ?>
                
                <div class="form-group mt-3 pt-3 mb-3 pb-3">
                  <input type="submit"
                    class="form-control btn-danger juan-valdez-background" name="submit" id="" aria-describedby="helpId" placeholder="">
                </div>


            </form>
        </div>
    </div>
</div>




       <?php include "../../bootstrap4/bootstrapjs.html" ?>
       <?php include "../../pie.php" ?>
    </body>
</html>

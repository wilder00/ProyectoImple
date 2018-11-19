
<?php
//funcion para que el oci_fetch no deje texto
function existeDni($id){
    $valor = false;
    $stid = oci_parse($conn, "SELECT $usuariomaster.Existe_dni(:id) AS EXISTE FROM DUAL;");
    oci_bind_by_name($stid, ':id', $id);
    
    echo '<div style="display: none">';
    oci_fetch($stid);
    echo '</div>';

    $rpta = oci_result($stid, 'EXISTE');
    if($rpta == 1){
        $valor = true;
    }
    
    oci_free_statement($stid);
    return $valor;
};


?>
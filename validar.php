<?php

require 'conexion.php';

function obtener_lista_correos(){
    $sql = "select correoEst from estudiante"; 
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $arreglo =[];
    if ($consulta->rowCount() != 0) {
        while ($row = $consulta->fetch()) {
            array_push($arreglo, $row['correoEst']);
        }
    }
    return implode(',', $arreglo);
      
      alert("aqui");
      return "dentro de la funcion";

}

?>
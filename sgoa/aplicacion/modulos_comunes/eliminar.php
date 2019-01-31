
<?php
session_start();

require_once '../clases_negocio/clase_conexion.php';
$aceptar  = false;
$aceptar = '<script> confirm("Está seguro que desea eliminar este foro?")</script>';
echo ($aceptar);
    if($aceptar==true){
        include("conexionBD.php");
        if(isset($_GET["id"]))
        $id = $_GET['id'];
        $query = "DELETE FROM  foro WHERE ID = '$id'";
        $result = $mysqli->query($query);
        echo "<script>location.href='../modulos_comunes/index.php'</script>";
     }
                
?>
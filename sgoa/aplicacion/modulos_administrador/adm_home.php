<body>
    <?php 
        include 'navbar_admin.php';
    ?>
    <!-- presentacion de objetos de aprendizaje-->
    <div class="container text-center">
        <div class="row content">
            <!-- --------------------------------------------- -->
            <div class="col-sm-12 text-center">
                <h2> <img src="../../images/foro.png"style="float:left;width:300px;height:170px">ADMINISTRACION DEL FORO</h2>
                
                <div class="container-fluid" >
                    <table  class="table table-striped"border ="1|1" class="table table-bordered" id="tabla">
                        <thead style="background-color:#FFFFCC">
                            <tr>
                                <td ></td>
                                <td>Titulo</td>
                                <td>Fecha</td>
                                <td>Respuestas</td>
                            </tr>
                        </thead>
                    <?php 
                        require_once '../clases_negocio/clase_conexion.php';
                        require '../clases_negocio/funciones_administrador.php';
                        include("conexionBD.php");
                        $query = "SELECT * FROM  foro WHERE identificador = 0 ORDER BY fecha DESC";
                        $result = $mysqli->query($query);
                        while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
                            $id = $row['ID'];
                            $titulo = $row['titulo'];
                            $fecha = $row['fecha'];
                            $respuestas = $row['respuestas'];
                            echo "<tr style='background-color:#BAD6B8'>";
                                echo "<td><a href='foro.php?id=$id'><span class='glyphicon glyphicon-hand-right'> Participar</a></td>";
                                echo "<td>$titulo</td>";
                                echo "<td>".date("$fecha")."</td>";
                                echo "<td>$respuestas</td>";
                                echo "<td><a onClick=\"javascript: return confirm('Realmente desea eliminar el foro seleccionado? Se eliminarán todos las respuestas asociadas al mismo.');\" href='index.php?id=" . $row['ID'] . "&id_gestion=1'><span class='glyphicon glyphicon-remove'></a></td>";
                            echo "</tr>";
                        }
                        echo '</table>';
                        $id_gestion = filter_input(INPUT_GET, 'id_gestion');
                        $id = filter_input(INPUT_GET, 'id');
                        if ($id_gestion == 1) {
                            if (eliminar_foro($id)) {
                                echo '<script>alert("Foro eliminado correctamente")</script> ';
                            } else {
                                echo '<script>alert("El Foro no se ha podido eliminar")</script> ';
                            }
                            echo "<script>location.href='../modulos_comunes/index.php'</script>";
                        }
                    ?>
                </div>
                    <a type="button" class="btn btn-lg btn-primary" href="formulario.php"><i class='glyphicon glyphicon-plus'></i> Nuevo Tema </a>
            </div>

        </div>
    </div>
</body>

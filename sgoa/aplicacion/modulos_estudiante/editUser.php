<?php
session_start();
if (@!$_SESSION['usuario']) {
    header("Location:../../index2.php");
} elseif ($_SESSION['tipo_usuario'] == 'EST') {
    //header("Location:index2.php");
    echo "Estudiante";
    $idUsuario = $_SESSION['id'];
} elseif ($_SESSION['tipo_usuario'] == 'ADM') {
    echo "Administrador";
}
?>
<!DOCTYPE html >
<html  lang="es">
    <head>
        <meta charset="utf-8"></meta>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximun-scale=1.0, minimun-scale=1.0"></meta>
        <link rel="stylesheet" href="../../plugins/bootstrap/css/bootstrap.min.css"></link>
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap-responsive.css"></link>
        <link rel="stylesheet" type="text/css" href="../../estilos/estilosEst.css"></link>
        <script type="text/javascript" src="../../plugins/editPerfil.js"></script>
        <script type="text/javascript" src="../../plugins/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../../plugins/bootstrap/js/jquery-3.3.1.js"></script>
        <script type="text/javascript" src="../../plugins/bootstrap/js/funciones_validar_formularios.js"></script>
        <title>Proyecto SSC</title>
    </head>
    <style>
        body{
            background-image: url(../../images/fondotot.jpg);
        }
    </style>
    <body>
        <?php include 'navbar_estudiante.php'; ?>
        <form action="../formularios_registro/ejecutar_actualizar_estudiante.php" method="post" enctype="multipart/form-data" name="perfil">
            <legend style="font-size: 18pt;" ><b>Editar Perfil</b></legend>
            <div class="pull-center image">
                <?php
                    require_once'../clases_negocio/funciones_oa_estudiante.php';
                    echo "<img id='imgId1' src='". obtener_imagen_es($_SESSION['usuario']) . "' width='85' height='85' class='img-circle'>";
                
                ?>
            </div>
            <?php
            require_once '../../aplicacion/clases_negocio/clase_conexion.php';
            $query1 = 'SELECT * FROM estudiante as es, facultad as facu, usuario as us where es.id_usuario = '.$idUsuario.' AND es.id_facultad=facu.idfacultad AND us.idUsuario=es.id_usuario';
            
            $conexion1 = new Conexion();
            $consulta1 = $conexion1->prepare($query1);
            $consulta1->setFetchMode(PDO::FETCH_ASSOC);
            $consulta1->execute();
            if ($consulta1->rowCount() != 0) {
                if ($row = $consulta1->fetch()) {
                    //echo '<script> console.log("PHP: ';print_r($row);echo '");</script>';
                    $cedula = $row['ci'];
                    $nombres = $row['nombres'];
                    $apellidos = $row['apellidos'];
                    $carrera = $row['carrera'];
                    $facultad = $row['facultad'];
                    $idfacultad = $row['idfacultad'];
                    $mail = $row['mail'];
                    $usuario = $row['usuario'];
                }
            }
            echo '</select></br>';
            $consulta1 = null;
            ?>
            <input class="form-control" placeholder=" Cédula"  id="cedula" type="text" required name="cedula" value="<?php echo $cedula;?>" readonly>
            <input class="form-control" placeholder=" Nombres"  id="nombres" type="text" required name="nombres" value="<?php echo $nombres;?>" >
            <input class="form-control" placeholder=" Apellidos"  id="apellidos" type="text" required name="apellidos" value="<?php echo $apellidos;?>" >
            <input class="form-control" placeholder=" E-mail"   id="email" type="email" required name="email" value="<?php echo $mail;?>" >
            <input class="form-control" placeholder=" Carrera"   id="carrera" type="text" required name="carrera" value="<?php echo $carrera;?>" > 
            <label style="font-size: 10pt;color:#808080" >Facultad</label>
            <?php
            require_once '../../aplicacion/clases_negocio/clase_conexion.php';
            $query1 = 'SELECT * FROM facultad';
            $conexion1 = new Conexion();
            $consulta1 = $conexion1->prepare($query1);
            $consulta1->setFetchMode(PDO::FETCH_ASSOC);
            $consulta1->execute();
            echo '<select class= "form-control"  name="facultad" >';
            echo '<option value="">Selecione facultad</option>';
            if ($consulta1->rowCount() != 0) {
                while ($row = $consulta1->fetch()) {
                    echo '<option value="' . $row['idfacultad'] . '"';
                    if($row['idfacultad']==$idfacultad)
                        echo ' selected';
                    echo '>' . $row['facultad'] . '</option>';
                }
            }
            echo '</select></br>';
            $consulta1 = null;
            ?>
            <p id="usuarios_existentes" style="display:none;" ><?php
                            //echo implode(",", scandir('../../storage/')); 
                            require '../clases_negocio/funciones_oa_profesor.php';
                            echo obtener_lista_de_usuarios();
                            ?></p>
            <p id="error_usuarios_duplicados" style="display:none; color:#FF0000;">
                                El usuario ya existe!!;
                            </p>
            <input class="form-control" placeholder=" Usuario"  id="usuario" type="text" required name="usuario" value="<?php echo $usuario;?>">
            
            <!--div id="campos_contrasenia" style="display:none">
                <input class="form-control" placeholder=" Contraseña Actual"   id="contrasenia_actual" type="password" name="contrasenia_actual">
                <input class="form-control" placeholder=" Nueva Contraseña"   id="contrasenia" type="password" name="contrasenia">
                <input class="form-control" placeholder=" Confirme Nueva Contraseña"   id="contrasenia1" type="password" name="contrasenia1" ><br>
            </div>
            <input class="btn btn-primary" type="submit" name="cambiar_contrasenia" value="Cambiar contraseña" id="cambiar_contrasenia" onclick="cambiar_contrasenia()" /-->
            <br>

            <div class="form-group">
                <fieldset>
                    <label>Seleccione una imagen JPEG, JPG o PNG</label>
                    <p><input type="file" name="fotoPerfil" id= "fotoPerfil" onchange="uploadFile()"/></p>
                </fieldset>
            </div>
            <input class="btn btn-primary" type="submit"  id ="registrar" value="Guardar Cambios">
        </form>

        <script>
            //funcion validacion objetos
            function comprobar_existencia(arreglo, valor) {
                var flag = false;
                for (i = 0; i < arreglo.length; i++)
                {
                    if (arreglo[i].trim().localeCompare(valor.trim()) === 0)
                        flag = true;
                }
                return flag;
            }
            $(document).ready(function () {
                var isvalue = document.getElementById("usuarios_existentes").innerHTML;
                isvalue = isvalue.split(',');
                $('#usuario').keyup(function () {
                    let useramount = $(this).val();
                    //alert(useramount+'.zip');
                    //alert(isvalue.includes(String(useramount + '.zip')));
                    if (comprobar_existencia(isvalue, useramount)) {
                        $('#error_usuarios_duplicados').slideDown("slow");
                        document.getElementById("registrar").disabled = true;
                    } else {
                        $('#error_usuarios_duplicados').slideUp("slow");
                        document.getElementById("registrar").disabled = false;
                    }
                });
            });
        </script>
    </body>
</html>
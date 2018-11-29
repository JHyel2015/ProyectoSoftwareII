<?php
    session_start();
    require_once "pdo.php";

    if (isset($_POST['editProf'])) {
        $sql = "CALL editarProfesor(:nombresProf, :apellidosProf, :correoProf, :idDepartamento, :usuarioProf, :idProfesor)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute(array(
            ':nombresProf' => $_POST["nombre"],
            ':apellidosProf' => $_POST["apellido"],
            ':correoProf' => $_POST["correo"],
            ':idDepartamento' => $_POST["departamento"],
            ':usuarioProf' => $_POST["usuario"],
            ':idProfesor' => $_SESSION["userID"]));
        unset($_POST['editProf']);
        header( 'Location: userprof.php' ) ;
        return;
    }
    if (isset($_POST['changePWProf'])) {
        $sql = 'CALL seleccionarUnProfesor(:idProfesor)';
        $stmt = $pdo->prepare($sql);
        $stmt->execute(array(':idProfesor' => $_SESSION["userID"]));
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        $passwd = $result['pwProf'];
       	$stmt->closeCursor();
        if (password_verify($_POST["pw"], $passwd))
        {
            if ($_POST["pwNew"] == $_POST["pwConf"]) 
            {
                $pwd_hash = password_hash($_POST["pwNew"], PASSWORD_DEFAULT);
                $sql = "CALL cambiarProfesorPw(:pwProf, :idProfesor)";
                $stmt = $pdo->prepare($sql);
                $stmt->execute(array(
                    ':pwProf' => $pwd_hash,
                    ':idProfesor' => $_SESSION["userID"]));
                unset($_POST['changePWProf']);
                header( 'Location: userprof.php' ) ;
                return;
            }
            else
            {
                $_SESSION['errorEditProf'] = 'Contraseñas no coinciden.';
            }
        }
        else
        {
            $_SESSION['errorEditProf'] = 'Contraseña actual incorrecta.';
        }
    }

    if (isset($_POST['editAdmin'])) {
        $sql = "CALL editarAdministrador(:nombreAdmin, :usuarioAdmin, :idAdministrador)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute(array(
            ':nombreAdmin' => $_POST["nombre"],
            ':usuarioAdmin' => $_POST["usuario"],
            ':idAdministrador' => $_SESSION["userID"]));
        unset($_POST['editAdmin']);
        header( 'Location: userprof.php' ) ;
        return;
    }
    if (isset($_POST['changePWAdmin'])) {
        $sql = 'CALL seleccionarUnAdministrador(:idAdministrador)';
        $stmt = $pdo->prepare($sql);
        $stmt->execute(array(':idAdministrador' => $_SESSION["userID"]));
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        $stmt->closeCursor();
        $passwd = $result['pwAdmin'];
        if (password_verify($_POST["pw"], $passwd))
        {
            if ($_POST["pwNew"] == $_POST["pwConf"]) 
            {
                $pwd_hash = password_hash($_POST["pwNew"], PASSWORD_DEFAULT);
                $sql = "CALL cambiarPwAdministrador(:pwAdmin, :idAdministrador)";
                $stmt = $pdo->prepare($sql);
                $stmt->execute(array(
                    ':pwAdmin' => $pwd_hash,
                    ':idAdministrador' => $_SESSION["userID"]));
                unset($_POST['changePWAdmin']);
                header( 'Location: userprof.php' ) ;
                return;
            }
            else
            {
                $_SESSION['errorEditProf'] = 'Contraseñas no coinciden.';
            }
        }
        else
        {
            $_SESSION['errorEditProf'] = 'Contraseña actual incorrecta.';
        }
    }

    if (isset($_POST['editEst'])) {
        $sql = "CALL editarEstudiante(:nombresEst, :apellidosEst, :correoEst, :idCarrera, :usuarioEst, :idEstudiante)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute(array(
            ':nombresEst' => $_POST["nombre"],
            ':apellidosEst' => $_POST["apellido"],
            ':correoEst' => $_POST["correo"],
            ':idCarrera' => $_POST["departamento"],
            ':usuarioEst' => $_POST["usuario"],
            ':idEstudiante' => $_SESSION["userID"]));
        unset($_POST['editEst']);
        header( 'Location: userprof.php' ) ;
        return;
    }
    if (isset($_POST['changePWEst'])) {
        $sql = 'CALL seleccionarUnEstudiante(:idEstudiante)';
        $stmt = $pdo->prepare($sql);
        $stmt->execute(array(':idEstudiante' => $_SESSION["userID"]));
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        $stmt->closeCursor();
        $passwd = $result['pwEst'];
        if (password_verify($_POST["pw"], $passwd))
        {
            if ($_POST["pwNew"] == $_POST["pwConf"]) 
            {
                $pwd_hash = password_hash($_POST["pwNew"], PASSWORD_DEFAULT);
                $sql = "CALL cambiarPwEstudiante(:pwEst, :idEstudiante)";
                $stmt = $pdo->prepare($sql);
                $stmt->execute(array(
                    ':pwEst' => $pwd_hash,
                    ':idEstudiante' => $_SESSION["userID"]));
                unset($_POST['changePWEst']);
                header( 'Location: userprof.php' ) ;
                return;
            }
            else
            {
                $_SESSION['errorEditProf'] = 'Contraseñas no coinciden.';
            }
        }
        else
        {
            $_SESSION['errorEditProf'] = 'Contraseña actual incorrecta.';
        }
    }
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <?php
        require "head.php";
    ?>
    <style>
    .jumbotron {
        padding-top: 20px;
        padding-bottom: 20px;
    }

    .bottom5 { 
        margin-bottom:20px; 
    }
    </style>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
    <?php
        require "navbar.php";
    ?>

    <div class="content-wrapper bg-light">
        <?php
            if ( isset($_SESSION["errorEditProf"]) ) {
                echo('<div class="alert alert-danger alert-dismissable">');
                echo('<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>');
                echo('<strong>Error!</strong>' . $_SESSION["errorEditProf"]);
                echo('</div>');
                unset($_SESSION["errorEditProf"]);
            }
        ?>
        <div class="container">
            <div class="jumbotron">
                <h2 class="display-5 text-center">Editar Perfil de Usuario</h2>
            </div>
        </div>
        <div class="row bottom5">
            <div class="col-8 offset-2">
                <div class="card">
                    <div class="card-body">
                        <form method="post">
                        <?php
                            if ($_SESSION["userType"] == "admin") 
                            {
                                $sql = "CALL seleccionarUnAdministrador(:id)";//revisar los selects si no funcionan
                                $stmt = $pdo->prepare($sql);
                                $stmt->execute(array(':id' => $_SESSION["userID"]));
                                $row1 = $stmt->fetch(PDO::FETCH_ASSOC);
                                echo '<div class="form-group">';
                                echo '<label for="nombre">Nombre</label>';
                                echo '<input class="form-control" id="nombre" name="nombre" type="text" value="' . $row1["nombreAdmin"] . '" required>';
                                echo '</div>';
                                echo '<div class="form-group">';
                                echo '<label for="cedula">Usuario</label>';
                                echo '<input class="form-control" id="usuario" name="usuario" type="text" maxlength="15" value="' . $row1["usuarioAdmin"] . '" required>';
                                echo '</div>';
                                echo '<input type="hidden" name="editAdmin" value="1">';
                                echo '<input class="btn btn-primary btn-block" type="submit" value="Guardar Cambios">';
                                $stmt->closeCursor();
                            }
                            else if ($_SESSION["userType"] == "prof") 
                            {
                                $sql = "CALL seleccionarUnProfesor(:id)";
                                $stmt = $pdo->prepare($sql);
                                $stmt->execute(array(':id' => $_SESSION["userID"]));
                                $row1 = $stmt->fetch(PDO::FETCH_ASSOC);
                                $stmt->closeCursor();
                                echo '<div class="form-group">';
                                echo '<label for="cedula">Cédula</label>';
                                echo '<input class="form-control" id="cedula" name="cedula" type="text" value="' . $row1["cedulaProf"] . '" disabled>';
                                echo '</div>';
                                echo '<div class="form-group">';
                                echo '<div class="form-row">';
                                echo '<div class="col-md-6">';
                                echo '<label for="nombre">Nombres</label>';
                                echo '<input class="form-control" id="nombre" name="nombre" type="text" maxlength="50" value="' . $row1["nombresProf"] . '" required>';
                                echo '</div>';
                                echo '<div class="col-md-6">';
                                echo '<label for="apellido">Apellidos</label>';
                                echo '<input class="form-control" id="apellido" name="apellido" type="text" value="' . $row1["apellidosProf"] . '" required>';
                                echo '</div>';
                                echo '</div>';
                                echo '</div>';
                                echo '<div class="form-group">';
                                echo '<label for="correo">Correo electronico</label>';
                                echo '<input class="form-control" id="correo" name="correo" type="email" value="' . $row1["correoProf"] . '" required>';
                                echo '</div>';
                                echo '<div class="form-group">';
                                echo '<label for="departamento">Departamento</label>';
                                echo '<select class="form-control" id="departamento" name="departamento">';
                                $result = $pdo->query("CALL seleccionarDepartamentoXFacultad()");
                                $facultad = ' ';
                                foreach ($result as $row) {
                                    $departamento = $row['nombreDepartamento'];
                                    $idDepartamento = $row['idDepartamento'];
                                    if ($row['nombreFacultad'] != $facultad) {
                                        $facultad = $row['nombreFacultad'];
                                        if ($idDepartamento > 1) {
                                            echo('</optgroup>');
                                        }
                                        echo('<optgroup label="' . $facultad . '">');
                                    }
                                    if ($idDepartamento == $row1["idDepartamento"]) {
                                        echo('<option value="' . $idDepartamento . '" selected="selected">' . $departamento . '</option>');
                                    } else {
                                        echo('<option value="' . $idDepartamento . '">' . $departamento . '</option>');
                                    }
                                  }
                                $result->closeCursor();
                                echo('</optgroup>');
                                echo '</select>';
                                echo '</div>';
                                echo '<div class="form-group">';
                                echo '<label for="cedula">Usuario</label>';
                                echo '<input class="form-control" id="usuario" name="usuario" type="text" maxlength="15" value="' . $row1["usuarioProf"] . '" required>';
                                echo '</div>';
                                echo '<input type="hidden" name="editProf" value="1">';
                                echo '<input class="btn btn-primary btn-block" type="submit" value="Guardar Cambios">';
                            }
                            else {
                                $sql = "CALL seleccionarUnEstudiante(:id)";
                                $stmt = $pdo->prepare($sql);
                                $stmt->execute(array(':id' => $_SESSION["userID"]));
                                $row1 = $stmt->fetch(PDO::FETCH_ASSOC);
                                echo '<div class="form-group">';
                                echo '<label for="cedula">Cédula</label>';
                                echo '<input class="form-control" id="cedula" name="cedula" type="text" value="' . $row1["cedulaEst"] . '" disabled>';
                                echo '</div>';
                                echo '<div class="form-group">';
                                echo '<div class="form-row">';
                                echo '<div class="col-md-6">';
                                echo '<label for="nombre">Nombres</label>';
                                echo '<input class="form-control" id="nombre" name="nombre" type="text" maxlength="50" value="' . $row1["nombresEst"] . '" required>';
                                echo '</div>';
                                echo '<div class="col-md-6">';
                                echo '<label for="apellido">Apellidos</label>';
                                echo '<input class="form-control" id="apellido" name="apellido" type="text" value="' . $row1["apellidosEst"] . '" required>';
                                echo '</div>';
                                echo '</div>';
                                echo '</div>';
                                echo '<div class="form-group">';
                                echo '<label for="correo">Correo electronico</label>';
                                echo '<input class="form-control" id="correo" name="correo" type="email" value="' . $row1["correoEst"] . '" required>';
                                echo '</div>';
                                echo '<div class="form-group">';
                                echo '<label for="departamento">Departamento</label>';
                                echo '<select class="form-control" id="departamento" name="departamento">';
                                $result = $pdo->query("CALL selectCarreraXFacultad()");
                                $facultad = ' ';
                                foreach ($result as $row) {
                                    $carrera = $row['nombreCarrera'];
                                    $idCarrera = $row['idCarrera'];
                                    if ($row['nombreFacultad'] != $facultad) {
                                        $facultad = $row['nombreFacultad'];
                                        if ($idCarrera > 1) {
                                            echo('</optgroup>');
                                        }
                                        echo('<optgroup label="' . $facultad . '">');
                                    }
                                    if ($idCarrera == $row1["idCarrera"]) {
                                        echo('<option value="' . $idCarrera . '" selected="selected">' . $carrera . '</option>');
                                    } else {
                                        echo('<option value="' . $idCarrera . '">' . $carrera . '</option>');
                                    }
                                }
                                $result->closeCursor();
                                echo('</optgroup>');
                                echo '</select>';
                                echo '</div>';
                                echo '<div class="form-group">';
                                echo '<label for="cedula">Usuario</label>';
                                echo '<input class="form-control" id="usuario" name="usuario" type="text" maxlength="15" value="' . $row1["usuarioEst"] . '" required>';
                                echo '</div>';
                                echo '<input type="hidden" name="editEst" value="1">';
                                echo '<input class="btn btn-primary btn-block" type="submit" value="Guardar Cambios">';
                            }
                        ?>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row bottom5">
            <div class="col-8 offset-2">
                <div class="card">
                    <div class="card-body">
                        <form method="post">
                        <?php
                            if ($_SESSION["userType"] == "admin") 
                            {
                                echo '<div class="form-group">';
                                echo '<label for="cedula">Contraseña Actual</label>';
                                echo '<input class="form-control" id="pw" name="pw" type="password" placeholder="Ingrese su contraseña actual" required>';
                                echo '</div>';
                                echo '<div class="form-group">';
                                echo '<div class="form-row">';
                                echo '<div class="col-md-6">';
                                echo '<label for="pw">Contraseña Nueva</label>';
                                echo '<input class="form-control" id="pwNew" name="pwNew" type="password" placeholder="Contraseña nueva" required>';
                                echo '</div>';
                                echo '<div class="col-md-6">';
                                echo '<label for="pwconfirm">Confirmar contraseña nueva</label>';
                                echo '<input class="form-control" id="pwConf" name="pwConf" type="password" placeholder="Confirmar contraseña nueva" required>';
                                echo '</div>';
                                echo '</div>';
                                echo '</div>';
                                echo '<input type="hidden" name="changePWAdmin" value="1">';
                                echo '<input class="btn btn-danger btn-block" type="submit" value="Cambiar Contraseña">';
                            }
                            else if ($_SESSION["userType"] == "prof") 
                            {
                                echo '<div class="form-group">';
                                echo '<label for="cedula">Contraseña Actual</label>';
                                echo '<input class="form-control" id="pw" name="pw" type="password" placeholder="Ingrese su contraseña actual" required>';
                                echo '</div>';
                                echo '<div class="form-group">';
                                echo '<div class="form-row">';
                                echo '<div class="col-md-6">';
                                echo '<label for="pw">Contraseña Nueva</label>';
                                echo '<input class="form-control" id="pwNew" name="pwNew" type="password" placeholder="Contraseña nueva" required>';
                                echo '</div>';
                                echo '<div class="col-md-6">';
                                echo '<label for="pwconfirm">Confirmar contraseña nueva</label>';
                                echo '<input class="form-control" id="pwConf" name="pwConf" type="password" placeholder="Confirmar contraseña nueva" required>';
                                echo '</div>';
                                echo '</div>';
                                echo '</div>';
                                echo '<input type="hidden" name="changePWProf" value="1">';
                                echo '<input class="btn btn-danger btn-block" type="submit" value="Cambiar Contraseña">';
                            }
                            else {
                                echo '<div class="form-group">';
                                echo '<label for="cedula">Contraseña Actual</label>';
                                echo '<input class="form-control" id="pw" name="pw" type="password" placeholder="Ingrese su contraseña actual" required>';
                                echo '</div>';
                                echo '<div class="form-group">';
                                echo '<div class="form-row">';
                                echo '<div class="col-md-6">';
                                echo '<label for="pw">Contraseña Nueva</label>';
                                echo '<input class="form-control" id="pwNew" name="pwNew" type="password" placeholder="Contraseña nueva" required>';
                                echo '</div>';
                                echo '<div class="col-md-6">';
                                echo '<label for="pwconfirm">Confirmar contraseña nueva</label>';
                                echo '<input class="form-control" id="pwConf" name="pwConf" type="password" placeholder="Confirmar contraseña nueva" required>';
                                echo '</div>';
                                echo '</div>';
                                echo '</div>';
                                echo '<input type="hidden" name="changePWEst" value="1">';
                                echo '<input class="btn btn-danger btn-block" type="submit" value="Cambiar Contraseña">';
                            }
                        ?>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <?php
            require "footer.php";
        ?>
    </div>
</body>

</html>
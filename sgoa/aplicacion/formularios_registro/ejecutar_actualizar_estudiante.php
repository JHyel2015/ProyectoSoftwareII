<?php
    session_start();

    require '../../aplicacion/clases_negocio/funciones_oa_estudiante.php';
    require '../../aplicacion/clases_negocio/funciones_oa_profesor.php';

    $cedula = filter_input(INPUT_POST, 'cedula');
    $nombres = filter_input(INPUT_POST, 'nombres');
    $apellidos = filter_input(INPUT_POST, 'apellidos');
    $email = filter_input(INPUT_POST, 'email');
    $carrera = filter_input(INPUT_POST, 'carrera');
    $facultad = filter_input(INPUT_POST, 'facultad');
    $usuario = filter_input(INPUT_POST, 'usuario');
    $contrasenia = filter_input(INPUT_POST, 'contrasenia');

    $carpeta = "../../imagenes/";
    opendir($carpeta);
    $destino = $carpeta.$_FILES['fotoPerfil']['name'];
    //echo '<script>console.log("'.$destino.'")</script>';
    if($_FILES['fotoPerfil']['tmp_name']==""){
        $target_file = obtener_imagen_es($_SESSION['usuario']); 
        echo '<script>console.log("Esta vacio, la imagen seguira siendo: '.$target_file.'")</script>';
    }
    else{
        copy($_FILES['fotoPerfil']['tmp_name'], $destino);
        $path = $_FILES['fotoPerfil']['name'];
        //echo '<script>console.log("'.$path.'")</script>';

        $ext = pathinfo($path, PATHINFO_EXTENSION);
        $target_file = $carpeta .urlencode($path);        
        //echo '<script>console.log("'.$target_file.','.obtener_imagen_es($_SESSION['usuario']).'")</script>';
    }

    $id_usuario= $_SESSION['id'];
    $alert = "";
    //echo '<script>console.log("'.$id_usuario.','.$usuario.'")</script>';
    actualizar_usuario($id_usuario, $usuario);
    if(actualizar_estudiante($nombres, $apellidos, $carrera, $facultad, $email, $id_usuario,$target_file)){
        echo '<script>alert("Usuario actualizado correctamente! Puede ingresar al sistema")</script> ';
        echo "<script>location.href='../modulos_estudiante/editUser.php'</script>";
    }else{
        echo '<script>alert("No se ha podido actualizar el usuario. Contacte a un administrador")</script> ';
        echo "<script>location.href='../modulos_estudiante/editUser.php'</script>";
    }


 
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es">
    <head>

        <meta charset="utf-8"></meta>
        <link rel="stylesheet" href="../../plugins/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="../../estilos/style.css"></link>

        <!-- intro.js -->
        <link href="../../intro.js/introjs.css" rel="stylesheet">

        <title>Proyecto SGOA</title>
    </head>
    <body>        
        <?php include 'navBarIndex.php'; ?>

        <div class="intro-header">
        <form action="../../aplicacion/validar.php" method="post">
            <h1 style="color: #004e91;">SSC</h1>
            <h3 style="color: #004e91;">Sistema de Soluciones Compartidas</h3>
            <br>
            <select data-step="1" data-intro="¡Bienvenido! Selecciona tu usuario para ingresar al sistema" class= "form-control" name="tipo_usuario" dir="ltr" required>
                <option value="">Tipo de Usuario</option>
                <option value="ADM">Administrador</option>
                <option value="PRO">Docente</option>
                <option value="EST">Estudiante</option>
            </select></br>
            <div data-step="2" data-intro="En esta sección ingresas tus datos" class="Ingreso_datos">
                <div class="form-group has-feedback">
                    <input type="text" class="form-control" placeholder="Nombre de Usuario" required name="user"></input>
                    <i class="glyphicon glyphicon-user form-control-feedback"></i>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="Contraseña" required name="pass"></input>
                    <i class="glyphicon glyphicon-lock form-control-feedback"></i>
                </div>
            </div>

            <br>
            <button class="btn btn-primary btn-s" type="submit">
                <span class="glyphicon glyphicon-log-in"></span> Iniciar sesión
            </button>
            <!--<h2 style = "color: #004e91; font-size: 80%"; align="right"> ¿Olvidó su contraseña? </h2>-->
        </form>
        <script type="text/javascript" src="../../intro.js/intro.js"></script>
        <br/>
        <a class="btn btn-info btn-success" href="javascript:void(0);" onclick="javascript:introJs().setOption('showProgress', true).start();">Ayuda</a>
    </body>
</html>
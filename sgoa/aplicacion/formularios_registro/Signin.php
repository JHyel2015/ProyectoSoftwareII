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
            <form method="post">
                <h2 style="color: #004e91; font-size: 250%;">Regístrate</h2>
                <div data-step="3" data-intro="En esta sección te puedes registrar" class="Registro_usuarios">
                    <td width="75%"> <a href="../../aplicacion/formularios_registro/RegistrarProfesor.php"> Registrar Profesor</a></td></br>
                    <label></label>
                    <td width="75%" align="right" valign="middle"><a href="../../aplicacion/formularios_registro/RegistrarEstudiante.php"> Registrar Estudiante</a></td>
                </div>
            </form>
        </div>
        <script type="text/javascript" src="../../intro.js/intro.js"></script>
        <br/>
        <a class="btn btn-info btn-success" href="javascript:void(0);" onclick="javascript:introJs().setOption('showProgress', true).start();">Ayuda</a>
    </body>
</html>
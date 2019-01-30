<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
            </button>
            <div class="pull-left image">
                <?php
                    require_once'../clases_negocio/funciones_oa_estudiante.php';
                    echo "<img id='imgId' src='". obtener_imagen_es($_SESSION['usuario']) . "' width='40' height='40' class='img-circle'>";
                
                ?>
            </div>
            <a class="navbar-brand" href="../modulos_estudiante/est_home.php"> Bienvenid@: <strong><?php echo $_SESSION['usuario'] ?></strong></a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="../modulos_comunes/index.php">Home</a></li>
                <!--li><a data-step="5" data-intro="Puedes encontrar o crear temas de discucion" href="../modulos_comunes/index.php">Foro</a></li-->
                <li><a href="../modulos_estudiante/est_importar_catalogar.php">Importar y catalogar</a></li>
                <li><a data-step="3" data-intro="Puedes Buscar tus objetos de aprendizaje aquí" href="../modulos_estudiante/est_buscar.php">Buscar</a></li>
                <!--li><a data-step="4" data-intro="Puedes encontrar herramientas útiles para crear tus objetos de aprendizaje aquí" href="../modulos_estudiante/est_herramientas.php">Herramientas</a></li-->
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="../../aplicacion/desconectar_sesion.php"><span class="glyphicon glyphicon-log-out"></span> Salir</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
            </button>
            <a class="navbar-brand" href="#"> Bienvenid@: <strong><?php echo $_SESSION['usuario'] ?></strong></a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a data-step="5" data-intro="Puedes encontrar o crear temas de discucion" href="../modulos_comunes/index.php">Home</a></li>
                <li><a href="../modulos_administrador/adm_buscar_profesores.php">Gestionar profesores</a></li>
                <li><a href="../modulos_administrador/adm_buscar_estudiantes.php">Gestionar Estudiantes</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="../../aplicacion/desconectar_sesion.php"><span class="glyphicon glyphicon-log-out"></span> Salir</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
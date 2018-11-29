<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" style="background-color:#45929e" id="mainNav">
    <a style="font-family:modern;color:white" style="background-color:#45929e" href="index.php"><i class="fa fa-fw fa-book"></i> Comparte tus soluciones y ayuda a desarrollar más proyectos</a>

    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive"
        aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarResponsive">
        <?php
            if ( isset($_SESSION["user"]) ) {
        ?>
        <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
            <?php
                if ( $_SESSION["userType"] == 'prof' ) {
            ?>
            <li2 class="nav-item" data-toggle="tooltip" data-placement="right" title="Crear">
                <a class="nav-link"><i class="fa fa-fw fa-question"></i><p>
                    <span class="nav-link-text"></span>Pantalla de inicio</p>
                  </br>
                    <span class="nav-link-text">- Comparte tus soluciones y comenta las soluciones de otros proyectos.</span>
                  </br>
                    <span class="nav-link-text">- Busca un problema con el tema de tu proyecto y podrás encontrar ayuda para solucionar tus inconvenietes.</span>
                </a>
            </li2>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Crear">
                    <a class="nav-link" href="exe.php">
                        <i class="fa fa-fw fa-bullhorn"></i>
                        <span class="nav-link-text">Crear un nuevo foro de soluciones compartidas</span>
                    </a>
                </li>
            <?php } ?>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
                <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion">
                    <i class="fa fa-fw fa-github"></i>
                    <span class="nav-link-text">Repositorio de tus soluciones a proyectos</span>
                </a>
                <ul class="sidenav-second-level collapse" id="collapseComponents">
                    <?php
                        if ( $_SESSION["userType"] == 'prof' ) {
                    ?>
                        <li>
                            <a href="importar.php"><i class="fa fa-fw fa-file-upload"></i> Importar y catalogar nuevos temas de ayuda</a>
                        </li>
                    <?php } ?>
                    <li>
                        <a href="buscar.php"><i class="fa fa-fw fa-search"></i> Buscar proyectos relacionados</a>
                    </li>

                </ul>
            </li>
            <?php
                if ( $_SESSION["userType"] != 'admin' && $_SESSION["userType"] != 'prof') {
            ?>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Crear">
                    <a class="nav-link" href="tools.php">
                        <i class="fa fa-external-link"></i>
                        <span class="nav-link-text">Herramientas Adicionales</span>
                    </a>
                </li>
            
                
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Crear">
                    <a class="nav-link" href="exe.php">
                        <i class="fa fa-fw fa-bullhorn"></i>
                        <span class="nav-link-text">Crear un nuevo foro de soluciones compartidas</span>
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Crear">
                <a class="nav-link" href="importar.php">
                    <i class="fa fa-fw fa-file-upload"></i> 
                    <span class="nav-link-text">Importar y catalogar nuevos temas de ayuda</span>
                    </a>
                </li>
                
            <?php } ?>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
               
                </a>
                <ul class="sidenav-second-level collapse" id="collapseComponents">
                    <?php
                        if ( $_SESSION["userType"] == 'prof' ) {
                    ?>
                        <li>
                            <a href="importar.php"><i class="fa fa-fw fa-file-upload"></i> Importar y catalogar nuevos temas de ayuda</a>
                        </li>
                    <?php } ?>
                    <li>
                        <a href="buscar.php"><i class="fa fa-fw fa-search"></i> Buscar proyectos relacionados</a>
                    </li>

                </ul>
            </li>
            <button type= "button" class= "btn btn-danger" data-toggle="modal" data-target="#myModalEst" >Ayuda</button>
            <?php
                if ( $_SESSION["userType"] == 'admin' ) {
            ?>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                    <a class="nav-link" href="users.php">
                        <i class="fa fa-fw fa-address-book"></i>
                        <span class="nav-link-text">Usuarios</span>
                    </a>
                </li>
                <li2 class="nav-item" data-toggle="tooltip" data-placement="right" title="Crear">
                    <a class="nav-link">
                      <p>
                        <i class="fa fa-fw fa-question"></i> 
                        <span class="nav-link-text"> Pantalla de Administrador: En esta pagina se muestran las opciones del administrador para el manejo de Usuarios</span>
                      </p>
                      <span class="nav-link-text">- El administrador puede además de buscar una solución en el repositorio, elimiar estudiantes y profesores.</span>
                    </a>
                </li2>
            <?php } ?>
        </ul>
        <ul class="navbar-nav sidenav-toggler">
            <li class="nav-item">
                <a class="nav-link text-center" id="sidenavToggler">
                    <i class="fa fa-fw fa-angle-left"></i>
                </a>
            </li>
        </ul>
        <?php } else { ?>
        <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">

            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Crear">
                <a class="nav-link" href="login.php">
                    <i class="fa fa-fw fa-sign-in"></i>
                    <span class="nav-link-text">Log In.</span>
                </a>
            </li>
            <li2 class="nav-item" data-toggle="tooltip" data-placement="right" title="Crear">
                <a class="nav-link">
                  <p>
                    <i class="fa fa-fw fa-question"></i> 
                    <span class="nav-link-text"> Pantalla de Inicio: En esta pagina se muestra la pantalla inicial y el ingreso al sistema para estudiante, profesor y administrador.</span>
                  </p>
                  <span class="nav-link-text">- Profesor: puede crear, buscar y comentar con soluciones a problemas de proyectos compartidos.</span>
                </br>
                  <span class="nav-link-text">- Estudiante: puede crear  nuevos temas para repositorrios y comparte soluciones de proyectos.</span>
                </br>
                <span class="nav-link-text">- Administrador: maneja la información de los usuarios.</span>
              </br>
                </a>

                

            </li2>
            <button type= "button" class= "btn btn-danger" data-toggle="modal" data-target="#myModalIni" > 
                    <i class="fa fa-fw fa-file-upload"></i> Ayuda</button>
        </ul>
        <?php } ?>

        <ul class="navbar-nav ml-auto">
            <?php
                if ( ! isset($_SESSION["user"]) ) {
            ?>
            <li class="nav-item">
                <a class="nav-link" href="login.php">
                    <i class="fa fa-fw fa-sign-in"></i>Login</a>
            </li>
            <?php } else { ?>
                <li class="nav-item">
                <a class="nav-link" href="userprof.php">
                    <i class="fa fa-fw fa-user"></i>
                    <?php
                        if ( $_SESSION["userType"] == "admin" ) {
                            echo 'Administrador';
                        } else {
                            echo $_SESSION["userName"];
                        }
                    ?>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
                        <i class="fa fa-fw fa-sign-out"></i>Logout</a>
                </li>
            <?php } ?>
        </ul>

    </div>

</nav>
<div id="myModalIni" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div class="modal-dialog" >
    <div class="modal-content"style="width: 1040px; height: 640px;">
        <div class="modal-body">
            <img src="AyudaIni.png" class="img-responsive" style="width: 1000px; height: 600px;">
        </div>
    </div>
  </div>
</div>
<div id="myModalEst" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div class="modal-dialog" >
    <div class="modal-content"style="width: 1040px; height: 640px;">
        <div class="modal-body">
            <img src="AyudaEst.png" class="img-responsive" style="width: 1000px; height: 600px;">
        </div>
    </div>
  </div>
</div>
<div id="myModalProf" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div class="modal-dialog" >
    <div class="modal-content"style="width: 1040px; height: 640px;">
        <div class="modal-body">
            <img src="AyudaProf.png" class="img-responsive" style="width: 1000px; height: 600px;">
        </div>
    </div>
  </div>
</div>

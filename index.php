<?php
    session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <?php
    require "head.php"; //la funcion requiere en cada script toma la funcionalidad de dicho script y lo replica en este documento. Sirve para codigo limpio
  ?>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <?php
    require "navbar.php";
  ?>
  <div class="content-wrapper">
    <?php //En esta parte el $_SESSION[] succes controla que un usuario se haya logueado correctamente
      if ( isset($_SESSION["success"]) ) {
          echo('<div class="alert alert-success alert-dismissable">');
          echo('<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>');
          echo('<strong>Ingreso Correcto!</strong> Ahora puede usar el sistema.');
          echo('</div>');
          unset($_SESSION["success"]);
      }

      //esta parte del codigo es el anuncia cuando un usuario se registro correctamente
      if ( isset($_SESSION["reg"]) ) {
        echo('<div class="alert alert-success alert-dismissable">');
        echo('<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>');
        echo($_SESSION["reg"]);
        echo('</div>');
        unset($_SESSION["reg"]);
      }
    ?>
    <div class="jumbotron">
      <h1 style="font-family:modern;color:white">SISTEMA DE SOLUCIONES COMPARTIDAS</h1>
      <img src="images/inicio.png" style="text-aling:center;margin:1em">
      <p class="lead">Esta herramienta sirve para almacenar y compartir soluciones a problemas informáticos.</p>
      <p class="lead">¿Qué realiza el Sistema de soluciones compartidas? </p>
      <p class="lead">Puedes participar en un foro para publicar tus soluciones a problemas de códigos, o proyectos en desarrollo. Además comentar o recibir comentarios de mejoras a soluciones de otros usuarios</p>
      <hr class="my-3">
      <a class="lead" style="color:#4eecdf" href="http://www.biblioweb.tic.unam.mx/libros/repositorios/pdf/capitulo_3.pdf">Conocer más</a>
      <p></p>
      <hr class="my-3">
      <p class="display-5">Elaborado por:</p>
      <ul type = disk >
      <li>Carolina Cevallos
      <li>Jorge Heredia
      <li>Pamela Pachacama
      <li>Sergio Villacres
      </ul>
    </div>

    <?php
      require "footer.php";
    ?>

  </div>
</body>

</html>

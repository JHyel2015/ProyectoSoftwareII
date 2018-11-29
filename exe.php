<?php
  session_start();
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <?php
    require "head.php";
  ?>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <?php
    require "navbar.php";
  ?>
  <div class="content-wrapper">
    <div>
      <object type="text/html" data="http://exelearning.net/" width="100%" height="700px">
      </object>
    </div>
    <?php
      require "footer.php";
    ?>
  </div>
</body>

</html>

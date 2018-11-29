<?php
require_once "pdo.php";
require_once "delete_files.php";

function deleteOA($filename, $idOA, $idComentario) {
    
    $pdo = new PDO('mysql:host=localhost;dbname=sistemaoa;charset=utf8', 'root', '');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    $name = basename($filename,".zip");
    $target = 'oa/' . $name . '/';
    delete_files($target);
    
    $dirZip = 'zip/' . $filename;
    unlink($dirZip);
    
    $sql = "CALL eliminarOA(:idOA)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(array(':idOA' => $idOA));
    
    $sql = "CALL eliminarComentario(:idOA, :idComentario)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(array(':idOA' => $idOA, ':idComentario' => $idComentario));
}

function deleteComentario($idOA, $idComentario) {
    
    $pdo = new PDO('mysql:host=localhost;dbname=sistemaoa;charset=utf8', 'root', '');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    
    $sql = "CALL eliminarComentario(:idOA, :idComentario)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(array(':idOA' => $idOA, ':idComentario' => $idComentario));
}



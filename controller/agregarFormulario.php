<?php


$nombre = $_POST['nombre'];
$rut = $_POST['rut'];
$idArea = $_POST['idArea'];
$idContrato = $_POST['idContrato'];
$idEspecialidad = $_POST['idEspecialidad'];
$year_ingreso = $_POST['year_ingreso'];
$opinion_1 = $_POST['opinion_1']; 
$opinion_2 = $_POST['opinion_2']; 
$opinion_3 = $_POST['opinion_3']; 
  $mysqli = include_once "../model/conexion.php";

        $resultado = $mysqli->query("INSERT INTO formulario(nombre,rut,idArea,idTipoContrato,idEspecialidad,year_ingreso,opinion_1,opinion_2,opinion_3,fecha,hora) VALUES (
            '$nombre','$rut',$idArea,$idContrato,$idEspecialidad,'$year_ingreso','$opinion_1','$opinion_2','$opinion_3',date_format(curdate(), '%d/%m/%Y'),DATE_FORMAT(NOW( ), '%H:%i:%S' ))");


            header("location: ../index.php");
           

?>
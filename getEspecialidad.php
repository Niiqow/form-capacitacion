<?php
$mysqli = include_once "model/conexion.php";

$idArea = $_POST['idArea'];

$resultado = $mysqli->query("SELECT * from especialidad where idArea = $idArea");
$especialidad = $resultado->fetch_all(MYSQLI_ASSOC);

$html = "<option value=''>SELECCIONAR</option>";

foreach ($especialidad as $m) { 
 $idEspecialidad = $m['idEspecialidad'];
$especialidad = $m['nombre'];

        $html.= "<option value='".$idEspecialidad."'>".$especialidad."</option>";
}

echo $html;

?>
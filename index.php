<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario</title>
    <link rel="stylesheet" href="https://codepen.io/gymratpacks/pen/VKzBEp#0">
    <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="style.css">
</head>


<?php
$mysqli = include_once "model/conexion.php";
$resultado = $mysqli->query("SELECT * from area");
$areas = $resultado->fetch_all(MYSQLI_ASSOC);
?>

<body>
    <div class="row">
        <div class="col-md-12">
            <form action="controller/agregarFormulario.php" method="POST">
                <h1> Formulario </h1>

                <fieldset>

                    <legend><span class="number">1</span> Datos</legend>

                    <label for="name">Nombre:</label>
                    <input type="text" id="nombre" maxlength="100" name="nombre" required>
                    <label for="name">RUT :</label>
                    <input type="text" maxlength="10" oninput="checkRut(this)" id="rut" name="rut" required>


                    <label for="job">Área:</label>
                    <select id="cbx_area" name="idArea" required>

                        <option value="">SELECCIONAR</option>
                        <?php foreach ($areas as $u) { ?>

                            <option value="<?php echo $u["idArea"] ?>"><?php echo $u["nombre"] ?></option>
                        <?php
                        }
                        ?>

                        </optgroup>
                        </optgroup>
                    </select>
                    <label>Tipo Contrato:</label>
                    <input type="radio" id="idContrato0" value="0" name="idContrato" required><label for="idContrato0" class="light">A plazo fijo</label><br>
                    <input type="radio" id="idContrato1" value="1" name="idContrato" required><label for="idContrato1" class="light">Indefinido</label>
                    <br>
                    <br>
                    <label for="job">Cargo:</label>
                    <select id="cbx_especialidad" name="idEspecialidad" required>

                    </select>

                    <label for="name">Año de ingreso:</label>
                    <input type="number" min="1" max="10000" id="year" name="year_ingreso" required>

                </fieldset>
                <fieldset>

                    <legend><span class="number">2</span> Temas interes de capacitación</legend>
                    <legend> 3 opiniones:</legend>


                    <input type="text" maxlength="100" id="opinion_1" name="opinion_1" required>

                    <input type="text" maxlength="100"id="opinion_2" name="opinion_2">

                    <input type="text" maxlength="100" id="opinion_3" name="opinion_3">



                </fieldset>

                <button type="submit">Guardar</button>

            </form>
        </div>
    </div>

    <script src="jquery-3.6.0.min.js">

    </script>

    <script>
        function checkRut(rut) {
            // Despejar Puntos
            var valor = rut.value.replace('.', '');
            // Despejar Guión
            valor = valor.replace('-', '');

            // Aislar Cuerpo y Dígito Verificador
            cuerpo = valor.slice(0, -1);
            dv = valor.slice(-1).toUpperCase();

            // Formatear RUN
            rut.value = cuerpo + '-' + dv

            // Si no cumple con el mínimo ej. (n.nnn.nnn)
            if (cuerpo.length < 7) {
                rut.setCustomValidity("RUT Incompleto");
                return false;
            }

            // Calcular Dígito Verificador
            suma = 0;
            multiplo = 2;

            // Para cada dígito del Cuerpo
            for (i = 1; i <= cuerpo.length; i++) {

                // Obtener su Producto con el Múltiplo Correspondiente
                index = multiplo * valor.charAt(cuerpo.length - i);

                // Sumar al Contador General
                suma = suma + index;

                // Consolidar Múltiplo dentro del rango [2,7]
                if (multiplo < 7) {
                    multiplo = multiplo + 1;
                } else {
                    multiplo = 2;
                }

            }

            // Calcular Dígito Verificador en base al Módulo 11
            dvEsperado = 11 - (suma % 11);

            // Casos Especiales (0 y K)
            dv = (dv == 'K') ? 10 : dv;
            dv = (dv == 0) ? 11 : dv;

            // Validar que el Cuerpo coincide con su Dígito Verificador
            if (dvEsperado != dv) {
                rut.setCustomValidity("RUT Inválido");
                return false;
            }

            // Si todo sale bien, eliminar errores (decretar que es válido)
            rut.setCustomValidity('');
        }

        $(document).ready(function() {

            $("#cbx_area").change(function() {


                $("#cbx_area option:selected").each(function() {
                    idArea = $(this).val();
                    $.post("getEspecialidad.php", {
                        idArea: idArea
                    }, function(data) {
                        $("#cbx_especialidad").html(data);
                    });
                });
            });
        });

        var input = document.getElementById('year');
        input.addEventListener('input', function() {
            if (this.value.length > 4)
                this.value = this.value.slice(0, 4);
        })

        jQuery(document).ready(function() {
            // Listen for the input event.
            jQuery("#year").on('input', function(evt) {
                // Allow only numbers.
                jQuery(this).val(jQuery(this).val().replace(/[^0-9]/g, ''));
            });
        });
    </script>


</body>

</html>
-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 26-11-2021 a las 17:33:56
-- Versión del servidor: 10.4.16-MariaDB
-- Versión de PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `form-capacitacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `idArea` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`idArea`, `nombre`) VALUES
(1, 'ADMINISTRACIÓN'),
(2, 'COORD.DE USUARIOS'),
(3, 'EDUCACIÓN'),
(4, 'MÉDICA'),
(5, 'INVESTIGACIÓN'),
(6, 'PSICOSOCIAL'),
(7, 'TERAPIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `idEspecialidad` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `idArea` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`idEspecialidad`, `nombre`, `idArea`) VALUES
(1, 'CONTADOR', 1),
(2, 'ADMINISTRATIVO', 1),
(3, 'AUXILIAR', 1),
(4, 'AUXILIAR ASEO', 1),
(5, 'CHOFER', 1),
(6, 'DIRECTOR', 1),
(7, 'DIRECTOR ADM. Y FINANZAS', 1),
(8, 'ENCARGADO DE INFORMATICA', 1),
(9, 'INFORMÁTICO/A', 1),
(10, 'MANTENCION', 1),
(11, 'SECRETARIA', 1),
(12, 'PUBLICISTA', 1),
(13, 'PERIODISTA', 1),
(14, 'ADQUISICIONES', 1),
(15, 'MANIPULADOR DE ALIMENTOS', 1),
(16, 'COORDINACIÓN DE SEDE', 1),
(17, 'COORDINADOR PROG. UNIVERSAL', 1),
(18, 'ENCARGADO DE AREA', 2),
(19, 'SECRETARIA', 2),
(20, 'AUXILIAR BUS', 3),
(21, 'EDUCADOR/A DIFERENCIAL', 3),
(22, 'PROFESOR DE EDUCACIÓN FÍSICA', 3),
(23, 'MONITOR', 3),
(24, 'KINESIOLOGO(A)', 3),
(25, 'T. OCUPACIONAL', 3),
(26, 'FONOAUDIOLOGA(O)', 3),
(27, 'PSICOLOGO', 3),
(28, 'TÉCNICO EN EDUCACION', 3),
(29, 'TRABAJADOR SOCIAL', 3),
(30, 'JEFE TECNICO', 3),
(31, 'U.T.P', 3),
(32, 'ENFERMERA', 4),
(33, 'FISIATRA', 4),
(34, 'MEDICO', 4),
(35, 'NUTRICIÓN', 4),
(36, 'ORTESISTA', 4),
(37, 'PEDIATRA', 4),
(38, 'PROTESISTA', 4),
(39, 'TÉCNICO EN ENFERMERIA', 4),
(40, 'TÉCNICO EN ORTESIS', 4),
(41, 'KINESIOLOGO(A)', 5),
(42, 'PSICOLOGO', 5),
(43, 'PSICOLOGO', 6),
(44, 'TRABAJADOR SOCIAL', 6),
(45, 'KINESIOLOGO(A)', 7),
(46, 'T. OCUPACIONAL', 7),
(47, 'FONOAUDIOLOGA(O)', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulario`
--

CREATE TABLE `formulario` (
  `idFormulario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `rut` varchar(10) NOT NULL,
  `idArea` int(11) NOT NULL,
  `idTipoContrato` int(11) NOT NULL,
  `idEspecialidad` int(11) NOT NULL,
  `year_ingreso` varchar(4) NOT NULL,
  `opinion_1` varchar(100) NOT NULL,
  `opinion_2` varchar(100) NOT NULL,
  `opinion_3` varchar(100) NOT NULL,
  `fecha` varchar(10) NOT NULL,
  `hora` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`idArea`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`idEspecialidad`),
  ADD KEY `idArea` (`idArea`);

--
-- Indices de la tabla `formulario`
--
ALTER TABLE `formulario`
  ADD PRIMARY KEY (`idFormulario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `idArea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `idEspecialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `formulario`
--
ALTER TABLE `formulario`
  MODIFY `idFormulario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD CONSTRAINT `especialidad_ibfk_1` FOREIGN KEY (`idArea`) REFERENCES `area` (`idArea`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

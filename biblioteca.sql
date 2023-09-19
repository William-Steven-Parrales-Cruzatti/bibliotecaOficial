CREATE TABLE `autor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `autor` varchar(150) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`));

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`id`, `autor`, `imagen`, `estado`) VALUES
(1, 'ultima prueba', 'logo.png', 1),
(2, 'cambiar el nombre llll', '20210514132528.jpg', 1),
(3, 'popoiipippi', 'logo.png', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` text NOT NULL,
  `correo` varchar(100) NOT NULL,
  `foto` varchar(50) NOT NULL,
  PRIMARY KEY (`id`));

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `nombre`, `telefono`, `direccion`, `correo`, `foto`) VALUES
(1, 'Vida Informático', '925491523', 'Manta - Ecuador', 'bibliotecaOnline@gmail.com', 'logo.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`));

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `nombre`, `clave`, `estado`) VALUES
(1, 'admin', 'Angel sifuentes', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 1),
(2, 'angel', 'Vida Informatico', '519ba91a5a5b4afb9dc66f8805ce8c442b6576316c19c6896af2fa9bda6aff71', 1);


--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `tipo` int NOT NULL,
  PRIMARY KEY (`id`));

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `nombre`, `tipo`) VALUES
(1, 'Libros', 1),
(2, 'Autor', 2),
(3, 'Editorial', 3),
(4, 'Usuarios', 4),
(5, 'Configuracion', 5),
(6, 'Estudiantes', 6),
(7, 'Materias', 7),
(8, 'Reportes', 8),
(9, 'Prestamos', 9);

--
-- Estructura de tabla para la tabla `detalle_permisos`
--

CREATE TABLE `detalle_permisos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_permiso` int NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id`));
--
-- Volcado de datos para la tabla `detalle_permisos`
--

INSERT INTO `detalle_permisos` (`id`, `id_usuario`, `id_permiso`) VALUES
(5, 2, 1),
(6, 2, 2),
(7, 2, 3),
(8, 2, 5),
(9, 2, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editorial`
--

CREATE TABLE `editorial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `editorial` varchar(150) NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`));

--
-- Volcado de datos para la tabla `editorial`
--

INSERT INTO `editorial` (`id`, `editorial`, `estado`) VALUES
(1, 'Ninguna', 1),
(2, 'Toribio anyarin', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `carrera` varchar(255) NOT NULL,
  `direccion` text NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`));

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id`, `codigo`, `dni`, `nombre`, `carrera`, `direccion`, `telefono`, `estado`) VALUES
(1, '12345', '74589745', 'Angel sifuentes', 'Ingenieria de sistemas', 'Manta Ecuador', '925491523', 1),
(2, '465', '9779879', 'Prueba', 'Ingenieria', 'Manta', '987978456', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `materia` text NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`));

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`id`, `materia`, `estado`) VALUES
(1, 'Base de Datos', 1),
(2, 'Ingenieria de Software', 1),
(3, 'Algebra', 1),
(4, 'Matematica', 1);


--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` text NOT NULL,
  `cantidad` int NOT NULL,
  `id_autor` int NOT NULL,
  `id_editorial` int NOT NULL,
  `anio_edicion` date NOT NULL,
  `id_materia` int NOT NULL,
  `num_pagina` int NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  FOREIGN KEY (id_autor) REFERENCES autor (id),
  FOREIGN KEY (id_editorial) REFERENCES editorial (id),
  FOREIGN KEY (id_materia) REFERENCES materia (id));

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`id`, `titulo`, `cantidad`, `id_autor`, `id_editorial`, `anio_edicion`, `id_materia`, `num_pagina`, `descripcion`, `imagen`, `estado`) VALUES
(1, 'poiopioioiop', 50, 1, 1, '2021-05-08', 1, 1335, 'si', 'logo.png', 1),
(2, 'Javascript', 69, 1, 1, '2021-05-08', 2, 1478, 'Domina javascript', '20210514132615.jpg', 1),
(3, 'python para todos', 23, 1, 1, '2021-05-08', 1, 258, 'anaconda', 'logo.png', 1),
(4, 'ultima prueba', 23, 1, 1, '2021-05-14', 1, 569, '', '20210514132757.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int NOT NULL,
  `id_libro` int NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `fecha_devolucion` date NOT NULL,
  `cantidad` int NOT NULL,
  `observacion` text NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id`),
  FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id`));

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`id`, `id_estudiante`, `id_libro`, `fecha_prestamo`, `fecha_devolucion`, `cantidad`, `observacion`, `estado`) VALUES
(1, 1, 1, '2021-05-11', '2021-05-11', 5, '', 0),
(2, 1, 2, '2021-05-11', '2021-05-11', 15, '', 0);
-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-03-2025 a las 23:23:23
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `timbre`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuraciontimbre`
--

CREATE TABLE `configuraciontimbre` (
  `ConfigID` int(11) NOT NULL,
  `HorarioID` int(11) DEFAULT NULL,
  `EventoID` int(11) DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT 1,
  `FechaCreacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias_apagado`
--

CREATE TABLE `dias_apagado` (
  `Id_dia` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `desac_total` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dias_apagado`
--

INSERT INTO `dias_apagado` (`Id_dia`, `Fecha`, `hora_inicio`, `hora_fin`, `desac_total`) VALUES
(13, '2024-10-28', '00:00:00', '24:00:00', 0),
(14, '2024-10-28', '00:00:00', '24:00:00', 0),
(53, '2024-11-30', '10:10:00', '11:11:00', 0),
(61, '2024-11-29', '08:15:00', '10:20:00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `EventoID` int(11) NOT NULL,
  `NombreEvento` varchar(100) NOT NULL,
  `Fecha` date NOT NULL,
  `Horario` time NOT NULL,
  `duracion` int(11) NOT NULL,
  `Activo` tinyint(1) DEFAULT 0,
  `Descripcion` text DEFAULT NULL,
  `FechaCreacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`EventoID`, `NombreEvento`, `Fecha`, `Horario`, `duracion`, `Activo`, `Descripcion`, `FechaCreacion`) VALUES
(1, 'salida anticipada de CS', '0000-00-00', '21:35:00', 3, 1, 'salida anticipada de ciclo Superior por motivos escolares', '2024-11-26 15:06:54'),
(2, 'salida anticipada de CS', '0000-00-00', '21:35:00', 3, 1, 'salida anticipada de ciclo Superior por motivos escolares', '2024-11-26 15:08:24'),
(3, 'salida anticipada de CS', '0000-00-00', '20:45:00', 3, 1, 'salida anticipada de ciclo Superior por motivos escolares', '2024-11-26 15:09:24'),
(4, 'salida anticipada de todo el colegio', '0000-00-00', '20:20:00', 3, 1, '..', '2024-11-26 15:15:47'),
(5, 'salida anticipada de CSasda', '0000-00-00', '20:10:00', 12321, 1, 'asd', '2024-11-26 15:17:18'),
(6, 'salida anticipada de CSasdaasd', '2024-11-26', '21:29:00', 3, 1, '..', '2024-11-26 15:23:10'),
(7, 'adasadas', '2024-12-26', '19:30:00', 3, 1, '..', '2024-11-26 15:26:22'),
(8, 'salida anticipada de todo el colegio', '2024-11-26', '20:12:00', 2, 1, 'asd', '2024-11-26 15:30:27'),
(9, 'adasadasas12121', '2024-11-26', '12:12:00', 2, 0, 'asd', '2024-11-26 15:30:55'),
(10, 'salida anticipada de CS', '2024-11-27', '21:20:00', 2, 0, 'salida anticipada de ciclo Superior por motivos escolares', '2024-11-27 10:52:55'),
(11, 'timbre15', '2024-11-27', '20:35:00', 3, 0, '..', '2024-11-27 11:25:04'),
(12, 'asdad', '2024-02-14', '12:02:00', 2, 1, 'as', '2024-11-29 13:03:40'),
(13, 'tomar falopa', '2025-01-02', '17:00:00', 0, 1, '1', '0000-00-00 00:00:00'),
(14, 'tomar falopa', '2025-01-02', '10:10:00', 0, 1, 'tomar pasta base', '2025-03-19 18:55:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialtimbre`
--

CREATE TABLE `historialtimbre` (
  `HistorialID` int(11) NOT NULL,
  `HorarioID` int(11) DEFAULT NULL,
  `EventoID` int(11) DEFAULT NULL,
  `FechaAccion` datetime DEFAULT current_timestamp(),
  `TipoAccion` enum('Sonido','Modificacion') NOT NULL,
  `Descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `HorarioID` int(11) NOT NULL,
  `NombreHorario` varchar(50) NOT NULL,
  `HoraInicio` time NOT NULL,
  `Activo` tinyint(1) DEFAULT 1,
  `FechaCreacion` datetime DEFAULT current_timestamp(),
  `duracion` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `UsuarioID` int(11) NOT NULL,
  `NombreUsuario` varchar(50) NOT NULL,
  `Contrasena` varchar(255) NOT NULL,
  `FechaCreacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`UsuarioID`, `NombreUsuario`, `Contrasena`, `FechaCreacion`) VALUES
(1, 'root', '$2b$10$uzhvNHG6w70UrIh7QTwgzu46ejK8QRliXiCG97/eQeg67NmvQTLhq', '2024-11-23 16:09:52');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `configuraciontimbre`
--
ALTER TABLE `configuraciontimbre`
  ADD PRIMARY KEY (`ConfigID`),
  ADD KEY `HorarioID` (`HorarioID`),
  ADD KEY `EventoID` (`EventoID`);

--
-- Indices de la tabla `dias_apagado`
--
ALTER TABLE `dias_apagado`
  ADD PRIMARY KEY (`Id_dia`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`EventoID`);

--
-- Indices de la tabla `historialtimbre`
--
ALTER TABLE `historialtimbre`
  ADD PRIMARY KEY (`HistorialID`),
  ADD KEY `HorarioID` (`HorarioID`),
  ADD KEY `EventoID` (`EventoID`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`HorarioID`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`UsuarioID`),
  ADD UNIQUE KEY `NombreUsuario` (`NombreUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `configuraciontimbre`
--
ALTER TABLE `configuraciontimbre`
  MODIFY `ConfigID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dias_apagado`
--
ALTER TABLE `dias_apagado`
  MODIFY `Id_dia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `EventoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `historialtimbre`
--
ALTER TABLE `historialtimbre`
  MODIFY `HistorialID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `HorarioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `UsuarioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `configuraciontimbre`
--
ALTER TABLE `configuraciontimbre`
  ADD CONSTRAINT `configuraciontimbre_ibfk_1` FOREIGN KEY (`HorarioID`) REFERENCES `horarios` (`HorarioID`),
  ADD CONSTRAINT `configuraciontimbre_ibfk_2` FOREIGN KEY (`EventoID`) REFERENCES `eventos` (`EventoID`);

--
-- Filtros para la tabla `historialtimbre`
--
ALTER TABLE `historialtimbre`
  ADD CONSTRAINT `historialtimbre_ibfk_1` FOREIGN KEY (`HorarioID`) REFERENCES `horarios` (`HorarioID`),
  ADD CONSTRAINT `historialtimbre_ibfk_2` FOREIGN KEY (`EventoID`) REFERENCES `eventos` (`EventoID`);
COMMIT;

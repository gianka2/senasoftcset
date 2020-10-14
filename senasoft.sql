-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-10-2020 a las 17:50:37
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `senasoft`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `idDocumento` varchar(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `consecutivo` varchar(11) DEFAULT NULL,
  `modInventario` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_inventario` varchar(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `saldo_inicial` int(11) DEFAULT NULL,
  `entradas` int(11) DEFAULT NULL,
  `salidas` int(11) DEFAULT NULL,
  `stock_min` int(11) DEFAULT NULL,
  `saldo` int(11) DEFAULT NULL,
  `estado` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_inventario`
--

CREATE TABLE `movimiento_inventario` (
  `mi_numTransaccion` varchar(11) NOT NULL,
  `id_sucursal` varchar(11) NOT NULL,
  `mi_idInventario` varchar(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `valorUnitario` int(11) DEFAULT NULL,
  `subTotal` int(11) DEFAULT NULL,
  `iva` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_prefacturacion`
--

CREATE TABLE `movimiento_prefacturacion` (
  `mi_numTransaccion` varchar(11) NOT NULL,
  `mi_idInventario` varchar(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `valorUnitario` int(11) DEFAULT NULL,
  `subTotal` int(11) DEFAULT NULL,
  `iva` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pre_facturacion`
--

CREATE TABLE `pre_facturacion` (
  `num_transaccion` varchar(11) NOT NULL,
  `tran_idUsuario` varchar(11) NOT NULL,
  `tran_idDocumento` varchar(11) NOT NULL,
  `total_entradas` int(11) DEFAULT NULL,
  `total_salidas` int(11) DEFAULT NULL,
  `cliente` varchar(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` varchar(11) NOT NULL,
  `nombre_proveedor` varchar(50) DEFAULT NULL,
  `tel_proveedor` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` varchar(10) NOT NULL,
  `descripcion` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `id_sucursal` varchar(11) NOT NULL,
  `id_inventario` varchar(11) DEFAULT NULL,
  `nombre_sucursal` varchar(100) DEFAULT NULL,
  `dir_sucursal` varchar(50) DEFAULT NULL,
  `tel_sucursal` varchar(10) DEFAULT NULL,
  `cel_sucursal` varchar(10) DEFAULT NULL,
  `correo_sucursal` varchar(30) DEFAULT NULL,
  `estado_sucursal` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal_usuario`
--

CREATE TABLE `sucursal_usuario` (
  `id_sucursal` varchar(11) NOT NULL,
  `id_usuario` varchar(11) NOT NULL,
  `rol_usuario` varchar(5) DEFAULT NULL,
  `clave_usuario` varchar(15) DEFAULT NULL,
  `estado_usuario` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE `tienda` (
  `id_tienda` varchar(11) NOT NULL,
  `id_sucursal` varchar(11) NOT NULL,
  `id_proveedor` varchar(11) DEFAULT NULL,
  `nombre_tienda` varchar(100) DEFAULT NULL,
  `nombre_bd` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda_proveedor`
--

CREATE TABLE `tienda_proveedor` (
  `id_tienda` varchar(11) NOT NULL,
  `id_proveedor` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion_inventario`
--

CREATE TABLE `transaccion_inventario` (
  `num_transaccion` varchar(11) NOT NULL,
  `id_facturacion` varchar(11) DEFAULT NULL,
  `fecha_transaccion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` varchar(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `celular` varchar(10) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `estado` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`idDocumento`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_inventario`);

--
-- Indices de la tabla `movimiento_inventario`
--
ALTER TABLE `movimiento_inventario`
  ADD PRIMARY KEY (`mi_numTransaccion`,`id_sucursal`,`mi_idInventario`),
  ADD KEY `id_sucursal` (`id_sucursal`),
  ADD KEY `mi_idInventario` (`mi_idInventario`);

--
-- Indices de la tabla `movimiento_prefacturacion`
--
ALTER TABLE `movimiento_prefacturacion`
  ADD PRIMARY KEY (`mi_numTransaccion`,`mi_idInventario`),
  ADD KEY `mi_idInventario` (`mi_idInventario`);

--
-- Indices de la tabla `pre_facturacion`
--
ALTER TABLE `pre_facturacion`
  ADD PRIMARY KEY (`num_transaccion`,`tran_idUsuario`,`tran_idDocumento`),
  ADD KEY `tran_idUsuario` (`tran_idUsuario`),
  ADD KEY `tran_idDocumento` (`tran_idDocumento`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id_sucursal`),
  ADD KEY `id_inventario` (`id_inventario`);

--
-- Indices de la tabla `sucursal_usuario`
--
ALTER TABLE `sucursal_usuario`
  ADD PRIMARY KEY (`id_sucursal`,`id_usuario`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `rol_usuario` (`rol_usuario`);

--
-- Indices de la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`id_tienda`,`id_sucursal`),
  ADD KEY `id_sucursal` (`id_sucursal`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `tienda_proveedor`
--
ALTER TABLE `tienda_proveedor`
  ADD PRIMARY KEY (`id_tienda`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `transaccion_inventario`
--
ALTER TABLE `transaccion_inventario`
  ADD PRIMARY KEY (`num_transaccion`),
  ADD KEY `id_facturacion` (`id_facturacion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movimiento_inventario`
--
ALTER TABLE `movimiento_inventario`
  ADD CONSTRAINT `movimiento_inventario_ibfk_1` FOREIGN KEY (`mi_numTransaccion`) REFERENCES `transaccion_inventario` (`num_transaccion`),
  ADD CONSTRAINT `movimiento_inventario_ibfk_2` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`),
  ADD CONSTRAINT `movimiento_inventario_ibfk_3` FOREIGN KEY (`mi_idInventario`) REFERENCES `inventario` (`id_inventario`);

--
-- Filtros para la tabla `movimiento_prefacturacion`
--
ALTER TABLE `movimiento_prefacturacion`
  ADD CONSTRAINT `movimiento_prefacturacion_ibfk_1` FOREIGN KEY (`mi_numTransaccion`) REFERENCES `pre_facturacion` (`num_transaccion`),
  ADD CONSTRAINT `movimiento_prefacturacion_ibfk_2` FOREIGN KEY (`mi_idInventario`) REFERENCES `inventario` (`id_inventario`);

--
-- Filtros para la tabla `pre_facturacion`
--
ALTER TABLE `pre_facturacion`
  ADD CONSTRAINT `pre_facturacion_ibfk_1` FOREIGN KEY (`tran_idUsuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `pre_facturacion_ibfk_2` FOREIGN KEY (`tran_idDocumento`) REFERENCES `documento` (`idDocumento`);

--
-- Filtros para la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD CONSTRAINT `sucursal_ibfk_1` FOREIGN KEY (`id_inventario`) REFERENCES `inventario` (`id_inventario`);

--
-- Filtros para la tabla `sucursal_usuario`
--
ALTER TABLE `sucursal_usuario`
  ADD CONSTRAINT `sucursal_usuario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `sucursal_usuario_ibfk_2` FOREIGN KEY (`rol_usuario`) REFERENCES `rol` (`id_rol`);

--
-- Filtros para la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD CONSTRAINT `tienda_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`),
  ADD CONSTRAINT `tienda_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`);

--
-- Filtros para la tabla `tienda_proveedor`
--
ALTER TABLE `tienda_proveedor`
  ADD CONSTRAINT `tienda_proveedor_ibfk_1` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id_tienda`),
  ADD CONSTRAINT `tienda_proveedor_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`);

--
-- Filtros para la tabla `transaccion_inventario`
--
ALTER TABLE `transaccion_inventario`
  ADD CONSTRAINT `transaccion_inventario_ibfk_1` FOREIGN KEY (`id_facturacion`) REFERENCES `pre_facturacion` (`num_transaccion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

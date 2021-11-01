-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2021 a las 04:47:01
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pistachio`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_parametro` (`descripcion_` VARCHAR(150), `valor_` VARCHAR(150), `modificado_` VARCHAR(150), `id_parametro_` INTEGER)  begin
UPDATE tbl_parametro SET  descripcion=descripcion_, valor=valor_ , modificado_por=modificado_, fecha_modificacion=sysdate()  WHERE id_parametro= id_parametro_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_permiso_usuario` (IN `insertar_` INT, IN `Modificar_` INT, IN `Eliminar_` INT, IN `Visualizar_` INT, IN `usuario_` VARCHAR(150), IN `id_permiso_` INT)  BEGIN
UPDATE tbl_permisos SET   insertar=insertar_ , modificar=Modificar_, eliminar=Eliminar_, visualizar=Visualizar_ , modificado_por=usuario_, fecha_modificacion=sysdate()  WHERE id_permiso= id_permiso_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_pregunta` (IN `pregunta` VARCHAR(150), IN `estado` INT, IN `usuario` VARCHAR(100), IN `cod_pregunta` INT)  BEGIN
UPDATE `tbl_preguntas` SET `pregunta`=pregunta,`estado`=estado,`fecha_modificacion`=sysdate(), `modificado_por`=usuario WHERE id_pregunta=cod_pregunta;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_rol` (`Rol_` VARCHAR(150), `Descripcion_` VARCHAR(150), `Estado_` INTEGER, `Usuario_` VARCHAR(150), `Id_rol_` INTEGER)  begin
UPDATE tbl_roles SET   rol=Rol_, descripcion=Descripcion_, estado=Estado_, modificado_por=Usuario_ , fecha_modificacion=sysdate() WHERE id_rol= Id_rol_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_usuario` (IN `Usuario_` VARCHAR(150), IN `Id_rol_` INT, IN `Modificado_` VARCHAR(150), IN `Id_usuario_` INT, IN `Estado_` INT)  begin
UPDATE tbl_usuarios SET   id_rol=Id_rol_, usuario=Usuario_,    modificado_por=Modificado_ , fecha_modificacion=sysdate() ,estado=Estado_  WHERE id_usuario= Id_usuario_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminar_pregunta` (`preguntaname` VARCHAR(100))  BEGIN
DELETE FROM tbl_preguntas WHERE pregunta =preguntaname;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminar_rol` (IN `rol_` VARCHAR(150))  BEGIN
DELETE FROM tbl_roles WHERE rol = rol_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminar_usuario` (`usuario_` VARCHAR(150))  BEGIN
DELETE FROM tbl_usuarios WHERE usuario =usuario_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_permisos` (`id_rol_` INTEGER, `id_objeto_` INTEGER, `permiso_insertar_` INTEGER, `permiso_eliminar_` INTEGER, `permiso_actualizar_` INTEGER, `permiso_consultar_` INTEGER, `creado_por_` VARCHAR(150))  BEGIN
INSERT INTO  tbl_permisos(id_rol, id_objeto,permiso_insertar , permiso_eliminar, permiso_actualizar,permiso_consultar, creado_por, fecha_creacion)
VALUES (id_rol_, id_objeto_, permiso_insertar_ ,permiso_eliminar_ ,permiso_actualizar_,permiso_consultar_,Creado_por_, sysdate());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_pregunta` (`preguntav` VARCHAR(150), `estadov` INTEGER, `creado_porv` VARCHAR(200))  BEGIN
INSERT INTO  tbl_preguntas(pregunta,estado,creado_por,fecha_creacion)
VALUES (preguntav,estadov,creado_porv,sysdate());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_rol` (`n_rol` VARCHAR(150), `descripcionrol` VARCHAR(250), `estado_` INTEGER, `usuario_` VARCHAR(150))  BEGIN
INSERT INTO  tbl_roles(rol, descripcion, estado,creado_por, fecha_creacion)
VALUES (n_rol, descripcionrol, estado_ , usuario_,sysdate());
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_usuario` (`Id_persona_` BIGINT(16), `Id_rol_` INTEGER, `Usuario_` VARCHAR(150), `Contrasena_` VARCHAR(150), `creado_por_` VARCHAR(255))  BEGIN
INSERT INTO  tbl_usuarios(id_persona,  id_rol , usuario , pass , estado , creado_por,fecha_creacion)
VALUES (Id_persona_, Id_rol_, Usuario_ , Contrasena_, 2 , creado_por_, sysdate());




end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_insertar_permisos` (`Id_rol_` INTEGER, `Id_objeto_` INTEGER, `Insertar_` INTEGER, `Modificar_` INTEGER, `Eliminar_` INTEGER, `Visualizar_` INTEGER, `Creado_por_` VARCHAR(150))  BEGIN
INSERT INTO  tbl_permisos(id_rol, id_objeto, insertar , modificar, eliminar, visualizar,creado_por,fecha_creacion)
VALUES (Id_rol_, Id_objeto_, Insertar_ , Modificar_, Eliminar_, Visualizar_, Creado_por_,sysdate());
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_bitacora`
--

CREATE TABLE `tbl_bitacora` (
  `id_bitacora` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `id_objeto` bigint(20) NOT NULL,
  `accion` varchar(25) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_bitacora`
--

INSERT INTO `tbl_bitacora` (`id_bitacora`, `id_usuario`, `id_objeto`, `accion`, `descripcion`, `fecha`) VALUES
(1, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-10'),
(2, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-10'),
(3, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-10'),
(4, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-10'),
(5, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-10'),
(6, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-10'),
(7, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-10'),
(8, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-10'),
(9, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-10'),
(10, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-10'),
(11, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-10'),
(12, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-10'),
(13, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-10'),
(14, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-10'),
(15, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-10'),
(16, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-10'),
(17, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-10'),
(18, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-10'),
(19, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-10'),
(20, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-10'),
(21, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-10'),
(23, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-10'),
(24, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-10'),
(25, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-10'),
(26, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-10'),
(27, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-10'),
(28, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-11'),
(29, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-11'),
(30, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-11'),
(31, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-11'),
(32, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-11'),
(33, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-11'),
(34, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-11'),
(35, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-11'),
(36, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-11'),
(37, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-11'),
(38, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-11'),
(39, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-11'),
(40, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-11'),
(41, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-11'),
(42, 1, 1, 'INSERTO', 'LA PREGUNTA A', '2021-10-11'),
(43, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-11'),
(44, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-11'),
(45, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-11'),
(46, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-11'),
(47, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-11'),
(48, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-11'),
(49, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-11'),
(50, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-11'),
(51, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-11'),
(52, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-11'),
(53, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-11'),
(54, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-11'),
(55, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-11'),
(56, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-11'),
(57, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-11'),
(58, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-11'),
(59, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-11'),
(60, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-11'),
(61, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-11'),
(62, 1, 4, 'Ingreso', 'A Crear roles', '2021-10-11'),
(63, 1, 4, 'Ingreso', 'A Crear roles', '2021-10-11'),
(64, 1, 4, 'Ingreso', 'A Crear roles', '2021-10-11'),
(65, 1, 4, 'Ingreso', 'A Crear roles', '2021-10-11'),
(66, 1, 4, 'Ingreso', 'A Crear roles', '2021-10-11'),
(67, 1, 4, 'Ingreso', 'A Crear roles', '2021-10-11'),
(68, 1, 4, 'INSERTO', 'EL ROL USUARIO', '2021-10-11'),
(69, 1, 4, 'Ingreso', 'A Crear roles', '2021-10-11'),
(70, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-11'),
(71, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-11'),
(72, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-11'),
(73, 1, 1, 'INSERTO', 'LA PREGUNTA NOMBRE', '2021-10-11'),
(74, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-11'),
(75, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-11'),
(76, 1, 4, 'Ingreso', 'A Crear roles', '2021-10-11'),
(77, 1, 4, 'INSERTO', 'EL ROL VENDEDOR', '2021-10-11'),
(78, 1, 4, 'Ingreso', 'A Crear roles', '2021-10-11'),
(80, 1, 4, 'Ingreso', 'A Crear roles', '2021-10-11'),
(82, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-11'),
(83, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-11'),
(84, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-11'),
(85, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-11'),
(86, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-14'),
(87, 1, 4, 'Ingreso', 'A Crear roles', '2021-10-14'),
(89, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-14'),
(90, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-14'),
(91, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-14'),
(92, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-14'),
(93, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-14'),
(94, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-14'),
(95, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-14'),
(96, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-14'),
(97, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-14'),
(98, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-14'),
(99, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-14'),
(100, 1, 1, 'INSERTO', 'LA PREGUNTA NOMBRE TIO', '2021-10-14'),
(101, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-14'),
(102, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-14'),
(103, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-14'),
(104, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-14'),
(105, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-14'),
(106, 1, 1, 'INSERTO', 'LA PREGUNTA J', '2021-10-14'),
(107, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-14'),
(108, 1, 1, 'INSERTO', 'LA PREGUNTA HOLA', '2021-10-14'),
(109, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-14'),
(110, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-14'),
(111, 1, 1, 'INSERTO', 'LA PREGUNTA AAAB ', '2021-10-14'),
(112, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-14'),
(113, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-14'),
(114, 1, 1, 'INSERTO', 'LA PREGUNTA NJD', '2021-10-14'),
(115, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-14'),
(116, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-14'),
(117, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-14'),
(118, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-14'),
(119, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-14'),
(120, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-14'),
(121, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-15'),
(122, 1, 2, 'ELIMINO', 'LA PREGUNTA 1', '2021-10-15'),
(123, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-15'),
(124, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-15'),
(125, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-15'),
(126, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-15'),
(127, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-15'),
(128, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-15'),
(129, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-15'),
(130, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-15'),
(131, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-15'),
(132, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-15'),
(133, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-15'),
(134, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-15'),
(135, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-15'),
(136, 1, 5, 'ELIMINO', 'EL ROL   1', '2021-10-15'),
(137, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-15'),
(138, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-15'),
(139, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-15'),
(140, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-15'),
(141, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-15'),
(142, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-15'),
(143, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-15'),
(144, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-15'),
(145, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-15'),
(146, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-15'),
(147, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-15'),
(148, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-15'),
(149, 1, 1, 'INSERTO', 'LA PREGUNTA PRUEBA', '2021-10-15'),
(150, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-15'),
(151, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-15'),
(152, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-15'),
(153, 1, 2, 'ELIMINO', 'LA PREGUNTA ', '2021-10-15'),
(154, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-15'),
(155, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-17'),
(156, 1, 1, 'INSERTO', 'LA PREGUNTA UNO', '2021-10-17'),
(157, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(158, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(159, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(160, 1, 2, 'ELIMINO', 'LA PREGUNTA 1', '2021-10-17'),
(161, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(162, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(163, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(164, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(165, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(166, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(167, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(168, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(169, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(170, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-17'),
(171, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-17'),
(172, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-17'),
(173, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(174, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(175, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(176, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-17'),
(177, 1, 1, 'INSERTO', 'LA PREGUNTA ABC', '2021-10-17'),
(178, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(179, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(180, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(181, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-17'),
(182, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-17'),
(183, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-17'),
(184, 1, 1, 'INSERTO', 'LA PREGUNTA MARIA', '2021-10-17'),
(185, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(186, 1, 2, 'ELIMINO', 'LA PREGUNTA 1', '2021-10-17'),
(187, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(188, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(189, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(190, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-17'),
(191, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-17'),
(192, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-17'),
(193, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(194, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-17'),
(195, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-17'),
(196, 1, 1, 'INSERTO', 'LA PREGUNTA ABCD', '2021-10-17'),
(197, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(198, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(199, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(200, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(201, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(202, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(203, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(204, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(205, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(206, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(207, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(208, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(209, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(210, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(211, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(212, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(213, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(214, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(215, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(216, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(217, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(218, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(219, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(220, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(221, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(222, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(223, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(224, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(225, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(226, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(227, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(228, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(229, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(230, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(231, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(232, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(233, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(234, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(235, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(236, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(237, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(238, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(239, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(240, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(241, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(242, 1, 2, 'MODIFICO', 'LA PREGUNTAABCEF, Y SU ESTADOINACTIVADO', '2021-10-17'),
(243, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(244, 1, 2, 'ELIMINO', 'LA PREGUNTA 1', '2021-10-17'),
(245, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-17'),
(246, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-17'),
(247, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-17'),
(248, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(249, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(250, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-18'),
(251, 1, 2, 'ELIMINO', 'LA PREGUNTA 1', '2021-10-18'),
(252, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-18'),
(253, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(254, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-18'),
(255, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-18'),
(256, 1, 2, 'MODIFICO ', 'LA PREGUNTA JOSE, Y SU ESTADOINACTIVADO', '2021-10-18'),
(257, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-18'),
(258, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(259, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-18'),
(260, 1, 4, 'Ingreso', 'A Crear roles', '2021-10-18'),
(261, 1, 4, 'INSERTO', 'EL ROL PRUEBA', '2021-10-18'),
(262, 1, 4, 'INSERTO', 'EL ROL PRUEBAL', '2021-10-18'),
(263, 1, 4, 'Ingreso', 'A Crear roles', '2021-10-18'),
(264, 1, 4, 'INSERTO', 'EL ROL HOLA', '2021-10-18'),
(265, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-18'),
(266, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-18'),
(267, 1, 6, 'Modifico', ' HOLA por HOLAD, La descripción de el rol HOLAD ', '2021-10-18'),
(268, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-18'),
(269, 1, 5, 'ELIMINO ', 'EL ROL   1', '2021-10-18'),
(270, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-18'),
(271, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(272, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-18'),
(273, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-18'),
(274, 1, 4, 'Ingreso', 'A Crear roles', '2021-10-18'),
(275, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-18'),
(276, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(277, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-18'),
(278, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-18'),
(279, 1, 6, 'Modifico', ' PRUEBA por PRUEBAS, La descripción de el rol PRUEBAS ', '2021-10-18'),
(280, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-18'),
(281, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(282, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(283, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(284, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(285, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-18'),
(286, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-18'),
(287, 1, 5, 'Modifico', ' PRUEBAL por PRUEBAM, La descripción de el rol PRUEBAM ', '2021-10-18'),
(288, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-18'),
(289, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(290, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(291, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(292, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(293, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-18'),
(294, 1, 5, 'ELIMINO ', 'EL ROL   1', '2021-10-18'),
(295, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-18'),
(296, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(297, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(298, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-18'),
(299, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-18'),
(300, 1, 6, 'MODIFICO', 'LA DESCRIPCION CLAVE , CON EL VALOR9', '2021-10-18'),
(301, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-18'),
(302, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-18'),
(303, 1, 6, 'MODIFICO', 'LA DESCRIPCION CLAVE DEL USUARIO, CON EL VALOR9', '2021-10-18'),
(304, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-18'),
(305, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-18'),
(306, 1, 6, 'MODIFICO', 'LA DESCRIPCION CLAVE DEL USUARIO, CON EL VALOR9', '2021-10-18'),
(307, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-18'),
(308, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(309, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(310, 1, 9, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(311, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(312, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-18'),
(313, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(314, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-18'),
(315, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(316, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(317, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(318, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(319, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(320, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(321, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(322, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(323, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(324, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(325, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(326, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(327, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(328, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-18'),
(329, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-18'),
(330, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(331, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(332, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(333, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(334, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(335, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(336, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(337, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(338, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(339, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(340, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(341, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(342, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(343, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(344, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(345, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-18'),
(346, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(347, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(348, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(349, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(350, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(351, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(352, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(353, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(354, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(355, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(356, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(357, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(358, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(359, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(360, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(361, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(362, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(363, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(364, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(365, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(366, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(367, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-18'),
(368, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-18'),
(369, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-18'),
(370, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-18'),
(371, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-18'),
(372, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-18'),
(373, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-18'),
(374, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-18'),
(375, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-18'),
(376, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(377, 1, 4, 'Ingreso', 'A Crear roles', '2021-10-18'),
(378, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(379, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(380, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(381, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-18'),
(382, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-18'),
(383, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-18'),
(384, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-18'),
(385, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-18'),
(386, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-18'),
(387, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(388, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(389, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(390, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(391, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(392, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(393, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(394, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(395, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(396, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(397, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(398, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(399, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(400, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-18'),
(401, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(413, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(414, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(415, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(416, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(417, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(418, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(419, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(420, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(421, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(422, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(423, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(424, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-18'),
(425, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(426, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(427, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(428, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(429, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(430, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-18'),
(431, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(432, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-18'),
(433, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-18'),
(434, 1, 1, 'INSERTO', 'LA PREGUNTA COMIDA FAVORITA', '2021-10-18'),
(435, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-18'),
(436, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-18'),
(437, 1, 2, 'MODIFICO ', 'LA PREGUNTA NOMBRE MASCOTA, Y SU ESTADO ACTIVADO', '2021-10-18'),
(438, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-18'),
(439, 1, 2, 'ELIMINO', 'LA PREGUNTA 1', '2021-10-18'),
(440, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-18'),
(441, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-18'),
(442, 1, 1, 'INSERTO', 'LA PREGUNTA COLOR FAVORITO', '2021-10-18'),
(443, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-18'),
(444, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-18'),
(445, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-18'),
(446, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-18'),
(447, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-18'),
(448, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-18'),
(449, 1, 1, 'Ingreso', 'A Creacion de Preguntas', '2021-10-18'),
(450, 1, 4, 'Ingreso', 'A Crear roles', '2021-10-18'),
(451, 1, 4, 'Ingreso', 'A Crear roles', '2021-10-18'),
(452, 1, 4, 'INSERTO', 'EL ROL SUPERVISOR', '2021-10-18'),
(453, 1, 4, 'INSERTO', 'EL ROL CLIENTE', '2021-10-18'),
(454, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-18'),
(455, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-18'),
(456, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-18'),
(457, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-18'),
(458, 1, 5, 'MODIFICO ', ' EL ROL  POR CLIENTES, LA DESCRIPCION DE EL ROL CLIENTES, EL ESTADO DECLIENTES ', '2021-10-18'),
(459, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-18'),
(460, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-18'),
(461, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-18'),
(462, 1, 6, 'MODIFICO', 'LA DESCRIPCION CLAVE DEL USUARIOS, CON EL VALOR9', '2021-10-18'),
(463, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-18'),
(464, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-18'),
(465, 1, 7, 'INSERTO', 'EL PERMISO pregunta nueva', '2021-10-18'),
(466, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-18'),
(467, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(468, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(469, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(470, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-18'),
(471, 1, 7, 'INSERTO', 'EL PERMISO pregunta nueva', '2021-10-18'),
(472, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-18'),
(473, 1, 7, 'INSERTO', 'EL PERMISO pregunta nueva', '2021-10-18'),
(474, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-18'),
(475, 1, 7, 'INSERTO', 'EL PERMISO pregunta nueva', '2021-10-18'),
(476, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-18'),
(477, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(478, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(479, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(480, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(481, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(482, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-18'),
(483, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-18'),
(484, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-18'),
(485, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-18'),
(486, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-18'),
(487, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-18'),
(488, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-18'),
(489, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-18'),
(490, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-18'),
(491, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-23'),
(492, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-23'),
(493, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-23'),
(494, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-23'),
(495, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-23'),
(496, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-23'),
(497, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-23'),
(498, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-23'),
(499, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-23'),
(500, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-23'),
(501, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-23'),
(502, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-23'),
(503, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-23'),
(504, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-23'),
(505, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-23'),
(506, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-23'),
(507, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-26'),
(508, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-26'),
(509, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-26'),
(510, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-26'),
(511, 1, 7, 'INSERTO', 'EL PERMISO pregunta nueva', '2021-10-26'),
(512, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-26'),
(513, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(514, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-26'),
(515, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(516, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-26'),
(517, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(518, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(519, 1, 10, 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AACTIVO ', '2021-10-26'),
(520, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(521, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(522, 1, 10, 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AACTIVO ', '2021-10-26'),
(523, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(524, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(525, 1, 10, 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AACTIVO ', '2021-10-26'),
(526, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(527, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(528, 1, 10, 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AINACTIVO ', '2021-10-26'),
(529, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(530, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(531, 1, 10, 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AINACTIVO ', '2021-10-26'),
(532, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(533, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(534, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(535, 1, 8, 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AACTIVO ', '2021-10-26'),
(536, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(537, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(538, 1, 8, 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AACTIVO ', '2021-10-26'),
(539, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(540, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(541, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(542, 1, 8, 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AACTIVO ', '2021-10-26'),
(543, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(544, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-26'),
(545, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(546, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(547, 1, 8, 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AACTIVO ', '2021-10-26'),
(548, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(549, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-26'),
(550, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-26'),
(551, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-26'),
(552, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-26'),
(553, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-26'),
(554, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-26'),
(555, 1, 2, 'ELIMINO', 'LA PREGUNTA 1', '2021-10-26'),
(556, 1, 2, 'Ingreso', 'A Gestion de Preguntas', '2021-10-26'),
(557, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-26'),
(558, 1, 6, 'Ingreso', 'A Gestion de Parametros', '2021-10-26'),
(559, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(560, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-26'),
(561, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(562, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(563, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(564, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(565, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(566, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(567, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(568, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(569, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(570, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(571, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(572, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(573, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(574, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(575, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(576, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(577, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(578, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(579, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(580, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(581, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(582, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(583, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(584, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(585, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(586, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(587, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(588, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(589, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(590, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(591, 1, 4, 'Ingreso', 'A Crear roles', '2021-10-26'),
(592, 1, 4, 'INSERTO', 'EL ROL D', '2021-10-26'),
(593, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-26'),
(594, 1, 4, 'Ingreso', 'A Crear roles', '2021-10-26'),
(595, 1, 4, 'INSERTO', 'EL ROL A', '2021-10-26'),
(596, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-26'),
(597, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(598, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(599, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(600, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(601, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(602, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(603, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(604, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(605, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(606, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(607, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(608, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(609, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(610, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(611, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(612, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(613, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(614, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(615, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(616, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(617, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(618, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(619, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(620, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(621, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-26'),
(622, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(623, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(624, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(625, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(626, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(627, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(628, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(629, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(630, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(631, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(632, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(633, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(634, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(635, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(636, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(637, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(638, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(639, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(640, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(641, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(642, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(643, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(644, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(645, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(646, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(647, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(648, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(649, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(650, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(651, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(652, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(653, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(654, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(655, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(656, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(657, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(658, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(659, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(660, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(661, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(662, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(663, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(664, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(665, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(666, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(667, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(668, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(669, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(670, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(671, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(672, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(673, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(674, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(675, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(676, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(677, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(678, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(679, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(680, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(681, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(682, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(683, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(684, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(685, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(686, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(687, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(688, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(689, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(690, 1, 3, 'Ingreso', 'A Crear Usuarios', '2021-10-26'),
(691, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(692, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(693, 1, 10, 'ELIMINO', 'EL USUARIO  ', '2021-10-26'),
(694, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(695, 1, 10, 'ELIMINO', 'EL USUARIO  ', '2021-10-26'),
(696, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(697, 1, 10, 'ELIMINO', 'EL USUARIO  ', '2021-10-26'),
(698, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(699, 1, 10, 'ELIMINO', 'EL USUARIO  ', '2021-10-26'),
(700, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(701, 1, 10, 'ELIMINO', 'EL USUARIO  ', '2021-10-26'),
(702, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(703, 1, 10, 'ELIMINO', 'EL USUARIO  ', '2021-10-26'),
(704, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(705, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(706, 1, 10, 'ELIMINO', 'EL USUARIO  ', '2021-10-26'),
(707, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(708, 1, 10, 'ELIMINO', 'EL USUARIO  ', '2021-10-26'),
(709, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(710, 1, 10, 'ELIMINO', 'EL USUARIO  ', '2021-10-26'),
(711, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(712, 1, 10, 'ELIMINO', 'EL USUARIO  ', '2021-10-26'),
(713, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(714, 1, 10, 'ELIMINO', 'EL USUARIO  ', '2021-10-26'),
(715, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(716, 1, 10, 'ELIMINO', 'EL USUARIO  ', '2021-10-26'),
(717, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(718, 1, 10, 'ELIMINO', 'EL USUARIO  ', '2021-10-26'),
(719, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(720, 1, 10, 'ELIMINO', 'EL USUARIO  ', '2021-10-26'),
(721, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(722, 1, 10, 'ELIMINO', 'EL USUARIO  ', '2021-10-26'),
(723, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(724, 1, 10, 'ELIMINO', 'EL USUARIO  ', '2021-10-26'),
(725, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(726, 1, 10, 'ELIMINO', 'EL USUARIO  ', '2021-10-26'),
(727, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(728, 1, 10, 'ELIMINO', 'EL USUARIO  ', '2021-10-26'),
(729, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(730, 1, 10, 'ELIMINO', 'EL USUARIO  ', '2021-10-26'),
(731, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(732, 1, 10, 'ELIMINO', 'EL USUARIO  ', '2021-10-26'),
(733, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(734, 1, 10, 'ELIMINO', 'EL USUARIO  ', '2021-10-26'),
(735, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(736, 1, 10, 'ELIMINO', 'EL USUARIO  ', '2021-10-26'),
(737, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(738, 1, 10, 'ELIMINO', 'EL USUARIO  ', '2021-10-26'),
(739, 1, 10, 'Ingreso', 'A Gestion de Usuarios', '2021-10-26'),
(740, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-26'),
(741, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(742, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(743, 1, 8, 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AACTIVO ', '2021-10-26'),
(744, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(745, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-26'),
(746, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-26'),
(747, 1, 5, 'Ingreso', 'A Gestion de Roles', '2021-10-26'),
(748, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(749, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(750, 1, 8, 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AACTIVO ,EL ELIMINAR AACTIVO ,EL VISUALIZAR AACTIVO ', '2021-10-26'),
(751, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(752, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(753, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(754, 1, 8, 'MODIFICO', 'EL INSERTAR AINACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AACTIVO ', '2021-10-26'),
(755, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(756, 1, 4, 'Ingreso', 'A Crear roles', '2021-10-26'),
(757, 1, 4, 'Ingreso', 'A Crear roles', '2021-10-26'),
(758, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(759, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(760, 1, 8, 'MODIFICO', 'EL INSERTAR AINACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AINACTIVO ', '2021-10-26'),
(761, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(762, 1, 4, 'Ingreso', 'A Crear roles', '2021-10-26'),
(763, 1, 4, 'Ingreso', 'A Crear roles', '2021-10-26'),
(764, 1, 4, 'Ingreso', 'A Crear roles', '2021-10-26'),
(765, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(766, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(767, 1, 8, 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AACTIVO ,EL ELIMINAR AACTIVO ,EL VISUALIZAR AACTIVO ', '2021-10-26'),
(768, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(769, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(770, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-26'),
(771, 1, 7, 'INSERTO', 'EL PERMISO ver pedidos', '2021-10-26'),
(772, 1, 7, 'Ingreso', 'A Permisos a roles y pantallas', '2021-10-26'),
(773, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(774, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(775, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(776, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(777, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(778, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(779, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(780, 1, 11, 'Ingreso', 'A Creacion de Preguntas', '2021-10-26'),
(781, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-26'),
(782, 1, 11, 'Ingreso', 'A ver pedidos', '2021-10-26'),
(783, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-26'),
(784, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-26'),
(785, 1, 11, 'Ingreso', 'A ver pedidos', '2021-10-26'),
(786, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(787, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(788, 1, 8, 'MODIFICO', 'EL INSERTAR AINACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AINACTIVO ', '2021-10-26'),
(789, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(790, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(791, 1, 8, 'MODIFICO', 'EL INSERTAR AINACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AACTIVO ', '2021-10-26'),
(792, 1, 8, 'Ingreso', 'A Gestion de permisos usuarios', '2021-10-26'),
(793, 1, 11, 'Ingreso', 'A ver pedidos', '2021-10-26'),
(794, 1, 9, 'Ingreso', 'A Bitacora del sistema', '2021-10-26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_objetos`
--

CREATE TABLE `tbl_objetos` (
  `id_objeto` bigint(20) NOT NULL,
  `objeto` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_objetos`
--

INSERT INTO `tbl_objetos` (`id_objeto`, `objeto`, `descripcion`) VALUES
(1, 'pregunta nueva', 'modulo pregunta'),
(2, 'gestion pregunta', 'gestion pregunta'),
(3, 'resgistro usuarios', 'resgistro usuarios'),
(4, 'crear roles', 'crear roles'),
(5, 'gestion roles', 'gestion roles'),
(6, 'gestion parametros', 'gestion parametros'),
(7, 'crear permiso usuario', 'crear permiso usuario'),
(8, 'gestionar permiso usuario', 'gestionar permiso usuario'),
(9, 'bitacora', 'bitacora'),
(10, 'gestion usuarios', 'gestion usuarios'),
(11, 'ver pedidos', 'ver pedidos ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_parametro`
--

CREATE TABLE `tbl_parametro` (
  `id_parametro` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `parametro` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `valor` varchar(100) NOT NULL,
  `modificado_por` varchar(20) DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_parametro`
--

INSERT INTO `tbl_parametro` (`id_parametro`, `id_usuario`, `parametro`, `descripcion`, `valor`, `modificado_por`, `fecha_modificacion`) VALUES
(1, 1, 'tamaño de clave', 'CLAVE DEL USUARIOS', '9', ' .ADMIN.', '2021-10-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_permisos`
--

CREATE TABLE `tbl_permisos` (
  `id_permiso` bigint(20) NOT NULL,
  `id_rol` bigint(20) NOT NULL,
  `id_objeto` bigint(20) NOT NULL,
  `insertar` varchar(1) NOT NULL,
  `modificar` varchar(1) NOT NULL,
  `eliminar` varchar(1) NOT NULL,
  `visualizar` varchar(1) NOT NULL,
  `creado_por` varchar(20) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `modificado_por` varchar(20) DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_permisos`
--

INSERT INTO `tbl_permisos` (`id_permiso`, `id_rol`, `id_objeto`, `insertar`, `modificar`, `eliminar`, `visualizar`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`) VALUES
(1, 1, 1, '1', '1', '1', '1', 'maria', '2021-10-10', NULL, NULL),
(2, 1, 2, '1', '1', '1', '1', 'maria', '2021-10-10', NULL, NULL),
(3, 1, 3, '1', '1', '1', '1', 'maria', '2021-10-10', NULL, NULL),
(4, 1, 4, '1', '1', '1', '1', 'maria', '2021-10-10', 'ADMIN', '2021-10-26'),
(5, 1, 5, '1', '1', '1', '1', 'maria', '2021-10-10', 'ADMIN', '2021-10-26'),
(6, 1, 6, '1', '1', '1', '1', 'maria', '2021-10-10', NULL, NULL),
(7, 1, 7, '1', '1', '1', '1', 'maria', '2021-10-10', NULL, NULL),
(8, 1, 8, '1', '1', '1', '1', 'maria', '2021-10-10', NULL, NULL),
(9, 1, 9, '1', '1', '1', '1', 'maria', '2021-10-10', NULL, NULL),
(10, 1, 10, '1', '1', '1', '1', 'maria', '2021-10-10', NULL, NULL),
(11, 4, 1, '1', '0', '0', '0', ' ADMIN ', '2021-10-18', NULL, NULL),
(12, 3, 1, '1', '0', '0', '0', ' ADMIN ', '2021-10-18', NULL, NULL),
(13, 8, 1, '1', '0', '0', '1', ' ADMIN ', '2021-10-18', 'ADMIN', '2021-10-26'),
(15, 7, 1, '1', '0', '0', '0', ' ADMIN ', '2021-10-26', NULL, NULL),
(16, 1, 11, '0', '0', '0', '1', ' ADMIN ', '2021-10-26', 'ADMIN', '2021-10-26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_personas`
--

CREATE TABLE `tbl_personas` (
  `id_persona` bigint(20) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `identidad` varchar(25) NOT NULL,
  `estado_civil` varchar(20) NOT NULL,
  `genero` varchar(20) NOT NULL,
  `fecha_nacimieto` date NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `correo_electronico` varchar(50) DEFAULT NULL,
  `id_tipo_persona` bigint(20) NOT NULL,
  `creado_por` varchar(20) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `modificado_por` varchar(20) NOT NULL,
  `fecha_modificacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_personas`
--

INSERT INTO `tbl_personas` (`id_persona`, `nombres`, `apellidos`, `identidad`, `estado_civil`, `genero`, `fecha_nacimieto`, `telefono`, `direccion`, `correo_electronico`, `id_tipo_persona`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`) VALUES
(1, 'MARIA', 'COLINDRES', '123', 'SOLTERA', 'F', '2021-10-06', '85947581', 'TOROCAGUA', NULL, 1, 'ADMIN', '2021-10-08', 'ADMIN', '2021-10-08'),
(2, 'CARLOS', 'MAIRENA', '0801199812345', 'SOLTERO', 'M', '2021-10-18', '89756482', 'TOROCAGUA', 'carlos@gmail.com', 1, 'ADMIN', '2021-10-18', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_preguntas`
--

CREATE TABLE `tbl_preguntas` (
  `id_pregunta` bigint(20) NOT NULL,
  `pregunta` varchar(100) NOT NULL,
  `estado` bigint(20) NOT NULL,
  `creado_por` varchar(20) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `modificado_por` varchar(20) NOT NULL,
  `fecha_modificacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_preguntas`
--

INSERT INTO `tbl_preguntas` (`id_pregunta`, `pregunta`, `estado`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`) VALUES
(2, 'NOMBRE', 1, '', '2021-10-11', '', '0000-00-00'),
(4, 'NOMBRE MASCOTA', 1, 'ADMIN', '2021-10-14', 'ADMIN', '2021-10-18'),
(5, 'HOLA', 1, 'ADMIN', '2021-10-14', '', '0000-00-00'),
(8, 'PRUEBA', 1, 'ADMIN', '2021-10-15', '', '0000-00-00'),
(13, 'COMIDA FAVORITA', 1, 'ADMIN', '2021-10-18', '', '0000-00-00'),
(14, 'COLOR FAVORITO', 1, 'ADMIN', '2021-10-18', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pregutas_seguridad`
--

CREATE TABLE `tbl_pregutas_seguridad` (
  `id_pregunta_seguridad` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `id_pregunta` bigint(20) NOT NULL,
  `respuesta` varchar(100) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `creado_por` varchar(20) DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `modificado_por` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `id_rol` bigint(20) NOT NULL,
  `rol` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `creado_por` varchar(20) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `modificado_por` varchar(20) DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_roles`
--

INSERT INTO `tbl_roles` (`id_rol`, `rol`, `descripcion`, `estado`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`) VALUES
(1, 'administrador', 'ingresa a todo el sistema', '1', 'maria', '2021-10-08', 'maria', '2021-10-08'),
(3, 'VENDEDOR', 'VENDEDOR', '1', '', '2021-10-11', NULL, NULL),
(4, 'PRUEBAS', 'PRUEBAS', '1', 'ADMIN', '2021-10-18', 'ADMIN', '2021-10-18'),
(7, 'SUPERVISOR', 'SUPERVISOR', '1', 'ADMIN', '2021-10-18', NULL, NULL),
(8, 'CLIENTES', 'CLIENTES', '0', 'ADMIN', '2021-10-18', 'ADMIN', '2021-10-18'),
(9, 'D', 'D', '1', 'ADMIN', '2021-10-26', NULL, NULL),
(10, 'A', 'B', '1', 'ADMIN', '2021-10-26', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_persona`
--

CREATE TABLE `tbl_tipo_persona` (
  `id_tipo_persona` bigint(20) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `creado_por` varchar(20) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `modificado_por` varchar(20) NOT NULL,
  `fecha_modificacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_tipo_persona`
--

INSERT INTO `tbl_tipo_persona` (`id_tipo_persona`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`) VALUES
(1, 'juridica', 'maria', '2021-10-08', '', '0000-00-00'),
(2, 'rtgtr', 'ttt', '2021-10-08', 'tht', '2021-10-08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios`
--

CREATE TABLE `tbl_usuarios` (
  `id_usuario` bigint(20) NOT NULL,
  `id_persona` bigint(20) NOT NULL,
  `id_rol` bigint(20) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `estado` bigint(20) DEFAULT NULL,
  `ultima_conexion` date DEFAULT NULL,
  `intento` bigint(20) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `creado_por` varchar(20) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `modificado_por` varchar(20) DEFAULT NULL,
  `fecha_modifacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`id_usuario`, `id_persona`, `id_rol`, `usuario`, `pass`, `estado`, `ultima_conexion`, `intento`, `fecha_vencimiento`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modifacion`) VALUES
(1, 1, 1, 'ADMIN', '123', 1, '2021-10-08', 0, '2021-10-09', 'ADMIN', '2021-10-08', 'ADMIN', '2021-10-08');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  ADD PRIMARY KEY (`id_bitacora`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_objeto` (`id_objeto`);

--
-- Indices de la tabla `tbl_objetos`
--
ALTER TABLE `tbl_objetos`
  ADD PRIMARY KEY (`id_objeto`);

--
-- Indices de la tabla `tbl_parametro`
--
ALTER TABLE `tbl_parametro`
  ADD PRIMARY KEY (`id_parametro`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `tbl_permisos`
--
ALTER TABLE `tbl_permisos`
  ADD PRIMARY KEY (`id_permiso`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `id_objeto` (`id_objeto`);

--
-- Indices de la tabla `tbl_personas`
--
ALTER TABLE `tbl_personas`
  ADD PRIMARY KEY (`id_persona`),
  ADD KEY `id_tipo_persona` (`id_tipo_persona`);

--
-- Indices de la tabla `tbl_preguntas`
--
ALTER TABLE `tbl_preguntas`
  ADD PRIMARY KEY (`id_pregunta`);

--
-- Indices de la tabla `tbl_pregutas_seguridad`
--
ALTER TABLE `tbl_pregutas_seguridad`
  ADD PRIMARY KEY (`id_pregunta_seguridad`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_pregunta` (`id_pregunta`);

--
-- Indices de la tabla `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `tbl_tipo_persona`
--
ALTER TABLE `tbl_tipo_persona`
  ADD PRIMARY KEY (`id_tipo_persona`);

--
-- Indices de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_persona` (`id_persona`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  MODIFY `id_bitacora` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=795;

--
-- AUTO_INCREMENT de la tabla `tbl_objetos`
--
ALTER TABLE `tbl_objetos`
  MODIFY `id_objeto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tbl_parametro`
--
ALTER TABLE `tbl_parametro`
  MODIFY `id_parametro` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_permisos`
--
ALTER TABLE `tbl_permisos`
  MODIFY `id_permiso` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tbl_personas`
--
ALTER TABLE `tbl_personas`
  MODIFY `id_persona` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_preguntas`
--
ALTER TABLE `tbl_preguntas`
  MODIFY `id_pregunta` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tbl_pregutas_seguridad`
--
ALTER TABLE `tbl_pregutas_seguridad`
  MODIFY `id_pregunta_seguridad` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `id_rol` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_persona`
--
ALTER TABLE `tbl_tipo_persona`
  MODIFY `id_tipo_persona` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  MODIFY `id_usuario` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  ADD CONSTRAINT `tbl_bitacora_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_bitacora_ibfk_2` FOREIGN KEY (`id_objeto`) REFERENCES `tbl_objetos` (`id_objeto`);

--
-- Filtros para la tabla `tbl_parametro`
--
ALTER TABLE `tbl_parametro`
  ADD CONSTRAINT `tbl_parametro_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_permisos`
--
ALTER TABLE `tbl_permisos`
  ADD CONSTRAINT `tbl_permisos_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `tbl_roles` (`id_rol`),
  ADD CONSTRAINT `tbl_permisos_ibfk_2` FOREIGN KEY (`id_objeto`) REFERENCES `tbl_objetos` (`id_objeto`);

--
-- Filtros para la tabla `tbl_personas`
--
ALTER TABLE `tbl_personas`
  ADD CONSTRAINT `tbl_personas_ibfk_1` FOREIGN KEY (`id_tipo_persona`) REFERENCES `tbl_tipo_persona` (`id_tipo_persona`);

--
-- Filtros para la tabla `tbl_pregutas_seguridad`
--
ALTER TABLE `tbl_pregutas_seguridad`
  ADD CONSTRAINT `tbl_pregutas_seguridad_ibfk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `tbl_preguntas` (`id_pregunta`),
  ADD CONSTRAINT `tbl_pregutas_seguridad_ibfk_2` FOREIGN KEY (`id_pregunta_seguridad`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD CONSTRAINT `tbl_usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `tbl_roles` (`id_rol`),
  ADD CONSTRAINT `tbl_usuarios_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `tbl_personas` (`id_persona`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

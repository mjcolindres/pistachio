SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE IF NOT EXISTS pistacchio;

USE pistacchio;

DROP TABLE IF EXISTS tbl_bitacora;

CREATE TABLE `tbl_bitacora` (
  `id_bitacora` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_usuario` bigint(20) NOT NULL,
  `id_objeto` bigint(20) NOT NULL,
  `accion` varchar(25) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_bitacora`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_objeto` (`id_objeto`),
  CONSTRAINT `tbl_bitacora_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuarios` (`id_usuario`),
  CONSTRAINT `tbl_bitacora_ibfk_2` FOREIGN KEY (`id_objeto`) REFERENCES `tbl_objetos` (`id_objeto`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_bitacora VALUES("1","1","8","Ingreso","A Gestion de permisos usuarios","2021-10-10");
INSERT INTO tbl_bitacora VALUES("2","1","9","Ingreso","A Gestion de permisos usuarios","2021-10-10");
INSERT INTO tbl_bitacora VALUES("3","1","9","Ingreso","A Gestion de permisos usuarios","2021-10-10");
INSERT INTO tbl_bitacora VALUES("4","1","9","Ingreso","A Gestion de permisos usuarios","2021-10-10");
INSERT INTO tbl_bitacora VALUES("5","1","9","Ingreso","A Gestion de permisos usuarios","2021-10-10");
INSERT INTO tbl_bitacora VALUES("6","1","9","Ingreso","A Gestion de permisos usuarios","2021-10-10");
INSERT INTO tbl_bitacora VALUES("7","1","9","Ingreso","A Gestion de permisos usuarios","2021-10-10");
INSERT INTO tbl_bitacora VALUES("8","1","9","Ingreso","A Gestion de permisos usuarios","2021-10-10");
INSERT INTO tbl_bitacora VALUES("9","1","9","Ingreso","A Gestion de permisos usuarios","2021-10-10");
INSERT INTO tbl_bitacora VALUES("10","1","9","Ingreso","A Gestion de permisos usuarios","2021-10-10");
INSERT INTO tbl_bitacora VALUES("11","1","9","Ingreso","A Gestion de permisos usuarios","2021-10-10");
INSERT INTO tbl_bitacora VALUES("12","1","9","Ingreso","A Gestion de permisos usuarios","2021-10-10");
INSERT INTO tbl_bitacora VALUES("13","1","9","Ingreso","A Gestion de permisos usuarios","2021-10-10");
INSERT INTO tbl_bitacora VALUES("14","1","9","Ingreso","A Gestion de permisos usuarios","2021-10-10");
INSERT INTO tbl_bitacora VALUES("15","1","9","Ingreso","A Gestion de permisos usuarios","2021-10-10");
INSERT INTO tbl_bitacora VALUES("16","1","9","Ingreso","A Gestion de permisos usuarios","2021-10-10");
INSERT INTO tbl_bitacora VALUES("17","1","9","Ingreso","A Gestion de permisos usuarios","2021-10-10");
INSERT INTO tbl_bitacora VALUES("18","1","9","Ingreso","A Gestion de permisos usuarios","2021-10-10");
INSERT INTO tbl_bitacora VALUES("19","1","9","Ingreso","A Gestion de permisos usuarios","2021-10-10");
INSERT INTO tbl_bitacora VALUES("20","1","7","Ingreso","A Permisos a roles y pantallas","2021-10-10");
INSERT INTO tbl_bitacora VALUES("21","1","7","Ingreso","A Permisos a roles y pantallas","2021-10-10");
INSERT INTO tbl_bitacora VALUES("23","1","9","Ingreso","A Bitacora del sistema","2021-10-10");
INSERT INTO tbl_bitacora VALUES("24","1","9","Ingreso","A Bitacora del sistema","2021-10-10");
INSERT INTO tbl_bitacora VALUES("25","1","9","Ingreso","A Bitacora del sistema","2021-10-10");
INSERT INTO tbl_bitacora VALUES("26","1","9","Ingreso","A Bitacora del sistema","2021-10-10");
INSERT INTO tbl_bitacora VALUES("27","1","9","Ingreso","A Bitacora del sistema","2021-10-10");
INSERT INTO tbl_bitacora VALUES("28","1","1","Ingreso","A Creacion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("29","1","1","Ingreso","A Creacion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("30","1","1","Ingreso","A Creacion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("31","1","1","Ingreso","A Creacion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("32","1","1","Ingreso","A Creacion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("33","1","1","Ingreso","A Creacion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("34","1","1","Ingreso","A Creacion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("35","1","1","Ingreso","A Creacion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("36","1","1","Ingreso","A Creacion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("37","1","1","Ingreso","A Creacion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("38","1","1","Ingreso","A Creacion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("39","1","1","Ingreso","A Creacion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("40","1","1","Ingreso","A Creacion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("41","1","1","Ingreso","A Creacion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("42","1","1","INSERTO","LA PREGUNTA A","2021-10-11");
INSERT INTO tbl_bitacora VALUES("43","1","1","Ingreso","A Creacion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("44","1","9","Ingreso","A Bitacora del sistema","2021-10-11");
INSERT INTO tbl_bitacora VALUES("45","1","2","Ingreso","A Gestion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("46","1","2","Ingreso","A Gestion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("47","1","2","Ingreso","A Gestion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("48","1","2","Ingreso","A Gestion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("49","1","2","Ingreso","A Gestion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("50","1","2","Ingreso","A Gestion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("51","1","2","Ingreso","A Gestion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("52","1","6","Ingreso","A Gestion de Parametros","2021-10-11");
INSERT INTO tbl_bitacora VALUES("53","1","6","Ingreso","A Gestion de Parametros","2021-10-11");
INSERT INTO tbl_bitacora VALUES("54","1","6","Ingreso","A Gestion de Parametros","2021-10-11");
INSERT INTO tbl_bitacora VALUES("55","1","6","Ingreso","A Gestion de Parametros","2021-10-11");
INSERT INTO tbl_bitacora VALUES("56","1","6","Ingreso","A Gestion de Parametros","2021-10-11");
INSERT INTO tbl_bitacora VALUES("57","1","6","Ingreso","A Gestion de Parametros","2021-10-11");
INSERT INTO tbl_bitacora VALUES("58","1","6","Ingreso","A Gestion de Parametros","2021-10-11");
INSERT INTO tbl_bitacora VALUES("59","1","6","Ingreso","A Gestion de Parametros","2021-10-11");
INSERT INTO tbl_bitacora VALUES("60","1","6","Ingreso","A Gestion de Parametros","2021-10-11");
INSERT INTO tbl_bitacora VALUES("61","1","6","Ingreso","A Gestion de Parametros","2021-10-11");
INSERT INTO tbl_bitacora VALUES("62","1","4","Ingreso","A Crear roles","2021-10-11");
INSERT INTO tbl_bitacora VALUES("63","1","4","Ingreso","A Crear roles","2021-10-11");
INSERT INTO tbl_bitacora VALUES("64","1","4","Ingreso","A Crear roles","2021-10-11");
INSERT INTO tbl_bitacora VALUES("65","1","4","Ingreso","A Crear roles","2021-10-11");
INSERT INTO tbl_bitacora VALUES("66","1","4","Ingreso","A Crear roles","2021-10-11");
INSERT INTO tbl_bitacora VALUES("67","1","4","Ingreso","A Crear roles","2021-10-11");
INSERT INTO tbl_bitacora VALUES("68","1","4","INSERTO","EL ROL USUARIO","2021-10-11");
INSERT INTO tbl_bitacora VALUES("69","1","4","Ingreso","A Crear roles","2021-10-11");
INSERT INTO tbl_bitacora VALUES("70","1","5","Ingreso","A Gestion de Roles","2021-10-11");
INSERT INTO tbl_bitacora VALUES("71","1","5","Ingreso","A Gestion de Roles","2021-10-11");
INSERT INTO tbl_bitacora VALUES("72","1","1","Ingreso","A Creacion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("73","1","1","INSERTO","LA PREGUNTA NOMBRE","2021-10-11");
INSERT INTO tbl_bitacora VALUES("74","1","1","Ingreso","A Creacion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("75","1","2","Ingreso","A Gestion de Preguntas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("76","1","4","Ingreso","A Crear roles","2021-10-11");
INSERT INTO tbl_bitacora VALUES("77","1","4","INSERTO","EL ROL VENDEDOR","2021-10-11");
INSERT INTO tbl_bitacora VALUES("78","1","4","Ingreso","A Crear roles","2021-10-11");
INSERT INTO tbl_bitacora VALUES("80","1","4","Ingreso","A Crear roles","2021-10-11");
INSERT INTO tbl_bitacora VALUES("82","1","6","Ingreso","A Gestion de Parametros","2021-10-11");
INSERT INTO tbl_bitacora VALUES("83","1","7","Ingreso","A Permisos a roles y pantallas","2021-10-11");
INSERT INTO tbl_bitacora VALUES("84","1","9","Ingreso","A Gestion de permisos usuarios","2021-10-11");
INSERT INTO tbl_bitacora VALUES("85","1","9","Ingreso","A Bitacora del sistema","2021-10-11");
INSERT INTO tbl_bitacora VALUES("86","1","9","Ingreso","A Bitacora del sistema","2021-10-29");
INSERT INTO tbl_bitacora VALUES("87","1","9","Ingreso","A Bitacora del sistema","2021-10-29");



DROP TABLE IF EXISTS tbl_objetos;

CREATE TABLE `tbl_objetos` (
  `id_objeto` bigint(20) NOT NULL AUTO_INCREMENT,
  `objeto` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_objeto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_objetos VALUES("1","pregunta nueva","modulo pregunta");
INSERT INTO tbl_objetos VALUES("2","gestion pregunta","gestion pregunta");
INSERT INTO tbl_objetos VALUES("3","resgistro uusarios","resgistro uusarios");
INSERT INTO tbl_objetos VALUES("4","crear roles","crear roles");
INSERT INTO tbl_objetos VALUES("5","gestion roles","gestion roles");
INSERT INTO tbl_objetos VALUES("6","gestion parametros","gestion parametros");
INSERT INTO tbl_objetos VALUES("7","crear permiso usuario","crear permiso usuario");
INSERT INTO tbl_objetos VALUES("8","gestionar permiso usuario","gestionar permiso usuario");
INSERT INTO tbl_objetos VALUES("9","bitacora","bitacora");
INSERT INTO tbl_objetos VALUES("10","gestion usuarios","gestion usuarios");



DROP TABLE IF EXISTS tbl_parametro;

CREATE TABLE `tbl_parametro` (
  `id_parametro` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_usuario` bigint(20) NOT NULL,
  `parametro` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `valor` varchar(100) NOT NULL,
  `modificado_por` varchar(20) DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id_parametro`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `tbl_parametro_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_parametro VALUES("1","1","tamaño de clave","clave del usuario","8","","0000-00-00");



DROP TABLE IF EXISTS tbl_permisos;

CREATE TABLE `tbl_permisos` (
  `id_permiso` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_rol` bigint(20) NOT NULL,
  `id_objeto` bigint(20) NOT NULL,
  `permiso_insertar` varchar(1) NOT NULL,
  `permiso_eliminar` varchar(1) NOT NULL,
  `permiso_actualizar` varchar(1) NOT NULL,
  `permiso_consultar` varchar(1) NOT NULL,
  `creado_por` varchar(20) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `modificado_por` varchar(20) DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id_permiso`),
  KEY `id_rol` (`id_rol`),
  KEY `id_objeto` (`id_objeto`),
  CONSTRAINT `tbl_permisos_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `tbl_roles` (`id_rol`),
  CONSTRAINT `tbl_permisos_ibfk_2` FOREIGN KEY (`id_objeto`) REFERENCES `tbl_objetos` (`id_objeto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_permisos VALUES("1","1","1","1","1","1","1","maria","2021-10-10","","");
INSERT INTO tbl_permisos VALUES("2","1","2","1","1","1","1","maria","2021-10-10","","");
INSERT INTO tbl_permisos VALUES("3","1","3","1","1","1","1","maria","2021-10-10","","");
INSERT INTO tbl_permisos VALUES("4","1","4","1","1","1","1","maria","2021-10-10","","");
INSERT INTO tbl_permisos VALUES("5","1","5","1","1","1","1","maria","2021-10-10","","");
INSERT INTO tbl_permisos VALUES("6","1","6","1","1","1","1","maria","2021-10-10","","");
INSERT INTO tbl_permisos VALUES("7","1","7","1","1","1","1","maria","2021-10-10","","");
INSERT INTO tbl_permisos VALUES("8","1","8","1","1","1","1","maria","2021-10-10","","");
INSERT INTO tbl_permisos VALUES("9","1","9","1","1","1","1","maria","2021-10-10","","");
INSERT INTO tbl_permisos VALUES("10","1","10","1","1","1","1","maria","2021-10-10","","");



DROP TABLE IF EXISTS tbl_personas;

CREATE TABLE `tbl_personas` (
  `id_persona` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `identidad` varchar(25) NOT NULL,
  `estado_civil` varchar(20) NOT NULL,
  `genero` varchar(20) NOT NULL,
  `fecha_nacimieto` date NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `id_tipo_persona` bigint(20) NOT NULL,
  `creado_por` varchar(20) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `modificado_por` varchar(20) NOT NULL,
  `fecha_modificacion` date NOT NULL,
  `correo_electronico` varchar(50) NOT NULL,
  PRIMARY KEY (`id_persona`),
  KEY `id_tipo_persona` (`id_tipo_persona`),
  CONSTRAINT `tbl_personas_ibfk_1` FOREIGN KEY (`id_tipo_persona`) REFERENCES `tbl_tipo_persona` (`id_tipo_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_personas VALUES("1","maria","dff","123","soltera","f","2021-10-06","85947581","rg","1","maria","2021-10-08","maria","2021-10-08","");
INSERT INTO tbl_personas VALUES("2","hrththythrt","hrtytrh","315467897984","soltero","masculini","2021-10-03","33333333","efwefcefcewc","1","hola","2021-10-03","hola","2021-10-03","");
INSERT INTO tbl_personas VALUES("3","hrththythrt","hrtytrh","315467897984","soltero","masculini","2021-10-03","33333333","efwefcefcewc","1","hola","2021-10-03","hola","2021-10-03","");
INSERT INTO tbl_personas VALUES("4","gtrgtgtrvg","evtrgvettrv","6546798465161","s","m","2021-10-05","","b5g4tg45g45g","4","rtgrtgtrg","2021-10-01","tgtgrtgrtg","2021-10-01","hola@gmail.com");
INSERT INTO tbl_personas VALUES("5","gtrget","erttr","gergtt","ttgt","egrt","2021-10-01","222222222","dewxefxexfef","1","rtget","2021-10-05","tgergttre","2021-10-14","hola2@gmail.com");
INSERT INTO tbl_personas VALUES("6","gtrget","erttr","gergtt","ttgt","egrt","2021-10-01","222222222","dewxefxexfef","1","rtget","2021-10-05","tgergttre","2021-10-14","hola2@gmail.com");



DROP TABLE IF EXISTS tbl_preguntas;

CREATE TABLE `tbl_preguntas` (
  `id_pregunta` bigint(20) NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(100) NOT NULL,
  `estado` bigint(20) NOT NULL,
  `creado_por` varchar(20) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `modificado_por` varchar(20) NOT NULL,
  `fecha_modificacion` date NOT NULL,
  PRIMARY KEY (`id_pregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_preguntas VALUES("1","A","1","ADMIN","2021-10-11","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("2","NOMBRE","1","","2021-10-11","","0000-00-00");



DROP TABLE IF EXISTS tbl_pregutas_seguridad;

CREATE TABLE `tbl_pregutas_seguridad` (
  `id_pregunta_seguridad` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_usuario` bigint(20) NOT NULL,
  `id_pregunta` bigint(20) NOT NULL,
  `respuesta` varchar(100) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `creado_por` varchar(20) DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `modificado_por` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_pregunta_seguridad`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_pregunta` (`id_pregunta`),
  CONSTRAINT `tbl_pregutas_seguridad_ibfk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `tbl_preguntas` (`id_pregunta`),
  CONSTRAINT `tbl_pregutas_seguridad_ibfk_2` FOREIGN KEY (`id_pregunta_seguridad`) REFERENCES `tbl_usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS tbl_roles;

CREATE TABLE `tbl_roles` (
  `id_rol` bigint(20) NOT NULL AUTO_INCREMENT,
  `rol` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `creado_por` varchar(20) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `modificado_por` varchar(20) DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_roles VALUES("1","administrador","ingresa a todo el sistema","1","maria","2021-10-08","maria","2021-10-08");
INSERT INTO tbl_roles VALUES("2","USUARIO","USUARIO","1","ADMIN","2021-10-11","","");
INSERT INTO tbl_roles VALUES("3","VENDEDOR","VENDEDOR","1","","2021-10-11","","");



DROP TABLE IF EXISTS tbl_tipo_persona;

CREATE TABLE `tbl_tipo_persona` (
  `id_tipo_persona` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `creado_por` varchar(20) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `modificado_por` varchar(20) NOT NULL,
  `fecha_modificacion` date NOT NULL,
  PRIMARY KEY (`id_tipo_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_tipo_persona VALUES("1","juridica","maria","2021-10-08","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("2","rtgtr","ttt","2021-10-08","tht","2021-10-08");
INSERT INTO tbl_tipo_persona VALUES("3","ADMINISTRADOR","","2021-10-31","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("4","ADMINISTRADOR","","2021-10-31","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("5","ADMINISTRADOR","","2021-10-31","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("6","ADMINISTRADOR","","2021-10-31","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("7","CLIENTE","","2021-10-29","","0000-00-00");



DROP TABLE IF EXISTS tbl_usuarios;

CREATE TABLE `tbl_usuarios` (
  `id_usuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_persona` bigint(20) NOT NULL,
  `id_rol` bigint(20) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `intentos` bigint(20) DEFAULT NULL,
  `ultima_conexion` date DEFAULT NULL,
  `estado` bigint(20) DEFAULT NULL,
  `primer_ingreso` bigint(20) DEFAULT NULL,
  `preguntas_contestadas` bigint(20) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `creado_por` varchar(20) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `modificado_por` varchar(20) DEFAULT NULL,
  `fecha_modifacion` date DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_persona` (`id_persona`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `tbl_usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `tbl_roles` (`id_rol`),
  CONSTRAINT `tbl_usuarios_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `tbl_personas` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_usuarios VALUES("1","1","1","ADMIN","123456789","0","2021-10-29","1","3","2","2021-10-16","maria@gamil.com","maria","2021-10-08","maria","2021-10-08");
INSERT INTO tbl_usuarios VALUES("2","1","2","DAVIDIM","123456789","0","2021-10-29","1","0","","2021-12-31","fernandoizaguirrehn7@gmail.com","FER","2021-10-29","FER","2021-10-29");



SET FOREIGN_KEY_CHECKS=1;
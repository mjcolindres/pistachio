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
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO tbl_bitacora VALUES("88","1","9","Ingreso","A Bitacora del sistema","2021-10-29");
INSERT INTO tbl_bitacora VALUES("89","1","3","Ingreso","A Crear Usuarios","2021-10-31");
INSERT INTO tbl_bitacora VALUES("90","1","3","Ingreso","A Crear Usuarios","2021-10-31");
INSERT INTO tbl_bitacora VALUES("91","1","3","Ingreso","A Crear Usuarios","2021-10-31");
INSERT INTO tbl_bitacora VALUES("92","1","3","Ingreso","A Crear Usuarios","2021-10-31");
INSERT INTO tbl_bitacora VALUES("93","1","6","Ingreso","A Gestion de Parametros","2021-10-31");
INSERT INTO tbl_bitacora VALUES("94","1","6","Ingreso","A Gestion de Parametros","2021-10-31");
INSERT INTO tbl_bitacora VALUES("95","1","6","Ingreso","A Gestion de Parametros","2021-10-31");
INSERT INTO tbl_bitacora VALUES("96","1","6","Ingreso","A Gestion de Parametros","2021-10-31");
INSERT INTO tbl_bitacora VALUES("97","1","6","Ingreso","A Gestion de Parametros","2021-10-31");
INSERT INTO tbl_bitacora VALUES("98","1","6","Ingreso","A Gestion de Parametros","2021-10-31");
INSERT INTO tbl_bitacora VALUES("99","1","6","Ingreso","A Gestion de Parametros","2021-10-31");
INSERT INTO tbl_bitacora VALUES("100","1","6","Ingreso","A Gestion de Parametros","2021-10-31");
INSERT INTO tbl_bitacora VALUES("101","1","6","Ingreso","A Gestion de Parametros","2021-10-31");
INSERT INTO tbl_bitacora VALUES("102","1","6","Ingreso","A Gestion de Parametros","2021-10-31");
INSERT INTO tbl_bitacora VALUES("103","1","6","Ingreso","A Gestion de Parametros","2021-10-31");
INSERT INTO tbl_bitacora VALUES("104","1","6","Ingreso","A Gestion de Parametros","2021-10-31");
INSERT INTO tbl_bitacora VALUES("105","1","9","Ingreso","A Bitacora del sistema","2021-10-31");
INSERT INTO tbl_bitacora VALUES("106","1","9","Ingreso","A Bitacora del sistema","2021-10-31");
INSERT INTO tbl_bitacora VALUES("107","1","6","Ingreso","A Gestion de Parametros","2021-11-01");
INSERT INTO tbl_bitacora VALUES("108","1","6","Ingreso","A Gestion de Parametros","2021-11-01");
INSERT INTO tbl_bitacora VALUES("109","1","6","Ingreso","A Gestion de Parametros","2021-11-01");
INSERT INTO tbl_bitacora VALUES("110","1","6","Ingreso","A Gestion de Parametros","2021-11-01");
INSERT INTO tbl_bitacora VALUES("111","1","6","Ingreso","A Gestion de Parametros","2021-11-01");
INSERT INTO tbl_bitacora VALUES("112","1","6","Ingreso","A Gestion de Parametros","2021-11-01");
INSERT INTO tbl_bitacora VALUES("113","1","6","Ingreso","A Gestion de Parametros","2021-11-01");
INSERT INTO tbl_bitacora VALUES("114","1","6","Ingreso","A Gestion de Parametros","2021-11-01");
INSERT INTO tbl_bitacora VALUES("115","1","6","Ingreso","A Gestion de Parametros","2021-11-01");
INSERT INTO tbl_bitacora VALUES("116","1","6","Ingreso","A Gestion de Parametros","2021-11-01");
INSERT INTO tbl_bitacora VALUES("117","1","6","Ingreso","A Gestion de Parametros","2021-11-01");
INSERT INTO tbl_bitacora VALUES("118","1","6","Ingreso","A Gestion de Parametros","2021-11-01");



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

INSERT INTO tbl_permisos VALUES("1","1","1","1","1","1","1","maria","2021-10-10","","0000-00-00");
INSERT INTO tbl_permisos VALUES("2","1","2","1","1","1","1","maria","2021-10-10","","0000-00-00");
INSERT INTO tbl_permisos VALUES("3","1","3","1","1","1","1","maria","2021-10-10","","0000-00-00");
INSERT INTO tbl_permisos VALUES("4","1","4","1","1","1","1","maria","2021-10-10","","0000-00-00");
INSERT INTO tbl_permisos VALUES("5","1","5","1","1","1","1","maria","2021-10-10","","0000-00-00");
INSERT INTO tbl_permisos VALUES("6","1","6","1","1","1","1","maria","2021-10-10","","0000-00-00");
INSERT INTO tbl_permisos VALUES("7","1","7","1","1","1","1","maria","2021-10-10","","0000-00-00");
INSERT INTO tbl_permisos VALUES("8","1","8","1","1","1","1","maria","2021-10-10","","0000-00-00");
INSERT INTO tbl_permisos VALUES("9","1","9","1","1","1","1","maria","2021-10-10","","0000-00-00");
INSERT INTO tbl_permisos VALUES("10","1","10","1","1","1","1","maria","2021-10-10","","0000-00-00");



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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_personas VALUES("1","maria","dff","123","soltera","f","2021-10-06","85947581","rg","1","maria","2021-10-08","maria","2021-10-08","");
INSERT INTO tbl_personas VALUES("2","hrththythrt","hrtytrh","315467897984","soltero","masculini","2021-10-03","33333333","efwefcefcewc","1","hola","2021-10-03","hola","2021-10-03","");
INSERT INTO tbl_personas VALUES("3","hrththythrt","hrtytrh","315467897984","soltero","masculini","2021-10-03","33333333","efwefcefcewc","1","hola","2021-10-03","hola","2021-10-03","");
INSERT INTO tbl_personas VALUES("4","gtrgtgtrvg","evtrgvettrv","6546798465161","s","m","2021-10-05","","b5g4tg45g45g","4","rtgrtgtrg","2021-10-01","tgtgrtgrtg","2021-10-01","hola@gmail.com");
INSERT INTO tbl_personas VALUES("5","gtrget","erttr","gergtt","ttgt","egrt","2021-10-01","222222222","dewxefxexfef","1","rtget","2021-10-05","tgergttre","2021-10-14","hola2@gmail.com");
INSERT INTO tbl_personas VALUES("6","gtrget","erttr","gergtt","ttgt","egrt","2021-10-01","222222222","dewxefxexfef","1","rtget","2021-10-05","tgergttre","2021-10-14","hola2@gmail.com");
INSERT INTO tbl_personas VALUES("7","","","","","","0000-00-00","","","25","","0000-00-00","","0000-00-00","");
INSERT INTO tbl_personas VALUES("8","","","","","","0000-00-00","","","26","","0000-00-00","","0000-00-00","");
INSERT INTO tbl_personas VALUES("9","","","","","","0000-00-00","","","27","","0000-00-00","","0000-00-00","");
INSERT INTO tbl_personas VALUES("10","dasdasdas","jkh","lkh","CASADO / A","FEMENINO","2021-01-01","654654","lkjljlj","29","","0000-00-00","","0000-00-00","kljlkjlk");
INSERT INTO tbl_personas VALUES("11","","","","","","0000-00-00","","","30","","0000-00-00","","0000-00-00","");
INSERT INTO tbl_personas VALUES("12","","","","","","0000-00-00","","","31","","0000-00-00","","0000-00-00","");
INSERT INTO tbl_personas VALUES("13","HLKJHLKJHLKJ","HLKJHLKJH","321654987","CASADO / A","MASCULINO","2021-12-31","654654654","HGJFJGJHFJHG","32","","0000-00-00","","0000-00-00","hola@hola.com");



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
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_roles VALUES("1","ADMINISTRADOR","ingresa a todo el sistema","1","maria","2021-10-08","maria","2021-10-08");
INSERT INTO tbl_roles VALUES("2","USUARIO","USUARIO","1","ADMIN","2021-10-11","","0000-00-00");
INSERT INTO tbl_roles VALUES("3","CLIENTE","CLIENTE","1","","2021-10-11","","0000-00-00");
INSERT INTO tbl_roles VALUES("4","","","","","2021-10-30","","");
INSERT INTO tbl_roles VALUES("5","","","","","2021-11-06","","");
INSERT INTO tbl_roles VALUES("6","","","","","2021-11-06","","");
INSERT INTO tbl_roles VALUES("7","","","","","2021-11-06","","");
INSERT INTO tbl_roles VALUES("8","CLIENTE","","","","2021-11-06","","");
INSERT INTO tbl_roles VALUES("9","CLIENTE","","","","2021-11-06","","");
INSERT INTO tbl_roles VALUES("10","CLIENTE","","","","2021-11-06","","");
INSERT INTO tbl_roles VALUES("11","CLIENTE","","","","2021-11-06","","");
INSERT INTO tbl_roles VALUES("12","CLIENTE","","","","2021-11-06","","");
INSERT INTO tbl_roles VALUES("13","CLIENTE","","","","2021-11-06","","");
INSERT INTO tbl_roles VALUES("14","CLIENTE","","","","2021-11-06","","");
INSERT INTO tbl_roles VALUES("15","CLIENTE","","","","2021-11-06","","");
INSERT INTO tbl_roles VALUES("16","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("17","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("18","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("19","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("20","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("21","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("22","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("23","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("24","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("25","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("26","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("27","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("28","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("29","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("30","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("31","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("32","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("33","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("34","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("35","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("36","ADMINISTRADOR","","","","2022-02-02","","");
INSERT INTO tbl_roles VALUES("37","ADMINISTRADOR","","","","2022-02-02","","");
INSERT INTO tbl_roles VALUES("38","ADMINISTRADOR","","","","2022-02-02","","");
INSERT INTO tbl_roles VALUES("39","ADMINISTRADOR","","","","2022-02-02","","");
INSERT INTO tbl_roles VALUES("40","ADMINISTRADOR","","","","2022-02-02","","");
INSERT INTO tbl_roles VALUES("41","ADMINISTRADOR","","","","2022-02-02","","");
INSERT INTO tbl_roles VALUES("42","ADMINISTRADOR","","","","2022-02-02","","");
INSERT INTO tbl_roles VALUES("43","USUARIO","","","","2022-03-02","","");
INSERT INTO tbl_roles VALUES("44","USUARIO","","","","2022-03-02","","");
INSERT INTO tbl_roles VALUES("45","USUARIO","","","","2022-03-02","","");
INSERT INTO tbl_roles VALUES("46","ADMINISTRADOR","","","","2020-10-29","","");
INSERT INTO tbl_roles VALUES("47","ADMINISTRADOR","","","","2020-10-29","","");
INSERT INTO tbl_roles VALUES("48","USUARIO","","","","2021-10-30","","");
INSERT INTO tbl_roles VALUES("49","USUARIO","","","","2021-10-30","","");
INSERT INTO tbl_roles VALUES("50","USUARIO","","","","2021-10-30","","");
INSERT INTO tbl_roles VALUES("51","USUARIO","","","","2021-10-30","","");
INSERT INTO tbl_roles VALUES("52","USUARIO","","","","2021-10-30","","");
INSERT INTO tbl_roles VALUES("53","USUARIO","","","","2021-10-30","","");
INSERT INTO tbl_roles VALUES("54","USUARIO","","","","2021-10-30","","");
INSERT INTO tbl_roles VALUES("55","USUARIO","","","","2021-10-30","","");
INSERT INTO tbl_roles VALUES("56","USUARIO","","","","2021-10-30","","");
INSERT INTO tbl_roles VALUES("57","USUARIO","","","","2021-10-30","","");
INSERT INTO tbl_roles VALUES("58","USUARIO","","","","2021-10-30","","");
INSERT INTO tbl_roles VALUES("59","USUARIO","","","","2021-10-30","","");
INSERT INTO tbl_roles VALUES("60","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("61","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("62","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("63","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("64","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("65","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("66","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("67","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("68","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("69","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("70","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("71","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("72","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("73","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("74","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("75","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("76","USUARIO","","","","2020-11-28","","");
INSERT INTO tbl_roles VALUES("77","USUARIO","","","","2020-11-28","","");
INSERT INTO tbl_roles VALUES("78","USUARIO","","","","2020-11-28","","");
INSERT INTO tbl_roles VALUES("79","USUARIO","","","","2020-11-28","","");
INSERT INTO tbl_roles VALUES("80","USUARIO","","","","2020-11-28","","");
INSERT INTO tbl_roles VALUES("81","ADMINISTRADOR","","","","2020-10-30","","");
INSERT INTO tbl_roles VALUES("82","ADMINISTRADOR","","","","2020-10-30","","");
INSERT INTO tbl_roles VALUES("83","ADMINISTRADOR","","","","2020-10-30","","");
INSERT INTO tbl_roles VALUES("84","ADMINISTRADOR","","","","2020-10-30","","");
INSERT INTO tbl_roles VALUES("85","ADMINISTRADOR","","","","2020-10-30","","");
INSERT INTO tbl_roles VALUES("86","ADMINISTRADOR","","","","2020-10-30","","");
INSERT INTO tbl_roles VALUES("87","CLIENTE","","","","2020-11-29","","");
INSERT INTO tbl_roles VALUES("88","CLIENTE","","","","2020-11-29","","");
INSERT INTO tbl_roles VALUES("89","CLIENTE","","","","2020-11-29","","");
INSERT INTO tbl_roles VALUES("90","CLIENTE","","","","2020-11-29","","");
INSERT INTO tbl_roles VALUES("91","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("92","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("93","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("94","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("95","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("96","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("97","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("98","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("99","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("100","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("101","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("102","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("103","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("104","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("105","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("106","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("107","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("108","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("109","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("110","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("111","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("112","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("113","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("114","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("115","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("116","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("117","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("118","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("119","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("120","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("121","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("122","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("123","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("124","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("125","USUARIO","","","","2021-11-29","","");
INSERT INTO tbl_roles VALUES("126","USUARIO","","","","2022-03-02","","");
INSERT INTO tbl_roles VALUES("127","USUARIO","","","","2022-03-02","","");
INSERT INTO tbl_roles VALUES("128","USUARIO","","","","2022-03-02","","");
INSERT INTO tbl_roles VALUES("129","USUARIO","","","","2022-03-02","","");
INSERT INTO tbl_roles VALUES("130","USUARIO","","","","2022-03-02","","");
INSERT INTO tbl_roles VALUES("131","USUARIO","","","","2022-03-02","","");
INSERT INTO tbl_roles VALUES("132","USUARIO","","","","2022-03-02","","");
INSERT INTO tbl_roles VALUES("133","USUARIO","","","","2022-03-02","","");
INSERT INTO tbl_roles VALUES("134","USUARIO","","","","2022-03-02","","");
INSERT INTO tbl_roles VALUES("135","USUARIO","","","","2022-03-02","","");
INSERT INTO tbl_roles VALUES("136","USUARIO","","","","2022-03-02","","");
INSERT INTO tbl_roles VALUES("137","USUARIO","","","","2022-03-02","","");
INSERT INTO tbl_roles VALUES("138","USUARIO","","","","2022-03-02","","");
INSERT INTO tbl_roles VALUES("139","USUARIO","","","","2022-03-02","","");
INSERT INTO tbl_roles VALUES("140","USUARIO","","","","2022-03-02","","");
INSERT INTO tbl_roles VALUES("141","USUARIO","","","","2022-03-02","","");
INSERT INTO tbl_roles VALUES("142","ADMINISTRADOR","","","","2019-11-29","","");
INSERT INTO tbl_roles VALUES("143","ADMINISTRADOR","","","","2019-11-29","","");
INSERT INTO tbl_roles VALUES("144","ADMINISTRADOR","","","","2019-11-29","","");
INSERT INTO tbl_roles VALUES("145","ADMINISTRADOR","","","","2019-11-29","","");
INSERT INTO tbl_roles VALUES("146","ADMINISTRADOR","","","","2019-11-29","","");
INSERT INTO tbl_roles VALUES("147","ADMINISTRADOR","","","","2019-11-29","","");
INSERT INTO tbl_roles VALUES("148","ADMINISTRADOR","","","","2019-11-29","","");
INSERT INTO tbl_roles VALUES("149","ADMINISTRADOR","","","","2019-11-29","","");
INSERT INTO tbl_roles VALUES("150","ADMINISTRADOR","","","","2019-11-29","","");
INSERT INTO tbl_roles VALUES("151","ADMINISTRADOR","","","","2019-11-29","","");
INSERT INTO tbl_roles VALUES("152","ADMINISTRADOR","","","","2019-11-29","","");
INSERT INTO tbl_roles VALUES("153","USUARIO","","","","2020-11-30","","");
INSERT INTO tbl_roles VALUES("154","USUARIO","","","","2020-11-30","","");
INSERT INTO tbl_roles VALUES("155","USUARIO","","","","2020-11-30","","");
INSERT INTO tbl_roles VALUES("156","USUARIO","","","","2020-11-30","","");
INSERT INTO tbl_roles VALUES("157","USUARIO","","","","2020-11-30","","");
INSERT INTO tbl_roles VALUES("158","USUARIO","","","","2020-11-30","","");
INSERT INTO tbl_roles VALUES("159","USUARIO","","","","2020-11-30","","");
INSERT INTO tbl_roles VALUES("160","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("161","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("162","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("163","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("164","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("165","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("166","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("167","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("168","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("169","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("170","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("171","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("172","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("173","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("174","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("175","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("176","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("177","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("178","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("179","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("180","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("181","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("182","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("183","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("184","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("185","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("186","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("187","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("188","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("189","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("190","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("191","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("192","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("193","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("194","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("195","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("196","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("197","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("198","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("199","","","","","0000-00-00","","");
INSERT INTO tbl_roles VALUES("200","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("201","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("202","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("203","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("204","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("205","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("206","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("207","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("208","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("209","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("210","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("211","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("212","ADMINISTRADOR","","","","2021-12-31","","");
INSERT INTO tbl_roles VALUES("213","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("214","ADMINISTRADOR","","","","2019-10-29","","");
INSERT INTO tbl_roles VALUES("215","ADMINISTRADOR","","","","2019-10-29","","");



DROP TABLE IF EXISTS tbl_tipo_persona;

CREATE TABLE `tbl_tipo_persona` (
  `id_tipo_persona` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `creado_por` varchar(20) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `modificado_por` varchar(20) NOT NULL,
  `fecha_modificacion` date NOT NULL,
  PRIMARY KEY (`id_tipo_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_tipo_persona VALUES("1","juridica","maria","2021-10-08","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("2","rtgtr","ttt","2021-10-08","tht","2021-10-08");
INSERT INTO tbl_tipo_persona VALUES("3","ADMINISTRADOR","","2021-10-31","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("4","ADMINISTRADOR","","2021-10-31","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("5","ADMINISTRADOR","","2021-10-31","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("6","ADMINISTRADOR","","2021-10-31","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("7","CLIENTE","","2021-10-29","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("8","ADMINISTRADOR","","2021-10-31","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("9","ADMINISTRADOR","","2021-10-31","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("10","ADMINISTRADOR","","2021-10-31","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("11","ADMINISTRADOR","","2021-10-31","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("12","CLIENTE","","2021-10-02","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("13","CLIENTE","","2021-10-02","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("14","USUARIO","","2021-09-26","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("15","","","0000-00-00","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("16","","","0000-00-00","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("17","","","0000-00-00","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("18","","","0000-00-00","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("19","","","0000-00-00","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("20","","","0000-00-00","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("21","","","0000-00-00","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("22","","","0000-00-00","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("23","","","0000-00-00","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("24","","","0000-00-00","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("25","","","0000-00-00","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("26","","","0000-00-00","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("27","","","0000-00-00","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("28","ADMINISTRADOR","","2021-01-01","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("29","ADMINISTRADOR","","2021-01-01","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("30","","","0000-00-00","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("31","","","0000-00-00","","0000-00-00");
INSERT INTO tbl_tipo_persona VALUES("32","ADMINISTRADOR","","2021-12-31","","0000-00-00");



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
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_usuarios VALUES("1","1","1","ADMIN","123456789","0","2021-11-01","1","3","2","2021-10-16","maria@gamil.com","maria","2021-10-08","maria","2021-10-08");
INSERT INTO tbl_usuarios VALUES("2","1","2","DAVIDIM","123456789","0","2021-10-31","1","0","0","2021-12-31","fernandoizaguirrehn7@gmail.com","FER","2021-10-29","FER","2021-10-29");
INSERT INTO tbl_usuarios VALUES("4","5","5","","hola123456","","","","","","2021-10-24","sdad@unah.com","","2021-11-06","","");
INSERT INTO tbl_usuarios VALUES("5","6","6","","hola123456","","","","","","2021-10-24","sdad@unah.com","","2021-11-06","","");
INSERT INTO tbl_usuarios VALUES("6","7","7","","hola123456","","","","","","2021-10-24","sdad@unah.com","","2021-11-06","","");
INSERT INTO tbl_usuarios VALUES("7","8","8","","hola123456","","","","","","2021-10-24","sdad@unah.com","","2021-11-06","","");
INSERT INTO tbl_usuarios VALUES("8","9","9","","hola123456","","","","","","2021-10-24","sdad@unah.com","","2021-11-06","","");
INSERT INTO tbl_usuarios VALUES("9","10","10","","hola123456","","","","","","2021-10-24","sdad@unah.com","","2021-11-06","","");



SET FOREIGN_KEY_CHECKS=1;
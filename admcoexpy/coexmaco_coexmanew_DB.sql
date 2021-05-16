-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 11-05-2021 a las 11:59:40
-- Versión del servidor: 5.7.34
-- Versión de PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `coexmaco_coexmanew_DB`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mail_config`
--

CREATE TABLE `mail_config` (
  `id` int(11) NOT NULL,
  `assunto` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `email_to` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `email_from` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `email_cc` varchar(80) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `mail_config`
--

INSERT INTO `mail_config` (`id`, `assunto`, `email_to`, `email_from`, `email_cc`) VALUES
(1, 'Sitio Web: Nueva Solicitud de Presupuest', 'rogerio@coexma.com.py', 'coexma@coexma.com.py', 'leandro@coexma.com.py');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_atributo`
--

CREATE TABLE `tb_atributo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_atributo`
--

INSERT INTO `tb_atributo` (`id`, `nombre`, `activo`) VALUES
(1, 'Colores', 1),
(2, 'Medida', 1),
(3, 'Tamaño', 1),
(4, 'Material', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_atr_valor`
--

CREATE TABLE `tb_atr_valor` (
  `id` int(11) NOT NULL,
  `id_atributo` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_atr_valor`
--

INSERT INTO `tb_atr_valor` (`id`, `id_atributo`, `nombre`, `activo`) VALUES
(1, 1, 'Blanco', 1),
(2, 1, 'Rojo', 1),
(3, 1, 'Azul', 1),
(4, 1, 'Marfin', 1),
(5, 1, 'Negro', 1),
(6, 4, 'Metal', 1),
(7, 4, 'Plástico', 1),
(8, 4, 'MDF', 1),
(9, 4, 'MDP', 1),
(10, 3, 'Pequeño', 1),
(11, 3, 'Mediano', 1),
(12, 3, 'Grande', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_banner`
--

CREATE TABLE `tb_banner` (
  `id` int(11) NOT NULL,
  `img` varchar(100) NOT NULL,
  `text_alt` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `orden` int(11) NOT NULL,
  `posicion` tinyint(1) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_banner`
--

INSERT INTO `tb_banner` (`id`, `img`, `text_alt`, `url`, `orden`, `posicion`, `activo`) VALUES
(1, 'banner-2021-04-20-03-47-50.jpeg', '', 'categorie.php?cat=2', 1, 0, 1),
(13, 'banner-2020-12-15-08-49-09.jpeg', '', 'categorie.php?cat=1', 1, 1, 1),
(14, 'banner-2020-12-15-10-12-52.jpeg', '', 'categorie.php?cat=1', 4, 1, 1),
(15, 'banner-2021-04-20-03-48-10.jpeg', '', 'categorie.php?cat=2', 2, 0, 1),
(16, 'banner-2021-03-17-08-23-14.jpeg', '', 'categorie.php?cat=1', 2, 1, 1),
(17, 'banner-2021-04-20-03-48-24.jpeg', '', 'categorie.php?cat=2', 3, 0, 1),
(18, 'banner-2021-03-17-08-20-11.jpeg', '', 'categorie.php?cat=1', 3, 1, 1),
(19, 'banner-2021-02-24-10-13-44.jpeg', '', 'categorie.php?cat=1', 5, 1, 1),
(20, 'banner-2021-04-20-03-48-44.jpeg', '', 'categorie.php?cat=2', 4, 0, 1),
(21, 'banner-2021-04-20-03-48-59.jpeg', '', 'categorie.php?cat=2', 5, 0, 1),
(22, 'banner-2021-04-20-03-49-07.jpeg', '', 'categorie.php?cat=2', 5, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_categoria`
--

CREATE TABLE `tb_categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `id_padre` int(11) DEFAULT NULL,
  `menu` tinyint(1) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `descripcion` text,
  `url` varchar(80) DEFAULT 'no-image.png',
  `orden` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_categoria`
--

INSERT INTO `tb_categoria` (`id`, `nombre`, `id_padre`, `menu`, `activo`, `descripcion`, `url`, `orden`) VALUES
(8, 'Proyectos Exclusivos', 2, 1, 1, NULL, '', 50),
(7, 'Equipos para Refrigeracion y Minimarket', 2, 1, 1, NULL, NULL, 0),
(6, 'Equipos de bar y Restó', 1, 1, 1, NULL, '', 3),
(5, 'Persianas de oficina y Hogar', 1, 1, 1, NULL, '', 4),
(4, 'Equipos para Oficina', 1, 1, 1, NULL, '', 2),
(3, 'Sillas', 193, 1, 1, NULL, '', 0),
(2, 'Refrigeracion y Gastronomia', NULL, 1, 1, NULL, NULL, 0),
(1, 'Muebles de Oficina', NULL, 1, 1, NULL, NULL, 0),
(136, 'Auto Atendimento', 7, 1, 1, NULL, NULL, 13),
(137, 'Armario P/ Panes / Bodegas', 7, 1, 1, NULL, NULL, 18),
(138, 'Mesas', 6, 1, 1, NULL, NULL, 0),
(9, 'Sillas Gamer', 193, 1, 1, NULL, '', 0),
(141, 'Armarios', 4, 1, 1, NULL, NULL, 2),
(140, 'Caja Fuerte', 4, 1, 1, NULL, NULL, 6),
(142, 'Estación de Trabajo', 4, 1, 1, NULL, NULL, 7),
(143, 'Mesas de Reuniones', 4, 1, 1, NULL, NULL, 3),
(144, 'Complementos', 4, 1, 1, NULL, NULL, 9),
(145, 'Visa Cooler', 7, 1, 1, NULL, NULL, 14),
(146, 'Carnicería', 7, 1, 1, NULL, NULL, 15),
(147, 'Panadería y Confitería', 7, 1, 1, NULL, NULL, 17),
(148, 'Heladeras', 195, 1, 1, NULL, NULL, 0),
(149, 'Freezer/Isla', 7, 1, 1, NULL, NULL, 16),
(150, 'Recepción/Check out', 7, 1, 1, NULL, NULL, 19),
(151, 'Frutería', 7, 1, 1, NULL, NULL, 20),
(152, 'Cocina Industrial', 195, 1, 1, NULL, NULL, 0),
(153, 'Gondolas/Carritos', 7, 1, 1, NULL, NULL, 21),
(154, 'Persianas Horizontales', 5, 1, 1, NULL, NULL, 0),
(155, 'Persianas Verticales', 5, 1, 1, NULL, NULL, 0),
(156, 'Persianas Verticales en tela', 5, 1, 1, NULL, NULL, 0),
(157, 'Persiana Roló', 5, 1, 1, NULL, NULL, 0),
(158, 'Persianas Romanas', 5, 1, 1, NULL, NULL, 0),
(159, 'Persiana Double Visión', 5, 1, 1, NULL, NULL, 0),
(162, 'Cajoneros y Archiveros', 4, 1, 1, NULL, '', 4),
(163, 'Recepción', 4, 1, 1, NULL, NULL, 8),
(164, 'Metalicos', 4, 1, 1, NULL, NULL, 5),
(165, 'Escritorios', 4, 1, 1, NULL, '', 1),
(166, 'Quema de Stock', 4, 1, 1, NULL, NULL, 12),
(181, 'Línea Estudiante ', 193, 1, 1, NULL, '', 0),
(168, 'Proyectos Exclusivos', 1, 0, 1, NULL, '', 0),
(170, 'Fabricadora de hielo MFG150 ', 7, 0, 0, NULL, NULL, 0),
(182, 'Promoción Sillas ', 3, 1, 1, NULL, NULL, 0),
(183, 'Banquetas', 6, 1, 1, NULL, NULL, 0),
(184, 'Sillas para Bar', 6, 1, 1, NULL, NULL, 0),
(185, 'Sillas de Espera', 193, 1, 1, NULL, '', 0),
(186, 'Sillas Cavaletti', 3, 0, 0, NULL, 'sillas-cavaletti-2021-02-25-02-49-22.jpeg', 0),
(187, 'Call Center', 1, 0, 1, NULL, '', 0),
(180, 'Posa pie', 4, 0, 1, NULL, '', 11),
(190, 'Sillas Plaxmetal', 3, 0, 0, NULL, 'sillas-plaxmetal-2021-02-25-02-54-00.jpeg', 0),
(191, 'Sillas Plasnew', 3, 0, 0, NULL, 'sillas-plasnew-2021-02-25-02-56-43.jpeg', 0),
(193, 'Sillas para oficina', 1, 1, 1, NULL, 'no-image.png', 1),
(194, 'Sofá para Oficinas', 193, 1, 1, NULL, 'no-image.png', 0),
(195, 'Equipos de Restaurant y Gastronomía', 2, 1, 1, NULL, 'no-image.png', 0),
(196, 'Mesada de Trabajo', 195, 1, 1, NULL, 'no-image.png', 0),
(197, 'Hornos Industriales', 195, 1, 1, NULL, 'no-image.png', 0),
(198, 'Cilindro Laminador', 195, 1, 1, NULL, 'no-image.png', 0),
(199, 'Amasadoras', 195, 1, 1, NULL, 'no-image.png', 0),
(200, 'Molino de Pan', 195, 1, 1, NULL, 'no-image.png', 0),
(201, 'Batidora Industrial', 195, 1, 1, NULL, 'no-image.png', 0),
(202, 'Licuadora Industrial', 195, 1, 1, NULL, 'no-image.png', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_categoria_tienda`
--

CREATE TABLE `tb_categoria_tienda` (
  `id_tienda` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_ciudad`
--

CREATE TABLE `tb_ciudad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `id_departamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_ciudad`
--

INSERT INTO `tb_ciudad` (`id`, `nombre`, `id_departamento`) VALUES
(1, 'Cedrales', 1),
(2, 'Colonia Yguazu', 1),
(3, 'Hernandarias', 1),
(4, 'Itakyry ', 1),
(5, 'Juan E. O-Leary', 1),
(6, 'Colonia Yguazu', 1),
(7, 'Juan León Malloriquin', 1),
(8, 'Minga Guazú', 1),
(9, 'Minga Porá', 1),
(10, 'Naranjal', 1),
(11, 'Nueva Fortuna', 1),
(12, 'Puerto Pdte. Franco ', 1),
(13, 'San Alberto', 1),
(14, 'San Cristobal', 1),
(15, 'Santa Fe del Paraná', 1),
(16, 'Santa Rita', 1),
(17, 'Bella Vista Norte', 2),
(18, 'Capitán Bado', 2),
(19, 'Pedro Juan Caballero', 2),
(20, 'Sanja Pyta', 2),
(21, 'Filadelfia', 3),
(22, 'Loma Plata', 3),
(23, 'Caaguazú', 4),
(24, 'Campo 9', 4),
(25, 'Carayao', 4),
(26, 'Cecilio Báez', 4),
(27, 'Coronel Oviedo', 4),
(28, 'Juan Manuel Frutos -Pastoreo', 4),
(29, 'Nueva Londres', 4),
(30, 'Repatriación', 4),
(31, 'RI 3 Corrales', 4),
(32, 'San Joaquin', 4),
(33, 'San José de los Arroyos', 4),
(34, 'Santa Rosa del Mbutuy', 4),
(35, 'Simon Bolivar', 4),
(36, 'Vaquería', 4),
(37, 'Yhu', 4),
(38, 'Buena Vista', 5),
(39, 'Caazapá', 5),
(40, 'Fulgencio Yegros', 5),
(41, 'Higinio Morinigo', 5),
(42, 'Maciel', 5),
(43, 'Moises Bertoni', 5),
(44, 'San Juan Nepomuceno', 5),
(45, 'Yuty', 5),
(46, 'Corpus Christi', 6),
(47, 'Curuguaty', 6),
(48, 'Katuete', 6),
(49, 'Nueva Esperanza', 6),
(50, 'Puente Kyha', 6),
(51, 'Salto del Guaira', 6),
(52, 'Asunción', 7),
(53, 'Areguá', 8),
(54, 'Capiatá', 8),
(55, 'Fernando de la Mora', 8),
(56, 'Guarambaré', 8),
(57, 'Itá', 8),
(58, 'Itagua', 8),
(59, 'José Agusto Saldivar', 8),
(60, 'Lambaré', 8),
(61, 'Limpio', 8),
(62, 'Luque', 8),
(63, 'Mariano Roque Alonso', 8),
(64, 'Ñemby', 8),
(65, 'Nueva Italia', 8),
(66, 'San Antonio', 8),
(67, 'San Lorenzo', 8),
(68, 'Villa Elisa', 8),
(69, 'Villeta', 8),
(70, 'Ypacarai', 8),
(71, 'Ypane', 8),
(72, 'Azotey', 9),
(73, 'Concepción', 9),
(74, 'Horqueta', 9),
(75, 'Loreto', 9),
(76, 'Paso Barreto', 9),
(77, 'Yby Ya-u', 9),
(78, '1ro. De marzo', 10),
(79, 'Altos', 10),
(80, 'Arroyos y Esteros', 10),
(81, 'Atyra', 10),
(82, 'Caacupe', 10),
(83, 'Caraguatay', 10),
(84, 'Eusebio Ayala', 10),
(85, 'Isla Pucu', 10),
(86, 'Itacurubí de la Cordillera', 10),
(87, 'Piribebuy', 10),
(88, 'San Bernardino', 10),
(89, 'San José Obrero', 10),
(90, 'Santa Elena', 10),
(91, 'Tobatí', 10),
(92, 'Valenzuela', 10),
(93, 'Borja', 11),
(94, 'Colonia Independencia', 11),
(95, 'Coronel Martinez', 11),
(96, 'Dr. Botrel', 11),
(97, 'Eugenio A. Garay', 11),
(98, 'Felix Perez Cardozo', 11),
(99, 'Itapé', 11),
(100, 'Iturbe', 11),
(101, 'José Fassardi', 11),
(102, 'Mauricio Jose Troche', 11),
(103, 'Mbocayaty', 11),
(104, 'Natalicio Talavera', 11),
(105, 'Ñumi', 11),
(106, 'Paso Yobai', 11),
(107, 'San Salvador', 11),
(108, 'Tebicuary', 11),
(109, 'Villarrica', 11),
(110, 'Bella Vista Sur', 12),
(111, 'Cambyreta', 12),
(112, 'Capitán Meza', 12),
(113, 'Capitan Miranda', 12),
(114, 'Carmen del Paraná', 12),
(115, 'Colonia Fram', 12),
(116, 'Coronel Bogado', 12),
(117, 'Edelira', 12),
(118, 'Edelira 28', 12),
(119, 'Encarnación', 12),
(120, 'Gral. Artigas', 12),
(121, 'Gral. Delgado', 12),
(122, 'Hohenau', 12),
(123, 'Kimex -Colonia Carlos A. López', 12),
(124, 'La Paz', 12),
(125, 'Maria Auxiliadora', 12),
(126, 'Mayor Otaño', 12),
(127, 'Natalio', 12),
(128, 'Obligado', 12),
(129, 'Pirapo', 12),
(130, 'San Cosme Y Damián', 12),
(131, 'San Juan del Paraná', 12),
(132, 'San Rafael del Paraná', 12),
(133, 'Yatytay', 12),
(134, 'Ayolas', 13),
(135, 'San Ignacio Misiones	', 13),
(136, 'San Juan Bautista', 13),
(137, 'San Patricio', 13),
(138, 'Santa María Misiones', 13),
(139, 'Santa Rosa Misiones', 13),
(140, 'Santiago Misiones', 13),
(141, 'Alberdi', 14),
(142, 'Pilar', 14),
(143, 'Villa Oliva', 14),
(144, 'Acahay', 15),
(145, 'Caballero', 15),
(146, 'Carapeguá', 15),
(147, 'Escobar', 15),
(148, 'Paraguarí', 15),
(149, 'Pirayú', 15),
(150, 'Quiindy	', 15),
(151, 'San Roque Gonzalez', 15),
(152, 'Sapucai', 15),
(153, 'Yaguaron	', 15),
(154, 'Ybycui', 15),
(155, 'Ybytymí', 15),
(156, 'Benjamín Aceval', 16),
(157, 'Villa Hayes', 16),
(158, '25 de Diciembre', 17),
(159, 'Antequera', 17),
(160, 'Capiibary', 17),
(161, 'Choré', 17),
(162, 'Gral. Elizardo Aquino', 17),
(163, 'Gral. Resquín', 17),
(164, 'Guayaybi', 17),
(165, 'Itacurubí del Rosario', 17),
(166, 'Lima', 17),
(167, 'Puerto Rosario	', 17),
(168, 'San Pedro del Ycuamandiyú', 17),
(169, 'Santani', 17),
(170, 'Santa Rosa del Aguaray', 17),
(171, 'Unión', 17),
(172, 'Ciudad del Este', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_cliente`
--

CREATE TABLE `tb_cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `apellido` varchar(80) DEFAULT NULL,
  `ruc` varchar(20) DEFAULT NULL COMMENT 'RUC, RG, CI',
  `documento` varchar(50) DEFAULT NULL,
  `razon_social` varchar(80) DEFAULT NULL,
  `mayorista` tinyint(1) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_cliente`
--

INSERT INTO `tb_cliente` (`id`, `nombre`, `apellido`, `ruc`, `documento`, `razon_social`, `mayorista`, `telefono`, `email`) VALUES
(28, 'Jun', 'Taniwaki', NULL, NULL, NULL, 0, '0982244833', 'jundanielvallejostaniwaki@gmail.com'),
(27, 'Rene', 'Ortega', '6916197-6', '6916197', '', 0, '0985329533', 'reneortega2609@gmail.com'),
(26, 'Rocio', 'Gonzalez', NULL, NULL, NULL, 0, '0972118743', 'gerencia@integrallogistics.com.py'),
(25, 'José Antonio', 'Sánchez', NULL, NULL, NULL, 0, '+59597311840', 'joseaguilera1709@gmail.com'),
(24, 'René', 'Ortega', NULL, NULL, NULL, 0, '+595985329533', 'reneortega260@gmail.com'),
(23, 'BrianFrept', 'BrianFrept', NULL, NULL, NULL, 0, '87422324353', 'alycelundy@iswc.info\r\n'),
(22, 'Juan ', 'Cabrera', '4402651-01', '4402651-01', 'Capacit', 0, '0983112965', 'capacitcursoscde@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_cli_direccion`
--

CREATE TABLE `tb_cli_direccion` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `calle` varchar(80) NOT NULL,
  `ciudad` varchar(80) NOT NULL,
  `departamento` varchar(80) NOT NULL,
  `referencia` varchar(80) DEFAULT NULL,
  `favorito` tinyint(1) NOT NULL COMMENT '0 -> no 1 -> sí'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_cli_direccion`
--

INSERT INTO `tb_cli_direccion` (`id`, `id_cliente`, `calle`, `ciudad`, `departamento`, `referencia`, `favorito`) VALUES
(19, 27, 'Nicasio Villalba c/ Cnel. Victor Ayala', '55', '8', 'Detras de Herimarc en el asfaltado paralelo a Mcal. Lopez', 1),
(18, 22, 'Avda. San Blas, Km 3.5 CDE', '172', '1', 'Al lado de Olier', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_contacto`
--

CREATE TABLE `tb_contacto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `asunto` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `mensaje` longtext COLLATE utf8_unicode_ci NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tb_contacto`
--

INSERT INTO `tb_contacto` (`id`, `nombre`, `email`, `telefono`, `asunto`, `mensaje`, `fecha`) VALUES
(9, 'Mike Palmer\r\n', 'no-replyTet@gmail.com', '87937898533', '', 'Greetings \r\n \r\nI have just analyzed  coexma.com.py for the Local ranking keywords and seen that your website could use an upgrade. \r\n \r\nWe will enhance your Local Ranks organically and safely, using only whitehat methods, while providing Google maps and website offsite work at the same time. \r\n \r\nPlease check our pricelist here, we offer SEO at cheap rates. \r\nhttps://speed-seo.net/product/local-seo-package/ \r\n \r\nStart increasing your local visibility with us, today! \r\n \r\nregards \r\nMike Palmer\r\n \r\nSpeed SEO Digital Agency \r\nsupport@speed-seo.net', '2021-04-29 10:35:00'),
(10, 'Dhara Ortúzar', 'dharaortuzar@britimp.com.py', '0971951832', 'Presupuesto', 'Buen día, \r\nEstamos necesitando presupuesto de 6 butacas altas para cajeros.\r\n\r\nMuchas gracias\r\n', '2021-04-30 11:08:28'),
(11, 'Judith Diaz', 'judia17a@hotmail.com', '0973805312', 'Precio ', 'La mesa de reunión con Referencia:11072 que valor tiene? ', '2021-05-03 09:28:06'),
(12, 'Mike Johnson\r\n', 'no-reply@google.com', '89972844783', '', 'Good Day \r\n \r\nI have just verified your SEO on  coexma.com.py for its SEO Trend and saw that your website could use a push. \r\n \r\nWe will enhance your SEO metrics and ranks organically and safely, using only whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nPlease check our plans here, we offer SEO at cheap rates. \r\nhttps://www.hilkom-digital.de/cheap-seo-packages/ \r\n \r\nStart improving your sales and leads with us, today! \r\n \r\nregards \r\nMike Johnson\r\n \r\nHilkom Digital Team \r\nsupport@hilkom-digital.de', '2021-05-03 11:52:51'),
(13, 'HERIB RUIZ', 'federatio2020b@gmail.com', '0983216479', 'CONSULTA URGENTE', 'PRECISO ASESORAMIENTO PARA COMPRAR UN ARCHIVADOR TIENEN MODELOS MUY BUENOS PARA SABER LAS MEDIDAS', '2021-05-03 19:28:21'),
(14, 'Paulo Martins ', 'p.martins@piron.it', '+5511992212906', 'Contacto', 'Estimados \r\n\r\nMi nombre és Paulo Martins y soy el responsable por el desarrollo del mercado y ventas para Latina America de el fabricante Italiana de hornos Piron SrL.\r\nDebido a mi trabajo en años anteriores llegué a conocer vuestra empresa, vuestro profesionalismo, cualidades y potencial.\r\nPiron, ya trabaja en 75 países alrededor del mundo..\r\nMe gustaría poder hablar con ustedes para poder presentarles Piron y ver si hay posibilidad e interés en una futura asociación   ya que creo que ambas empresas comparten las mismas ideas, profesionalismo, cualidades y potencial.\r\n\r\n', '2021-05-03 21:49:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_curriculm`
--

CREATE TABLE `tb_curriculm` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `cedula` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `id_ciudad` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_departamento` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `area` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_curriculum`
--

CREATE TABLE `tb_curriculum` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `cedula` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `id_ciudad` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_departamento` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `area` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `url_cv` varchar(120) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tb_curriculum`
--

INSERT INTO `tb_curriculum` (`id`, `nombre`, `apellido`, `cedula`, `id_ciudad`, `id_departamento`, `area`, `email`, `telefono`, `url_cv`) VALUES
(1, 'María Pabla', 'Peralta Aguilera', '5789502', 'Ciudad del Este ', 'Alto Paraná', 'Ventas', 'pablaperaltaapp19@gmail.com', '0971250326', '308d3dd62e9143decfbac7c465603a76.pdf'),
(2, 'Ricardo ', 'Cardoso ', '8654165 ', 'Ñemby ', 'Central ', 'Producción', 'ricardocardoso27@hotmail.com', '0985682650', '28d4e1ef5d66dc35886a5244f48b7034.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_curriculum_experiencia`
--

CREATE TABLE `tb_curriculum_experiencia` (
  `id` int(11) NOT NULL,
  `id_curriculum` int(11) NOT NULL,
  `empresa` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `desde` date NOT NULL,
  `hasta` date NOT NULL,
  `cargo` varchar(80) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tb_curriculum_experiencia`
--

INSERT INTO `tb_curriculum_experiencia` (`id`, `id_curriculum`, `empresa`, `desde`, `hasta`, `cargo`) VALUES
(1, 1, 'Wines & Spirits S.A', '2019-01-10', '2021-03-26', 'Promotora'),
(2, 1, ' Wines & Spirits S.A', '2019-01-10', '2021-03-26', 'Promotora'),
(3, 1, ' Wines & Spirits S.A', '2019-08-10', '2021-03-26', 'Promotora'),
(4, 2, 'Imar ', '2015-09-17', '2020-08-19', 'Técnico en Refrigeración y aire acondicionado ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_departamento`
--

CREATE TABLE `tb_departamento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_departamento`
--

INSERT INTO `tb_departamento` (`id`, `nombre`) VALUES
(1, 'Alto Parana'),
(2, 'Amambay'),
(3, 'Boquerón'),
(4, 'Caaguazú'),
(5, 'Caazapá'),
(6, 'Canindeyú'),
(7, 'Capital'),
(8, 'Central'),
(9, 'Concepción'),
(10, 'Cordillera'),
(11, 'Guairá'),
(12, 'Itapúa'),
(13, 'Misiones'),
(14, 'Ñeembucú'),
(15, 'Paraguarí'),
(16, 'Presidente Hayes'),
(17, 'San Pedro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_linea`
--

CREATE TABLE `tb_linea` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `activo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tb_linea`
--

INSERT INTO `tb_linea` (`id`, `nombre`, `url`, `activo`) VALUES
(2, 'Linea 1', 'no-image.png', 0),
(3, 'Coexma', 'no-image.png', 1),
(4, 'Leef', 'no-image.png', 1),
(5, 'Lanzamientos', 'no-image.png', 1),
(6, 'Prime', 'no-image.png', 1),
(7, 'Air', 'no-image.png', 1),
(8, 'C3', 'no-image.png', 1),
(9, 'C4', 'no-image.png', 1),
(10, 'Mais', 'no-image.png', 1),
(11, 'Start', 'no-image.png', 1),
(12, 'NewNet', 'no-image.png', 1),
(13, 'Master', 'no-image.png', 1),
(14, 'Essence', 'no-image.png', 1),
(15, 'Idea', 'no-image.png', 1),
(16, 'Vélo', 'no-image.png', 1),
(17, 'Flip', 'no-image.png', 1),
(18, 'Colectiva', 'no-image.png', 1),
(19, 'Joy', 'no-image.png', 1),
(20, 'Cajera', 'no-image.png', 1),
(22, 'Beezi', 'no-image.png', 1),
(23, 'Brizza', 'no-image.png', 1),
(24, 'Ergoplax', 'no-image.png', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_marca`
--

CREATE TABLE `tb_marca` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `url` varchar(80) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_marca`
--

INSERT INTO `tb_marca` (`id`, `nombre`, `url`, `activo`) VALUES
(15, 'PLASNEW', 'logo plassnew coexma.png-2021-03-11', 1),
(4, 'NOBRE', 'Logo Persianas Nobre.png-2021-03-12', 1),
(5, 'CAVALETTI', 'Logo cavaletti -Coexma.png-2021-03-12', 1),
(6, 'REFRIMATE', 'logo refrimate.jpg-2021-04-14', 1),
(7, 'DALL MÓVEIS', 'Logo dall moveis Coexma.png-2021-03-12', 1),
(8, 'EDW', 'logo Edw Coexma.png-2021-03-12', 1),
(9, 'AVANTTI', 'Logo Avantti Coexma.png-2021-03-12', 1),
(10, 'ARTANY', 'Logo Arnaty- Coexma.png-2021-03-12', 1),
(11, 'LUNASA', 'Logo Lunassa Coexma.png-2021-03-12', 1),
(12, 'GEBB WORK', 'Logo Gebb Work  Coexma.png-2021-03-12', 1),
(13, 'BERMAR', 'LOGO BERMAR.jpg-2021-04-14', 1),
(14, 'INARCAN', 'no-image.png', 1),
(16, 'COEXMA', 'Logo Coexma.png-2021-03-12', 1),
(17, 'PLAXMETAL', 'logo-plaxmetal-coexma.png-2021-03-11', 1),
(18, 'VENANCIO', 'logo venancio.jpg-2021-04-14', 1),
(19, 'ECCEL', 'logo ECCEL.jpg-2021-04-14', 1),
(20, 'MALTA', 'logo malta.jpg-2021-04-14', 1),
(21, 'Gabbinetto', 'Logo Gabbinetto.png-2021-03-12', 1),
(22, 'JJ Equipamientos', 'jj.png-2021-04-14', 1),
(23, 'Marchesoni', 'logo marchesoni.jpg-2021-04-14', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_met_envio`
--

CREATE TABLE `tb_met_envio` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `costo` double DEFAULT '0',
  `coordinar_env` int(11) NOT NULL DEFAULT '0',
  `default` int(11) DEFAULT '0',
  `activo` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_met_envio`
--

INSERT INTO `tb_met_envio` (`id`, `descripcion`, `costo`, `coordinar_env`, `default`, `activo`) VALUES
(1, 'AEX', 45000, 0, 0, 0),
(2, 'Retirar en la Tienda', 0, 1, 0, 1),
(3, 'Coordinar Envío (COEXMA)', 0, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_met_envio_costo`
--

CREATE TABLE `tb_met_envio_costo` (
  `id` int(11) DEFAULT NULL,
  `id_met_envio` int(11) DEFAULT NULL,
  `id_ciudad` int(11) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `tiempo_entrega` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_met_pago`
--

CREATE TABLE `tb_met_pago` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `default` int(11) DEFAULT NULL,
  `instrucciones` mediumtext,
  `activo` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_met_pago`
--

INSERT INTO `tb_met_pago` (`id`, `descripcion`, `default`, `instrucciones`, `activo`) VALUES
(1, 'TARJETA / PAGO EXPRESS / PAGOPAR', 0, NULL, 0),
(2, 'COORDINAR PAGO CON VENDEDOR', 1, 'En la brevedad posible un Asesor de Ventas estará confirmando su pedido en contactándole para coordinar la entrega', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_newsletter`
--

CREATE TABLE `tb_newsletter` (
  `id` int(11) NOT NULL,
  `email` varchar(80) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tb_newsletter`
--

INSERT INTO `tb_newsletter` (`id`, `email`) VALUES
(1, 'richardcabrera92@hotmail.com'),
(2, 'richardcabrera92@hotmail.com'),
(3, 'richardcabrera92@hotmail.com'),
(4, 'n@gmail.com'),
(5, 'n@gmail.com'),
(6, 'n@gmail.com'),
(7, 'richardcabrera92@hotmail.com'),
(8, 'dfvd@sdsd.com'),
(9, 'richardcabrera92@hotmail.com'),
(10, 'richardcabrera92@hotmail.com'),
(11, 'richard.cabrera.paim@hotmail.com'),
(12, ''),
(13, ''),
(14, ''),
(15, 'jos.pe@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_pais`
--

CREATE TABLE `tb_pais` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_pedido`
--

CREATE TABLE `tb_pedido` (
  `id` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_cliente` int(11) NOT NULL,
  `id_met_pago` int(11) NOT NULL,
  `id_met_envio` int(11) NOT NULL,
  `id_cli_direccion` int(11) NOT NULL DEFAULT '1',
  `total` double NOT NULL,
  `id_factura` int(11) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `total_envio` double DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_pedido`
--

INSERT INTO `tb_pedido` (`id`, `fecha`, `id_cliente`, `id_met_pago`, `id_met_envio`, `id_cli_direccion`, `total`, `id_factura`, `observacion`, `total_envio`, `status`) VALUES
(83, '2021-04-25 16:58:26', 22, 2, 3, 1, 1462000, NULL, 'Entregar por la tarde', 0, 5),
(84, '2021-05-06 23:58:30', 27, 2, 3, 1, 2375000, NULL, '', 0, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_pedido_express`
--

CREATE TABLE `tb_pedido_express` (
  `id` int(11) NOT NULL,
  `url_desde` varchar(45) DEFAULT 'Formulario',
  `nombre` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `ciudad` varchar(80) NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `mensaje` text,
  `vendedor` int(11) DEFAULT NULL,
  `full_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_pedido_express`
--

INSERT INTO `tb_pedido_express` (`id`, `url_desde`, `nombre`, `telefono`, `id_producto`, `email`, `ciudad`, `fecha`, `mensaje`, `vendedor`, `full_url`) VALUES
(124, 'WhatsApp', 'Nancy ', '0982422080', 1, '', '', '2021-04-26 09:07:00', '', 4, 'https://www.coexma.com.py/producto.php?id=516'),
(126, 'WhatsApp', 'Alma Ocampo', '982341081', 1, '', '', '2021-04-26 16:21:28', '', 4, 'https://www.coexma.com.py/quienes-somos.php#'),
(127, 'WhatsApp', 'Ines', '0995619613', 1, '', '', '2021-04-26 16:24:48', '', 8, 'https://www.coexma.com.py/index.php?tienda=1'),
(128, 'WhatsApp', 'Mariela', '0984854651', 1, '', '', '2021-04-26 19:58:28', '', 8, 'https://www.coexma.com.py/producto.php?id=281#'),
(129, 'Formulario', 'Pedro', '0', 60, 'pedrobarbosapy@gmail.com', 'Asunción', '2021-04-27 10:47:34', 'Buenos días,\r\n\r\nMe gustaría saber precio de persianas', NULL, NULL),
(130, 'WhatsApp', 'Marcos', '0', 1, '', '', '2021-04-27 10:47:56', '', 8, 'https://coexma.com.py/producto.php?id=60#'),
(131, 'WhatsApp', 'Patricia', '0981448864', 1, '', '', '2021-04-27 10:52:09', '', 8, 'https://www.coexma.com.py/contactos.php'),
(132, 'WhatsApp', 'Patricia', '0981448864', 1, '', '', '2021-04-27 10:52:52', '', 8, 'https://www.coexma.com.py/contactos.php#'),
(133, 'WhatsApp', 'Johannes', '+595961800444', 1, '', '', '2021-04-27 12:01:59', '', 4, 'https://www.coexma.com.py/categoria.php?cat=165'),
(134, 'WhatsApp', 'Johannes', '+595961800444', 1, '', '', '2021-04-27 12:02:20', '', 1, 'https://www.coexma.com.py/categoria.php?cat=165#'),
(135, 'WhatsApp', 'Fatima Genes', '0992573967 ', 1, '', '', '2021-04-27 12:28:24', '', 6, 'https://www.coexma.com.py/refrigeracion-gastronomia.php'),
(136, 'WhatsApp', 'Fatima Genes', '0992573967 ', 1, '', '', '2021-04-27 12:29:48', '', 7, 'https://www.coexma.com.py/refrigeracion-gastronomia.php'),
(137, 'WhatsApp', 'Mirian', '0986 158596', 1, '', '', '2021-04-27 13:07:12', '', 9, 'http://www.coexma.com.py/refrigeracion-gastronomia.php'),
(138, 'WhatsApp', 'Danielli Moreira ', '0982 113406', 1, '', '', '2021-04-27 16:37:06', '', 2, 'http://www.coexma.com.py/index.php?tienda=1'),
(139, 'WhatsApp', 'Danielli Moreira ', '0982 113406', 1, '', '', '2021-04-27 16:37:09', '', 2, 'http://www.coexma.com.py/index.php?tienda=1#'),
(140, 'WhatsApp', 'Danielli Moreira ', '0982 113406', 1, '', '', '2021-04-27 16:37:10', '', 2, 'http://www.coexma.com.py/index.php?tienda=1#'),
(141, 'WhatsApp', 'Danielli Moreira ', '0982 113406', 1, '', '', '2021-04-27 16:37:16', '', 2, 'http://www.coexma.com.py/index.php?tienda=1#'),
(142, 'WhatsApp', 'Danielli Moreira ', '0982 113406', 1, '', '', '2021-04-27 16:37:16', '', 2, 'http://www.coexma.com.py/index.php?tienda=1#'),
(143, 'WhatsApp', 'Danielli Moreira ', '0982 113406', 1, '', '', '2021-04-27 16:37:19', '', 2, 'http://www.coexma.com.py/index.php?tienda=1#'),
(144, 'WhatsApp', 'Danielli Moreira ', '0982 113406', 1, '', '', '2021-04-27 16:37:21', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(145, 'WhatsApp', 'Danielli Moreira ', '0982 113406', 1, '', '', '2021-04-27 16:37:22', '', 2, 'http://www.coexma.com.py/index.php?tienda=1#'),
(146, 'WhatsApp', 'Danielli Moreira ', '0982 113406', 1, '', '', '2021-04-27 16:37:33', '', 2, 'http://www.coexma.com.py/index.php?tienda=1#'),
(147, 'WhatsApp', 'Danielli Moreira ', '0982 113406', 1, '', '', '2021-04-27 16:37:34', '', 2, 'http://www.coexma.com.py/index.php?tienda=1#'),
(148, 'WhatsApp', 'Danielli Moreira ', '0982 113406', 1, '', '', '2021-04-27 16:37:34', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(149, 'WhatsApp', 'Danielli ', '0982113406', 1, '', '', '2021-04-27 16:38:24', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(150, 'WhatsApp', 'Danielli ', '0982113406', 1, '', '', '2021-04-27 16:38:28', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(151, 'WhatsApp', 'Danielli ', '0982113406', 1, '', '', '2021-04-27 16:38:31', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(152, 'WhatsApp', 'Danielli ', '0982113406', 1, '', '', '2021-04-27 16:38:32', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(153, 'WhatsApp', 'Danielli ', '0982113406', 1, '', '', '2021-04-27 16:38:32', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(154, 'WhatsApp', 'Danielli ', '0982113406', 1, '', '', '2021-04-27 16:38:33', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(155, 'WhatsApp', 'Danielli ', '0982113406', 1, '', '', '2021-04-27 16:38:33', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(156, 'WhatsApp', 'Gustavo', '0986128890', 1, '', '', '2021-04-28 10:01:22', '', 4, 'https://www.coexma.com.py/producto.php?id=40'),
(157, 'WhatsApp', 'Paola duarte', '0981682791', 1, '', '', '2021-04-28 11:17:37', '', 1, 'https://www.coexma.com.py/categoria.php?cat=141'),
(158, 'WhatsApp', 'Paola duarte', '0981682791', 1, '', '', '2021-04-28 11:17:37', '', 1, 'https://www.coexma.com.py/categoria.php?cat=141#'),
(159, 'WhatsApp', 'Paola duarte', '0981682791', 1, '', '', '2021-04-28 11:17:56', '', 1, 'https://www.coexma.com.py/categoria.php?cat=141#'),
(160, 'WhatsApp', 'Paola duarte', '0981682791', 1, '', '', '2021-04-28 11:19:55', '', 8, 'https://www.coexma.com.py/categoria.php?cat=141#'),
(161, 'WhatsApp', 'Paola duarte', '0981682791', 1, '', '', '2021-04-28 11:19:55', '', 4, 'https://www.coexma.com.py/categoria.php?cat=141#'),
(162, 'WhatsApp', 'Paola duarte', '0981682791', 1, '', '', '2021-04-28 11:19:58', '', 8, 'https://www.coexma.com.py/categoria.php?cat=141#'),
(163, 'WhatsApp', 'Paola', '0981682791', 1, '', '', '2021-04-28 11:20:22', '', 4, 'https://www.coexma.com.py/'),
(164, 'WhatsApp', 'paola', '0981682791', 1, '', '', '2021-04-28 11:21:33', '', 8, 'https://www.coexma.com.py/index.php#'),
(165, 'WhatsApp', 'paola', '0981682791', 1, '', '', '2021-04-28 11:22:21', '', 8, 'https://www.coexma.com.py/index.php#'),
(166, 'WhatsApp', 'paola', '0981682791', 1, '', '', '2021-04-28 11:23:23', '', 8, 'https://www.coexma.com.py/index.php#'),
(167, 'WhatsApp', 'paola', '0981682791', 1, '', '', '2021-04-28 11:23:30', '', 8, 'https://www.coexma.com.py/index.php#'),
(168, 'Formulario', 'Pedro Paredes', '0995619613', 462, 'distri2023@hotmail.com', 'asuncion', '2021-04-28 12:47:50', 'estoy interesada en este producto', NULL, NULL),
(169, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:32:26', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+'),
(170, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:32:30', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(171, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:32:39', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(172, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:32:40', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(173, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:32:46', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(174, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:32:54', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(175, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:32:54', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(176, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:32:55', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(177, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:32:55', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(178, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:32:55', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(179, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:32:56', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(180, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:32:56', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(181, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:32:56', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(182, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:32:57', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(183, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:32:57', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(184, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:32:58', '', 2, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(185, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:07', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(186, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:08', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(187, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:08', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(188, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:18', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(189, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:18', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(190, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:18', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(191, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:22', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(192, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:23', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(193, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:23', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(194, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:23', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(195, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:23', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(196, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:24', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(197, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:25', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(198, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:25', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(199, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:26', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(200, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:26', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(201, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:32', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(202, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:34', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(203, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:37', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(204, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:37', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(205, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:37', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(206, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:37', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(207, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:38', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(208, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:38', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(209, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:38', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(210, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:38', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(211, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:38', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(212, 'WhatsApp', 'Adriana Ortiz', '0984178102', 1, '', '', '2021-04-28 15:33:38', '', 3, 'http://www.coexma.com.py/categoria.php?search=Flip+#'),
(213, 'WhatsApp', 'Adriana Ortiz ', '0984178102', 1, '', '', '2021-04-28 16:31:39', '', 3, 'http://www.coexma.com.py/index.php?tienda=1'),
(214, 'WhatsApp', 'Adriana Ortiz ', '0984178102', 1, '', '', '2021-04-28 16:31:48', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(215, 'WhatsApp', 'Adriana Ortiz ', '0984178102', 1, '', '', '2021-04-28 16:31:49', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(216, 'WhatsApp', 'Adriana Ortiz ', '0984178102', 1, '', '', '2021-04-28 16:31:49', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(217, 'WhatsApp', 'Adriana Ortiz ', '0984178102', 1, '', '', '2021-04-28 16:31:49', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(218, 'WhatsApp', 'Adriana Ortiz ', '0984178102', 1, '', '', '2021-04-28 16:31:50', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(219, 'WhatsApp', 'Adriana Ortiz ', '0984178102', 1, '', '', '2021-04-28 16:31:50', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(220, 'WhatsApp', 'Adriana Ortiz ', '0984178102', 1, '', '', '2021-04-28 16:31:50', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(221, 'WhatsApp', 'Adriana Ortiz ', '0984178102', 1, '', '', '2021-04-28 16:31:50', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(222, 'WhatsApp', 'Adriana Ortiz ', '0984178102', 1, '', '', '2021-04-28 16:31:51', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(223, 'WhatsApp', 'Adriana Ortiz ', '0984178102', 1, '', '', '2021-04-28 16:31:51', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(224, 'WhatsApp', 'Adriana Ortiz ', '0984178102', 1, '', '', '2021-04-28 16:31:51', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(225, 'WhatsApp', 'Adriana Ortiz ', '0984178102', 1, '', '', '2021-04-28 16:31:52', '', 2, 'http://www.coexma.com.py/index.php?tienda=1#'),
(226, 'WhatsApp', 'Adriana Ortiz ', '0984178102', 1, '', '', '2021-04-28 16:31:52', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(227, 'WhatsApp', 'Adriana Ortiz ', '0984178102', 1, '', '', '2021-04-28 16:31:52', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(228, 'WhatsApp', 'Adriana Ortiz ', '0984178102', 1, '', '', '2021-04-28 16:31:52', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(229, 'WhatsApp', 'Adriana Ortiz ', '0984178102', 1, '', '', '2021-04-28 16:31:52', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(230, 'WhatsApp', 'Adriana Ortiz ', '0984178102', 1, '', '', '2021-04-28 16:31:53', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(231, 'WhatsApp', 'Adriana Ortiz ', '0984178102', 1, '', '', '2021-04-28 16:31:53', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(232, 'WhatsApp', 'Adriana Ortiz ', '0984178102', 1, '', '', '2021-04-28 16:31:53', '', 3, 'http://www.coexma.com.py/index.php?tienda=1#'),
(233, 'WhatsApp', 'jesus', '0981442491', 1, '', '', '2021-04-29 14:25:06', '', 8, 'https://www.coexma.com.py/producto.php?id=183'),
(234, 'WhatsApp', 'Jorge Solis', '0981868281', 1, '', '', '2021-04-30 09:55:39', '', 8, 'https://www.coexma.com.py/producto.php?id=331'),
(235, 'WhatsApp', 'Lenz ', '0973500373 ', 1, '', '', '2021-04-30 12:58:02', '', 2, 'https://www.coexma.com.py/index.php?tienda=1'),
(236, 'WhatsApp', 'Lenz ', '0973500373 ', 1, '', '', '2021-04-30 12:58:39', '', 3, 'https://www.coexma.com.py/index.php?tienda=1#'),
(237, 'WhatsApp', 'Andres', '0981873062', 1, '', '', '2021-04-30 21:04:20', '', 4, 'https://www.coexma.com.py/index.php?tienda=1'),
(238, 'WhatsApp', 'Blas Enciso', '0986292060', 1, '', '', '2021-05-01 17:54:52', '', 9, 'https://www.coexma.com.py/producto.php?id=422'),
(239, 'WhatsApp', 'Manfred', '0981669955', 1, '', '', '2021-05-02 16:37:48', '', 11, 'http://www.coexma.com.py/contactos.php'),
(240, 'WhatsApp', 'Rubens Dario', '0983884499', 1, '', '', '2021-05-03 09:32:06', '', 2, 'https://www.coexma.com.py/index.php?tienda=1'),
(241, 'WhatsApp', 'Angela', '972 968068', 1, '', '', '2021-05-03 10:33:57', '', 4, 'http://www.coexma.com.py/'),
(242, 'WhatsApp', 'Brian', '0985270458', 1, '', '', '2021-05-03 13:58:31', '', 2, 'https://www.coexma.com.py/producto.php?id=365'),
(243, 'WhatsApp', 'Luis Alfonso', '0991585327', 1, '', '', '2021-05-03 16:24:36', '', 11, 'https://www.coexma.com.py/refrigeracion-gastronomia.php'),
(244, 'WhatsApp', 'Marcos lopez', '0972793275', 1, '', '', '2021-05-03 19:31:31', '', 9, 'https://www.coexma.com.py/producto.php?id=80#'),
(245, 'WhatsApp', 'WILSON', '0983962049', 1, '', '', '2021-05-03 23:22:55', '', 3, 'https://www.coexma.com.py/producto.php?id=578'),
(246, 'WhatsApp', 'Agropecuaria San Antonio', '0983 241 143', 1, '', '', '2021-05-04 12:02:28', '', 3, 'https://www.coexma.com.py/index.php?tienda=1'),
(247, 'WhatsApp', 'Rocio gonzalez', '0991684666', 1, '', '', '2021-05-04 13:39:58', '', 7, 'https://www.coexma.com.py/producto.php?id=91'),
(248, 'WhatsApp', 'Pedro ', '0981236302', 1, '', '', '2021-05-04 13:44:33', '', 2, 'https://www.coexma.com.py/categoria.php?cat=1'),
(249, 'WhatsApp', 'Pedro ', '0981236302', 1, '', '', '2021-05-04 13:44:43', '', 2, 'https://www.coexma.com.py/categoria.php?cat=1#'),
(250, 'WhatsApp', 'Pedro ', '0981236302', 1, '', '', '2021-05-04 13:44:50', '', 3, 'https://www.coexma.com.py/categoria.php?cat=1#'),
(251, 'WhatsApp', 'Pedro ', '0981236302', 1, '', '', '2021-05-04 13:45:04', '', 2, 'https://www.coexma.com.py/categoria.php?cat=1#'),
(252, 'WhatsApp', 'Pedro ', '0981236302', 1, '', '', '2021-05-04 13:45:05', '', 2, 'https://www.coexma.com.py/categoria.php?cat=1#'),
(253, 'WhatsApp', 'Pedro ', '0981236302', 1, '', '', '2021-05-04 13:50:35', '', 2, 'https://www.coexma.com.py/categoria.php?cat=1#'),
(254, 'WhatsApp', 'Alexandra Vidal ', '0982616557', 1, '', '', '2021-05-04 14:13:16', '', 3, 'https://www.coexma.com.py/index.php?tienda=1'),
(255, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:48:56', '', 1, 'http://www.coexma.com.py/index.php?tienda=1'),
(256, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:48:57', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(257, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:48:58', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(258, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:48:58', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(259, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:48:59', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(260, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:08', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(261, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:09', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(262, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:09', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(263, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:10', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(264, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:11', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(265, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:11', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(266, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:12', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(267, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:14', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(268, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:14', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(269, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:15', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(270, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:15', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(271, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:16', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(272, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:16', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(273, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:17', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(274, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:19', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(275, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:21', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(276, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:21', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(277, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:22', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(278, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:23', '', 8, 'http://www.coexma.com.py/index.php?tienda=1#'),
(279, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:24', '', 8, 'http://www.coexma.com.py/index.php?tienda=1#'),
(280, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:24', '', 4, 'http://www.coexma.com.py/index.php?tienda=1#'),
(281, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:31', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(282, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:31', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(283, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:31', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(284, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:31', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(285, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:37', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(286, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:38', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(287, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:41', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(288, 'WhatsApp', 'Romina Contreras', '0981587000', 1, '', '', '2021-05-05 12:49:42', '', 1, 'http://www.coexma.com.py/index.php?tienda=1#'),
(289, 'WhatsApp', 'Irma Caceres', '0981341408', 1, '', '', '2021-05-06 09:30:08', '', 9, 'https://www.coexma.com.py/refrigeracion-gastronomia.php'),
(290, 'WhatsApp', 'jose', '595983193300', 1, '', '', '2021-05-06 20:38:18', '', 1, 'https://www.coexma.com.py/producto.php?id=349'),
(291, 'WhatsApp', 'CECILIA ZARACHO', '0994-348-224', 1, '', '', '2021-05-07 15:41:30', '', 8, 'https://www.coexma.com.py/contactos.php'),
(292, 'WhatsApp', 'Jose', '0971406802', 1, '', '', '2021-05-08 11:54:30', '', 6, 'https://www.coexma.com.py/refrigeracion-gastronomia.php'),
(293, 'WhatsApp', 'Jose', '0971406802', 1, '', '', '2021-05-08 11:56:21', '', 9, 'https://www.coexma.com.py/refrigeracion-gastronomia.php#'),
(294, 'WhatsApp', 'Rosangela', '0983385194', 1, '', '', '2021-05-08 12:01:32', '', 3, 'https://www.coexma.com.py/producto.php?id=351'),
(295, 'WhatsApp', 'Sheila', '0983596738', 1, '', '', '2021-05-08 14:48:09', '', 4, 'https://www.coexma.com.py/producto.php?id=322'),
(296, 'WhatsApp', 'Sheila', '0983596738', 1, '', '', '2021-05-08 14:48:13', '', 4, 'https://www.coexma.com.py/producto.php?id=322#'),
(297, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 07:45:03', '', 5, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6'),
(298, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 07:45:07', '', 5, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(299, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 07:45:11', '', 5, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(300, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 07:45:14', '', 5, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(301, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 07:45:15', '', 5, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(302, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 07:45:15', '', 5, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(303, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 07:45:16', '', 5, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(304, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 07:45:19', '', 5, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(305, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 07:45:20', '', 5, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(306, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 07:45:21', '', 5, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(307, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 07:45:22', '', 5, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(308, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 07:45:24', '', 3, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(309, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 07:45:25', '', 3, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(310, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 07:45:26', '', 3, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(311, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 07:45:27', '', 3, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(312, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 07:45:27', '', 3, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(313, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 07:45:32', '', 3, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(314, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 07:45:34', '', 3, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(315, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 07:45:36', '', 3, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(316, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 07:45:37', '', 3, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(317, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 07:45:37', '', 2, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(318, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 07:45:38', '', 2, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(319, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 08:52:43', '', 3, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(320, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 09:11:23', '', 5, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(321, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 09:11:24', '', 5, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(322, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 09:11:25', '', 5, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(323, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 09:11:26', '', 5, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(324, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 09:11:26', '', 5, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(325, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 09:11:29', '', 5, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(326, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 09:11:30', '', 5, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(327, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 09:11:30', '', 5, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(328, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 09:11:37', '', 5, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(329, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 09:11:39', '', 5, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(330, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 09:11:40', '', 5, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(331, 'WhatsApp', 'Jeferson Stolarski ', '0983570377', 1, '', '', '2021-05-10 09:11:46', '', 3, 'http://www.coexma.com.py/categoria.php?cat=3&pageno=6#'),
(332, 'WhatsApp', 'Marco', '+595981850773', 1, '', '', '2021-05-10 10:05:12', '', 8, 'https://www.coexma.com.py/index.php?tienda=1'),
(333, 'WhatsApp', 'Marco', '+595981850773', 1, '', '', '2021-05-10 10:05:18', '', 8, 'https://www.coexma.com.py/index.php?tienda=1#'),
(334, 'WhatsApp', 'Fatima Bareiro', '0981933988', 1, '', '', '2021-05-10 13:50:21', '', 4, 'https://www.coexma.com.py/producto.php?id=517'),
(335, 'WhatsApp', 'Fatima bareiro ', '0981 933988 ', 1, '', '', '2021-05-10 13:52:06', '', 8, 'https://www.coexma.com.py/producto.php?id=515'),
(336, 'WhatsApp', 'Luis', '0971909709', 1, '', '', '2021-05-10 14:46:55', '', 1, 'https://www.coexma.com.py/categoria.php?cat=3&pageno=1'),
(337, 'WhatsApp', 'Luis', '0971909709', 1, '', '', '2021-05-10 14:47:39', '', 1, 'https://www.coexma.com.py/categoria.php?cat=3&pageno=1#'),
(338, 'WhatsApp', 'Luis', '0971909709', 1, '', '', '2021-05-10 14:48:40', '', 1, 'https://www.coexma.com.py/categoria.php?cat=3&pageno=1#'),
(339, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:35:51', '', 9, 'https://www.coexma.com.py/producto.php?id=109'),
(340, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:35:53', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(341, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:35:54', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(342, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:35:56', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(343, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:35:56', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(344, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:35:57', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(345, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:00', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(346, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:00', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(347, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:01', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(348, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:01', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(349, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:04', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(350, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:04', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(351, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:05', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(352, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:07', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(353, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:08', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(354, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:08', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(355, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:09', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(356, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:11', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(357, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:13', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(358, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:13', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(359, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:14', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(360, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:15', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(361, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:15', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(362, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:15', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(363, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:15', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(364, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:15', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(365, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:15', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(366, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:15', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(367, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:16', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(368, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:18', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(369, 'WhatsApp', 'Daniel barreto ', '0994194026', 1, '', '', '2021-05-10 16:36:18', '', 9, 'https://www.coexma.com.py/producto.php?id=109#'),
(370, 'WhatsApp', 'Jun Taniwaki', '0982244833', 1, '', '', '2021-05-10 18:54:32', '', 8, 'https://www.coexma.com.py/producto.php?id=370'),
(371, 'Formulario', 'María del Carmen', '+595981523221', 475, 'mdc_alvarez@hotmail.com', 'Central', '2021-05-10 22:38:47', '', NULL, NULL),
(372, 'WhatsApp', 'Pedro costa', '0991396591', 1, '', '', '2021-05-11 08:49:09', '', 8, 'https://www.coexma.com.py/index.php?tienda=1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_ped_detalle`
--

CREATE TABLE `tb_ped_detalle` (
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_stock` int(11) NOT NULL,
  `combinacion` varchar(100) DEFAULT NULL,
  `valor_unitario` double NOT NULL,
  `ctd` int(11) NOT NULL,
  `descuento` double DEFAULT NULL,
  `valor_total` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_ped_detalle`
--

INSERT INTO `tb_ped_detalle` (`id_pedido`, `id_producto`, `id_stock`, `combinacion`, `valor_unitario`, `ctd`, `descuento`, `valor_total`) VALUES
(84, 331, 169, '', 1190000, 1, 0, 1190000),
(84, 503, 216, '', 1185000, 1, 0, 1185000),
(83, 324, 163, '', 838000, 1, 0, 838000),
(83, 326, 165, '', 208000, 3, 0, 624000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_ped_status`
--

CREATE TABLE `tb_ped_status` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(80) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_ped_status`
--

INSERT INTO `tb_ped_status` (`id`, `descripcion`) VALUES
(0, 'Pendiente'),
(1, 'En Revisión'),
(2, 'Aprobado'),
(3, 'Enviado'),
(4, 'Entregado'),
(5, 'Cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_preguntas`
--

CREATE TABLE `tb_preguntas` (
  `id` int(11) NOT NULL,
  `pregunta` varchar(150) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_preguntas`
--

INSERT INTO `tb_preguntas` (`id`, `pregunta`, `activo`) VALUES
(1, 'Cómo valora la atención recibida? El vendedor comprendió sus necesidades?', 1),
(2, 'La calidad del producto es la esperada?', 1),
(3, 'En caso de que haya adquirido muebles corporativos, está satisfecho con el montaje y la entrega?', 1),
(4, 'Cuál es la probabilidad de que vuelva a comprar nuestros productos?', 1),
(5, 'En general, está satisfecho con esta compañía?', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_preguntas_opciones`
--

CREATE TABLE `tb_preguntas_opciones` (
  `id` int(11) DEFAULT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `valor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_preguntas_opciones`
--

INSERT INTO `tb_preguntas_opciones` (`id`, `id_pregunta`, `valor`) VALUES
(1, 1, 'Todas mis necesidades fueron comprendidas'),
(2, 1, 'Algunas necesidades no fueron comprendidas'),
(3, 1, ' El vendedor no comprendió lo que necesitaba.'),
(4, 1, ' Insuficiente, no recibí respuesta.'),
(5, 2, 'Supera mis expectativas de calidad'),
(6, 2, ' Resuelve mis necesidades sin más'),
(7, 2, 'Es útil, pero hay opciones mejores'),
(8, 2, 'No resuelve mis necesidades'),
(9, 3, 'Muy Satisfecho'),
(10, 3, 'Satisfecho'),
(11, 3, 'Poco Satisfecho'),
(12, 3, 'Insatisfecho'),
(13, 4, 'Muy Probable'),
(14, 4, 'Probable'),
(15, 4, 'Poco Probable'),
(16, 4, 'Improbable'),
(17, 5, 'Altamente satisfecho'),
(18, 5, 'Muy satisfecho'),
(19, 5, 'Satisfecho'),
(20, 5, 'Poco Satisfecho');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_preguntas_respuestas`
--

CREATE TABLE `tb_preguntas_respuestas` (
  `id_res` int(11) NOT NULL,
  `id` varchar(50) DEFAULT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `id_respuesta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_preguntas_respuestas`
--

INSERT INTO `tb_preguntas_respuestas` (`id_res`, `id`, `id_pregunta`, `id_respuesta`) VALUES
(6, 'f1fc554c2c16abb8', 1, 1),
(7, 'f1fc554c2c16abb8', 2, 6),
(8, 'f1fc554c2c16abb8', 3, 10),
(9, 'f1fc554c2c16abb8', 4, 14),
(10, 'f1fc554c2c16abb8', 5, 19),
(11, 'd85dcf98e4e68b53', 1, 1),
(12, 'd85dcf98e4e68b53', 2, 5),
(13, 'd85dcf98e4e68b53', 3, 9),
(14, 'd85dcf98e4e68b53', 4, 13),
(15, 'd85dcf98e4e68b53', 5, 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_producto`
--

CREATE TABLE `tb_producto` (
  `id` int(20) NOT NULL,
  `referencia` varchar(20) DEFAULT NULL,
  `nombre` varchar(80) NOT NULL,
  `descripcion_corta` text NOT NULL,
  `descripcion_detallada` text NOT NULL,
  `precio` double DEFAULT '0',
  `stock` int(11) DEFAULT '0',
  `valor_descuento` double DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `valor_mayorista` int(11) DEFAULT NULL,
  `id_marca` int(11) NOT NULL,
  `id_linea` int(11) DEFAULT NULL,
  `destaque` tinyint(1) NOT NULL,
  `recomendado` int(11) NOT NULL DEFAULT '0',
  `oden_destaque` int(11) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  `unique_hits` int(11) DEFAULT NULL,
  `total_hits` int(11) DEFAULT NULL,
  `modelo` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_producto`
--

INSERT INTO `tb_producto` (`id`, `referencia`, `nombre`, `descripcion_corta`, `descripcion_detallada`, `precio`, `stock`, `valor_descuento`, `descripcion`, `valor_mayorista`, `id_marca`, `id_linea`, `destaque`, `recomendado`, `oden_destaque`, `activo`, `unique_hits`, `total_hits`, `modelo`) VALUES
(33, '5705', 'Armario Bajo con Puertas 5705', 'Super y compacto armario para guardar todo los papeles y artículos de la oficina', '<p>Llave en la parte interna para trabar todas las puertas</p>\r\n\r\n<p>Puertas de correr con perfil en PS</p>\r\n\r\n<p>1 bandeja fija, sin divisoria interna entre las puertas</p>\r\n', 0, 0, 0, '', NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, '5705'),
(34, '000293', 'Caja Fuerte 40', 'Con la caja fuerte EDW de COEXMA mantén seguro sus objetos de valores y documentos importantes. ', '<p><strong>Medidas Externas: Largo:</strong> 0,38&nbsp;cm -&nbsp;&nbsp;<strong>Alto:</strong>&nbsp;0,40&nbsp;cm&nbsp; -&nbsp;&nbsp;<strong>Profundidad:</strong>&nbsp;0,35&nbsp;cm&nbsp;</p>\r\n\r\n<p><strong>Medidas Internas:&nbsp; Largo:</strong> 0,29&nbsp;cm -&nbsp;&nbsp;<strong>Alto:</strong>&nbsp;0,26&nbsp;cm&nbsp; -&nbsp;&nbsp;<strong>Profundidad:</strong>&nbsp;0,26&nbsp;cm</p>\r\n\r\n<p><strong>Pesa: </strong>80&nbsp;kilos</p>\r\n', 0, 0, 0, '', NULL, 8, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(35, '98264', 'Call Center Simple 98264', 'Call Center para trabajo, elegante y muy moderno en su estilo', '<p><strong>Largo:</strong> 90 cm</p>\r\n\r\n<p><strong>Alto</strong>: 120 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 81 cm</p>\r\n', 0, 0, 0, '', NULL, 9, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(36, '90116', 'Mesa en L Reunión con Pie OP de Metal 90116', 'Elegante mesa de Reunión diseño minimalista con pies opcional en metal ', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong> 140 x 180 xcm</p>\r\n\r\n<p><strong>Altura:</strong> &nbsp;75 cm</p>\r\n\r\n<p><strong>Profundidad:&nbsp;</strong>60 cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, '', NULL, 9, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(38, '10634', 'Cajonero Fijo de 2 Cajones con llave lateral MU-15301', 'Cajoneros fijos de 2 cajones con llave lateral para guardar y mantener seguro tus documentos de la oficina', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;0,36 cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,21 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,395 cm</p>\r\n', 200000, 0, 0, '', NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(39, '5774', 'Balcón de Recepción Tamburato 5774', 'Un robusto y sofisticado mueble para recepción de clientes, especial para todo tipo de oficinas', '<p>Un robusto y sofisticado mueble para recepci&oacute;n de clientes, especial para todo tipo de oficinas</p>\r\n', 0, 0, 0, '', NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(40, '004179', 'Estante Metálico 5 Bandejas ', 'Estante de metal con 5 bandejas ajustables de a cuerdo a su necesidad, chapa leve de 26 que soporta 25 kilos bien distribuidos', '<p><strong>Cantidad: </strong>5 Bandejas</p>\r\n\r\n<p><strong>Altura:</strong> 2,00 cm</p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;0,92 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,30 cm</p>\r\n\r\n<p><strong>Capacidad: </strong>25&nbsp;kg. por bandeja</p>\r\n\r\n<p><strong>Chapa:</strong> 26</p>\r\n', 382000, 0, 0, '', NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(41, '11429', 'Mesa Angular Create 390007', 'Moderna, robusta, buen diseño especial para montar en una oficina con su estilo angular', '<p><strong>390007</strong></p>\r\n\r\n<p><strong>Largo:</strong> 140 X 140 cm</p>\r\n\r\n<p><strong>Altura:</strong> 74 cm</p>\r\n\r\n<p><strong>Profundidad</strong>: 60 cm</p>\r\n', 0, 0, 0, '', NULL, 9, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(42, '12583', 'Cajonero móvil 3 cajones  ATC4640', 'Cajonero móvil con 2 cajones normales con llaves y 1 para carpetas colgantes ', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;0,46&nbsp;cm</p>\r\n\r\n<p><strong>Alto:</strong>&nbsp;0,67&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,40 cm</p>\r\n', 570000, 0, 0, '', NULL, 16, 3, 0, 1, NULL, 1, NULL, NULL, ''),
(43, 'Soporte', 'Soporte para monitor', '', '', 0, 0, 0, '', NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(45, 'Apas2000', 'Armario para panes Apas2000', '', '<p><strong>INFORMACIONES DEL PRODUCTO</strong></p>\r\n\r\n<p>&bull; Iluminaci&oacute;n fluorescente</p>\r\n\r\n<p>&bull; 100% laminado 15mm&nbsp;</p>\r\n\r\n<p>&bull; Largo: 1,00mts</p>\r\n\r\n<p>&bull; Altura: 1,87mts</p>\r\n\r\n<p>&bull; Profundidad: 67cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 0, NULL, NULL, ''),
(46, 'ASFL-3PP', 'Visacooler Fríos y Lácteos ASFL-3PP', '', '<p><strong>INFORMACIONES DEL PRODUCTO</strong></p>\r\n\r\n<p>&bull; Controlador de temperatura&nbsp;digital.&nbsp;</p>\r\n\r\n<p>&bull; Temperatura regulable de&nbsp;3 a 10 grados.</p>\r\n\r\n<p>&bull; 4 niveles de rejilla con&nbsp;altura ajustable.</p>\r\n\r\n<p>&bull; Pies regulables.</p>\r\n\r\n<p>&bull; Iluminaci&oacute;n Led.</p>\r\n\r\n<p>&bull; Largo: 84cm</p>\r\n\r\n<p>&bull; Altura: 1,89mts</p>\r\n\r\n<p>&bull; Profundidad: 57cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 7, 1, 0, NULL, 1, NULL, NULL, ''),
(47, 'BBP1000', 'Balcón de Pesaje Línea Plus BBP1000', 'Balcón de Pesaje Línea Plus BBP1000', '<p>&bull; Estructura en chapa de acero con pintura blanca anticorrosiva</p>\r\n\r\n<p>&bull; Largo: 1,00mts</p>\r\n\r\n<p>&bull; Altura: 84cm</p>\r\n\r\n<p>&bull; Profundidad: 71cm</p>\r\n\r\n<p>&bull; Utilizaci&oacute;n: Para balanzas</p>\r\n', 0, 0, 0, NULL, NULL, 6, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(48, 'VNPCX730', 'Vitrina New Panorámica Caja VNPCX730', 'Vitrina New Panorámica Caja VNPCX730', '<p>&bull; Exposici&oacute;n de productos secos</p>\r\n\r\n<p>&bull; Temperatura:&nbsp; Ambiente</p>\r\n\r\n<p>&bull; Patas regulables</p>\r\n\r\n<p>&bull; Largo: 1,26mts</p>\r\n\r\n<p>&bull; Altura:&nbsp; 1,13mts</p>\r\n\r\n<p>&bull; Profundidad: 70cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 7, 0, 0, NULL, 1, NULL, NULL, ''),
(49, 'BSR-2000', 'Mesada de Trabajo Refrigerada c/ Cuba BSR-2000', 'Mesada de Trabajo Refrigerada c/ Cuba BSR-2000', '<p>&bull; Almacenamiento de productos refrigerados</p>\r\n\r\n<p>&bull; Temperatura: 0&deg;C a 5&deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: Est&aacute;tica</p>\r\n\r\n<p>&bull; Controlador de temperatura electr&oacute;nico digital</p>\r\n\r\n<p>&bull; Puertas con cierre autom&aacute;tico</p>\r\n\r\n<p>&bull; Aislamiento en poliuretano inyectado</p>\r\n\r\n<p>&bull; Patas regulables</p>\r\n\r\n<p>&bull; Con cuba</p>\r\n', 0, 0, 0, NULL, NULL, 6, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(421, 'BSRC-2000', 'Mesada de Trabajo Refrigerada BSRC-2000', 'Mesada de Trabajo Refrigerada BSRC-2000', '<p>&bull; Almacenamiento de productos refrigerados</p>\r\n\r\n<p>&bull; Temperatura: 0&deg;C a 5&deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: Est&aacute;tica</p>\r\n\r\n<p>&bull; Controlador de temperatura electr&oacute;nico digital</p>\r\n\r\n<p>&bull; Puertas con cierre autom&aacute;tico</p>\r\n\r\n<p>&bull; Aislamiento en poliuretano inyectado</p>\r\n\r\n<p>&bull; Patas regulables&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(50, 'EIP3000', 'Isla para Congelados Doble Acción EIP3000', 'Isla para Congelados Doble Acción EIP3000', '<p><strong>INFORMACIONES DEL PRODUCTO</strong></p>\r\n\r\n<p><br />\r\n&bull; Utilizaci&oacute;n de productos congelados o refrigerados</p>\r\n\r\n<p>&bull; Temperatura: 0&deg;C a 7&deg;C o -18&deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: Est&aacute;tica</p>\r\n\r\n<p>&bull; Parrilas divisorias</p>\r\n\r\n<p>&bull; Molduras en PVC</p>\r\n\r\n<p>&bull; Patas Regulables</p>\r\n\r\n<p>&bull; 4 Puertas</p>\r\n\r\n<p>&bull; Volumen: 86</p>\r\n\r\n<p>&bull; Tapa de vidrio plano</p>\r\n\r\n<p>&bull; Largo: 3,00mts</p>\r\n\r\n<p>&bull; Altura: 97cm</p>\r\n\r\n<p>&bull; Profundidad: 83cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(51, 'COTE2050', 'Check-out COTE2050', 'Check-out COTE2050', '<p>&bull; Tapa de acero inoxidable</p>\r\n\r\n<p>&bull; Estructura en chapa de acero con pintura anticorrosiva</p>\r\n\r\n<p>&bull; Caja con llave</p>\r\n\r\n<p>&bull; Patas regulables</p>\r\n\r\n<p>&bull; Kit de automatizaci&oacute;n</p>\r\n\r\n<p>&bull; Altura: 93cm</p>\r\n\r\n<p>&bull; Largo: 2,05mts</p>\r\n\r\n<p>&bull; Profundidad: 1,00mts</p>\r\n', 0, 0, 0, NULL, NULL, 6, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(52, 'FCCE-24CX', 'Frutera central FCCE-24CX', 'Frutera central FCCE-24CX', '<p>&bull; Estructura met&aacute;lica</p>\r\n\r\n<p>&bull; Patas regulables</p>\r\n\r\n<p>&bull; Altura: 1,85mts</p>\r\n\r\n<p>&bull; Largo: 1,86mts</p>\r\n\r\n<p>&bull; Profundidad: 2,10mts</p>\r\n\r\n<p>&bull; Con espejo</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(450, 'FLSE-12CX', 'Frutera central FLSE-12CX', 'Frutera central FLSE-12CX', '<p>&bull; Estructura met&aacute;lica</p>\r\n\r\n<p>&bull; Patas regulables</p>\r\n\r\n<p>&bull; Altura: 1,35mts</p>\r\n\r\n<p>&bull; Largo: 1,86mts</p>\r\n\r\n<p>&bull; Profundidad: 1,05mts</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(53, 'BM-122', 'Licuadora industrial basculante BM-122 (Baja rotación)', '', '<p>INFORMACIONES DEL PRODUCTO</p>\r\n\r\n<p><br />\r\n&bull; Codigo: BM-122</p>\r\n\r\n<p>&bull; Estructura y vaso en acero inox</p>\r\n\r\n<p>&bull; Cuchillas en acero inox reforzadas</p>\r\n\r\n<p>&bull; Capacidad: 15 Litros</p>\r\n\r\n<p>&bull; Rotaci&oacute;n: Baja</p>\r\n\r\n<p>&bull; Altura: 1,22mts</p>\r\n\r\n<p>&bull; Largo: 34cm</p>\r\n\r\n<p>&bull; Potencia y motor: 1HP</p>\r\n\r\n<p>&bull; Mezclas y salsas en general</p>\r\n', 0, 0, 0, NULL, NULL, 13, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(54, '104-002', 'Carrito para supermercado 90LTS 104-002', 'Carrito para supermercado 90LTS 104-002', '<p>&bull; C&oacute;digo S: 06556</p>\r\n\r\n<p>&bull; Largo: 51cm</p>\r\n\r\n<p>&bull; Altura: 96cm</p>\r\n\r\n<p>&bull; Profundidad: 82cm</p>\r\n', 0, 0, 0, NULL, NULL, 14, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(452, '105-002', 'Carrito para supermercado 130LTS 105-002', 'Carrito para supermercado 130LTS 105-002', '<p>&bull; C&oacute;digo:&nbsp;105-002</p>\r\n\r\n<p>&bull; C&oacute;digo S ROJO: 06709</p>\r\n\r\n<p>&bull; C&oacute;digo S AZUL: 11479</p>\r\n\r\n<p>&bull; Largo: 51cm</p>\r\n\r\n<p>&bull; Altura: 97cm</p>\r\n\r\n<p>&bull; Profundidad: 87cm</p>\r\n', 0, 0, 0, NULL, NULL, 14, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(55, 'Persianas Horizontal', 'Persianas Horizontales', 'Persianas Horizontales', '<p>Persianas horizontales de Aluminio 25mm</p>\r\n', 0, 0, 0, NULL, NULL, 16, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(56, 'Persianas Verticales', 'Persianas Verticales', 'Persianas Verticales en PVC de 90mm', '<p>Persianas Verticales en PVC de 90mm</p>\r\n', 0, 0, 0, NULL, NULL, 16, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(57, 'Persianas en Tela', 'Persianas Verticales en Tela', 'Persianas verticales en tela de 90mm', '<p>Persianas verticales en tela de 90mm</p>\r\n', 0, 0, 0, NULL, NULL, 16, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(58, 'Persianas Roló', 'Persianas Roló', 'Persianas Roló,  clean y moderna, combina con diversos estilos de decoración.', '<p>Es clean y moderna, combina con diversos estilos de decoraci&oacute;n.</p>\r\n', 0, 0, 0, NULL, NULL, 16, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(59, 'Persianas Romanas', 'Persianas Romanas', 'Persianas romanas en tela', '<p>Persianas romanas en tela</p>\r\n', 0, 0, 0, NULL, NULL, 16, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(60, 'Persiana Double', 'Persiana Double Visión ', 'Persiana Double Visión ', '<p>Persiana Double Visi&oacute;n&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 16, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(61, 'Plataforma 98181', 'Plataforma de Trabajo Dupla Pie Painel 98181', 'Plataforma de trabajo dupla pie Painel 98181', '<p><strong>Largo: </strong>120 cm</p>\r\n\r\n<p><strong>Altura:</strong> 74 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 133 cm</p>\r\n', 0, 0, 0, NULL, NULL, 9, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(62, '12104', 'Cajonero Móvil 4 Cajones ATC4641', 'Cajonero Móvil 4 Cajones y llave', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;0,46 cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,67 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,40 cm</p>\r\n', 570000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(63, 'BOX 36105 1L ', 'Sofá de espera BOX 36105 1L ', 'Cómodo y sofisticado sofá de espera, para que tus invitados, clientes y amigos se sientan a gusto en tu oficina o sala de espera', '<p>C&oacute;modo y sofisticado sof&aacute; de espera, para que tus invitados, clientes y amigos se sientan a gusto en tu oficina o sala de espera</p>\r\n', 0, 0, 0, NULL, NULL, 5, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(64, '002625', 'Estante metálico 6 bandejas ', 'Estante de metal con 6 bandejas ajustables de a cuerdo a su necesidad, chapa leve de 26 que soporta 25 kilos bien distribuidos', '<p><strong>Cantidad: </strong>5 Bandejas</p>\r\n\r\n<p><strong>Altura:</strong> 2,00 cm</p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;0,92 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,30 cm</p>\r\n\r\n<p><strong>Capacidad: </strong>25&nbsp;kg. por bandeja</p>\r\n\r\n<p><strong>Chapa:</strong> 26</p>\r\n', 420000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(65, '13193', 'Mesa recta tamburato 1700 5894 ', 'Moderna, robusta, buen diseño especial para montar en una oficina con su estilo recto minimalista', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong> 1,70 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,60 cm</p>\r\n\r\n<p><strong>Altura: </strong>0,76&nbsp;cm</p>\r\n', 1111000, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(66, 'Amazonas Paraguay', 'Proyectos para Oficinas, reuniones y Sala de estar', 'Hacemos los proyectos segun tus gustos, medidas y solicitud, para dejar mas top que nunca tu oficina, sala de estar o algun proyecto', '<p>Hacemos los proyectos segun tus gustos, medidas y solicitud, para dejar mas top que nunca tu oficina, sala de estar o algun proyecto</p>\r\n', 0, 0, 0, NULL, NULL, 5, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(67, 'MFG75', 'Fabricadora de Hielo  MFG75', 'Fabricadora de Hielo  MFG75', '<p>&bull; Largo: 56cm</p>\r\n\r\n<p>&bull; Profundidad: 62cm</p>\r\n\r\n<p>&bull; Altura: 1,17mts</p>\r\n\r\n<p>&bull; Altura total: 1,28mts</p>\r\n\r\n<p>&bull; Capacidad de producci&oacute;n: 75kg en 24hrs</p>\r\n\r\n<p>&bull; Indicadores LED de funcionalidad en el exterior de la m&aacute;quina</p>\r\n\r\n<p>&bull; Acompa&ntilde;a filtro y 2 metros de manguera</p>\r\n\r\n<p>&bull; Dep&oacute;sito con capacidad: 25kg de almacenamiento</p>\r\n\r\n<p>&bull; Aislamiento de puliuretano inyectado</p>\r\n\r\n<p>&bull; Revestimiento externo en acero inoxidable 304</p>\r\n\r\n<p>&bull; S&oacute;tano de almacenamiento en vacuum-form</p>\r\n\r\n<p>&bull; Regulador del tama&ntilde;o de los hielos: peque&ntilde;o, mediano y grande</p>\r\n\r\n<p>&bull; Estructura del mecanismo de transformaci&oacute;n (l&iacute;quido o s&oacute;lido) de acero inoxidable 304</p>\r\n\r\n<p>&bull; Antideslizantes pies de goma con ajuste de altura</p>\r\n\r\n<p>&bull; Para un perfecto funcionamiento, la m&aacute;quina debe ser instalada en ambiente con temperatura controlada en torno de 22&deg;C y limpio, siendo que la temperatura del agua, que entrar&aacute; a la m&aacute;quina no puede ultrapasar 22&deg;C</p>\r\n\r\n<p>&bull; La capacidad de producci&oacute;n de las m&aacute;quinas, estar&aacute; directamente relacionada a la temperatura ambiente , la temperatura del agua y la calidad del medio ambiente (Aire libre de harina, lejos de Hornos, totalmente protegido interperios, etc.) Donde las mismas ser&aacute;n instaladas.</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(68, 'MFG150', 'Fabricadora de Hielo MFG150', '', '<p>&bull; Largo: 90cm</p>\r\n\r\n<p>&bull; Profundidad: 62cm</p>\r\n\r\n<p>&bull; Altura: 1,17mts</p>\r\n\r\n<p>&bull; Altura total: 1,28mts</p>\r\n\r\n<p>&bull; Capacidad de producci&oacute;n: 150kg en 24hrs</p>\r\n\r\n<p>&bull; Indicadores LED de funcionalidad en el exterior de la m&aacute;quina</p>\r\n\r\n<p>&bull; Acompa&ntilde;a filtro y 2 metros de manguera</p>\r\n\r\n<p>&bull; Dep&oacute;sito con capacidad: 50kg de almacenamiento</p>\r\n\r\n<p>&bull; Aislamiento de puliuretano inyectado</p>\r\n\r\n<p>&bull; Revestimiento externo en acero inoxidable 304</p>\r\n\r\n<p>&bull; S&oacute;tano de almacenamiento en vacuum-form</p>\r\n\r\n<p>&bull; Regulador del tama&ntilde;o de los hielos: peque&ntilde;o, mediano y grande</p>\r\n\r\n<p>&bull; Estructura del mecanismo de transformaci&oacute;n (l&iacute;quido o s&oacute;lido) de acero inoxidable 304</p>\r\n\r\n<p>&bull; Antideslizantes pies de goma con ajuste de altura</p>\r\n\r\n<p>&bull; Para un perfecto funcionamiento, la m&aacute;quina debe ser instalada en ambiente con temperatura controlada en torno de 22&deg;C y limpio, siendo que la temperatura del agua, que entrar&aacute; a la m&aacute;quina no puede ultrapasar 22&deg;C</p>\r\n\r\n<p>&bull; La capacidad de producci&oacute;n de las m&aacute;quinas, estar&aacute; directamente relacionada a la temperatura ambiente , la temperatura del agua y la calidad del medio ambiente (Aire libre de harina, lejos de Hornos, totalmente protegido interperios, etc.) Donde las mismas ser&aacute;n instaladas.</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(69, 'MFG50', 'Fabricadora de hielo MFG50', 'Fabricadora de hielo MFG50', '<p>&bull; Largo: 46cm</p>\r\n\r\n<p>&bull; Profundidad: 62cm</p>\r\n\r\n<p>&bull; Altura: 65cm</p>\r\n\r\n<p>&bull; Altura total: 77cm</p>\r\n\r\n<p>&bull; Capacidad de producci&oacute;n: 50kg en 24hrs</p>\r\n\r\n<p>&bull; Indicadores LED de funcionalidad en el interior de la m&aacute;quina</p>\r\n\r\n<p>&bull; Acompa&ntilde;a filtro y 2 metros de manguera</p>\r\n\r\n<p>&bull; Dep&oacute;sito con capacidad: 6kg de almacenamiento</p>\r\n\r\n<p>&bull; Aislamiento de puliuretano inyectado</p>\r\n\r\n<p>&bull; Revestimiento externo en acero inoxidable 304</p>\r\n\r\n<p>&bull; S&oacute;tano de almacenamiento en vacuum-form</p>\r\n\r\n<p>&bull; Regulador del tama&ntilde;o de los hielos: peque&ntilde;o, mediano y grande</p>\r\n\r\n<p>&bull; Estructura del mecanismo de transformaci&oacute;n (l&iacute;quido o s&oacute;lido) de acero inoxidable 304</p>\r\n\r\n<p>&bull; Antideslizantes pies de goma con ajuste de altura</p>\r\n\r\n<p>&bull; Para un perfecto funcionamiento, la m&aacute;quina debe ser instalada en ambiente con temperatura controlada en torno de 22&deg;C y limpio, siendo que la temperatura del agua, que entrar&aacute; a la m&aacute;quina no puede ultrapasar 22&deg;C</p>\r\n\r\n<p>&bull; La capacidad de producci&oacute;n de las m&aacute;quinas, estar&aacute; directamente relacionada a la temperatura ambiente , la temperatura del agua y la calidad del medio ambiente (Aire libre de harina, lejos de Hornos, totalmente protegido interperios, etc.) Donde las mismas ser&aacute;n instaladas.</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(70, 'VCCG600S', 'Autoservicios para Congelados VCCG600S', 'Autoservicios para Congelados VCCG600S', '<p>&bull; Exposici&oacute;n de productos congelados</p>\r\n\r\n<p>&bull; Temperatura: 0&deg;C a 7&deg;C o -12&deg;C a&nbsp; -15&deg;c</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: Est&aacute;tica</p>\r\n\r\n<p>&bull; Controlador de temperatura mec&aacute;nica de doble acci&oacute;n</p>\r\n\r\n<p>&bull; Estantes regulables</p>\r\n\r\n<p>&bull; Puertas con cierre autom&aacute;tico</p>\r\n\r\n<p>&bull; C&oacute;digo: VCCG600S</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(71, 'ASFL3000', 'Autoservicios Fríos y Lácteos ASFL3000', 'Autoservicios Fríos y Lácteos ASFL3000', '<p>- Exposici&oacute;n de productos fr&iacute;os y l&aacute;cteos</p>\r\n\r\n<p>- Temperatura: 3&deg; a 10&deg;C</p>\r\n\r\n<p>- Refrigeraci&oacute;n: Aire forzado</p>\r\n\r\n<p>- Controlador de temperatura electr&oacute;nico&nbsp;</p>\r\n\r\n<p>- Iluminaci&oacute;n LED</p>\r\n\r\n<p>- Estantes regulables</p>\r\n\r\n<p>- C&oacute;digo fabricante: ASFL3000</p>\r\n\r\n<p>- Altura: 2,10mts</p>\r\n\r\n<p>- Largo: 2,90mts</p>\r\n\r\n<p>- Profundidad: 61cm</p>\r\n\r\n<p>- Volumen: 1950</p>\r\n\r\n<p>- Estante: 5</p>\r\n\r\n<p>- Puerta: 5</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(72, 'AUTOSERVICIOS ', 'Autoservicios Bebidas', 'Autoservicios Bebidas', '<p>Autoservicios Bebidas</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(73, 'ASFL-3PP', 'Visacooler Frios y Lacteos ASFL-3PP', 'Visacooler Frios y Lacteos ASFL-3PP', '<p>&bull; Controlador de temperatura&nbsp;digital.&nbsp;</p>\r\n\r\n<p>&bull; Temperatura regulable de&nbsp;3 a 10 grados.</p>\r\n\r\n<p>&bull; 4 niveles de rejilla con&nbsp;altura ajustable.</p>\r\n\r\n<p>&bull; Pies regulables.</p>\r\n\r\n<p>&bull; Iluminaci&oacute;n Led.</p>\r\n\r\n<p>&bull; Largo: 84cm</p>\r\n\r\n<p>&bull; Altura: 1,89mts</p>\r\n\r\n<p>&bull; Profundidad: 57cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 7, 0, 0, NULL, 0, NULL, NULL, ''),
(74, 'ASFL2000', 'Autoservicio Fríos y Lácteos ASFL2000', 'Autoservicio Fríos y Lácteos ASFL2000', '<p>- Exposici&oacute;n de productos fr&iacute;os y l&aacute;cteos</p>\r\n\r\n<p>- Temperatura: 3&deg; a 10&deg;C</p>\r\n\r\n<p>- Refrigeraci&oacute;n: Aire forzado</p>\r\n\r\n<p>- Controlador de temperatura electr&oacute;nico&nbsp;</p>\r\n\r\n<p>- Iluminaci&oacute;n LED</p>\r\n\r\n<p>- Estantes regulables</p>\r\n\r\n<p>- C&oacute;digo fabricante: ASFL2000</p>\r\n\r\n<p>- Altura: 2,10mts</p>\r\n\r\n<p>- Largo: 1,80mts</p>\r\n\r\n<p>- Profundidad: 61cm</p>\r\n\r\n<p>- Volumen: 1260</p>\r\n\r\n<p>- Estante: 5</p>\r\n\r\n<p>- Puerta: 3</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(75, 'ASFL1240', 'Autoservicio Fríos y Lácteos ASFL1240', 'Autoservicio Fríos y Lácteos ASFL1240', '<p>- Exposici&oacute;n de productos fr&iacute;os y l&aacute;cteos</p>\r\n\r\n<p>- Temperatura: 3&deg; a 10&deg;C</p>\r\n\r\n<p>- Refrigeraci&oacute;n: Aire forzado</p>\r\n\r\n<p>- Controlador de temperatura electr&oacute;nico&nbsp;</p>\r\n\r\n<p>- Iluminaci&oacute;n LED</p>\r\n\r\n<p>- Estantes regulables</p>\r\n\r\n<p>- C&oacute;digo fabricante: ASFL1240</p>\r\n\r\n<p>- Altura: 2,10mts</p>\r\n\r\n<p>- Largo: 1,24mts</p>\r\n\r\n<p>- Profundidad: 61cm</p>\r\n\r\n<p>- Volumen: 750</p>\r\n\r\n<p>- Estante: 5</p>\r\n\r\n<p>- Puerta: 2</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(76, 'ASAC1200', 'Auto Atendimiento Abierto Conveniencia ASAC1200', 'Auto Atendimiento Abierto Conveniencia ASAC1200', '<p>Exposici&oacute;n de productos fr&iacute;os y l&aacute;cteos</p>\r\n\r\n<p>Temperatura: 3&deg; a 10&deg;C</p>\r\n\r\n<p>Refrigeraci&oacute;n: Aire forzado</p>\r\n\r\n<p>Controlador de temperatura electr&oacute;nico&nbsp;</p>\r\n\r\n<p>Iluminaci&oacute;n LED</p>\r\n\r\n<p>Estantes regulables</p>\r\n\r\n<p>Cortinas nocturnas</p>\r\n\r\n<p>C&oacute;digo fabricante: ASAC1200</p>\r\n\r\n<p>Altura: 1,89mts</p>\r\n\r\n<p>Largo: 1,20mts</p>\r\n\r\n<p>Profundidad: 85cm</p>\r\n\r\n<p>Volumen: 930</p>\r\n\r\n<p>Estante: 4</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(77, 'ASAC900', 'Auto Atendimiento Abierto Conveniencia ASAC900', 'Auto Atendimiento Abierto Conveniencia ASAC900', '<p>Exposici&oacute;n de productos fr&iacute;os y l&aacute;cteos</p>\r\n\r\n<p>Temperatura: 3&deg; a 10&deg;C</p>\r\n\r\n<p>Refrigeraci&oacute;n: Aire forzado</p>\r\n\r\n<p>Controlador de temperatura electr&oacute;nico&nbsp;</p>\r\n\r\n<p>Iluminaci&oacute;n LED</p>\r\n\r\n<p>Estantes regulables</p>\r\n\r\n<p>Cortinas nocturnas</p>\r\n\r\n<p>C&oacute;digo fabricante: ASAC900</p>\r\n\r\n<p>Altura: 1,89mts</p>\r\n\r\n<p>Largo: 90cm</p>\r\n\r\n<p>Profundidad: 85cm</p>\r\n\r\n<p>Volumen: 600</p>\r\n\r\n<p>Estante: 4</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(78, 'VCM400', 'Visacooler Multi Uso VCM400', 'Visacooler Multi Uso VCM400', '<p>&bull; C&oacute;digo: VCM400</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: Aire forzado</p>\r\n\r\n<p>&bull; Controlador de temperatura:&nbsp; termostato m&eacute;canico</p>\r\n\r\n<p>&bull; Iluminaci&oacute;n: LED&nbsp; fijada en la parte interna superior</p>\r\n\r\n<p>&bull; Temperatura: 2&deg;C a 6&deg;C</p>\r\n\r\n<p>&bull; Altura: 2,01mts</p>\r\n\r\n<p>&bull; Largo: 59cm</p>\r\n\r\n<p>&bull; Profundidad: 61cm</p>\r\n\r\n<p>&bull; Puerta de vidrio templado doble con gas arg&oacute;n</p>\r\n\r\n<p>&bull; Estantes de malla de alambre de tres niveles con pintura epoxi&nbsp;blanca, con ajuste de altura</p>\r\n\r\n<p>&bull; Pies regulables</p>\r\n\r\n<p>&bull; Vidrio sujeto a condensaci&oacute;n dependiendo de la variaci&oacute;n&nbsp;</p>\r\n\r\n<p>de la humedad relativa</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(79, 'VCM400', 'Visacooler Multi Uso VCM400', 'Visacooler Multi Uso VCM400', '<p>&bull; C&oacute;digo: VCM400</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: Aire forzado</p>\r\n\r\n<p>&bull; Controlador de temperatura: &nbsp;termostato m&eacute;canico</p>\r\n\r\n<p>&bull; Iluminaci&oacute;n: LED &nbsp;fijada en la parte interna superior</p>\r\n\r\n<p>&bull; Temperatura: 2&deg;C a 6&deg;C</p>\r\n\r\n<p>&bull; Altura: 2,01mts</p>\r\n\r\n<p>&bull; Largo: 59cm</p>\r\n\r\n<p>&bull; Profundidad: 61cm</p>\r\n\r\n<p>&bull; Puerta de vidrio templado doble con gas arg&oacute;n</p>\r\n\r\n<p>&bull; Estantes de malla de alambre de tres niveles con pintura epoxi blanca, con ajuste de altura</p>\r\n\r\n<p>&bull; Pies regulables</p>\r\n\r\n<p>&bull; Vidrio sujeto a condensaci&oacute;n dependiendo de la variaci&oacute;n&nbsp;</p>\r\n\r\n<p>de la humedad relativa</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(80, 'VCC400S', 'Visacooler para Cerveza Puerta Solida VCC400S', 'Visacooler para Cerveza Puerta Solida VCC400S', '<p>&bull; C&oacute;digo: VCC-400S</p>\r\n\r\n<p>&bull; Altura: 1,92mts</p>\r\n\r\n<p>&bull; Largo: 72cm</p>\r\n\r\n<p>&bull; Profundidad: 60cm</p>\r\n\r\n<p>&bull; Puerta s&oacute;lida: 1</p>\r\n\r\n<p>&bull; Estante: 4</p>\r\n\r\n<p>&bull; Volumen: 400</p>\r\n\r\n<p>&bull; Utilizaci&oacute;n: enfriamiento de cerveza</p>\r\n\r\n<p>&bull; Temperatura: -5,5&deg;C a -7,5&deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: aire forzado</p>\r\n\r\n<p>&bull; Controlador &nbsp;de temperatura electr&oacute;nico digital</p>\r\n\r\n<p>&bull; Iluminaci&oacute;n LED</p>\r\n\r\n<p>&bull; Puertas con cierre autom&aacute;tico</p>\r\n\r\n<p>&bull; Estantes regulables</p>\r\n\r\n<p>&bull; Patas regulables</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(81, 'VCC600S', 'Visacooler para Cerveza Puerta Sólida VCC600S', 'Visacooler para Cerveza Puerta Sólida VCC600S', '<p>&bull; C&oacute;digo: VCC-600S</p>\r\n\r\n<p>&bull; Altura: 2,08mts</p>\r\n\r\n<p>&bull; Largo: 72cm</p>\r\n\r\n<p>&bull; Profundidad: 74cm</p>\r\n\r\n<p>&bull; Puerta s&oacute;lida: 1</p>\r\n\r\n<p>&bull; Estante: 4</p>\r\n\r\n<p>&bull; Volumen: 600</p>\r\n\r\n<p>&bull; Utilizaci&oacute;n: enfriamiento de cerveza</p>\r\n\r\n<p>&bull; Temperatura: -5,5&deg;C a -7,5&deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: aire forzado</p>\r\n\r\n<p>&bull; Controlador &nbsp;de temperatura electr&oacute;nico digital</p>\r\n\r\n<p>&bull; Iluminaci&oacute;n LED</p>\r\n\r\n<p>&bull; Puertas con cierre autom&aacute;tico</p>\r\n\r\n<p>&bull; Estantes regulables</p>\r\n\r\n<p>&bull; Patas regulables</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(82, 'VCEXF1300', 'Visacooler Extra Frio VCEXF1300', 'Visacooler Extra Frio VCEXF1300', '<p>Conservaci&oacute;n de cervezas o carnes envasadas</p>\r\n\r\n<p>C&oacute;digo fabricante: VCEXF1300</p>\r\n\r\n<p>Altura: 2,08mts</p>\r\n\r\n<p>Largo: 1,44mts</p>\r\n\r\n<p>Profundidad: 74cm</p>\r\n\r\n<p>Puerta: 2</p>\r\n\r\n<p>Volumen: 1300</p>\r\n\r\n<p>Estante: 5</p>\r\n\r\n<p>Carga 1000ml: 250</p>\r\n\r\n<p>Carga lata: 1134</p>\r\n\r\n<p>Temperatura: -5&deg;C</p>\r\n\r\n<p>Refrigeraci&oacute;n: Aire forzado</p>\r\n\r\n<p>Controlador de temperatura&nbsp;</p>\r\n\r\n<p>electr&oacute;nico digital</p>\r\n\r\n<p>Iluminaci&oacute;n LED</p>\r\n\r\n<p>Estantes regulables</p>\r\n\r\n<p>Puerta con cerre autom&aacute;tico</p>\r\n\r\n<p>Doble vidrio</p>\r\n\r\n<p><br />\r\nPatas regulables</p>\r\n', 0, 0, 0, NULL, NULL, 6, 7, 1, 0, NULL, 1, NULL, NULL, ''),
(83, 'VCEXF600', 'Visacooler Extra Frio VCEXF600', 'Visacooler Extra Frio VCEXF600', '<p>Conservaci&oacute;n de cervezas o carnes envasadas</p>\r\n\r\n<p>C&oacute;digo fabricante: VCEXF600</p>\r\n\r\n<p>Altura: 2,08mts</p>\r\n\r\n<p>Largo: 72cm</p>\r\n\r\n<p>Profundidad: 74cm</p>\r\n\r\n<p>Puerta: 1</p>\r\n\r\n<p>Volumen: 600</p>\r\n\r\n<p>Estante: 5</p>\r\n\r\n<p>Carga 1000ml: 125</p>\r\n\r\n<p>Carga lata: 567</p>\r\n\r\n<p>Temperatura: -5&deg;C</p>\r\n\r\n<p>Refrigeraci&oacute;n: Aire forzado</p>\r\n\r\n<p>Controlador de temperatura&nbsp;</p>\r\n\r\n<p>electr&oacute;nico digital</p>\r\n\r\n<p>Iluminaci&oacute;n LED</p>\r\n\r\n<p>Estantes regulables</p>\r\n\r\n<p>Puerta con cerre autom&aacute;tico</p>\r\n\r\n<p>Doble vidrio</p>\r\n\r\n<p><br />\r\nPatas regulables</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(84, 'VCEXF410', 'Visacooler Extra Frio VCEXF410', 'Visacooler Extra Frio VCEXF410', '<p>Conservaci&oacute;n de cervezas o carnes&nbsp;envasadas</p>\r\n\r\n<p>C&oacute;digo fabricante: VCEXF410</p>\r\n\r\n<p>Altura: 1,92mts</p>\r\n\r\n<p>Largo: 72cm</p>\r\n\r\n<p>Profundidad: 60cm</p>\r\n\r\n<p>Puerta: 1</p>\r\n\r\n<p>Volumen: 410</p>\r\n\r\n<p>Estante: 4</p>\r\n\r\n<p>Carga 1000ml: 91</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Carga lata: 378</p>\r\n\r\n<p>Temperatura: -5&deg;C</p>\r\n\r\n<p>Refrigeraci&oacute;n: Aire forzado</p>\r\n\r\n<p>Controlador de temperatura&nbsp;</p>\r\n\r\n<p>electr&oacute;nico digital</p>\r\n\r\n<p>Iluminaci&oacute;n LED</p>\r\n\r\n<p>Estantes regulables</p>\r\n\r\n<p>Puerta con cerre autom&aacute;tico</p>\r\n\r\n<p>Doble vidrio</p>\r\n\r\n<p>Patas regulables</p>\r\n\r\n<p>Frio y seco</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(85, 'VMC1300', 'Visacooler Multi Uso VMC1300', 'Visacooler Multi Uso VMC1300', '<p>C&oacute;digo f&aacute;bricante: VCM1300</p>\r\n\r\n<p>-Exposici&oacute;n de bebidas,productos fr&iacute;os y l&aacute;cteos</p>\r\n\r\n<p>-Temperatura: 0&deg;C a 7&deg;C</p>\r\n\r\n<p>-Refrigeraci&oacute;n: Aire forzado</p>\r\n\r\n<p>-Controladodor de temperatura: termostato mec&aacute;nico o electr&oacute;nico digital</p>\r\n\r\n<p>-Iluminaci&oacute;n fluorescente</p>\r\n\r\n<p>-Patas regulables</p>\r\n\r\n<p>-Puertas con cierre autom&aacute;tico</p>\r\n\r\n<p>-Doble vidrio</p>\r\n\r\n<p>-Estante regulable</p>\r\n\r\n<p>-Altura: 2,05mts</p>\r\n\r\n<p>-Largo: 1,44mts</p>\r\n\r\n<p>-Profundidad: 75cm</p>\r\n\r\n<p>- 2 Puertas</p>\r\n\r\n<p>-Estante: 4</p>\r\n\r\n<p>-1300 Litros</p>\r\n\r\n<p>-Fr&iacute;o y seco</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(86, 'VMC3P', 'Visacooler Multi Uso VMC3P', 'Visacooler Multi Uso VMC3P', '<p>-C&oacute;digo f&aacute;bricante: VCM3P</p>\r\n\r\n<p>-Exposici&oacute;n de bebidas,productos fr&iacute;os y l&aacute;cteos</p>\r\n\r\n<p>-Temperatura: 0&deg;C a 7&deg;C</p>\r\n\r\n<p>-Refrigeraci&oacute;n: Aire forzado</p>\r\n\r\n<p>-Controladodor de temperatura: termostato mec&aacute;nico o electr&oacute;nico digital</p>\r\n\r\n<p>-Iluminaci&oacute;n fluorescente</p>\r\n\r\n<p>-Patas regulables</p>\r\n\r\n<p>-Puertas con cierre autom&aacute;tico</p>\r\n\r\n<p>-Doble vidrio</p>\r\n\r\n<p>-Estante regulable</p>\r\n\r\n<p>-Altura: 2,08mts</p>\r\n\r\n<p>-Largo: 2,18mts</p>\r\n\r\n<p>-Profundidad: 77cm</p>\r\n\r\n<p>- 3 Puertas</p>\r\n\r\n<p>-Estante: 3</p>\r\n\r\n<p>-2000 Litros</p>\r\n\r\n<p>-Fr&iacute;o y seco</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(87, 'Home Wine', 'Visacooler Adega Home Wine 230 Litros', 'Visacooler Adega Home Wine 230 Litros', '<p>&bull; C&oacute;digo fabricante: AHW230</p>\r\n\r\n<p>&bull; Utilizaci&oacute;n: Enfriamiento de vinos</p>\r\n\r\n<p>&bull; Temperatura: 4&deg;C a 20&deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: Est&aacute;tica. Placa fr&iacute;a</p>\r\n\r\n<p>&bull; Controlador de temperatura electr&oacute;nico digital</p>\r\n\r\n<p>&bull; Iluminaci&oacute;n LED azul</p>\r\n\r\n<p>&bull; Capacidad: 230 litros</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(88, 'Home Wine', 'Visacooler Adega Home Wine 130 Litros', 'Visacooler Adega Home Wine 130 Litros', '<p>&bull; C&oacute;digo fabricante: AHW130</p>\r\n\r\n<p>&bull; Utilizaci&oacute;n: Enfriamiento de vinos</p>\r\n\r\n<p>&bull; Temperatura: 4&deg;C a 20&deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: Est&aacute;tica. Placa fr&iacute;a</p>\r\n\r\n<p>&bull; Controlador de temperatura electr&oacute;nico digital</p>\r\n\r\n<p>&bull; &nbsp;Iluminaci&oacute;n LED azul</p>\r\n\r\n<p><br />\r\n&bull; Capacidad: 130 litros</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(89, 'Home Wine', 'Visa cooler Adega Home Wine 86 Litros', 'Visa cooler Adega Home Wine 86 Litros', '<p>&bull; C&oacute;digo fabricante: AHW86</p>\r\n\r\n<p>&bull; Utilizaci&oacute;n: Enfriamiento de vinos</p>\r\n\r\n<p>&bull; Temperatura: 4&deg;C a 20&deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: Est&aacute;tica. Placa fr&iacute;a</p>\r\n\r\n<p>&bull; Controlador de temperatura electr&oacute;nico digital</p>\r\n\r\n<p>&bull; &nbsp;Iluminaci&oacute;n LED azul</p>\r\n\r\n<p>&bull; Capacidad: 86 litros</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(90, 'Slim Home Beer', 'Visacooler Slim Home Beer Puerta de Vidrio 230L', 'Visacooler Slim Home Beer Puerta de Vidrio 230L', '<p>&bull; Puerta de vidrio</p>\r\n\r\n<p>&bull; Utilizaci&oacute;n: Enfriamiento de cerveza</p>\r\n\r\n<p>&bull; Temperatura: -5,5 &deg;C a -2,5 &deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: aire forzado</p>\r\n\r\n<p>&bull; Controlador de temperatura electr&oacute;nico digital</p>\r\n\r\n<p><br />\r\n&bull; Capacidad: 230 litros</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(91, 'Slim Home Beer', 'Visacooler Slim Home Beer Puerta de Vidrio 130L', 'Visacooler Slim Home Beer Puerta de Vidrio 130L', '<p>&bull; Puerta de vidrio</p>\r\n\r\n<p>&bull; Utilizaci&oacute;n: Enfriamiento de cerveza</p>\r\n\r\n<p>&bull; Temperatura: -5,5 &deg;C a -2,5 &deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: aire forzado</p>\r\n\r\n<p>&bull; Controlador de temperatura electr&oacute;nico digital</p>\r\n\r\n<p><br />\r\n&bull; Capacidad: 130 litros</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(92, 'Slim Home Beer ', 'Visacooler Slim Home Beer Puerta de Vidrio 86L', '', '<p>&bull; Puerta de vidrio</p>\r\n\r\n<p>&bull; Utilizaci&oacute;n: Enfriamiento de cerveza</p>\r\n\r\n<p>&bull; Temperatura: -5,5 &deg;C a -2,5 &deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: aire forzado</p>\r\n\r\n<p>&bull; Controlador de temperatura electr&oacute;nico digital</p>\r\n\r\n<p><br />\r\n&bull; Capacidad: 86 litros</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(93, 'Slim Home Beer', 'Visacooler Slim Home Beer Puerta Solida 230L', 'Visacooler Slim Home Beer Puerta Solida 230L', '<p>&bull; Puerta solida</p>\r\n\r\n<p>&bull; Utilizaci&oacute;n: Enfriamiento de cerveza</p>\r\n\r\n<p>&bull; Temperatura: -5,5 &deg;C a -2,5 &deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: aire forzado</p>\r\n\r\n<p>&bull; Controlador de temperatura electr&oacute;nico digital</p>\r\n\r\n<p><br />\r\n&bull; Capacidad: 230 litros</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(94, 'Visacooler Slim Home', 'Visacooler Slim Home Beer Puerta Sólida 130L', 'Visacooler Slim Home Beer Puerta Sólida 130L', '<p>&bull; Puerta solida</p>\r\n\r\n<p>&bull; Utilizaci&oacute;n: Enfriamiento de cerveza</p>\r\n\r\n<p>&bull; Temperatura: -5,5 &deg;C a -2,5 &deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: aire forzado</p>\r\n\r\n<p>&bull; Controlador de temperatura electr&oacute;nico digital</p>\r\n\r\n<p>&bull; Capacidad: 130 litros</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(95, 'Slim Home Beer', 'Visacooler Slim Home Beer Puerta Solida 86L', 'Visacooler Slim Home Beer Puerta Solida 86L', '<p>&bull; Puerta solida</p>\r\n\r\n<p>&bull; Utilizaci&oacute;n: Enfriamiento de cerveza</p>\r\n\r\n<p>&bull; Temperatura: -5,5 &deg;C a -2,5 &deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: aire forzado</p>\r\n\r\n<p>&bull; Controlador de temperatura electr&oacute;nico digital</p>\r\n\r\n<p>&bull; Capacidad: 86 litros</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(96, 'BBP1000', 'Balcón de pesaje línea plus BBP1000', '', '<p>&bull; Estructura en chapa de acero con pintura blanca anticorrosiva</p>\r\n\r\n<p>&bull; Largo: 1,00mts</p>\r\n\r\n<p>&bull; Altura: 84cm</p>\r\n\r\n<p>&bull; Profundidad: 71cm</p>\r\n\r\n<p>&bull; Utilizaci&oacute;n: Para balanzas</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(97, 'MCP2800', 'Mini Cámara para Carnes Línea Plus MCP2800', 'Mini Cámara para Carnes Línea Plus MCP2800', '<p>&bull; Utilizaci&oacute;n: Almacenamiento y refrigeraci&oacute;n de carnes</p>\r\n\r\n<p>&bull; Temperatura: 0&deg;C a 5&deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: Aire forzado</p>\r\n\r\n<p>&bull; Controlador de temperatura electr&oacute;nico digital</p>\r\n\r\n<p>&bull; Puertas con cierre autom&aacute;tico</p>\r\n\r\n<p>&bull; Gancheras en tubo de acero galbanizado</p>\r\n\r\n<p>&bull; Patas regulables</p>\r\n\r\n<p>&bull; Volumen: 2651</p>\r\n\r\n<p>&bull; Puerta: 3</p>\r\n\r\n<p>&bull; Largo: 2,31mts</p>\r\n\r\n<p>&bull; Altura: 2,15mts</p>\r\n\r\n<p>&bull; Profundidad: 91cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(98, 'MCP1800', 'Mini Cámara para Carnes Línea Plus MCP1800', 'Mini Cámara para Carnes Línea Plus MCP1800', '<p>&bull; Utilizaci&oacute;n: Almacenamiento y refrigeraci&oacute;n de carnes</p>\r\n\r\n<p>&bull; Temperatura: 0&deg;C a 5&deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: Aire forzado</p>\r\n\r\n<p>&bull; Controlador de temperatura electr&oacute;nico digital</p>\r\n\r\n<p>&bull; Puertas con cierre autom&aacute;tico</p>\r\n\r\n<p>&bull; Gancheras en tubo de acero galbanizado</p>\r\n\r\n<p>&bull; Patas regulables</p>\r\n\r\n<p>&bull; Volumen: 1755</p>\r\n\r\n<p>&bull; Puerta: 2</p>\r\n\r\n<p>&bull; Largo: 1,55mts</p>\r\n\r\n<p>&bull; Altura: 2,15mts</p>\r\n\r\n<p>&bull; Profundidad: 91cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(99, 'MCP1350', 'Mini Cámara para Carnes Línea Plus MCP1350', 'Mini Cámara para Carnes Línea Plus MCP1350', '<p>&bull; Utilizaci&oacute;n: Almacenamiento y refrigeraci&oacute;n de carnes</p>\r\n\r\n<p>&bull; Temperatura: 0&deg;C a 5&deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: Aire forzado</p>\r\n\r\n<p>&bull; Controlador de temperatura electr&oacute;nico digital</p>\r\n\r\n<p>&bull; Puertas con cierre autom&aacute;tico</p>\r\n\r\n<p>&bull; Gancheras en tubo de acero galbanizado</p>\r\n\r\n<p>&bull; Patas regulables</p>\r\n\r\n<p>&bull; Volumen: 1200</p>\r\n\r\n<p>&bull; Puerta: 1</p>\r\n\r\n<p>&bull; Largo: 1,18mts</p>\r\n\r\n<p>&bull; Altura: 2,15mts</p>\r\n\r\n<p>&bull; Profundidad: 91cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(100, 'ACIE-15', 'Ablandador de Carne ACIE-15', 'Ablandador de Carne ACIE-15', '<p>&bull; Capacidad de producci&oacute;n: 150kg / hora</p>\r\n\r\n<p>&bull; Cuchillas en acero inox&nbsp;</p>\r\n\r\n<p>&bull; Gabinete y tapa en acero inox</p>\r\n\r\n<p>&bull; C&oacute;digo: ACIE-15</p>\r\n\r\n<p>&bull; Largo: 25cm</p>\r\n\r\n<p>&bull; Altura: 47cm</p>\r\n\r\n<p>&bull; Profundidad: 37cm</p>\r\n\r\n<p>&bull; Moto: 1/2 HP</p>\r\n', 0, 0, 0, NULL, NULL, 19, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(101, 'MCIE-98', 'Moledor de Carne MCIE-98', 'Moledor de Carne MCIE-98', '<p>&bull; C&oacute;digo: MCIE-98</p>\r\n\r\n<p>&bull; Altura: 53cm</p>\r\n\r\n<p>&bull; Largo: 39cm</p>\r\n\r\n<p>&bull; Profundidad: 83cm</p>\r\n\r\n<p>&bull; Motor: 3 HP</p>\r\n\r\n<p>&bull; Potencia: 2208W</p>\r\n\r\n<p>&bull; Producci&oacute;n m&aacute;x: 500 kg</p>\r\n\r\n<p>&bull; Discos: 5mm y 8mm</p>\r\n\r\n<p>&bull; Bandeja en acero inox</p>\r\n\r\n<p>&bull; Bocal y caracol en hierro&nbsp;fundido</p>\r\n\r\n<p>&bull; Estructura en chapa de acero&nbsp;inox</p>\r\n', 0, 0, 0, NULL, NULL, 19, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(102, 'MCIE-22', 'Moledor de carne MCIE-22', 'Moledor de carne MCIE-22', '<p>&bull; C&oacute;digo: MCIE-22</p>\r\n\r\n<p>&bull; Altura: 45cm</p>\r\n\r\n<p>&bull; Largo: 33cm</p>\r\n\r\n<p>&bull; Profundidad: 70cm</p>\r\n\r\n<p>&bull; Motor: 1 HP</p>\r\n\r\n<p>&bull; Potencia: 736W</p>\r\n\r\n<p>&bull; Producci&oacute;n m&aacute;x: 300 kg</p>\r\n\r\n<p>&bull; Discos: 5mm y 8mm</p>\r\n\r\n<p>&bull; Bandeja en acero inox</p>\r\n\r\n<p>&bull; Bocal y caracol en hierro fundido</p>\r\n\r\n<p>&bull; Estructura en chapa de acero inox</p>\r\n', 0, 0, 0, NULL, NULL, 19, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(103, 'MCIE-10', 'Moledor de Carnes MCIE-10', 'Moledor de Carnes MCIE-10', '<p>&bull; C&oacute;digo: MCIE-10</p>\r\n\r\n<p>&bull; Altura: 41cm</p>\r\n\r\n<p>&bull; Largo: 31cm</p>\r\n\r\n<p>&bull; Profundidad: 53cm</p>\r\n\r\n<p>&bull; Motor: &frac12; HP</p>\r\n\r\n<p>&bull; Potencia: 368W</p>\r\n\r\n<p>&bull; Producci&oacute;n m&aacute;x: 100 kg</p>\r\n\r\n<p>&bull; Discos: 5mm y 8mm</p>\r\n\r\n<p>&bull; Bandeja en acero inox</p>\r\n\r\n<p>&bull; Bocal y caracol en hierro fundido</p>\r\n\r\n<p>&bull; Estructura en chapa de acero inox</p>\r\n', 0, 0, 0, NULL, NULL, 19, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(104, 'MSBPE180', 'Mini Sierra Carnicera para Carnes y Cartílagos con Molino MSBPE180', 'Mini Sierra Carnicera para Carnes y Cartílagos con Molino MSBPE180', '<p>&bull; M&oacute;delo: MSBPE-180</p>\r\n\r\n<p>&bull; Altura: 80cm</p>\r\n\r\n<p>&bull; Profundidad: 62cm</p>\r\n\r\n<p>&bull; Largo: 75cm</p>\r\n\r\n<p>&bull; Motor: &frac12; HP</p>\r\n\r\n<p>&bull; Con molino</p>\r\n\r\n<p>&bull; Estructura en chapa de acero inoxidable<br />\r\n&bull; L&aacute;mina de corte de 1,80mts en acero inoxidable<br />\r\n&bull; Mesada fija en acero inox con gu&iacute;a</p>\r\n', 0, 0, 0, NULL, NULL, 19, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(105, 'MSBE-180', 'Mini Sierra Carnicera para Carnes y Cartílagos MSBE-180', 'Mini Sierra Carnicera para Carnes y Cartílagos MSBE-180', '<p>&bull; M&oacute;delo: MSBE-180</p>\r\n\r\n<p>&bull; Altura: 80cm</p>\r\n\r\n<p>&bull; Profundidad: 62cm</p>\r\n\r\n<p>&bull; Largo: 62cm</p>\r\n\r\n<p>&bull; Motor: &frac12; HP</p>\r\n\r\n<p>&bull; Estructura en chapa de acero inoxidable<br />\r\n&bull; L&aacute;mina de corte de 1,80mts en acero inoxidable<br />\r\n&bull; Mesada fija en acero inox con gu&iacute;a</p>\r\n', 0, 0, 0, NULL, NULL, 19, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(106, 'STIE325', 'Sierra Carnicera Inox para Carnes y Huesos STIE325', 'Sierra Carnicera Inox para Carnes y Huesos STIE325', '<p>&bull; M&oacute;delo: STIE-325</p>\r\n\r\n<p>&bull; Altura: 1,85mts</p>\r\n\r\n<p>&bull; Profundidad: 90cm</p>\r\n\r\n<p>&bull; Largo: 91cm</p>\r\n\r\n<p>&bull; Motor: 2 HP</p>\r\n\r\n<p>&bull; Estructura en chapa de acero inoxidable<br />\r\n&bull; L&aacute;mina de corte de 3,25mts en acero inoxidable<br />\r\n&bull; Mesada m&oacute;vil en acero inox con gu&iacute;a<br />\r\n&bull; Poleas en hierro fundido</p>\r\n', 0, 0, 0, NULL, NULL, 19, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(107, 'SBE282', 'Sierra Carnicera para Carnes y Huesos SBE282', 'Sierra Carnicera para Carnes y Huesos SBE282', '<p>&bull; M&oacute;delo: SBE-282</p>\r\n\r\n<p>&bull; Altura: 1,75mts</p>\r\n\r\n<p>&bull; Profundidad: 80cm</p>\r\n\r\n<p>&bull; Largo: 79cm</p>\r\n\r\n<p>&bull; Motor: 1 HP</p>\r\n\r\n<p>&bull; Estructura en chapa de acero inoxidable<br />\r\n&bull; L&aacute;mina de corte de 2,82mts en acero inoxidable<br />\r\n&bull; Mesada m&oacute;vil en acero inox con gu&iacute;a<br />\r\n&bull; Poleas en hierro fundido</p>\r\n', 0, 0, 0, NULL, NULL, 19, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(108, 'Embutidor', 'Embutidor de Chorizos', '', '<p>&bull; Modelo: EL-8</p>\r\n\r\n<p>&bull; Capacidad por operaci&oacute;n: 8 kg</p>\r\n\r\n<p>&bull; Accionamiento manual</p>\r\n\r\n<p>&bull; Estructura en hierro fundido</p>\r\n\r\n<p>&bull; Ca&ntilde;on en acero inoxidable</p>\r\n\r\n<p>&bull; 3 Moldes embutidores</p>\r\n\r\n<p>&bull; Largo: 35cm</p>\r\n\r\n<p>&bull; Alto: 75cm</p>\r\n\r\n<p>&bull; Profundidad: 30cm</p>\r\n', 0, 0, 0, NULL, NULL, 19, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(109, 'EAP', 'Linea EAP', '', '<p>&bull; Altura: 1,45mts</p>\r\n\r\n<p>&bull; Largo: 1,50mts, 2,00mts y 3,00mts</p>\r\n\r\n<p>&bull; Profundidad: 84cm</p>\r\n\r\n<p>&bull; Colores opcionales</p>\r\n\r\n<p><br />\r\n&nbsp;Especificaciones&nbsp;</p>\r\n\r\n<p>&bull; Utilizaci&oacute;n: Exhibidor de carnes</p>\r\n\r\n<p>&bull; Temperatura: 3&deg;C a 10&deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: Serpentina superior y placa fr&iacute;a inferior</p>\r\n\r\n<p>&bull; Controlador de temperatura m&eacute;canica</p>\r\n\r\n<p>&bull; Ganchera superior</p>\r\n\r\n<p>&bull; Dep&oacute;sito incorporado</p>\r\n\r\n<p>&bull; Iluminaci&oacute;n fluorescente</p>\r\n\r\n<p>&bull; Obs: Vidrios sujetos a condensaci&oacute;n conforme a variaci&oacute;n de la humedad relativa del ambiente.<br />\r\n&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(110, 'APAS2000', 'Armario para Panes APAS2000', 'Armario para Panes APAS2000', '<p>&bull; Iluminaci&oacute;n fluorescente</p>\r\n\r\n<p>&bull; 100% laminado 15mm&nbsp;</p>\r\n\r\n<p>&bull; Largo: 1,00mts</p>\r\n\r\n<p>&bull; Altura: 1,87mts</p>\r\n\r\n<p>&bull; Profundidad: 67cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(111, 'APTU2000', 'Armario para Panes APTU2000', 'Armario para Panes APTU2000', '<p>&bull; Iluminaci&oacute;n fluorescente</p>\r\n\r\n<p>&bull; 100% laminado 15mm&nbsp;</p>\r\n\r\n<p>&bull; Largo: 2,00mts</p>\r\n\r\n<p>&bull; Altura: 2,00mts</p>\r\n\r\n<p>&bull; Profundidad: 75cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(112, 'AIPP2000', 'Isla para Panes AIPP2000', 'Isla para Panes AIPP2000', '<p>&bull; 100% laminado 15mm&nbsp;</p>\r\n\r\n<p>&bull; Largo: 1,00mts</p>\r\n\r\n<p>&bull; Altura: 1,18mts</p>\r\n\r\n<p>&bull; Profundidad: 95cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(113, 'APC2000', 'Armario para  Panes APC2000', 'Armario para  Panes APC2000', '<p>&bull; Iluminaci&oacute;n fluorescente</p>\r\n\r\n<p>&bull; 100% laminado 15mm&nbsp;</p>\r\n\r\n<p>&bull; Largo: 1,00mts</p>\r\n\r\n<p>&bull; Altura: 1,87mts</p>\r\n\r\n<p>&bull; Profundidad: 67cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(114, 'ASTPPG2000', 'Armario para Panes ASTPPG2000', '', '<p>&bull; Iluminaci&oacute;n fluorescente</p>\r\n\r\n<p>&bull; 100% laminado 15mm&nbsp;</p>\r\n\r\n<p>&bull; Largo: 1,00mts</p>\r\n\r\n<p>&bull; Altura: 2,21mts</p>\r\n\r\n<p>&bull; Profundidad: 56cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(115, 'APTE1000', 'Armario para espetos APTE1000', 'Armario para espetos APTE1000', '<p>&bull; Iluminaci&oacute;n fluorescente</p>\r\n\r\n<p>&bull; 100% laminado 15mm&nbsp;</p>\r\n\r\n<p>&bull; Largo: 1,00mts</p>\r\n\r\n<p>&bull; Altura: 2,21mts</p>\r\n\r\n<p>&bull; Profundidad: 55cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(116, 'APD1000', 'Armario de defumados APD1000', 'Armario de defumados APD1000', '<p>&bull; Iluminaci&oacute;n fluorescente</p>\r\n\r\n<p>&bull; 100% laminado 15mm&nbsp;</p>\r\n\r\n<p>&bull; Largo: 1,00mts</p>\r\n\r\n<p>&bull; Altura: 2,21mts</p>\r\n\r\n<p>&bull; Profundidad: 55cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(117, 'APT1000', 'Armario para temperos APT1000', '', '<p>&bull; Iluminaci&oacute;n fluorescente</p>\r\n\r\n<p>&bull; 100% laminado 15mm&nbsp;</p>\r\n\r\n<p>&bull; Largo: 1,00mts</p>\r\n\r\n<p>&bull; Altura: 2,21mts</p>\r\n\r\n<p>&bull; Profundidad: 55cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(118, 'APC1000', 'Armario para carbón APC1000', 'Armario para carbón APC1000', '<p>&bull; Iluminaci&oacute;n fluorescente</p>\r\n\r\n<p>&bull; 100% laminado 15mm&nbsp;</p>\r\n\r\n<p>&bull; Largo: 1,00mts</p>\r\n\r\n<p>&bull; Altura: 2,21mts</p>\r\n\r\n<p>&bull; Profundidad: 55cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(119, 'AAC1000', 'Bodega mixta para vinos AAC1000', '', '<p>&bull; Iluminaci&oacute;n fluorescente</p>\r\n\r\n<p>&bull; 100% laminado 15mm&nbsp;</p>\r\n\r\n<p>&bull; Largo: 1,00mts</p>\r\n\r\n<p>&bull; Altura: 2,21mts</p>\r\n\r\n<p>&bull; Profundidad: 55cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(120, 'AAB1000', 'Bodega tonel para vino AAB1000', 'Bodega tonel para vino AAB1000', '<p>&bull; Iluminaci&oacute;n fluorescente</p>\r\n\r\n<p>&bull; 100% laminado 15mm&nbsp;</p>\r\n\r\n<p>&bull; Largo: 1,00mts</p>\r\n\r\n<p>&bull; Altura: 2,21mts</p>\r\n\r\n<p>&bull; Profundidad: 55cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(121, 'AAI2000', 'Isla para vinos AAI2000', 'Isla para vinos AAI2000', '<p>&bull; Iluminaci&oacute;n fluorescente</p>\r\n\r\n<p>&bull; 100% laminado 15mm&nbsp;</p>\r\n\r\n<p>&bull; Largo: 2,00mts</p>\r\n\r\n<p>&bull; Altura: 1,18mts</p>\r\n\r\n<p>&bull; Profundidad: 95cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(122, 'AAP1000', 'Bodega estante para vinos AAP1000', 'Bodega estante para vinos AAP1000', '<p>&bull; Iluminaci&oacute;n fluorescente</p>\r\n\r\n<p>&bull; 100% laminado 15mm&nbsp;</p>\r\n\r\n<p>&bull; Largo: 1,00mts</p>\r\n\r\n<p>&bull; Altura: 2,21mts</p>\r\n\r\n<p>&bull; Profundidad: 55cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 3, 0, 0, NULL, 1, NULL, NULL, '');
INSERT INTO `tb_producto` (`id`, `referencia`, `nombre`, `descripcion_corta`, `descripcion_detallada`, `precio`, `stock`, `valor_descuento`, `descripcion`, `valor_mayorista`, `id_marca`, `id_linea`, `destaque`, `recomendado`, `oden_destaque`, `activo`, `unique_hits`, `total_hits`, `modelo`) VALUES
(123, 'AAV1000', 'Bodega vertical para vinos AAV10000', 'Bodega vertical para vinos AAV10000', '<p>&bull; Iluminaci&oacute;n fluorescente</p>\r\n\r\n<p>&bull; 100% laminado 15mm&nbsp;</p>\r\n\r\n<p>&bull; Largo: 1,00mts</p>\r\n\r\n<p>&bull; Altura: 2,21mts</p>\r\n\r\n<p>&bull; Profundidad: 55cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(124, 'VNPE730', 'Vitrina New Panorámica Estufa VNPE730', 'Vitrina New Panorámica Estufa VNPE730', '<p>&bull; Exposici&oacute;n de productos salados</p>\r\n\r\n<p>&bull; Temperatura: &nbsp;60&deg;C</p>\r\n\r\n<p>&bull; Largo: 73cm</p>\r\n\r\n<p>&bull; Altura: &nbsp;1,13mts</p>\r\n\r\n<p>&bull; Profundidad: 70cm</p>\r\n\r\n<p>&bull; &nbsp;Patas regulables</p>\r\n\r\n<p>&bull; Resistencia el&eacute;ctrica</p>\r\n\r\n<p>&bull; Bandejas inox</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(125, 'VNPS1260', 'Vitrina New Panorámica Seca VNPS1260', 'Vitrina New Panorámica Seca VNPS1260', '<p>&bull; Exposici&oacute;n de productos secos</p>\r\n\r\n<p>&bull; Temperatura: &nbsp;Ambiente</p>\r\n\r\n<p>&bull; Patas regulables</p>\r\n\r\n<p>&bull; Largo: 1,26mts</p>\r\n\r\n<p>&bull; Altura: &nbsp;1,13mts</p>\r\n\r\n<p>&bull; Profundidad: 70cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(126, 'VNPRPF1260 ', 'Vitrina New Panorámica Refrigerada VNPRPF1260 ', 'Vitrina new Panorámica Refrigerada VNPRPF1260 ', '<p>&bull; Exposici&oacute;n de productos refrigerados</p>\r\n\r\n<p>&bull; Temperatura: &nbsp;3&deg;C a 10&deg;C</p>\r\n\r\n<p>&bull; Largo: 1,26mts</p>\r\n\r\n<p>&bull; Altura: &nbsp;1,13mts</p>\r\n\r\n<p>&bull; Profundidad: 70cm</p>\r\n\r\n<p>&bull; Patas regulables</p>\r\n\r\n<p>&bull; Controlador de temperatura: Termostato mec&aacute;nico</p>\r\n\r\n<p>&bull; Fr&iacute;o h&uacute;medo</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(127, 'FTDE-10', 'Horno Turbo Convector FTDE-10 ', 'Horno Turbo Convector FTDE-10 ', '<p>&bull; Para bandejas de 58x70cm</p>\r\n\r\n<p>&bull; Termostato de 50&deg;C a 300&deg;C</p>\r\n\r\n<p>&bull; Estructura en chapa de acero</p>\r\n\r\n<p>&bull; Frente en acero inox</p>\r\n\r\n<p>&bull; Aislamiento t&eacute;rmico en lana bas&aacute;ltica</p>\r\n\r\n<p>&bull; Controlador digital con programaci&oacute;n de tiempo, temperatura y vapor.</p>\r\n\r\n<p>&bull; Trif&aacute;sico</p>\r\n\r\n<p>&bull; Motor: 1,5HP</p>\r\n\r\n<p>&bull; Potencia: 18000W</p>\r\n\r\n<p>&bull; Capacidad: 10 bandejas</p>\r\n\r\n<p>&bull; Largo: 1,02mts</p>\r\n\r\n<p>&bull; Profundidad: 1,29mts</p>\r\n\r\n<p>&bull; Altura: 1,70mts</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(128, 'FTDE-5', 'Horno Turbo Convector FTDE-5', 'Horno Turbo Convector FTDE-5', '<p>&bull; Para bandejas de 58x70cm</p>\r\n\r\n<p>&bull; Termostato de 50&deg;C a 300&deg;C</p>\r\n\r\n<p>&bull; Estructura en chapa de acero</p>\r\n\r\n<p>&bull; Frente en acero inox</p>\r\n\r\n<p>&bull; Aislamiento t&eacute;rmico en lana bas&aacute;ltica</p>\r\n\r\n<p>&bull; Controlador digital con programaci&oacute;n de tiempo, temperatura y vapor.</p>\r\n\r\n<p>&bull; Trif&aacute;sico</p>\r\n\r\n<p>&bull; Motor: 1/2 HP</p>\r\n\r\n<p>&bull; Potencia: 9500W</p>\r\n\r\n<p>&bull; Capacidad: 5 bandejas</p>\r\n\r\n<p>&bull; Largo: 1,02mts</p>\r\n\r\n<p>&bull; Profundidad: 1,29mts</p>\r\n\r\n<p>&bull; Altura: 1,60mts</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(129, 'FTDEM-5', 'HornoTurbo Convector FTDEM-5', 'HornoTurbo Convector FTDEM-5', '<p>&bull; Para bandejas de 58x70cm</p>\r\n\r\n<p>&bull; Termostato de 50&deg;C a 300&deg;C</p>\r\n\r\n<p>&bull; Estructura en chapa de acero</p>\r\n\r\n<p>&bull; Frente en acero inox</p>\r\n\r\n<p>&bull; Aislamiento t&eacute;rmico en lana bas&aacute;ltica</p>\r\n\r\n<p>&bull; Controlador digital con programaci&oacute;n</p>\r\n\r\n<p>de tiempo, temperatura y vapor.</p>\r\n\r\n<p>&bull; Monof&aacute;sico</p>\r\n\r\n<p>&bull; Motor: 1/2 HP</p>\r\n\r\n<p>&bull; Potencia: 9500W</p>\r\n\r\n<p>&bull; Capacidad: 5 bandejas</p>\r\n\r\n<p>&bull; Largo: 1,02mts</p>\r\n\r\n<p>&bull; Profundidad: 1,29mts</p>\r\n\r\n<p>&bull; Altura: 1,60mts</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(130, 'VBP-12', 'Batidora Planetaria VBP-12', 'Batidora Planetaria VBP-12', '<p>&bull; Largo: 34cm</p>\r\n\r\n<p>&bull; Altura: 75cm</p>\r\n\r\n<p>&bull; Profundidad: 65cm</p>\r\n\r\n<p>&bull; Capacidad: 12 litros</p>\r\n\r\n<p>&bull; Motor: 1/4 HP</p>\r\n\r\n<p>&bull; Cuerpo en acero inox on pintura epoxi</p>\r\n\r\n<p>&bull; Tacho en acero inox</p>\r\n\r\n<p>&bull; 3 brazos batidores</p>\r\n\r\n<p>- Globo</p>\r\n\r\n<p>- Gancho</p>\r\n\r\n<p>- Raqueta</p>\r\n\r\n<p>&bull; Rejilla protectora</p>\r\n\r\n<p>&bull; 6 Velocidades</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(131, 'VBP-05', 'Batidora Planetaria VBP-05', 'Batidora Planetaria VBP-05', '<p>&bull; Largo: 34cm</p>\r\n\r\n<p>&bull; Altura: 52cm</p>\r\n\r\n<p>&bull; Profundidad: 58cm</p>\r\n\r\n<p>&bull; Capacidad: 5 litros</p>\r\n\r\n<p>&bull; Motor: 1/4 HP</p>\r\n\r\n<p>&bull; Cuerpo en acero inox on pintura epoxi</p>\r\n\r\n<p>&bull; Tacho en acero inox</p>\r\n\r\n<p>&bull; 3 brazos batidores</p>\r\n\r\n<p>- Globo</p>\r\n\r\n<p>- Gancho</p>\r\n\r\n<p>- Raqueta</p>\r\n\r\n<p>&bull; Rejilla protectora</p>\r\n\r\n<p>&bull; 6 Velocidades</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(132, 'AC40T', 'Cámara de fermentación controlada AC40T', '', '<p>&bull; C&oacute;digo: AC40T</p>\r\n\r\n<p>&bull; Largo: 73cm</p>\r\n\r\n<p>&bull; Altura: 2,05mts</p>\r\n\r\n<p>&bull; Profundidad: 1,78mts</p>\r\n\r\n<p>&bull; 40 bandejas de 58x70cm</p>\r\n\r\n<p>&bull; Armario con sistema de retardo de fermentaci&oacute;n</p>\r\n\r\n<p>de masas (Fr&iacute;o) y aceleraci&oacute;n de fermentaci&oacute;n de masas</p>\r\n\r\n<p>(t&eacute;rmico).</p>\r\n\r\n<p>&bull; Controlador digital con funci&oacute;n de programaci&oacute;n de tiempo</p>\r\n\r\n<p>y par&aacute;metros de fr&iacute;o y calor.</p>\r\n\r\n<p>&bull; Sistema de refrigeraci&oacute;n por aire forzado</p>\r\n\r\n<p>&bull; Sistema de calentamiento por medio de 2 resistencias</p>\r\n\r\n<p>de 300w y de 700w.</p>\r\n\r\n<p>&bull; Interior revestido en aluminio corrugado</p>\r\n\r\n<p>&bull; Exterior en acero galvanizado con pintura epoxi.</p>\r\n', 0, 0, 0, NULL, NULL, 10, 0, 0, 0, NULL, 0, NULL, NULL, ''),
(133, 'AC20T', 'Cámara de fermentación controlada AC20T', '', '<p>&bull; C&oacute;digo: AC20T</p>\r\n\r\n<p>&bull; Largo: 73cm</p>\r\n\r\n<p>&bull; Altura: 2,05mts</p>\r\n\r\n<p>&bull; Profundidad: 1,02mts</p>\r\n\r\n<p>&bull; 20 bandejas de 58x70cm</p>\r\n\r\n<p>&bull; Armario con sistema de retardo de fermentaci&oacute;n</p>\r\n\r\n<p>de masas (Fr&iacute;o) y aceleraci&oacute;n de fermentaci&oacute;n de masas</p>\r\n\r\n<p>(t&eacute;rmico).</p>\r\n\r\n<p>&bull; Controlador digital con funci&oacute;n de programaci&oacute;n de tiempo</p>\r\n\r\n<p>y par&aacute;metros de fr&iacute;o y calor.</p>\r\n\r\n<p>&bull; Sistema de refrigeraci&oacute;n por aire forzado</p>\r\n\r\n<p>&bull; Sistema de calentamiento por medio de 2 resistencias</p>\r\n\r\n<p>de 300w y de 700w.</p>\r\n\r\n<p>&bull; Interior revestido en aluminio corrugado</p>\r\n\r\n<p>&bull; Exterior en acero galvanizado con pintura epoxi.</p>\r\n', 0, 0, 0, NULL, NULL, 10, 0, 0, 0, NULL, 0, NULL, NULL, ''),
(134, '1004', 'Cilindro Laminador Eléctrico 1004', 'Cilindro Laminador Eléctrico 1004', '<p>&bull; 40cm con carenagen de nylon</p>\r\n', 0, 0, 0, NULL, NULL, 20, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(135, '1002 ', 'Cilindro Laminador Eléctrico 1002 ', 'Cilindro Laminador Eléctrico 1002 ', '<p>&bull; 28 cm con carenagen de nylon</p>\r\n', 0, 0, 0, NULL, NULL, 20, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(136, 'Molino de pan', 'Molino de Pan', 'Molino de Pan', '<p>CARACTER&Iacute;STICAS</p>\r\n\r\n<p>- C&oacute;digo fabricante: VMP-80</p>\r\n\r\n<p>- Capacidad m&aacute;xima: 80 kilos por hora</p>\r\n\r\n<p>- Estructura en chapa de acero</p>\r\n\r\n<p>- Tamizador en chapa galvanizada de 2,2mm de grosor</p>\r\n\r\n<p>- Motor de &frac12; HP</p>\r\n\r\n<p>- Estructura acero SAE1010/1020.</p>\r\n\r\n<p>- Pintura Electrost&aacute;tica.</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(137, 'MPV-35', 'Modeladora de pan Felipe y baguette MPV-35', '', '<p>- Para pan felipe y baguette</p>\r\n\r\n<p>- Palanca graduadora de 8 niveles</p>\r\n\r\n<p>- Capacidad de modelado: 20g a&nbsp;1 kilo</p>\r\n\r\n<p>- Capacidad: 500 panes por hora</p>\r\n\r\n<p>- 3 juegos de pa&ntilde;o de felpa en lana</p>\r\n\r\n<p>- Estructura acero SAE1010/1020.</p>\r\n\r\n<p>- Pintura Electrost&aacute;tica.</p>\r\n\r\n<p>OTRAS MEDIDAS</p>\r\n\r\n<p>- C&oacute;digo fabricante: MPV-50</p>\r\n\r\n<p>- Para pan felipe y baguette</p>\r\n\r\n<p>- Palanca graduadora de 8 niveles</p>\r\n\r\n<p>- Capacidad de modelado: 20g a&nbsp;1 kilo</p>\r\n\r\n<p>- Capacidad: 1500 panes por hora</p>\r\n\r\n<p>- 3 juegos de pa&ntilde;o de felpa en lana</p>\r\n\r\n<p>- Estructura acero SAE1010/1020.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>- Pintura Electrost&aacute;tica.</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(138, 'DMV-30', 'Divisora de Pan', 'Divisora de Pan', '<p>- Capacidad: 30 cortes por operaci&oacute;n</p>\r\n\r\n<p>- Navajas de corte en acero inoxidable</p>\r\n\r\n<p>- Mesada revestida en acero inoxidable</p>\r\n\r\n<p>- Estructura acero SAE1010/1020.</p>\r\n\r\n<p>- Pintura Electrost&aacute;tica.</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(139, 'FPV-10', 'Cortador de Pan para Sándwich', 'Cortador de Pan para Sándwich', '<p>- L&aacute;minas de corte de acero inoxidable</p>\r\n\r\n<p>- Mesada revestida en acero inox</p>\r\n\r\n<p>- Motor de &frac14; HP</p>\r\n\r\n<p>- Limite de altura de pan 18cm</p>\r\n\r\n<p>- Corte: 10mm</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(140, 'CLMV-30', 'Cilindro Laminador de Mesa', 'Cilindro Laminador de Mesa', '<p>- Para masas livianas</p>\r\n\r\n<p>- Cilindro de 30 cm</p>\r\n\r\n<p>- Capacidad: 5kg por &nbsp;operaci&oacute;n</p>\r\n\r\n<p>- Potencia: 1/3 HP</p>\r\n\r\n<p>- Estructura acero SAE1010/1020.</p>\r\n\r\n<p>- Pintura Electrost&aacute;tica.</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(141, 'CLVT-50', 'Cilindro Refinador de Pie CLVT-50', 'Cilindro Refinador de Pie CLVT-50', '<p>- Para masas de panes y pasteler&iacute;a</p>\r\n\r\n<p>- Cilindro de 50cm</p>\r\n\r\n<p>- Capacidad: 15kg por &nbsp;operaci&oacute;n</p>\r\n\r\n<p>- Potencia: 2x1,5HP</p>\r\n\r\n<p>- Estructura acero SAE1010/1020.</p>\r\n\r\n<p>- Pintura Electrost&aacute;tica.</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(142, 'CLPV-39', 'Cilindro Laminador de Pie CLPV-39', 'Cilindro Laminador de Pie CLPV-39', '<p>- Para masas de pasteleria y confiter&iacute;a</p>\r\n\r\n<p>- Cilindro de 39 cm</p>\r\n\r\n<p>- Capacidad: 7kg por &nbsp;operaci&oacute;n</p>\r\n\r\n<p>- Potencia: 1 HP</p>\r\n\r\n<p>- Estructura acero SAE1010/1020.</p>\r\n\r\n<p>- Pintura Electrost&aacute;tica.</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(143, 'ARV-25EXP', 'Amasadora Rápida 25kg', 'Amasadora Rápida 25kg', '<p>- Capacidad: 25kg de masa pronta en 8 minutos</p>\r\n\r\n<p>- Patas de goma con nivelaci&oacute;n de altura</p>\r\n\r\n<p>- Estructura acero SAE1010/1020.</p>\r\n\r\n<p>- Tacho y cubierta superior en acero Inoxidable.</p>\r\n\r\n<p>- Amasador en hierro fundido esta&ntilde;ado.</p>\r\n\r\n<p>- Pintura Electrost&aacute;tica.</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(144, 'ARV-15EXP', 'Amasadora Rápida 15kg', 'Amasadora Rápida 15kg', '<p>- Capacidad: 15kg de masa pronta</p>\r\n\r\n<p>&nbsp;en&nbsp;8 minutos</p>\r\n\r\n<p>- Patas de goma con nivelaci&oacute;n de&nbsp;altura</p>\r\n\r\n<p>- Estructura acero SAE1010/1020.</p>\r\n\r\n<p>- Tacho y cubierta superior</p>\r\n\r\n<p>en acero Inoxidable.</p>\r\n\r\n<p>- Amasador en hierro fundido&nbsp;</p>\r\n\r\n<p>esta&ntilde;ado.</p>\r\n\r\n<p>- Pintura Electrost&aacute;tica.</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(145, ' ARV-05EXP', 'Amasadora Rápida 5kg ', 'Amasadora Rápida 5kg ', '<p>- Capacidad: 5kg de masa pronta en 8 minutos</p>\r\n\r\n<p>- Patas de goma con nivelaci&oacute;n de altura</p>\r\n\r\n<p>- Estructura acero SAE1010/1020.</p>\r\n\r\n<p>- Tacho y cubierta superior en acero Inoxidable.</p>\r\n\r\n<p>- Amasador en hierro fundido esta&ntilde;ado.</p>\r\n\r\n<p>- Pintura Electrost&aacute;tica.</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(146, 'VAE-40EXP', 'Amasadora Espiral 40kg ', 'Amasadora Espiral 40kg ', '<p>- Capacidad: 40kg de masa pronta&nbsp;</p>\r\n\r\n<p>- Patas de goma con nivelaci&oacute;n de altura</p>\r\n\r\n<p>- Estructura acero SAE1010/1020.</p>\r\n\r\n<p>- Tacho en acero Inoxidable.</p>\r\n\r\n<p>- Dos velocidades</p>\r\n\r\n<p>- Pintura Electrost&aacute;tica.</p>\r\n\r\n<p>- Rejilla protectora</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(147, 'VAE-25EXP', 'Amasadora Espiral 25kg ', 'Amasadora Espiral 25kg ', '<p>- Capacidad: 25kg de masa pronta</p>\r\n\r\n<p>- Patas de goma con nivelaci&oacute;n de altura</p>\r\n\r\n<p>- Estructura acero SAE1010/1020.</p>\r\n\r\n<p>- Tacho en acero Inoxidable.</p>\r\n\r\n<p>- Dos velocidades</p>\r\n\r\n<p>- Pintura Electrost&aacute;tica.</p>\r\n\r\n<p>- Rejilla protectora</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(148, 'ASRBV-25EXP', 'Amasadora Semi-rápida Basculante 25g', 'Amasadora Semi-rápida Basculante 25g', '<p>- Capacidad: 25kg de masa pronta</p>\r\n\r\n<p>- Patas de goma con nivelaci&oacute;n de altura</p>\r\n\r\n<p>- Estructura acero SAE1010/1020.</p>\r\n\r\n<p>- Tacho en acero Inoxidable.</p>\r\n\r\n<p>- Amasador en hierro fundido esta&ntilde;ado.</p>\r\n\r\n<p>- Pintura Electrost&aacute;tica.</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(149, 'ASRBV-05EXP', 'Amasadora Semi-rápida Basculante 5kg', 'Amasadora Semi-rápida Basculante 5kg', '<p>- Capacidad: 5kg de masa pronta</p>\r\n\r\n<p>- Patas de goma con nivelaci&oacute;n de&nbsp;</p>\r\n\r\n<p>altura</p>\r\n\r\n<p>- Estructura acero SAE1010/1020.</p>\r\n\r\n<p>- Tacho en acero Inoxidable.</p>\r\n\r\n<p>- Amasador en hierro fundido&nbsp;</p>\r\n\r\n<p>esta&ntilde;ado.</p>\r\n\r\n<p>- Pintura Electrost&aacute;tica.</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(150, 'CQNT1000', 'Vitrina Térmica 1,00mts New Titatium', 'Vitrina Térmica 1,00mts New Titatium', '<p>- Altura: 1,28mts</p>\r\n\r\n<p>- Largo: 1,00mts</p>\r\n\r\n<p>- Profundidad: 65cm</p>\r\n\r\n<p>- Exposici&oacute;n de productos salados</p>\r\n\r\n<p>- Temperatura m&aacute;xima: 60&deg;C</p>\r\n\r\n<p>- Refrigeraci&oacute;n: Aire forzado</p>\r\n\r\n<p>- Controlador de temperatura m&eacute;canica</p>\r\n\r\n<p>- Iluminaci&oacute;n fluorescente</p>\r\n\r\n<p>- Cuerpo en acero inoxidable</p>\r\n\r\n<p>- Patas regulables</p>\r\n\r\n<p>- Puerta batiente</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(151, 'CQNT600', 'Vitrina Térmica 60cm New Titatium', 'Vitrina Térmica 60cm New Titatium', '<p>- Altura: 1,28mts</p>\r\n\r\n<p>- Largo: 60cm</p>\r\n\r\n<p>- Profundidad: 65cm</p>\r\n\r\n<p>- Exposici&oacute;n de productos salados</p>\r\n\r\n<p>- Temperatura m&aacute;xima: 60&deg;C</p>\r\n\r\n<p>- Refrigeraci&oacute;n: Aire forzado</p>\r\n\r\n<p>- Controlador de temperatura m&eacute;canica</p>\r\n\r\n<p>- Iluminaci&oacute;n fluorescente</p>\r\n\r\n<p>- Cuerpo en acero inoxidable</p>\r\n\r\n<p>- Patas regulables</p>\r\n\r\n<p>- Puerta batiente</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(152, 'CSNT1000', 'Vitrina Seca 1,00 mts New Titanium', 'Vitrina Seca 1,00 mts New Titanium', '<p>- Altura: 1,28mts</p>\r\n\r\n<p>- Largo: 1,00mts</p>\r\n\r\n<p>- Profundidad: 65cm</p>\r\n\r\n<p>- Exposici&oacute;n de productos dulces y secos</p>\r\n\r\n<p>- Iluminaci&oacute;n LED</p>\r\n\r\n<p>- Cuerpo en acero inoxidable</p>\r\n\r\n<p>- Patas regulables</p>\r\n\r\n<p>- Puerta batiente</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(153, 'CSNT600', 'Vitrina Seca 60cm New Titanium ', 'Vitrina Seca 60cm New Titanium ', '<p>- Altura: 1,28mts</p>\r\n\r\n<p>- Largo: 60cm</p>\r\n\r\n<p>- Profundidad: 65cm</p>\r\n\r\n<p>- Exposici&oacute;n de productos dulces y secos</p>\r\n\r\n<p>- Iluminaci&oacute;n LED</p>\r\n\r\n<p>- Cuerpo en acero inoxidable</p>\r\n\r\n<p>- Patas regulables</p>\r\n\r\n<p>- Puerta batiente</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(154, 'CRNT1500', 'Vitrina Refrigerada 1,50 mts New Titanium', 'Vitrina Refrigerada 1,50 mts New Titanium', '<p>- Altura: 1,28mts</p>\r\n\r\n<p>- Largo: 1,50mts</p>\r\n\r\n<p>- Profundidad: 65cm</p>\r\n\r\n<p>- Otros tama&ntilde;os: 60cm y 1,00mts</p>\r\n\r\n<p>- Exposici&oacute;n de productos fr&iacute;os, l&aacute;cteos y tortas</p>\r\n\r\n<p>- Temperatura: 3&deg;C a 10&deg;C</p>\r\n\r\n<p>- Refrigeraci&oacute;n: Aire forzado, frio seco</p>\r\n\r\n<p>- Controlador de temperatura electr&oacute;nico digital</p>\r\n\r\n<p>- Iluminaci&oacute;n LED</p>\r\n\r\n<p>- Cuerpo en acero inoxidable</p>\r\n\r\n<p>- Patas regulables</p>\r\n\r\n<p>- Puertas batientes</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(155, 'CRNT600', 'Vitrina Refrigerada 60 cm New Titanium', 'Vitrina Refrigerada 60 cm New Titanium', '<p>- Altura: 1,28mts</p>\r\n\r\n<p>- Largo: 60cm</p>\r\n\r\n<p>- Profundidad: 65cm</p>\r\n\r\n<p>- Exposici&oacute;n de productos fr&iacute;os, l&aacute;cteos y tortas</p>\r\n\r\n<p>- Temperatura: 3&deg;C a 10&deg;C</p>\r\n\r\n<p>- Refrigeraci&oacute;n: Aire forzado, frio seco</p>\r\n\r\n<p>- Controlador de temperatura electr&oacute;nico digital</p>\r\n\r\n<p>- Iluminaci&oacute;n LED</p>\r\n\r\n<p>- Cuerpo en acero inoxidable</p>\r\n\r\n<p>- Patas regulables</p>\r\n\r\n<p>- Puertas batientes</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(156, 'CECT', 'Vitrina Esquinero Línea Titanium', 'Vitrina Esquinero Línea Titanium', '<p>- Exposici&oacute;n de productos secos</p>\r\n\r\n<p>- Temperatura: ambiente</p>\r\n\r\n<p>- Patas regulables</p>\r\n\r\n<p>- C&oacute;digo fabricante: CECT</p>\r\n\r\n<p>- Largo: 1,33mts</p>\r\n\r\n<p>- Profundidad: 68cm</p>\r\n\r\n<p>- Altura: 1,25mts</p>\r\n\r\n<p>obs: NO INCLUYE GRANITO</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(157, 'CCTP', 'Vitrina Caja Linea Titanium', 'Vitrina Caja Linea Titanium', '<p>- Exposici&oacute;n de productos secos</p>\r\n\r\n<p>- Temperatura: ambiente</p>\r\n\r\n<p>- Caja con llave</p>\r\n\r\n<p>- Estantes en vidrio</p>\r\n\r\n<p>- Patas regulables</p>\r\n\r\n<p>- C&oacute;digo fabricante: CCTP</p>\r\n\r\n<p>- Largo: 1,00mts</p>\r\n\r\n<p>- Profundidad: 68cm</p>\r\n\r\n<p>- Altura: 1,04mts</p>\r\n\r\n<p>Obs: NO INCLUYE GRANITO</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(158, 'CST1000', 'Vitrina Seca Linea Titanium', 'Vitrina Seca Lineal Titanium', '<p>- Exposici&oacute;n de productos secos</p>\r\n\r\n<p>- Temperatura: ambiente</p>\r\n\r\n<p>- Estantes en vidrio</p>\r\n\r\n<p>- Iluminaci&oacute;n LED</p>\r\n\r\n<p>- Cuerpo en acero inoxidable</p>\r\n\r\n<p>- Patas regulables</p>\r\n\r\n<p>- C&oacute;digo fabricante: CST1000</p>\r\n\r\n<p>- Largo: 1,00mts</p>\r\n\r\n<p>- Profundidad: 68cm</p>\r\n\r\n<p>- Otros tama&ntilde;os: ,1,50mts y&nbsp;</p>\r\n\r\n<p>- 2,00mts</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(159, 'CRT1000', 'Vitrina Refrigerada Linea Titanium', 'Vitrina Refrigerada Linea Titanium', '<p>- Exposici&oacute;n deproductos frios, l&aacute;cteos y tortas</p>\r\n\r\n<p>- Temperatura: 3&deg; a 10&deg;C</p>\r\n\r\n<p>- Refrigeraci&oacute;n: Aire forzado; fr&iacute;o seco</p>\r\n\r\n<p>- Controlador de temperatura electronico digital</p>\r\n\r\n<p>- Iluminaci&oacute;n LED</p>\r\n\r\n<p>- Estantes en vidrios</p>\r\n\r\n<p>- Cuerpo en acero inoxidable</p>\r\n\r\n<p>- Patas regulables</p>\r\n\r\n<p>- C&oacute;digo fabricante: CRT1000</p>\r\n\r\n<p>- Altura: 1,25mts</p>\r\n\r\n<p>- Largo: 1,00mts</p>\r\n\r\n<p>- Profundidad: 68cm</p>\r\n\r\n<p>- Otros tama&ntilde;os: ,1,50mts y&nbsp;</p>\r\n\r\n<p>2,00mts</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(160, 'CQT1000', 'Vitrina Térmica Linea Titanium', 'Vitrina Térmica Linea Titanium', '<p>- Exposici&oacute;n de productos salados</p>\r\n\r\n<p>- Temperatura: m&aacute;xima de 60&deg;C</p>\r\n\r\n<p>- Resistencia el&eacute;ctrica blindada</p>\r\n\r\n<p>- Controlador de temperatura m&eacute;canica</p>\r\n\r\n<p>- Iluminaci&oacute;n fluorescente</p>\r\n\r\n<p>- Cuerpo en acero inoxidable</p>\r\n\r\n<p>- Patas regulables</p>\r\n\r\n<p>- Bandejas en acero inox</p>\r\n\r\n<p>- C&oacute;digo fabricante: CQT1000</p>\r\n\r\n<p>- Altura: 1,25mts</p>\r\n\r\n<p>- Largo: 1,00mts</p>\r\n\r\n<p>- Profundidad: 68cm</p>\r\n\r\n<p>- Otros tama&ntilde;os: ,1,50mts y&nbsp;</p>\r\n\r\n<p>2,00mts</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(161, 'VPCV1360', 'Vitrina Panorámica Esquinera VPCV1360', 'Vitrina Panorámica Esquinera VPCV1360', '<p>-Exposici&oacute;n de productos &nbsp;secos</p>\r\n\r\n<p>-Temperatura: Ambiente</p>\r\n\r\n<p>-Patas regulables</p>\r\n\r\n<p>-Altura: 1,20mts</p>\r\n\r\n<p>-Largo: 1,36mts</p>\r\n\r\n<p>-Profundidad: 68cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(162, 'VPCX800', 'Vitrina Panorámica Caja VPCX800', 'Vitrina Panorámica Caja VPCX800', '<p>-Exposici&oacute;n de productos &nbsp;secos</p>\r\n\r\n<p>-Caja con llave</p>\r\n\r\n<p>-Vidrio superior</p>\r\n\r\n<p>-Patas regulables</p>\r\n\r\n<p>-Altura: 1,48mts</p>\r\n\r\n<p>-Largo: 80cm</p>\r\n\r\n<p>-Profundidad: 68cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(163, 'VPE600', 'Vitrina Panorámica Estufa VPE600', 'Vitrina Panorámica Estufa VPE600', '<p>-Exposici&oacute;n de productos &nbsp;salados</p>\r\n\r\n<p>-Temperatura: m&aacute;xima hasta 60&deg;C</p>\r\n\r\n<p>-Controlador de temperatura m&eacute;canico</p>\r\n\r\n<p>-Patas regulables</p>\r\n\r\n<p>-Altura: 1,20mts</p>\r\n\r\n<p>-Largo: 60cm</p>\r\n\r\n<p>-Profundidad: 70cm</p>\r\n\r\n<p>OPCI&Oacute;N DE OTRO TAMA&Ntilde;O</p>\r\n\r\n<p>-C&oacute;digo fabricante: VPE1000</p>\r\n\r\n<p>-Altura: 1,20mts</p>\r\n\r\n<p>-Largo: 1,00mts</p>\r\n\r\n<p>-Profundidad: 70cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(164, 'VPS1200', 'Vitrina Panorámica Seca VPS1200', 'Vitrina Panorámica Seca VPS1200', '<p>-Exposici&oacute;n de productos &nbsp;secos</p>\r\n\r\n<p>-Temperatura: ambiente</p>\r\n\r\n<p>-Patas regulables</p>\r\n\r\n<p>-Altura: 1,20mts</p>\r\n\r\n<p>-Largo: 1,20mts</p>\r\n\r\n<p>-Profundidad: 70cm</p>\r\n\r\n<p>OPCI&Oacute;N DE OTRO TAMA&Ntilde;O</p>\r\n\r\n<p>-C&oacute;digo fabricante: VPS1800</p>\r\n\r\n<p>-Altura: 1,20mts</p>\r\n\r\n<p>-Largo: 1,80mts</p>\r\n\r\n<p>-Profundidad: 70cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(165, 'VPRS1200', 'Vitrina Panorámica Refrigerada VPRS1200', 'Vitrina Panorámica Refrigerada VPRS1200', '<p>-Temperatura: 3&deg;C a 10&deg;C</p>\r\n\r\n<p>-Termostato m&eacute;canico</p>\r\n\r\n<p>-Exposici&oacute;n de productos Fr&iacute;os,l&aacute;cteos y tortas</p>\r\n\r\n<p>-Iluminaci&oacute;n LED</p>\r\n\r\n<p>-Altura: 1,20mts</p>\r\n\r\n<p>-Largo: 1,20mts</p>\r\n\r\n<p>-Profundidad: 70cm</p>\r\n\r\n<p>OPCI&Oacute;N DE OTRO TAMA&Ntilde;O</p>\r\n\r\n<p>-C&oacute;digo fabricante: VPRS1800</p>\r\n\r\n<p>-Altura: 1,20mts</p>\r\n\r\n<p>-Largo: 1,80mts</p>\r\n\r\n<p>-Profundidad: 70cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(166, 'VPR2PF1200 ', 'Vitrina Panorámica Doble Placa Fría VPR2PF1200 ', 'Vitrina Panorámica Doble Placa Fría VPR2PF1200 ', '<p>-Temperatura: 3&deg;C a 10&deg;C</p>\r\n\r\n<p>-Termostato m&eacute;canico</p>\r\n\r\n<p>-Exposici&oacute;n de productos Fr&iacute;os &nbsp;y l&aacute;cteos</p>\r\n\r\n<p>-Fr&iacute;o h&uacute;medo</p>\r\n\r\n<p>-Altura: 1,20mts</p>\r\n\r\n<p>-Largo: 1,20mts</p>\r\n\r\n<p>-Profundidad: 70cm</p>\r\n\r\n<p>OPCI&Oacute;N DE OTRO TAMA&Ntilde;O</p>\r\n\r\n<p>-C&oacute;digo fabricante: VPR2PF1800</p>\r\n\r\n<p>-Altura: 1,20mts</p>\r\n\r\n<p>-Largo: 1,80mts</p>\r\n\r\n<p>-Profundidad: 70cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(167, 'CSSTP1000', 'Vitrina Seca Linea Platinium', 'Vitrina Seca Linea Platinium', '<p>- Exposici&oacute;n de productos secos</p>\r\n\r\n<p>- Temperatura: ambiente</p>\r\n\r\n<p>- Estantes en vidrio</p>\r\n\r\n<p>-Iluminaci&oacute;n LED</p>\r\n\r\n<p>-Largo: 1,00mts</p>\r\n\r\n<p>-Altura: 1,27mts</p>\r\n\r\n<p>-Profundidad: 90cm</p>\r\n\r\n<p>OPCIONAL 1</p>\r\n\r\n<p>- CSSTP2000</p>\r\n\r\n<p>-Largo: 2,00mts</p>\r\n\r\n<p>-Altura: 1,27mts</p>\r\n\r\n<p>-Profundidad: 90cm</p>\r\n\r\n<p>OPCIONAL 2</p>\r\n\r\n<p>- CSSTP1500</p>\r\n\r\n<p>-Largo: 1,50mts</p>\r\n\r\n<p>-Altura: 1,27mts</p>\r\n\r\n<p>-Profundidad: 90cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(168, 'CRSTP1000', 'Vitrina Refrigerada Linea Platinium ', 'Vitrina Refrigerada Linea Platinium ', '<p>- Exposici&oacute;n de productos fr&iacute;os, l&aacute;cteos y tortas</p>\r\n\r\n<p>- Temperatura: 3&deg;C a 10&deg;C</p>\r\n\r\n<p>- Estantes en vidrio</p>\r\n\r\n<p>- Refrigeraci&oacute;n: aire forzado</p>\r\n\r\n<p>- Iluminaci&oacute;n LED</p>\r\n\r\n<p>- Largo: 1,00mts</p>\r\n\r\n<p>- Altura: 1,27mts</p>\r\n\r\n<p>- Profundidad: 90cm</p>\r\n\r\n<p>OPCIONALES 1</p>\r\n\r\n<p>- CRSTP1500</p>\r\n\r\n<p>-Largo: 1,50mts</p>\r\n\r\n<p>-Altura: 1,27mts</p>\r\n\r\n<p>-Profundidad: 90cm</p>\r\n\r\n<p>OPCIONALES 2</p>\r\n\r\n<p>-CRSTP2000</p>\r\n\r\n<p>-Largo: 2,00mts</p>\r\n\r\n<p>-Altura: 1,27mts</p>\r\n\r\n<p>-Profundidad: 90cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(169, 'CQSTP1000', 'Vitrina Térmica Linea Platinium ', 'Vitrina Térmica Linea Platinium ', '<p>- Exposici&oacute;n de productos salados</p>\r\n\r\n<p>- Temperatura m&aacute;xima: 60&deg;C</p>\r\n\r\n<p>- Resistencia el&eacute;ctrica blindada</p>\r\n\r\n<p>- Controlador de temperatura&nbsp;</p>\r\n\r\n<p>m&eacute;canica</p>\r\n\r\n<p>- Iluminaci&oacute;n LED</p>\r\n\r\n<p>- Largo: 1,00mts</p>\r\n\r\n<p>- Altura: 1,27mts</p>\r\n\r\n<p>- Profundidad: 90cm</p>\r\n\r\n<p>OPCIONALES 1</p>\r\n\r\n<p>- CQSTP1500</p>\r\n\r\n<p>-Largo: 1,50mts</p>\r\n\r\n<p>-Altura: 1,27mts</p>\r\n\r\n<p><br />\r\n-Profundidad: 90cm</p>\r\n\r\n<p>OPCIONALES 2</p>\r\n\r\n<p>-CQSTP2000</p>\r\n\r\n<p>-Largo: 2,00mts</p>\r\n\r\n<p>-Altura: 1,27mts</p>\r\n\r\n<p>-Profundidad: 90cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(170, 'CPSTP', 'Vitrina Caja Linea Platinium ', 'Vitrina Caja Linea Platinium ', '<p>- Exposici&oacute;n de productos secos</p>\r\n\r\n<p>- Temperatura: ambiente</p>\r\n\r\n<p>- Caja con llave</p>\r\n\r\n<p>- Estante en vidrio</p>\r\n\r\n<p>- Largo: 1,00mts</p>\r\n\r\n<p>- Altura: 1,14mts</p>\r\n\r\n<p>- Profundidad: 90cm</p>\r\n\r\n<p>- VITRINA CAJA SIN GRANITO</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(171, 'CSTPEF', 'Vitrina Curva Linea Platinium ', 'Vitrina Curva Linea Platinium ', '<p>-Exposici&oacute;n de productos secos</p>\r\n\r\n<p>-Temperatura: ambiente</p>\r\n\r\n<p>-Cuerpo en acero inoxidable</p>\r\n\r\n<p>-Patas regulables</p>\r\n\r\n<p>-Largo: 1,61mts</p>\r\n\r\n<p>-Altura: 1,27mts</p>\r\n\r\n<p>-Profundidad: 90cm</p>\r\n\r\n<p>-VITRINA CURVA SIN GRANITO</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(172, 'VRSCT1000', 'Vitrina Refrigerada Linea Show Case Titanium ', 'Vitrina Refrigerada Linea Show Case Titanium ', '<p>- Vitrina refrigerada</p>\r\n\r\n<p>- Exposici&oacute;n de fr&iacute;os y tortas</p>\r\n\r\n<p>- Temperatura : 3&deg;C 10&deg;C</p>\r\n\r\n<p>- Largo: 1,00mts</p>\r\n\r\n<p>- Altura: 84cm</p>\r\n\r\n<p>- Profundidad: 57cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(173, 'VSSCT1000', 'Vitrina Seca Linea Show Case Titanium ', 'Vitrina Seca Linea Show Case Titanium ', '<p>- Vitrina seca</p>\r\n\r\n<p>- Exposici&oacute;n de dulces y secos</p>\r\n\r\n<p>- Temperatura : Ambiente</p>\r\n\r\n<p>- Largo: 1,00mts</p>\r\n\r\n<p>- Altura: 84cm</p>\r\n\r\n<p>- Profundidad: 57cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(174, 'VQSCT1000', 'Vitrina Térmica Linea show Case Titanium ', 'Vitrina Térmica Linea show Case Titanium ', '<p>- Vitrina t&eacute;rmica</p>\r\n\r\n<p>- Exposici&oacute;n de salados</p>\r\n\r\n<p>- Temperatura m&aacute;xima: 60&deg;C</p>\r\n\r\n<p>- Largo: 1,00mts</p>\r\n\r\n<p>- Altura: 84cm</p>\r\n\r\n<p>- Profundidad: 57cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(175, 'VRSCP1000', 'Vitrina Refrigerada Linea Show Case Titanium ', 'Vitrina Refrigerada Linea Show Case Titanium ', '<p>- Vitrina refrigerada</p>\r\n\r\n<p>- Exposici&oacute;n de fr&iacute;os y tortas</p>\r\n\r\n<p>- Temperatura : 3&deg;C 10&deg;C</p>\r\n\r\n<p>- Largo: 1,00mts</p>\r\n\r\n<p>- Altura: 84cm</p>\r\n\r\n<p>- Profundidad: 57cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(176, 'VSSCP1000', 'Vitrina Seca Linea show Case Titanium ', 'Vitrina Seca Linea show Case Titanium ', '<p>- Vitrina seca</p>\r\n\r\n<p>- Exposici&oacute;n de dulces y secos</p>\r\n\r\n<p>- Temperatura : Ambiente</p>\r\n\r\n<p>- Largo: 1,00mts</p>\r\n\r\n<p>- Altura: 84cm</p>\r\n\r\n<p>- Profundidad: 57cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(177, 'VQSCP1000', 'Vitrina Térmica Linea Show Case Titanium ', 'Vitrina Térmica Linea Show Case Titanium ', '<p>- Vitrina t&eacute;rmica</p>\r\n\r\n<p>- Exposici&oacute;n de salados</p>\r\n\r\n<p>- Temperatura m&aacute;xima: 60&deg;C</p>\r\n\r\n<p>- Largo: 1,00mts</p>\r\n\r\n<p>- Altura: 84cm</p>\r\n\r\n<p>- Profundidad: 57cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(178, '000292', 'Caja fuerte 80', 'Con la caja fuerte EDW de COEXMA mantén seguro sus objetos de valores y documentos importantes. ', '<p><strong>Medidas Externas: Largo:</strong> 0,38&nbsp;cm -&nbsp;&nbsp;<strong>Alto:</strong>&nbsp;0,80&nbsp;cm&nbsp; -&nbsp;&nbsp;<strong>Profundidad:</strong>&nbsp;0,35&nbsp;cm&nbsp;</p>\r\n\r\n<p><strong>Medidas Internas:&nbsp; Largo:</strong> 0,27&nbsp;cm -&nbsp;&nbsp;<strong>Alto:</strong>&nbsp;0,61&nbsp;cm&nbsp; -&nbsp;&nbsp;<strong>Profundidad:</strong>&nbsp;0,26&nbsp;cm</p>\r\n\r\n<p><strong>Pesa: </strong>140&nbsp;kilos</p>\r\n', 0, 0, 0, NULL, NULL, 8, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(179, '000196', 'Caja fuerte 100', 'Con la caja fuerte EDW de COEXMA mantén seguro sus objetos de valores y documentos importantes. ', '<p><strong>Medidas Externas: Largo:</strong>&nbsp;0,44&nbsp;cm -&nbsp;&nbsp;<strong>Alto:</strong>&nbsp;0,96&nbsp;cm&nbsp; -&nbsp;&nbsp;<strong>Profundidad:</strong>&nbsp;0,33&nbsp;cm&nbsp;</p>\r\n\r\n<p><strong>Medidas Internas:&nbsp; Largo:</strong>&nbsp;0,33&nbsp;cm -&nbsp;&nbsp;<strong>Alto:</strong>&nbsp;0,80&nbsp;cm&nbsp; -&nbsp;&nbsp;<strong>Profundidad:</strong>&nbsp;0,315&nbsp;cm</p>\r\n\r\n<p><strong>Pesa:&nbsp;</strong>180&nbsp;kilos</p>\r\n', 0, 0, 0, NULL, NULL, 8, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(180, '000195', 'Caja fuerte 60', 'Con la caja fuerte EDW de COEXMA mantén seguro sus objetos de valores y documentos importantes. ', '<p><strong>Medidas Externas: Largo:</strong> 0,38&nbsp;cm -&nbsp;&nbsp;<strong>Alto:</strong>&nbsp;0,60&nbsp;cm&nbsp; -&nbsp;&nbsp;<strong>Profundidad:</strong>&nbsp;0,35&nbsp;cm&nbsp;</p>\r\n\r\n<p><strong>Medidas Internas:&nbsp; Largo:</strong> 0,27&nbsp;cm -&nbsp;&nbsp;<strong>Alto:</strong>&nbsp;0,40&nbsp;cm&nbsp; -&nbsp;&nbsp;<strong>Profundidad:</strong>&nbsp;0,26&nbsp;cm</p>\r\n\r\n<p><strong>Pesa: </strong>120&nbsp;kilos</p>\r\n', 0, 0, 0, NULL, NULL, 8, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(181, '000197', 'Caja fuerte 120', 'Con la caja fuerte EDW de COEXMA mantén seguro sus objetos de valores y documentos importantes. ', '<p><strong>Medidas Externas: Largo:</strong> 0,50 cm -&nbsp;&nbsp;<strong>Alto:</strong>&nbsp;1,16 cm&nbsp; -&nbsp;<strong>Profundidad:</strong>&nbsp;0,46&nbsp;cm&nbsp;</p>\r\n\r\n<p><strong>Medidas Internas:&nbsp; Largo:</strong> 0,41&nbsp;cm -&nbsp;&nbsp;<strong>Alto:</strong>&nbsp;1,00&nbsp;cm -&nbsp;&nbsp;<strong>Profundidad:</strong>&nbsp;0,38&nbsp;cm</p>\r\n\r\n<p><strong>Pesa: </strong>250&nbsp;kilos</p>\r\n', 0, 0, 0, NULL, NULL, 8, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(182, '2002', 'Armario 2 Puertas 1100 Y37 2002', 'Armario de 2 Puertas, tamaño ideal y amplio por dentro', '<p><strong>Alto:<br />\r\nLargo:<br />\r\nProfundidad:</strong></p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(183, '11069', 'Armario bajo Credenza 390514', 'Armario Bajo con llaves para guardar documentos y papeles', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong> 1,20 cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,74cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,45 cm</p>\r\n', 0, 0, 0, NULL, NULL, 9, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(184, '12913', 'Armario alto semi abierto 390512', 'Elegante armario alto, con llaves. Ahora podes organizar tus papeles de la oficina', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo</strong>: 0,80 cm</p>\r\n\r\n<p><strong>Altura:</strong> 1,60 cm</p>\r\n\r\n<p><strong>Profundidad</strong>: 0,45 cm</p>\r\n', 0, 0, 0, NULL, NULL, 9, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(185, 'SPIN 36802 BAJA ', 'Banqueta Spin 36802 Baja', 'Elegante y firme Banqueta Spin para bares y boutiques multi uso por su estilo y design', '<p>Elegante y firme Banqueta Spin para bares y boutiques multi uso por su estilo y design</p>\r\n', 50000, 0, 0, NULL, NULL, 5, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(186, '12774', 'Armario Alto de 2 Puertas 390507 ', 'Elegante armario de 2 puertas alto, con llaves. Ahora podes organizar tus papeles de la oficina', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;0,80 cm</p>\r\n\r\n<p><strong>Altura:</strong> 1,60 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,45 cm</p>\r\n', 0, 0, 0, NULL, NULL, 9, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(187, '2101', 'Armario Bajo de 2 Puertas 800 Y37 2101', 'Armario Bajo compacto pero amplio por dentro, para oficinas compactas y espacios moderados', '<p><strong>Largo: </strong>80 cm<br />\r\n<strong>Altura:</strong> 75 cm<br />\r\n<strong>Profundidad: </strong>50 cm</p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(188, '2109', 'Armario 4 Puertas 1400 Y37 2109', 'Amplio y firme armario de 4 puertas', '<p><strong>Altura:</strong> 75 cm</p>\r\n\r\n<p><strong>Largo:</strong> 140 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 50 cm</p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(189, '2111', 'Armario 4 Puertas 1600 Y37 2111', 'Amplio y firme armario de 4 puertas', '<p><strong>Altura</strong>: 75 cm</p>\r\n\r\n<p><strong>Largo</strong>: 160 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 50 cm</p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(190, '05583', 'Armario Aparador 1600 Y37 2104', 'Armario tipo aparador, sofisticado y elegante', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Alto:</strong>&nbsp;0,75&nbsp;cm</p>\r\n\r\n<p><strong>Largo: </strong>1,60 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>0,50 cm</p>\r\n', 1466000, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(191, '09885', 'Armario Directorio con Cajones 1800 Y37 5713', 'Armario Director, amplio, robusto, firme y elegante', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Alto:</strong>&nbsp;0,75 cm</p>\r\n\r\n<p><strong>Largo:&nbsp;</strong> 18,0 cm</p>\r\n\r\n<p><strong>Profundidad:&nbsp;</strong>&nbsp;0,50 cm</p>\r\n', 1910000, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(192, '2002 ', 'Armario 2 Puertas 1100 Y37 2002 ', 'Armario de dos puertas, ideal para el uso diario para la oficina o Home Office', '<p><strong>Alto: </strong>160 cm</p>\r\n\r\n<p><strong>Largo: </strong>80 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>50 cm</p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(193, '001803', 'Armario Bajo 2 Puertas 654', 'Armario Bajo con grandes espacio de almacenamientos', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Alto:</strong>&nbsp;0,76 cm</p>\r\n\r\n<p><strong>Largo: </strong>0,83.5 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>0,405 cm</p>\r\n', 710000, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(194, '10325', 'Armario Bajo con Puertas 5773', 'Armario bajo con alta capacidad de almacenamiento', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Alto: </strong>0,75 cm</p>\r\n\r\n<p><strong>Largo: </strong>1,80 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,50 cm</p>\r\n', 2233000, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(195, '5774', 'Armario Alto Tamburato 5774', 'Armario Alto con robusto material, para mucho almacenamiento', '<p><strong>Alto:</strong> 165 cm</p>\r\n\r\n<p><strong>Largo: </strong>83 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 40 cm</p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(196, '07482', 'Armario Alto 2 Puertas 5775 - 5776', 'Armario Alto, elegante y sofisticado', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Alto: </strong>1,60 cm</p>\r\n\r\n<p><strong>Largo: </strong>0,50 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>1,25 cm</p>\r\n', 1980000, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(197, '10338', 'Armario Alto Tamburato con Puertas Corredizas 5780', 'Super armario con puertas corredizas de buen y robusto material', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Alto: </strong>1,60 cm</p>\r\n\r\n<p><strong>Largo: </strong>1,25 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>0,50 cm</p>\r\n', 2695000, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(198, 'ATC8073', 'Armario Bajo 2 Puertas ATC8073', 'Armario Bajo de 2 puertas especial para todo tipo de documentos', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Alto: </strong>80 cm</p>\r\n\r\n<p><strong>Largo:</strong>75 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>45 cm</p>\r\n', 550000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(199, 'ATC1273 ', 'Armario Bajo Credenza ATC1273 ', 'Armario amplio y elegante', '<p><strong>Medidas: </strong></p>\r\n\r\n<p><strong>Alto: </strong>1,20cm</p>\r\n\r\n<p><strong>Largo: </strong>0,75 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>0,45 cm</p>\r\n', 740000, 0, 0, NULL, NULL, 16, 3, 0, 1, NULL, 0, NULL, NULL, ''),
(200, '12099', 'Armario Alto Mixto ATC8017', 'Armario Alto para oficinas corporativas y Home Office', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Alto: </strong>0<strong>,</strong>80 cm</p>\r\n\r\n<p><strong>Largo:</strong>1,60 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 0<strong>,</strong>45 cm</p>\r\n', 850000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(201, 'ATC8016', 'Armario Alto ATC8016', 'Armario Alto 2 puertas para guardar todo los artículos y papeleos de la oficina', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Alto: </strong>0,80 cm</p>\r\n\r\n<p><strong>Largo:</strong>1,60 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>0<strong>,</strong>45 cm</p>\r\n', 930000, 0, 0, NULL, NULL, 16, 3, 0, 1, NULL, 0, NULL, NULL, ''),
(202, '11453', 'Cajonero Móvil de 3 Cajones 390732', 'Cajonero Móvil con 2 cajones normales y 1 para carpetas colgantes ', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;0,37&nbsp;cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,63&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,45&nbsp;cm</p>\r\n', 0, 0, 0, NULL, NULL, 9, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(203, '11043', 'Cajonero Móvil de 4 Cajones 390731 ', 'Cajonero móvil con 4 cajones para guardar y mantener seguro tus documentos de la oficina', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;0,37&nbsp;cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,63&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,45&nbsp;cm</p>\r\n', 0, 0, 0, NULL, NULL, 9, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(204, '12582', 'Archivo de 4 Cajones ATC4613', 'Archivo 4 cajones con llave ', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo</strong>: 0,46 cm</p>\r\n\r\n<p><strong>Alto:&nbsp;</strong>1,26 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 0,45 cm</p>\r\n', 910000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(205, '09746', 'Cajonero Fijo 2 Cajones Y37 2610', 'Elegante y practico cajonero para documentos', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Alto: </strong>0,26 cm</p>\r\n\r\n<p><strong>Largo: </strong>0,36&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad: </strong>0,38 cm</p>\r\n', 330000, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(206, '2603 ', 'Cajonero de 3 Cajones  Y37 2603 ', 'Cajonero de 3 cajones con llave', '<p><strong>Alto:</strong></p>\r\n\r\n<p><strong>Largo:</strong></p>\r\n\r\n<p><strong>Profundidad:&nbsp;</strong></p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(207, '05576', 'Cajonero Móvil de 3 Cajones Y37 2604', 'Cajonero Móvil de 3 cajones con llave, con 2 cajones normales y 1 cajón para carpetas colgantes', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Alto: </strong>0,68,5&nbsp;cm</p>\r\n\r\n<p><strong>Largo: </strong>0,46&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad: </strong>0,46&nbsp;cm</p>\r\n', 803000, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(208, '2602', 'Archivo de 4 Cajones  Y37 2602', 'Archivos de 4 cajones', '<p><strong>Alto:</strong></p>\r\n\r\n<p><strong>Largo:</strong></p>\r\n\r\n<p><strong>Profundidad:</strong></p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(209, '666', 'Cajonero Fijo de 2 Cajones 666', 'Cajonero Fijo de 2 Cajones ', '<p><strong>Alto:</strong></p>\r\n\r\n<p><strong>Largo:</strong></p>\r\n\r\n<p><strong>Profundidad:</strong></p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(210, '649', 'Cajonero de 3 Cajones 649', 'Cajonero de 3 Cajones', '<p><strong>Alto: </strong>63 cm</p>\r\n\r\n<p><strong>Largo: </strong>44&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 39 cm</p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(211, '001343', 'Cajonero Móvil con 3 Cajones 648', 'Cajonero Móvil con 3 Cajones', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Alto:</strong> 0,70 cm</p>\r\n\r\n<p><strong>Largo: </strong>0,46cm</p>\r\n\r\n<p><strong>Profundidad: </strong>0,49 cm</p>\r\n', 950000, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(212, '657', 'Archivo de 4 Cajones 657', 'Archivo de 4 Cajones 657', '<p><strong>Alto: </strong>46 cm</p>\r\n\r\n<p><strong>Largo: </strong>130 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>50 cm</p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(213, 'ATC3340', 'Cajonero Fijo 2 Cajones ATC3340', 'Elegante y practico cajonero para documentos', '<p>Alto: 33 cm</p>\r\n\r\n<p>Largo: 30 cm</p>\r\n\r\n<p>Profundidad: 40&nbsp;cm</p>\r\n', 0, 0, 0, NULL, NULL, 12, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(214, 'Soporte', 'Soporte Para Monitor', 'Soporte Para Monitor', '<p><strong>Alto: </strong>12 cm</p>\r\n\r\n<p><strong>Largo: </strong>40 cm</p>\r\n\r\n<p><strong>Profundida:</strong> 24 cm</p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(215, '5212', 'Porta CPU 5212', 'Porta CPU 5212', '<p><strong>Alto: </strong>18&nbsp;cm</p>\r\n\r\n<p><strong>Largo: </strong>28&nbsp;cm</p>\r\n\r\n<p><strong>Profundida:</strong>&nbsp;38 cm</p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(216, '5214', 'Apoyo para Pies 5214', '', '<p>Apoyo para Pies 5214</p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(217, '827', 'Basurero Ejecutivo 827', 'Basurero Ejecutivo 827', '<p><strong>Altura:</strong> 30 cm</p>\r\n\r\n<p><strong>Largo:</strong> 25 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 25 cm</p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(218, 'Nicho Ejecutivo', 'Nicho Ejecutivo', 'Nicho Ejecutivo', '<p><strong>Alto: </strong>32 cm</p>\r\n\r\n<p><strong>Largo: </strong>40 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>27 cm</p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(219, '1043', 'Painel Ejecutivo 1043', 'Painel Ejecutivo 1043', '<p><strong>Alto: </strong>103 cm</p>\r\n\r\n<p><strong>Largo: </strong>160 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>5.5 cm</p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(220, '002066', 'Aparador Ejecutivo 1049', 'Aparador Ejecutivo con tampo y patas de 5 cm, ideal para entradas y recepciones', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Alto: </strong>0,85 cm</p>\r\n\r\n<p><strong>Largo:</strong> 1,60 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>0,40 cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 923000, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(221, '98266', 'Call Center Duplo 98266', 'Call Center doble para trabajo, elegante y muy moderno en su estilo', '<p><strong>Largo</strong>: 90 cm</p>\r\n\r\n<p><strong>Alto:</strong> 120 cm</p>\r\n\r\n<p><strong>Profundidad</strong>: 162 cm</p>\r\n', 0, 0, 0, NULL, NULL, 9, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(222, '12422', 'Plataforma de trabajo Dupla para 4 puestos 398197 ', 'Plataforma de trabajo Dupla para 4 puestos acompaña 4 cajas de tomadas', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;2,40 cm</p>\r\n\r\n<p><strong>Altura: </strong>0,74 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>1,32&nbsp;cm</p>\r\n', 0, 0, 0, NULL, NULL, 9, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(223, '12106', 'Plataforma de Trabajo 3982013', 'Plataforma central para 4 puestos de trabajos, acompaña 4 cajas de tomadas', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;2,40 cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp; 0,74&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:&nbsp;</strong>1,32&nbsp;cm</p>\r\n', 0, 0, 0, NULL, NULL, 9, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(224, '98225', 'Plataforma de Trabajo 398225', 'Plataforma central para 1 puesto de trabajo, acompaña 1 cajas de tomadas', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;1,20 cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp; 0,74&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad: </strong>0,70&nbsp;cm&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 9, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(225, '11245', 'Plataforma de Trabajo 398185', 'Plataforma central para 2 puestos de trabajos, acompaña 2 cajas de tomadas', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;1,20 cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp; 0,74&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:&nbsp;</strong>1,32&nbsp;cm</p>\r\n', 0, 0, 0, NULL, NULL, 9, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(226, 'CASILLERO P6', 'Casillero de Metal P6 ', 'Nunca fue tan fácil acomodar y organizar todo tipo de archivos, materiales, herramientas con los fuertes casilleros de Lunasa', '<p><strong>Puertas:</strong>&nbsp;6</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;200 cm</p>\r\n\r\n<p><strong>Largo</strong>:&nbsp;93&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 40&nbsp;cm</p>\r\n', 0, 0, 0, NULL, NULL, 11, 0, 0, 0, NULL, 0, NULL, NULL, ''),
(227, '003831', 'Casillero de Metal P8P  RL20008', 'Casilleros de metal de 20 puertas para guarda volumen, utilizable con candados ', '<p><strong>Puertas: </strong>8</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;2,00 cm</p>\r\n\r\n<p><strong>Largo: </strong>0,63&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad: </strong>0<strong>,</strong>40&nbsp;cm</p>\r\n\r\n<p><strong>Chapa:</strong>&nbsp;0,26</p>\r\n', 1285000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(228, '002156', 'Casillero de Metal P12P RL20009', 'Casilleros de metal de 12 puerta para guarda volumen, utilizable con candados ', '<p><strong>Puertas</strong>: 12</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;2,00 cm</p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;0,93&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad</strong>: 0,40&nbsp;cm</p>\r\n\r\n<p><strong>Chapa: </strong>26</p>\r\n', 1820000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(229, '000609', 'Casillero de Metal P16 RL20005', 'Casilleros de metal de 16 puertas para guarda volumen, utilizable con candados ', '<p><strong>Puertas:</strong> 16</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;2,00 cm</p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;1,23&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,40&nbsp;cm</p>\r\n\r\n<p><strong>Chapa:</strong> 26</p>\r\n', 2320000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(230, '001870', 'Casillero de Metal P20 RL20006', 'Casilleros de metal de 20 puertas para guarda volumen, utilizable con candados ', '<p><strong>Puertas:</strong>&nbsp;20</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;2,00 cm</p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;1,23&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,40&nbsp;cm</p>\r\n\r\n<p><strong>Chapa:</strong> 26</p>\r\n', 2495000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(231, '001973', 'Armario de Metal  AL18003', 'Armario de metal de 2 puertas con llaves de 3 bandejas internas, siendo 1 bandeja fija y 2 regulables', '<p><strong>Altura: </strong>1,70 cm</p>\r\n\r\n<p><strong>Largo: </strong>0,75 cm</p>\r\n\r\n<p><strong>Profundidad</strong>: 0,32 cm</p>\r\n\r\n<p><strong>Chapa:</strong> 26</p>\r\n', 1065000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, '');
INSERT INTO `tb_producto` (`id`, `referencia`, `nombre`, `descripcion_corta`, `descripcion_detallada`, `precio`, `stock`, `valor_descuento`, `descripcion`, `valor_mayorista`, `id_marca`, `id_linea`, `destaque`, `recomendado`, `oden_destaque`, `activo`, `unique_hits`, `total_hits`, `modelo`) VALUES
(232, '06347', 'Archivo de Metal 4 Cajones AQL22003', 'Nunca fue tan fácil acomodar y organizar todo tipo de archivos, materiales, herramientas con los fuertes archiveros de Lunasa', '<h3><strong>Chapa:</strong> 26</h3>\r\n\r\n<h3><strong>Medidas:</strong></h3>\r\n\r\n<h3><strong>Largo</strong>: 1,33&nbsp;cm</h3>\r\n\r\n<h3><strong>Alto</strong>: 0,46&nbsp;cm</h3>\r\n\r\n<h3><strong>Produndidad:</strong>&nbsp;0,60 cm</h3>\r\n\r\n<h3><strong>Capacidad:</strong> 25 Kg por caj&oacute;n</h3>\r\n\r\n<h3>&nbsp;</h3>\r\n', 1077000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(465, '001972', 'Armario de Metal  AL18005', 'Armario de metal de 2 puertas con llaves de 4 bandejas internas, siendo 1 bandeja fija y 3 regulables', '<p><strong>Altura: </strong>2,00 cm</p>\r\n\r\n<p><strong>Largo: </strong>0,90&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad</strong>: 0,40&nbsp;cm</p>\r\n\r\n<p><strong>Chapa:</strong> 26</p>\r\n', 1500000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(233, '000058', 'Archivo de Metal 2 Cajones AQL22000', 'Nunca fue tan fácil acomodar y organizar todo tipo de archivos, materiales, herramientas con los fuertes archiveros de Lunasa', '<h3><strong>Chapa:</strong> 26</h3>\r\n\r\n<h3><strong>Medidas:</strong></h3>\r\n\r\n<h3><strong>Largo</strong>: 0,46 cm</h3>\r\n\r\n<h3><strong>Alto</strong>: 0,69 cm</h3>\r\n\r\n<h3><strong>Produndidad:</strong>&nbsp;0,60 cm</h3>\r\n\r\n<h3><strong>Capacidad:</strong> 25 Kg por caj&oacute;n</h3>\r\n\r\n<p>&nbsp;</p>\r\n', 775000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(234, '36105 2L ', 'Sofá de Espera Box 36105 2L ', 'Cómodo y sofisticado sofá de espera, para que tus invitados, clientes y amigos se sientan a gusto en tu oficina o sala de espera', '<p>C&oacute;modo y sofisticado sof&aacute; de espera, para que tus invitados, clientes y amigos se sientan a gusto en tu oficina o sala de espera</p>\r\n', 0, 0, 0, NULL, NULL, 5, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(235, '12646', 'Balcón de Recepción 398272 ', 'Sofisticado balcón de recepción, para recibir a clientes y amigos para tu oficina o sala de espera', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo: </strong>1,20 cm</p>\r\n\r\n<p><strong>Alto: </strong>1,10 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,60 cm</p>\r\n', 0, 0, 0, NULL, NULL, 9, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(236, '11039', 'Balcón de Recepción en L 398275', 'Sofisticado balcón de recepción, para recibir a clientes y amigos para tu oficina o sala de espera', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo: </strong>1,40 cm</p>\r\n\r\n<p><strong>Alto: </strong>1,10 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 1,40 cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 9, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(237, 'SALA DE REUNIONES', 'Sala de Reuniones', 'Podes solicitarnos presupuesto de ambientación para su oficina o sala de reuniones', '<p>Podes solicitarnos presupuesto de ambientaci&oacute;n para su oficina o sala de reuniones, le hacemos el proyecto a su gusto y medida para luego amoblarlo como siempre quiso y asi cerrar grandes negocios</p>\r\n', 0, 0, 0, NULL, NULL, 5, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(238, '09157', 'Mesa Signa Recta 394001 ', 'Moderna, robusta, buen diseño especial para montar en una oficina con su estilo recto minimalista, con detalles en aluminio', '<p><strong>Modelo 394001</strong></p>\r\n\r\n<p><strong>Largo:</strong> 1,78&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,90 cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,75&nbsp;cm</p>\r\n', 0, 0, 0, NULL, NULL, 9, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(239, '11057', 'Mesa Recta Create 390003', 'Moderna, robusta, buen diseño especial para montar en una oficina con su estilo recto minimalista', '<p><strong>Modelo 390003</strong></p>\r\n\r\n<p><strong>Largo</strong>: 120 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;60&nbsp;cm</p>\r\n\r\n<p><strong>Altura</strong>: 74&nbsp;cm</p>\r\n', 0, 0, 0, NULL, NULL, 9, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(562, '11058', 'Mesa Recta Create 390004', 'Moderna, robusta, buen diseño especial para montar en una oficina con su estilo recto minimalista', '<p><strong>Modelo 390004</strong></p>\r\n\r\n<p><strong>Largo</strong>: 140 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;60&nbsp;cm</p>\r\n\r\n<p><strong>Altura</strong>: 74&nbsp;cm</p>\r\n', 0, 0, 0, NULL, NULL, 9, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(240, '1200/37 2203', 'Mesa Operacional 1200 Y37 2203', 'Moderna, robusta, buen diseño especial para montar en una oficina con su estilo recto minimalista', '<p><strong>Largo</strong>: 120 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;60 cm</p>\r\n\r\n<p><strong>Altura</strong>: 75&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(241, '05582', 'Mesa Operacional 1400 Y37 2102', 'Moderna, robusta, buen diseño especial para montar en una oficina con su estilo recto minimalista', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo</strong>: 1,40 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,50 cm</p>\r\n\r\n<p><strong>Altura</strong>: 0,75&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 771000, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(242, '06113', 'Mesa Dialogo 1400  Y 37', 'Moderna, robusta, buen diseño especial para montar en una oficina con su estilo recto minimalista', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo</strong>: 1,80 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,80 cm</p>\r\n\r\n<p><strong>Altura</strong>: 0,75&nbsp;cm</p>\r\n', 1069000, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(243, '1600/1800 Y37', 'Mesa Gerencial 1600 Y 1800 Y 37', 'Moderna, robusta, buen diseño especial para montar en una oficina con su estilo recto minimalista', '<p><strong>Largo</strong>: 120 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;60 cm</p>\r\n\r\n<p><strong>Altura</strong>: 75&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(244, '05542', 'Mesa Director  2000 Y 37 2402', 'Moderna, robusta, buen diseño especial para montar en una oficina con su estilo recto minimalista', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo</strong>: 2,00 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,80 cm</p>\r\n\r\n<p><strong>Altura</strong>: 0,75&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1595000, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(245, '11719', 'Mesa Director 5615', 'Moderna, robusta, buen diseño especial para montar en una oficina con su estilo minimalista', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo</strong>: 1,60 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;1,60 cm</p>\r\n\r\n<p><strong>Altura</strong>: 0,75&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 2133000, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(246, '11770', 'Mesa Director 2000 Y37 5607', 'Moderna, robusta en L, buen diseño especial para montar en una oficina con su estilo minimalista', '<p><strong>Medida:</strong></p>\r\n\r\n<p><strong>Largo</strong>: 2,00 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;1.60 cm</p>\r\n\r\n<p><strong>Altura</strong>: 0,75&nbsp;cmS</p>\r\n\r\n<p>&nbsp;</p>\r\n', 2320000, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(247, ' ORIGAMI LI/LD', 'Mesa Tamburato  ORIGAMI LI LD', 'Moderna, robusta, buen diseño especial para montar en una oficina con su estilo recto minimalista', '<p><strong>Largo</strong>: 120 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;60 cm</p>\r\n\r\n<p><strong>Altura</strong>: 75&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(248, '1250/1430 ', 'Mesa Tamburato 1250 y 1430 ', 'Moderna, robusta, buen diseño especial para montar en una oficina con su estilo recto minimalista', '<p><strong>Largo</strong>: 120 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;60 cm</p>\r\n\r\n<p><strong>Altura</strong>: 75&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(249, '1500/1800', 'Mesa Tamburato 1500 1800', 'Moderna, robusta, buen diseño especial para montar en una oficina con su estilo recto minimalista', '<p><strong>Largo</strong>: 120 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;60 cm</p>\r\n\r\n<p><strong>Altura</strong>: 75&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(250, 'Tamburato con Vidrio', 'Mesa Tamburato con Vidrio', 'Moderna, robusta, buen diseño especial para montar en una oficina con su estilo recto minimalista', '<p><strong>Largo</strong>: 120 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;60 cm</p>\r\n\r\n<p><strong>Altura</strong>: 75&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(251, 'Tamburato con cajon', 'Mesa Tamburato con Cajones', 'Moderna, robusta, buen diseño especial para montar en una oficina con su estilo recto minimalista', '<p><strong>Largo</strong>: 120 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;60 cm</p>\r\n\r\n<p><strong>Altura</strong>: 75&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(252, '10320', 'Mesa Tamburato Director 5039', 'Moderna, robusta, buen diseño especial para montar en una oficina con su estilo minimalista color louro negro', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo</strong>: 2,00 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;1,80 cm</p>\r\n\r\n<p><strong>Altura</strong>: 0,76&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 2273000, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(253, '5741/5761', 'Mesa Director 5741 5761', 'Moderna, robusta, buen diseño especial para montar en una oficina con su estilo recto minimalista', '<p><strong>Largo</strong>: 120 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;60 cm</p>\r\n\r\n<p><strong>Altura</strong>: 75&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(254, 'ATC1260/9045', 'Mesa en L ATC1260 - 9045', 'Moderna, robusta, buen diseño especial para montar en una oficina con su estilo en L minimalista', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo</strong>: 1,20 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;1,50&nbsp;cm</p>\r\n\r\n<p><strong>Altura</strong>: 0,72&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 720000, 0, 0, NULL, NULL, 16, 3, 0, 1, NULL, 1, NULL, NULL, ''),
(255, '12581', 'Mesa Recta ATC1260 ', 'Moderna, robusta, buen diseño especial para montar en una oficina con su estilo recto minimalista', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo</strong>: 1,20&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,60&nbsp;cm</p>\r\n\r\n<p><strong>Altura</strong>: 0,72&nbsp;cm</p>\r\n', 430000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(256, '2000 90428', 'Mesa de Reunión 2000 90428', 'Elegante mesa de Reunión diseño minimalista ', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong> 140 x 180 xcm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp; 0,75 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 0,60 cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 9, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(257, '11072', 'Mesa de Reunión Oval  390403', 'Mesa de Reunión Oval bien compacta, ideal para salas de reuniones ', '<p><strong>Medidas;</strong></p>\r\n\r\n<p><strong>Largo:</strong> 2,00&nbsp;cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp; 0,74&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad: </strong>1,20 cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 9, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(258, '10998', 'Mesa de Reunión Redonda 390406', 'Elegante mesa de Reunión diseño minimalista', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong> 1,20 cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp; 0,74&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad: </strong>1,20 cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 9, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(259, '05564', 'Mesa de Reunión 2000 Y37 5621 ', 'Elegante mesa de Reunión diseño minimalista', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;2,00 cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp; 0,75 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>1,2&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1735000, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(260, '001776', 'Mesa de Reunión Tamburato 642', 'Elegante mesa de Reunión diseño minimalista', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;2,00 cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp; 0,76&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad: </strong>1,00 cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 2170000, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(261, 'SPIN 36814', 'Banqueta SPIN 36814', 'Elegante y firme Banqueta Spin para bares y boutiques multi uso por su estilo y design', '<p>Elegante y firme Banqueta Spin para bares y boutiques multi uso por su estilo y design</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(262, 'GO 34020', 'Banqueta GO 34020', 'Elegante y firme Banqueta Spin para bares y boutiques multi uso por su estilo y design', '<p>Elegante y firme Banqueta Spin para bares y boutiques multi uso por su estilo y design</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(263, 'FUN 14015 BAJA', 'Banqueta Fun 14015 Baja', 'Elegante y firme Banqueta Spin para bares y boutiques multi uso por su estilo y design\r\n', '<p>Elegante y firme Banqueta FUN para bares y boutiques multi uso por su estilo y design</p>\r\n\r\n<p>Altura: 50 cm<br />\r\nsin respaldero, estructura cromada y negro&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(264, '11439', 'Banqueta 14015 con Respaldo', 'Elegante y firme Banqueta para bares y boutiques, desayunador multi uso por su estilo y design', '<p>Elegante y firme Banqueta con estructura cromado y asiento revestido en cuerina&nbsp;rojo para bares y boutiques, desayunador multi uso por su estilo y design</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(265, '13292', 'Banqueta Fun 14015 Sin Respaldo', 'Elegante y firme Banqueta para bares y boutiques, desayunador multi uso por su estilo y design', '<p>Elegante y firme Banqueta con estructura cromado y asiento revestido en cuerina&nbsp;rojo para bares y boutiques, desayunador multi uso por su estilo y design</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(266, 'FUN 14016', 'Banqueta Fun FUN 14016', 'Elegante y firme Banqueta Spin para bares y boutiques multi uso por su estilo y design', '<p>Elegante y firme Banqueta Spin para bares y boutiques multi uso por su estilo y design</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(267, '11438', 'Banqueta FUN 14020 Estofada', 'Elegante y firme Banqueta baja para bares y boutiques, desayunador multi uso por su estilo y design', '<p>Elegante y firme Banqueta con estructura cromado y asiento revestido en cuerina&nbsp;rojo para bares y boutiques, desayunador multi uso por su estilo y design</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(268, 'FUN 14020 Madera', 'Banqueta FUN 14020 Madera', 'Elegante y firme Banqueta Spin para bares y boutiques multi uso por su estilo y design', '<p>Elegante y firme Banqueta Spin para bares y boutiques multi uso por su estilo y design</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(269, '9009 CA021', 'Banqueta 9009 CA021', 'Elegante y firme Banqueta Spin para bares y boutiques multi uso por su estilo y design\r\n\r\n', '<p><strong>Altura: </strong>102 cm</p>\r\n\r\n<p><strong>Largo:</strong> 42 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 48 cm</p>\r\n', 0, 0, 0, NULL, NULL, 7, 0, 0, 0, NULL, 0, NULL, NULL, ''),
(270, 'LILIAN CA006 ', 'Banqueta Lilian CA006 ', 'Elegante y firme Banqueta Spin para bares y boutiques multi uso por su estilo y design', '<p><strong>Altura: </strong>102 cm</p>\r\n\r\n<p><strong>Largo:</strong> 42 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 48 cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 7, 0, 0, 0, NULL, 0, NULL, NULL, ''),
(271, 'VIGO CA054', 'Banqueta VIGO CA054', 'Elegante y firme Banqueta Spin para bares y boutiques multi uso por su estilo y design', '<p><strong>Altura: </strong>100 cm</p>\r\n\r\n<p><strong>Largo:</strong> 49&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;57&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 7, 0, 0, 0, NULL, 0, NULL, NULL, ''),
(272, 'APOLLO CA047 ', 'Baqueta APOLLO CA047 ', 'Elegante y firme Banqueta Spin para bares y boutiques multi uso por su estilo y design', '<p><strong>Altura: </strong>101&nbsp;cm</p>\r\n\r\n<p><strong>Largo:</strong> 41&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;51&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 7, 0, 0, 0, NULL, 0, NULL, NULL, ''),
(273, 'MJ023', 'Mesa Rectangular Tratoria MJ023', 'Mesa Rectangular Tratoria MJ023', '<p><strong>Altura:</strong> 77cm</p>\r\n\r\n<p><strong>Largo: </strong>140 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 80 cm</p>\r\n', 0, 0, 0, NULL, NULL, 7, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(274, '06866', 'Mesa Classic Cuadrada 06866', 'Mesa Classic Cuadrada 06866', '<p>Mesa Classic Cuadrada desmontable con pies de alumino&nbsp;<br />\r\nMesas plasnew de varios colores para su negocio o comercio</p>\r\n\r\n<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Altura: </strong>0.72 cm<br />\r\n<strong>Largo:</strong> 0.70 cm<br />\r\n<strong>Profundidad:</strong> 0.70 cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 302000, 0, 0, NULL, NULL, 15, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(275, 'MJ019', 'Mesa cuadrada Tratoria MJ019', 'Mesa Cuadrada elegante y de primera', '<p><strong>Altura:</strong> 77 cm</p>\r\n\r\n<p><strong>Largo: </strong>80 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>80 cm</p>\r\n', 0, 0, 0, NULL, NULL, 7, 0, 0, 0, NULL, 0, NULL, NULL, ''),
(276, '12301', 'Mesa Pub Redonda Plegable BA001', 'Mesa Pub Redonda Plegable BA001', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Altura: </strong>0,70 cm</p>\r\n\r\n<p><strong>Largo:</strong> 0,70 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>0,70 cm</p>\r\n', 0, 0, 0, NULL, NULL, 7, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(277, 'MJ037', 'Mesa Bar IZY Redonda MJ037', 'Mesa Bar IZY Redonda MJ037', '<p><strong>Altura: </strong>105 cm</p>\r\n\r\n<p><strong>Largo:</strong> 80 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>80 cm</p>\r\n', 0, 0, 0, NULL, NULL, 7, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(278, '11548', 'Mesa Spin 36805 Redonda', 'Mesa Spin 36805 Redonda', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Alto:</strong>&nbsp;0,72&nbsp;cm</p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;1,20 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;1,20 cm</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(279, '11549', 'Mesa Spin 36805 Cuadrada', 'Mesa Spin 36805 Cuadrada', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Alto:</strong>&nbsp;0,72&nbsp;cm</p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;0,75&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,75&nbsp;cm</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(280, '003105', 'Mesa Bistró', 'Mesa Bistró Service', '<p>Mesa Bistro Service,&nbsp;Mesa con tapa redonda y estructura cromada</p>\r\n\r\n<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Alto:</strong>&nbsp;1,07 cm</p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;0,60 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,60 cm</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(281, '13931', 'Mesa COEXMA Base Cromada', 'Mesa COEXMA Base Cromada', '<p><strong>Altura: </strong>75 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>70 cm</p>\r\n\r\n<p><strong>Largo</strong>: 70 cm</p>\r\n\r\n<p><strong>Tampo a elecci&oacute;n</strong></p>\r\n\r\n<p><strong>Base cromada</strong></p>\r\n', 0, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(282, '10500', 'Mesa COEXMA Base Gris', 'Mesa COEXMA Base Gris', '<p><strong>Altura: </strong>75 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>70 cm</p>\r\n\r\n<p><strong>Largo: </strong>70 cm</p>\r\n\r\n<p><strong>Tampo a elecci&oacute;n</strong></p>\r\n\r\n<p><strong>Base gris</strong></p>\r\n', 0, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(283, 'MESA COEXMA', 'Mesa COEXMA', 'Mesa COEXMA', '<p><strong>Altura:</strong> 78 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>81 cm</p>\r\n\r\n<p><strong>Largo:</strong> 110 cm</p>\r\n\r\n<p><strong>Tampo a elecci&oacute;n</strong></p>\r\n', 0, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(284, '13194', 'Silla Fija 13194', 'Silla Fija 13194', '<p>Asiento y respaldo en tela, grosor&nbsp;de la espuma del asiento de 6cm,&nbsp;</p>\r\n\r\n<p>Estructura negra con pintura ep&oacute;xi.</p>\r\n\r\n<p>Color: Tela negro c/ puntos dorados</p>\r\n', 0, 0, 0, NULL, NULL, 16, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(285, '11440', 'Silla Joy 4 Pies', 'Silla Joy 4 Pies', '<p>Silla Joy 4 Pies</p>\r\n', 0, 0, 0, NULL, NULL, 5, 19, 0, 0, NULL, 1, NULL, NULL, '60009'),
(286, '1001', 'Silla 1001', 'Silla 1001', '', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(287, '08947', 'Colectiva 1003 ', 'Colectiva 1003 ', '<p>Asiento y respaldero reestido en cuerina</p>\r\n\r\n<p>Estructura fija cromada o negro</p>\r\n\r\n<p>Soporta 110 Kg.</p>\r\n\r\n<p>Sillas apilable</p>\r\n\r\n<p>Consultar disponibilidad de colores&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 18, 0, 0, 0, 1, NULL, NULL, '60009'),
(288, 'CA083', 'Silla Mobi CA083', 'Silla Mobi CA083', '<p><strong>Altura:</strong> 79 cm</p>\r\n\r\n<p><strong>Largo:</strong> 54 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 54 cm</p>\r\n', 0, 0, 0, NULL, NULL, 7, 0, 0, 0, NULL, 0, NULL, NULL, ''),
(289, 'CA012 ', 'Silla Sky con Brazos CA012 ', 'Silla Sky con Brazos CA012 ', '<p><strong>Altura: </strong>79 cm</p>\r\n\r\n<p><strong>Largo: </strong>60 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 56 cm</p>\r\n', 0, 0, 0, NULL, NULL, 7, 0, 0, 0, NULL, 0, NULL, NULL, ''),
(290, 'CA129', 'Silla Lilian CA129', 'Silla Lilian CA129', '<p><strong>Altura:</strong> 87 cm</p>\r\n\r\n<p><strong>Largo</strong>: 48 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 50 cm</p>\r\n', 0, 0, 0, NULL, NULL, 7, 0, 0, 0, NULL, 0, NULL, NULL, ''),
(291, 'CA003', 'Silla 1001 CA003', 'Silla 1001 CA003', '<p><strong>Altura: </strong>93 cm</p>\r\n\r\n<p><strong>Largo: </strong>45 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 55 cm</p>\r\n', 0, 0, 0, NULL, NULL, 7, 0, 0, 0, NULL, 0, NULL, NULL, ''),
(292, 'CA017', 'Silla 9009 CA017', 'Silla 9009 CA017', '<p><strong>Altura:</strong> 94 cm</p>\r\n\r\n<p><strong>Largura: </strong>45 cm</p>\r\n\r\n<p><strong>Profundidad</strong>: 53 cm</p>\r\n', 0, 0, 0, NULL, NULL, 7, 0, 0, 0, NULL, 0, NULL, NULL, ''),
(293, '12541', 'Silla Calcutá CA107', 'Silla Calcutá CA107', '<p><strong>Altura:</strong> 88 cm</p>\r\n\r\n<p><strong>Largo:</strong> 60 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 57 cm</p>\r\n', 0, 0, 0, NULL, NULL, 7, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(294, 'CA030', 'Silla Mónaco con Brazos CA030', 'Silla Mónaco con Brazos CA030', '<p><strong>Altura:</strong> 86 cm</p>\r\n\r\n<p><strong>Largo: </strong>47 cm</p>\r\n\r\n<p><strong>Profundidad</strong>: 59 cm</p>\r\n', 0, 0, 0, NULL, NULL, 7, 0, 0, 0, NULL, 0, NULL, NULL, ''),
(295, 'CA059', 'Silla Vogel CA059', 'Silla Vogel CA059', '<p><strong>Altura:</strong> 86 cm</p>\r\n\r\n<p><strong>Largo</strong>: 50 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>59 cm</p>\r\n', 0, 0, 0, NULL, NULL, 7, 0, 0, 0, NULL, 0, NULL, NULL, ''),
(296, 'CONJUNTO INFANTIL', 'Conjunto Rectangular Infantil', 'Conjunto Rectangular Infantil', '<p>Estructura de acero (blanco)</p>\r\n\r\n<p>Mesa, asiento y respaldero de pl&aacute;stico</p>\r\n\r\n<p>Consultar Disponibilidad de colores</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(297, 'CONJUNTO JUVENIL', 'Conjunto Rectangular Juvenil', 'Conjunto Rectangular Juvenil', '<p>Estructura de acero (blanco)</p>\r\n\r\n<p>Mesa, asiento y respaldero de pl&aacute;stico</p>\r\n\r\n<p>Consultar Disponibilidad de colores</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(298, 'CONJUNTO ADULTO', 'Conjunto Rectangular Adulto', 'Conjunto Rectangular Adulto', '<p>Estructura de acero (blanco)</p>\r\n\r\n<p>Mesa, asiento y respaldero de pl&aacute;stico</p>\r\n\r\n<p>Consultar Disponibilidad de colores</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(299, 'ELOPLAX INFANTIL', 'Conjunto Eloplax Infantil ', '', '<p>Conjunto Eloplax Infantil&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 0, NULL, NULL, ''),
(300, 'ELOPLAX JUVENIL', 'Conjunto Eloplax Juvenil', 'Conjunto Eloplax Juvenil', '<p>Conjunto Eloplax Juvenil</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 0, NULL, NULL, ''),
(301, 'ELOPLAX ADULTO', 'Conjunto Eloplax Adulto', 'Conjunto Eloplax Adulto', '', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 0, NULL, NULL, ''),
(302, '003120', 'Conjunto Elotoy', 'Conjunto Elotoy', '<p>Conjunto infantil que ayuda a aprender, ense&ntilde;ar, estimular y compartir</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(303, '11699', 'Silla Ergoplax Universitario 11699/45549', 'Silla Ergoplax Universitario 11699/45549', '<p>Silla Ergoplax Universitario</p>\r\n\r\n<p>Asiento y respaldero anat&oacute;mico negro</p>\r\n\r\n<p>Pupitre fijo en pl&aacute;stico negro con porta l&aacute;piz</p>\r\n\r\n<p>Estructura tubular pintado en negro</p>\r\n\r\n<p>Capacidad 110 Kg</p>\r\n\r\n<p><strong>Disponible lado derecho e izquierdo</strong></p>\r\n', 299000, 0, 0, NULL, NULL, 17, 24, 1, 0, 14, 1, NULL, NULL, '11699'),
(304, '12373/003002/07030', 'Mesita + Silla 12373 - 003002 - 07030', 'Mesita + Silla 12373 - 003002 - 07030', '<p>Tampo de la mesa: 60 x 40 cm en color gris</p>\r\n\r\n<p>Silla 4 patas fija</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 0, NULL, NULL, ''),
(305, '10546', 'Mesa Sublime  40040 CROMADO', 'Mesa Sublime 40040 ', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;0,70 cm</p>\r\n\r\n<p><strong>Profundidad</strong>: 0,70&nbsp;cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,30&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(537, '10543', 'Mesa Sublime 40040 ', 'Mesa Sublime 40040 ', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;0,70 cm</p>\r\n\r\n<p><strong>Profundidad</strong>: 0,70&nbsp;cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,30&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(538, '003123', 'Conjunto Elotoy', 'Conjunto Elotoy', '<p>Conjunto infantil que ayuda a aprender, ense&ntilde;ar, estimular y compartir</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(306, '13608', 'Silla Fija STAY 33206 Con Estofado', 'Silla Fija STAY 33206 Con Estofado', '<p>Silla fija Cavaletti Stay 33206&nbsp;</p>\r\n\r\n<p>Con estofado</p>\r\n\r\n<p>Pie de madera barnizada</p>\r\n\r\n<p>Concha pl&aacute;stica con brazos integrados.</p>\r\n\r\n<p>Concha anat&oacute;mica con gran ergonom&iacute;a.</p>\r\n\r\n<p>Material termopl&aacute;stico inyectado</p>\r\n', 0, 0, 0, NULL, NULL, 5, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(307, '12219', 'Silla Fija STAY 33206', 'Silla Fija STAY 33206', '<p>Silla fija Cavaletti Stay 33206</p>\r\n\r\n<p>Pie de madera barnizada</p>\r\n\r\n<p>Concha pl&aacute;stica con brazos integrados.</p>\r\n\r\n<p>Concha anat&oacute;mica con gran ergonom&iacute;a.</p>\r\n\r\n<p>Material termopl&aacute;stico inyectado</p>\r\n', 0, 0, 0, NULL, NULL, 5, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(308, '12339', 'Sillón SKY 36906', 'Sillón SKY 36906', '<p>Base Sky con punteras de madera natural</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,75 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,86&nbsp;cm</p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;0,82&nbsp;cm</p>\r\n\r\n<p>Revestimiento en tela verde</p>\r\n', 0, 0, 0, NULL, NULL, 5, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(536, '12338', 'Sillón SKY 36906', 'Sillón SKY 36906', '<p>Base Sky&nbsp; con punteras de madera natural</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,75 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,86&nbsp;cm</p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;0,82&nbsp;cm</p>\r\n\r\n<p>Revestimiento en tela celeste cielo</p>\r\n', 0, 0, 0, NULL, NULL, 5, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(309, '12342 ', 'Sillón Stretch 36906 ', 'Sillón Stretch 36906 ', '<p>Base 4 patas con punteras de madera natural</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,71 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,76 cm</p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;0,78 cm</p>\r\n\r\n<p>Revestimiento en cuero natural caramelo</p>\r\n', 0, 0, 0, NULL, NULL, 5, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(310, '12325', 'Apoya Pies Ottoman 36914', 'Apoya Pies Ottoman 36914', '<p>Apoyo para los pies punteras de madera natural</p>\r\n\r\n<p><strong>Altura:</strong> 37 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>56 cm</p>\r\n\r\n<p><strong>Largo:</strong> 64 cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(311, '13074', 'Mesa Lateral Stretch 36901', 'Mesa Lateral Stretch 36901', '<p>Tablero de Tauari barnizado Punteras de madera natural</p>\r\n\r\n<p><strong>Altura:</strong> 0,405&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,73 cm</p>\r\n\r\n<p><strong>Largo: 0</strong>,73 cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(312, '10544', 'Sofá Sublime 39969 ', 'Sofá Sublime 39969 ', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:&nbsp;</strong>0,77&nbsp;cm<br />\r\n<strong>Profundidad:</strong>&nbsp;0,68 cm<br />\r\n<strong>Alto:&nbsp;</strong>0,80&nbsp;cm</p>\r\n\r\n<p><strong>Cuerina:</strong></p>\r\n\r\n<p>Negro</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(535, '06717', 'Longarina Stay 3 Lugares 33110', 'Longarina Stay 3 Lugares 33110', '<p>Asiento Pl&aacute;stico en color negro</p>\r\n\r\n<p>Estructura tubular cromado</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(313, '12004', 'Sofá Speed 53534', 'Sofá Speed 53534', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo: </strong>0,57 cm<br />\r\n<strong>Profundidad:</strong> 0,69 cm<br />\r\n<strong>Alto: </strong>0,87 cm</p>\r\n\r\n<p><strong>Cuerina:</strong></p>\r\n\r\n<p>Negro</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(314, '10299', 'Longarina Stay 3 Lugares 33110', 'Longarina Stay 3 Lugares 33110', '<p>Asiento Pl&aacute;stico en color rojo</p>\r\n\r\n<p>Estructura tubular Cromada</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(315, '11816', 'Longarina Flip 43110', 'Longarina Flip 43110', '<p>Brazos intercalados</p>\r\n\r\n<p>Base negra&nbsp;</p>\r\n\r\n<p>Respaldo en tela microperforada</p>\r\n\r\n<p>Asiento en cuerina negro</p>\r\n', 0, 0, 0, NULL, NULL, 5, 17, 0, 0, 0, 1, NULL, NULL, ''),
(316, 'Beezi 39007', 'Longarina Beezi 39007 ', 'Longarina Beezi 39007 ', '<p>Longarina Beezi 39007&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, 0, 0, NULL, NULL, ''),
(317, '08916', 'Longarina Ergoplax 3 lugares 53859', 'Longarina Ergoplax 3 lugares 53859', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong> 178 cm</p>\r\n\r\n<p><strong>Profundidad</strong>: 0,53 cm</p>\r\n\r\n<p><strong>Altura:</strong> 0,84 cm</p>\r\n', 0, 0, 0, NULL, NULL, 17, 24, 0, 0, NULL, 1, NULL, NULL, '53859'),
(418, 'RDAN-100', 'Enfriador y Dosificador de Agua RDAN-100', 'Enfriador y Dosificador de Agua RDAN-100', '<p>&bull; C&oacute;digo: RDAN-100</p>\r\n\r\n<p>&bull; Enfriador y dosificador de agua</p>\r\n\r\n<p>&bull; Capacidad: 100lts</p>\r\n\r\n<p>&bull; Regulador de temperatura mec&aacute;nico</p>\r\n\r\n<p>&bull; Temperatura: 0&deg;C a 10&deg;C</p>\r\n\r\n<p>&bull; Cuerpo externo en acero inox</p>\r\n\r\n<p>&bull; Dep&oacute;sito de acero inox 304</p>\r\n\r\n<p>&bull; Accesorios: 3 grifos y bandeja colectora de agua</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(319, '13198/13199/09420', 'Longarina 3 Lugares 13198 - 13199 - 09420', 'Longarina 3 Lugares 13198 - 13199 - 09420', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong> 1.45&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:&nbsp;</strong>0.50&nbsp;cm</p>\r\n\r\n<p><strong>Altura: </strong>0.88&nbsp;cm<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>Capacidad:</strong></p>\r\n\r\n<p>110 Kg/Lugar</p>\r\n', 0, 0, 0, NULL, NULL, 16, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(320, '13124', 'Silla Brizza Ejecutiva 37877', 'Silla Brizza Ejecutiva 37877', '<p>Apoyo Lumbar</p>\r\n\r\n<p>Brazos regulables</p>\r\n\r\n<p>Sistema de regulaje de altura a gas</p>\r\n\r\n<p>Mecanismo Relax</p>\r\n\r\n<p>Base met&aacute;lica con capa protectora negra</p>\r\n\r\n<p>Respaldero en tela microperforado negro</p>\r\n\r\n<p>Asiento en cuerina negro</p>\r\n\r\n<p>Capacidad 110 Kg</p>\r\n', 970000, 0, 0, NULL, NULL, 17, 23, 1, 0, 2, 1, NULL, NULL, '37877'),
(321, '13127', 'Silla Operativa Interlocutor 36235', 'Silla Operativa Interlocutor 36235', '<p>Respaldero altura media</p>\r\n\r\n<p>Brazos corsa fijo</p>\r\n\r\n<p>Mecanismo relax</p>\r\n\r\n<p>Estructura Pata S pintado en negro</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p><strong>Revestimiento disponible en Tela y Cuerina Negro</strong></p>\r\n', 715000, 0, 0, NULL, NULL, 17, 0, 1, 0, 6, 1, NULL, NULL, ''),
(322, '05724', 'Silla Operativa Secretaria 60006', 'Silla Operativa Secretaria 60006', '<p>Respaldero anatomico</p>\r\n\r\n<p>Sistema de regulaje de altura a gas</p>\r\n\r\n<p>Base de metal con capa protecci&oacute;n de pl&aacute;stico negro</p>\r\n\r\n<p>Capacidad 110 Kg</p>\r\n\r\n<p><strong>Revestimiento disponible en tela y cuerina negro&nbsp;</strong></p>\r\n', 378000, 0, 0, NULL, NULL, 17, 0, 1, 0, 8, 1, NULL, NULL, ''),
(323, '000388/002454', 'Longarina 3 Lugares 000388 - 002454', 'Longarina plástica de 3 Lugares 000388 - 002454', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong> 1.78 cm</p>\r\n\r\n<p><strong>Profundidad:&nbsp;</strong>0.53 cm</p>\r\n\r\n<p><strong>Altura: </strong>0.84 cm<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>Capacidad:</strong></p>\r\n\r\n<p>110 Kg/Lugar</p>\r\n', 590000, 0, 0, NULL, NULL, 16, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(324, '12970', 'Silla Operativa Director 36234', 'Silla Operativa Director 36234', '<p>Respaldero altura media</p>\r\n\r\n<p>Brazos corsa fijo</p>\r\n\r\n<p>Mecanismo relax</p>\r\n\r\n<p>Base de metal con capa protectora de pl&aacute;stico negro</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p><strong>Revestimiento disponible en Tela y Cuerina Negro</strong></p>\r\n', 838000, 0, 0, NULL, NULL, 17, 0, 1, 0, 5, 1, NULL, NULL, ''),
(325, '11780', 'Silla Classic sin Brazos 11780', 'Silla Classic sin Brazos 11780', '<p>Silla Classic sin Brazos 11780</p>\r\n', 188000, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(326, '005060', 'Silla Classic Con Brazos 005060', 'Silla Classic Con Brazos 005060', '<p>Silla Classic Con Brazos 005060</p>\r\n', 208000, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(327, '000388/000496', 'Silla Ergoplax Fija 000388 - 000496', 'Silla Ergoplax Fija 000388 - 000496', '<p>Asiento y respaldero anat&oacute;mico pl&aacute;stico negro</p>\r\n\r\n<p>Estructura fija 4 pies tubular negro</p>\r\n\r\n<p>Capacidad 110 Kg.&nbsp;</p>\r\n', 186000, 0, 0, NULL, NULL, 17, 24, 1, 0, 11, 1, NULL, NULL, '000388'),
(328, '09830', 'Silla Operativa Secretaria Fija 60017 ', 'Silla Operativa secretaria Fija 60017 ', '<p>Asiento y respaldero anat&oacute;mico</p>\r\n\r\n<p>Estructura 4 pies tubular pintado en negro&nbsp;</p>\r\n\r\n<p>Capadidad 110 Kg.</p>\r\n\r\n<p><strong>Revestimiento disponible en tela y cuerina Negro</strong></p>\r\n', 296000, 0, 0, NULL, NULL, 17, 0, 1, 0, 10, 1, NULL, NULL, ''),
(329, '07565', 'Silla Cajera 60010', 'Silla Cajera 60010', '<p>Asiento y respaldero anat&oacute;mico</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Aro Apoya pies en nylon regulable</p>\r\n\r\n<p>Base de metal con capa de protecci&oacute;n plastica negra</p>\r\n\r\n<p>Zapatas&nbsp;</p>\r\n\r\n<p>Capadidad 110 Kg.</p>\r\n\r\n<p><strong>Revestimiento disponible en tela y Cuerina Negro</strong></p>\r\n', 505000, 0, 0, NULL, NULL, 17, 3, 1, 0, 9, 1, NULL, NULL, 'ergoplax'),
(330, '30473', 'Silla Secretaria 30473', 'Silla Secretaria 30473', '<p>C&oacute;digo fabricante: 30473</p>\r\n\r\n<p>Marca: Plaxmetal</p>\r\n\r\n<p>Silla giratoria secretaria</p>\r\n\r\n<p>Base negra</p>\r\n\r\n<p>Con regulaci&oacute;n de altura</p>\r\n\r\n<p>Brazos SL regulable</p>\r\n\r\n<p>Respaldo regulable</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 0, NULL, NULL, ''),
(331, '13125', 'Silla Brizza Presidente 37811', 'Silla Brizza Presidente 37811', '<p>Apoya cabeza regulable</p>\r\n\r\n<p>Apoyo Lumbar</p>\r\n\r\n<p>Brazos regulables</p>\r\n\r\n<p>Sistema de regulaje de altura a gas</p>\r\n\r\n<p>Mecanismo Relax</p>\r\n\r\n<p>Base met&aacute;lica con capa protectora negra</p>\r\n\r\n<p>Respaldero en tela microperforado negro</p>\r\n\r\n<p>Asiento en cuerina negro</p>\r\n\r\n<p>Capacidad 110 Kg</p>\r\n', 1190000, 0, 0, NULL, NULL, 17, 23, 1, 0, 1, 1, NULL, NULL, '37811'),
(332, '10049', 'Silla Brizza Interlocutor 37881', 'Silla Brizza Interlocutor 37881', '<p>Respaldero en tela microperforado negro</p>\r\n\r\n<p>Asiento en cuerina negro</p>\r\n\r\n<p>Estructura pata S pintado negro con brazos interligados&nbsp;</p>\r\n\r\n<p>Capacidad 110 Kg</p>\r\n', 752000, 0, 0, NULL, NULL, 17, 23, 1, 0, 3, 1, NULL, NULL, '37881'),
(333, '12968', 'Silla Operativa Presidente 36233', 'Silla Operativa Presidente 36233', '<p>Respaldero alto</p>\r\n\r\n<p>Brazos corsa fijo</p>\r\n\r\n<p>Mecanismo relax</p>\r\n\r\n<p>Base de metal con capa protectora de pl&aacute;stico negro</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p><strong>Revestimiento disponible en Tela y Cuerina Negro</strong></p>\r\n', 880000, 0, 0, NULL, NULL, 17, 0, 1, 0, 4, 1, NULL, NULL, ''),
(335, '001813', 'NewNet Ejecutiva 16503 SOFT', 'NewNet Ejecutiva 16503 SOFT', '<p>Sistema de regulaje de respaldero</p>\r\n\r\n<p>Brazos regulables</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base estampada cromada</p>\r\n\r\n<p>Rodizio de 50 PU</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p><strong>Consultar disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 12, 0, 0, 0, 1, NULL, NULL, '16503 SOFT'),
(336, '10833', 'Flip Interlocutor  43106 SI', 'Interlocutor Flip 43106 SI', '<p>Respaldero anat&oacute;mico en tela microperforado</p>\r\n\r\n<p>Asiento en tela negro</p>\r\n\r\n<p>Estructura SI&nbsp;con brazos interligados pintado en negro</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>Consultar disponiblidad de colores&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 17, 0, 0, 0, 1, NULL, NULL, '43106 SI'),
(337, 'BRIZZA TELA 46338', 'Silla Presidente Sin AC Brizza Tela 46338', 'Silla Presidente Sin AC Brizza Tela 46338', '<p>Mecanismo Relax con traba</p>\r\n\r\n<p>Brazos 3D (Desplazamiento horizontal, giro y regulaci&oacute;n de altura</p>\r\n\r\n<p>Apoyo lumbar ajustable</p>\r\n\r\n<p>Respaldo en tela microperforada y asiento en tela</p>\r\n\r\n<p>Base piramidal de nylon gris&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 23, 0, 0, 0, 0, NULL, NULL, ''),
(338, '000136', 'NewNet Presidente 16501 AC SOFT', 'Silla NewNet Presidente 16501 AC SOFT', '<p>Apoya cabeza fija</p>\r\n\r\n<p>Revestimiento en cuerina negro</p>\r\n\r\n<p>Brazos regulables</p>\r\n\r\n<p>Sistema syncron</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base&nbsp;estampada cromada</p>\r\n\r\n<p>Rodizios dec 50 PU&nbsp;</p>\r\n\r\n<p>Capaciadad 110 Kg.</p>\r\n', 0, 0, 0, NULL, NULL, 5, 12, 0, 1, 0, 1, NULL, NULL, '16501 AC SOFT'),
(472, '13581', 'Mesa Recta LN 40193', 'Mesa Recta LN 40193', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;1,80 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,80&nbsp;cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,74&nbsp;cm</p>\r\n', 995000, 0, 0, NULL, NULL, 11, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(339, '13377', 'Essence Presidente 20501', 'Essence Presidente 20501', '<p>Poltrona Presidente con respaldero alto</p>\r\n\r\n<p>Brazos Regulables 4D</p>\r\n\r\n<p>Mecanismo Syncron (RP)</p>\r\n\r\n<p>Base en aluminio</p>\r\n\r\n<p>Rodizio de 65&nbsp;</p>\r\n\r\n<p>Consultar opciones de colores</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n', 0, 0, 0, NULL, NULL, 5, 14, 0, 0, 0, 1, NULL, NULL, '20501'),
(340, '06769', 'Prime Giratoria Presidente 20202', 'Prime Giratoria Presidente 20202', '<p>Asiento, respaldero revestidos en cuero natural</p>\r\n\r\n<p>Apoya brazos en PU</p>\r\n\r\n<p>Soporte de brazos interligados en aluminio</p>\r\n\r\n<p>Mecanismo syncron excentrico&nbsp;</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base en aluminio</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p><strong>Consultar disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 6, 0, 0, 0, 1, NULL, NULL, '20202'),
(341, 'START 4022', 'Caja START 4022', 'Silla Caja START 4022', '<p>Espuma inyectada</p>\r\n\r\n<p>Base caja con reposapi&eacute;s</p>\r\n\r\n<p>Base giratoria</p>\r\n\r\n<p>Sistema S.R.E. (Sistema de regulaci&oacute;n del respaldo)</p>\r\n\r\n<p>Regulaci&oacute;n de la altura del asiento y respaldo</p>\r\n\r\n<p>Ajuste de la inclinaci&oacute;n del respaldo.</p>\r\n\r\n<p>Funda protectora en polipropileno.</p>\r\n\r\n<p>Marca: Cavaletti</p>\r\n', 0, 0, 0, NULL, NULL, 5, 0, 0, 0, 0, 0, NULL, NULL, ''),
(342, '13842', 'Leef Presidente 45101', 'Leef Presidente 45101', '<p>Base giratoria UP (Nylon)</p>\r\n\r\n<p>Mecanismo Syncron en el que el respaldo puede ser regulado con 4 posiciones de trabado y ajuste la tensi&oacute;n.</p>\r\n\r\n<p>Respaldo con estructura maleable, capaz de adaptarse a los cambios de posici&oacute;n</p>\r\n\r\n<p>Apoyo lumbar ajustable (curso de 280mm) a la anatom&iacute;a del cuerpo.</p>\r\n\r\n<p>Apoya brazos 4D (regulables en 4 dimensiones)</p>\r\n\r\n<p>Asiento con regulaci&oacute;n de profundidad en 6 niveles diferentes (curso de 50mm) para ajustarse a diferentes estaturas</p>\r\n\r\n<p>Revestimiento en cuerina negro</p>\r\n\r\n<p>Garant&iacute;a de 6 a&ntilde;os contra defectos de fabricaci&oacute;n</p>\r\n', 0, 0, 0, NULL, NULL, 5, 4, 0, 0, 0, 1, NULL, NULL, ''),
(343, '005185', 'Silla Cajera 60009', 'Silla CHECK-OUT', '<p>Silla Cajera con asientos y respaldero anatomicos</p>\r\n\r\n<p>Regulaje de altura del respaldero</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base met&aacute;lica fija sin proteccion pl&aacute;stica</p>\r\n\r\n<p>No acompa&ntilde;a aro apoya pies</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n', 0, 0, 0, NULL, NULL, 5, 20, 0, 0, 0, 1, NULL, NULL, '60010'),
(344, '000680', 'Prime Interlocutor  20306 Elíptica', 'Prime Interlocutor  20306 Elíptica', '<p>Silla de aproximaci&oacute;n</p>\r\n\r\n<p>Asiento y respaldero revestidos en cuero natural</p>\r\n\r\n<p>Apoya brazos cromado con apoyo revestido en cuero natural</p>\r\n\r\n<p>Base fija el&iacute;ptica&nbsp; cromado&nbsp;</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p><strong>Consultar disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 6, 0, 0, 0, 1, NULL, NULL, '20306'),
(345, '07559', 'Prime Giratoria Presidente 20302', 'Prime Giratoria Presidente 20302', '<p>Asiento, respaldero y apoya brazos revestidos en cuero natural</p>\r\n\r\n<p>Soporte de brazos interligados cromados</p>\r\n\r\n<p>Mecanismo Relax</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base eliptica cromada</p>\r\n\r\n<p>Rodizios de 65 PU</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p><strong>Consultar disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 6, 0, 0, 0, 1, NULL, NULL, '20302'),
(346, '000679', 'Prime Presidente 20301', 'Prime Presidente 20301', '<p>Asiento, respaldero y apoya brazos revestidos en cuero natural</p>\r\n\r\n<p>Soporte de brazos interligados cromados</p>\r\n\r\n<p>Mecanismo Relax</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base eliptica cromada</p>\r\n\r\n<p>Rodizios de 65 PU</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p><strong>Consultar disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 6, 0, 0, 0, 1, NULL, NULL, '20301'),
(347, '001270', 'Prime Interlocutor  20206 S', 'Prime Interlocutor  20206 S', '<p>Silla de aproximaci&oacute;n</p>\r\n\r\n<p>Asiento y respaldero revestidos en cuero natural</p>\r\n\r\n<p>Apoya brazos aluminio con apoyo PU</p>\r\n\r\n<p>Base fija en S cromado&nbsp;</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p><strong>Consultar disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 6, 0, 0, 0, 1, NULL, NULL, '20206 S'),
(348, '001095', 'Prime Presidente  20201', 'Prime Presidente  20201', '<p>Asiento, respaldero revestidos en cuero natural</p>\r\n\r\n<p>Soporte de brazos interligados aluminio con apoyo PU</p>\r\n\r\n<p>Mecanismo Syncron excentrico&nbsp;</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base de aluminio&nbsp;</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p><strong>Consultar disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 6, 0, 0, 0, 1, NULL, NULL, '20201'),
(349, '08941', 'Prime Director Extra 20103', 'Prime Giratoria Director Extra 20103', '<p>Asiento y respaldero revestidos en cuerina</p>\r\n\r\n<p>Apoya brazos en PP</p>\r\n\r\n<p>Soporte de brazos interligados cromado</p>\r\n\r\n<p>Mecanismo Relax</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base estampada cromada</p>\r\n\r\n<p>Capacidad 140 Kg.</p>\r\n\r\n<p><strong>Consultar disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 6, 0, 0, 0, 1, NULL, NULL, '20103'),
(350, '000495', 'Prime Interlocutor 20106 S', 'Prime Interlocutor 20106 S', '<p>Silla de aproximaci&oacute;n</p>\r\n\r\n<p>Asiento y respaldero revestidos en cuerina</p>\r\n\r\n<p>Apoya brazos cromado con apoyo PP</p>\r\n\r\n<p>Soporte de brazos interligados cromado</p>\r\n\r\n<p>Base fija en S cromado&nbsp;</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p><strong>Consultar disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 6, 0, 0, 0, 1, NULL, NULL, '20106 S'),
(351, '000494', 'Prime Presidente  20101', 'Prime Presidente  20101', '<p>Asiento, respaldero revestidos en cuerina</p>\r\n\r\n<p>Soporte de brazos interligados cromados con apoyo PP</p>\r\n\r\n<p>Mecanismo Relax</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base estampada cromada</p>\r\n\r\n<p>Rodizios de 50 PU</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p><strong>Consultar disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 6, 0, 1, 0, 1, NULL, NULL, '20101'),
(352, '000904', 'NewNet  Interlocutor  16506 S SOFT', 'NewNet  Interlocutor  16506 S SOFT', '<p>Respaldero revestido con cuerina y costura&nbsp;</p>\r\n\r\n<p>Estructura para S cromado con brazos interligados</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p><strong>Consulte disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 12, 0, 0, 0, 1, NULL, NULL, '16506 S SOFT'),
(353, '10682', 'NewNet Presidente 16501 SOFT', 'NewNet Presidente 16501 SOFT', '<p>Revestimiento en cuerina negro</p>\r\n\r\n<p>Brazos regulables</p>\r\n\r\n<p>Sistema syncron</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base&nbsp;estampada cromada</p>\r\n\r\n<p>Rodizios de&nbsp;50 PU&nbsp;</p>\r\n\r\n<p>Capaciadad 110 Kg.</p>\r\n\r\n<p><strong>Consulte disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 12, 0, 0, 0, 1, NULL, NULL, '16501 SOFT'),
(354, '000731', 'NewNet Interlocutor 16006 S', 'NewNet Interlocutor 16006 S', '<p>Respaldero en tela microperforado negro</p>\r\n\r\n<p>Asiento en tela negro</p>\r\n\r\n<p>Estructura pata S cromado con brazo interligados</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p><strong>Consultar disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 12, 0, 0, 0, 1, NULL, NULL, '16006 S'),
(355, '06675', 'NewNet Ejecutiva 16003', 'NewNet Ejecutiva 16003', '<p>Mecanismo S.R.E (Sistema de regulaci&oacute;n del respaldo)</p>\r\n\r\n<p>Revestimiento en tela microperforada y asiento en cuerina</p>\r\n\r\n<p>Brazos con regulaci&oacute;n de altura</p>\r\n\r\n<p>Base negra giratoria</p>\r\n\r\n<p>Rod&iacute;zios de 50mm de nylon</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n', 0, 0, 0, NULL, NULL, 5, 12, 0, 0, 0, 1, NULL, NULL, '16003'),
(356, '16002', 'NewNert Director 16002', 'Silla NewNert Director 16002', '<p>Silla NewNert Director 16002</p>\r\n', 0, 0, 0, NULL, NULL, 5, 0, 0, 0, 0, 0, NULL, NULL, ''),
(357, '07400', 'NewNet Presidente 16001 AC', 'NewNet Presidente 16001 AC', '<p>Apoya cabeza fija</p>\r\n\r\n<p>Apoyo Lumbar regulable</p>\r\n\r\n<p>Brazos regulables</p>\r\n\r\n<p>Sistema syncron</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base&nbsp;estampadas cromadas</p>\r\n\r\n<p>Rodizios dec 50 PU&nbsp;</p>\r\n\r\n<p>Capaciadad 110 Kg.</p>\r\n', 0, 0, 0, NULL, NULL, 5, 12, 0, 1, 0, 1, NULL, NULL, '16001 AC'),
(358, '004558', 'Silla Interlocutor Master 20006 ', 'Silla Interlocutor Master 20006 S ', '<p>Asiento revestido&nbsp;en cuerina&nbsp;</p>\r\n\r\n<p>Estructura pata S cromado</p>\r\n\r\n<p>Brazos interligados&nbsp;</p>\r\n\r\n<p>Capacidad 110 Kg.&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 13, 0, 0, 0, 1, NULL, NULL, '20006');
INSERT INTO `tb_producto` (`id`, `referencia`, `nombre`, `descripcion_corta`, `descripcion_detallada`, `precio`, `stock`, `valor_descuento`, `descripcion`, `valor_mayorista`, `id_marca`, `id_linea`, `destaque`, `recomendado`, `oden_destaque`, `activo`, `unique_hits`, `total_hits`, `modelo`) VALUES
(359, '08029', 'Master Director 20002 ', 'Master Director 20002 ', '<p>Asiento y respaldero con costura</p>\r\n\r\n<p>Poltrona giratoria</p>\r\n\r\n<p>Brazos interligados fijo cromados</p>\r\n\r\n<p>Mecanismo Relax</p>\r\n\r\n<p>Regulaje&nbsp;de altura a gas</p>\r\n\r\n<p>Base estampada cromada</p>\r\n\r\n<p>Rodizios de 50 PU</p>\r\n\r\n<p>Capacidad 110 Kg.&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 13, 0, 0, 0, 1, NULL, NULL, '20002'),
(360, '001328', 'Master Presidente 20001', 'Master Presidente 20001', '<p>Asiento y respaldero alto con costura</p>\r\n\r\n<p>Poltrona giratoria</p>\r\n\r\n<p>Brazos interligados fijo cromados</p>\r\n\r\n<p>Mecanismo Relax</p>\r\n\r\n<p>Regulaje&nbsp;de altura a gas</p>\r\n\r\n<p>Base estampada cromada</p>\r\n\r\n<p>Rodizios de 50 PU</p>\r\n\r\n<p>Capacidad 110 Kg.&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 13, 0, 0, 0, 1, NULL, NULL, '20001'),
(361, '003985', 'Chroma Interlocutor 14007', 'Chroma Interlocutor 14007', '<p>Asiento, respaldero y apoyo de brazos en cuero natural</p>\r\n\r\n<p>Estructura con brazos interligados cromados</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p><strong>Consulte disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 0, 0, 0, 0, 0, NULL, NULL, ''),
(362, '11797', 'Chroma Secretaria 14004', 'Chroma Secretaria 14004', '<p>Asiento, respaldero y apoyo de brazos en cuero natural</p>\r\n\r\n<p>Estructura con brazos interligados cromados</p>\r\n\r\n<p>Mecanismo relax</p>\r\n\r\n<p>Base cromada&nbsp;</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p><strong>Consulte disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 0, 0, 0, 0, 0, NULL, NULL, ''),
(363, '003984', 'Chroma Presidente 14001', 'Chroma Presidente 14001', '<p>Asiento, respaldero y apoyo de brazos en cuero natural</p>\r\n\r\n<p>Estructura con brazos interligados cromados</p>\r\n\r\n<p>Mecanismo relax</p>\r\n\r\n<p>Base cromada&nbsp;</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p><strong>Consulte disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 0, 0, 0, 0, 0, NULL, NULL, ''),
(364, '07452', 'Air Interlocutor  27006', 'Air Interlocutor  27006', '<p>Respaldero en tela microperforado negro</p>\r\n\r\n<p>Silla Fija aproximaci&oacute;n</p>\r\n\r\n<p>Estructura pata S con brazos interligados pintado en negro</p>\r\n\r\n<p>Asientos revestidos en tela negro</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 7, 0, 0, 0, 1, NULL, NULL, ''),
(365, '005362', 'Air Giratoria 27001', 'Air Giratoria 27001', '<p>Respaldero en tela microperforado negro</p>\r\n\r\n<p>Apoyo Lumbar</p>\r\n\r\n<p>Brazos regulables 3D</p>\r\n\r\n<p>Mecanismo Syncron</p>\r\n\r\n<p>Regulaje de altura de gas</p>\r\n\r\n<p>Base de aluminio</p>\r\n\r\n<p>Rodizio de 65 nylon</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n', 0, 0, 0, NULL, NULL, 5, 7, 0, 0, 0, 1, NULL, NULL, ''),
(366, '14147', 'C4 Presidente 29001', 'C4 Presidente 29001', '<p>Respaldero en Tela microperforado</p>\r\n\r\n<p>Apoyo lumbar</p>\r\n\r\n<p>Brazos Regulables 3D</p>\r\n\r\n<p>Mecanismo Syncron (RP)</p>\r\n\r\n<p>Regulaje de altura gas</p>\r\n\r\n<p>Base en aluminio</p>\r\n\r\n<p>Rodizio de 65 nylon</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>Revestimiento del asiento en cuerina negro</p>\r\n', 0, 0, 0, NULL, NULL, 5, 9, 0, 0, 0, 1, NULL, NULL, '29001'),
(368, '07593', 'C4 Presidente 29001 AC', 'C4 Presidente 29001 AC', '<p>Respaldero en Tela microperforado</p>\r\n\r\n<p>Apoya Cabeza</p>\r\n\r\n<p>Apoyo lumbar</p>\r\n\r\n<p>Brazos Regulables 3D</p>\r\n\r\n<p>Mecanismo Syncron (RP)</p>\r\n\r\n<p>Regulaje de altura gas</p>\r\n\r\n<p>Base en aluminio</p>\r\n\r\n<p>Rodizio de 65 nylon</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>Revestimiento del asiento en cuerina negro</p>\r\n', 0, 0, 0, NULL, NULL, 5, 9, 0, 0, 0, 1, NULL, NULL, '29001'),
(370, '13616', 'C3 Presidente 28001', 'C3 Presidente 28001', '<p>Apoya cabeza</p>\r\n\r\n<p>Respaldero en Tela microperforado</p>\r\n\r\n<p>Apoyo lumbar regulables</p>\r\n\r\n<p>Brazos Regulables 4D</p>\r\n\r\n<p>Mecanismo Syncron</p>\r\n\r\n<p>Regulaje de altura&nbsp;&nbsp;gas</p>\r\n\r\n<p>Base nylon negro</p>\r\n\r\n<p>Rodizio de 65 nylon</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>Revestimiento del asiento en poliester&nbsp;negro</p>\r\n', 0, 0, 0, NULL, NULL, 5, 8, 0, 0, 0, 1, NULL, NULL, ''),
(371, '10813', 'Mais Interlocutor 37006 S', 'Mais Interlocutor 37006 S', '<p>Asiento y respaldero revestida con cuerina negro</p>\r\n\r\n<p>Estructura pata S con brazos interligados pintado en negro</p>\r\n\r\n<p>Capacidad 110 Kg.&nbsp;</p>\r\n\r\n<p><strong>Consulte disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 10, 0, 0, 0, 1, NULL, NULL, ''),
(372, '05541', 'Mais Ejecutiva Giratoria 37002', 'Silla Mais Ejecutiva Giratoria', '<p>Silla giratoria con asiento y respaldero medio revestida en tela&nbsp;</p>\r\n\r\n<p>Brazos regulables&nbsp;</p>\r\n\r\n<p>Mecanismo syncron</p>\r\n\r\n<p>Base negra</p>\r\n\r\n<p>Capacidadad 110 Kg.</p>\r\n\r\n<p><strong>Consulte disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 10, 0, 0, 0, 1, NULL, NULL, ''),
(373, '08246', 'Mais Director 37001', 'Mais Director 37001', '<p>Silla giratoria con asiento y respaldero revestida en tela&nbsp;</p>\r\n\r\n<p>Brazos regulables&nbsp;</p>\r\n\r\n<p>Mecanismo syncron (RP)</p>\r\n\r\n<p>Capacidadad 110 Kg.</p>\r\n\r\n<p><strong>Consulte disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 10, 0, 0, 0, 1, NULL, NULL, ''),
(374, '10803', 'Idea Presidente 40101 Soft', 'Idea Presidente 40101 Soft', '<p>Bot&oacute;n con ajuste en altura de respaldero</p>\r\n\r\n<p>Asiento y respaldero revestido en tela</p>\r\n\r\n<p>Brazos regulables ID</p>\r\n\r\n<p>Mecanismo syncron con regulaje (RP)</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base nylon gris</p>\r\n\r\n<p>Rodizio de 65 nylon</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>Consultar disponibilidad de colores</p>\r\n', 0, 0, 0, NULL, NULL, 5, 15, 0, 0, 0, 1, NULL, NULL, '40101 Soft'),
(375, '12255', 'Idea Director 40102 Soft', 'Idea Director 40102 Soft', '<p>Bot&oacute;n con ajuste en altura de respaldero</p>\r\n\r\n<p>Asiento y respaldero revestido en tela</p>\r\n\r\n<p>Brazos regulables ID</p>\r\n\r\n<p>Mecanismo syncron con regulaje (RP)</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base nylon gris</p>\r\n\r\n<p>Rodizio de 65 nylon</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>Consultar disponibilidad de colores</p>\r\n', 0, 0, 0, NULL, NULL, 5, 15, 0, 0, 0, 1, NULL, NULL, '40102 Soft'),
(376, '07459', 'Idea Interlocutor 40106 SOFT', 'Idea Interlocutor 40106 SOFT', '<p>Silla aproximaci&oacute;n</p>\r\n\r\n<p>Estructura pata S con brazos interligados</p>\r\n\r\n<p>Asiento y respaldero en tela negra</p>\r\n\r\n<p>Capacidad 110 Kg.&nbsp;</p>\r\n\r\n<p><strong>Consultar Disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 0, 0, 0, 0, 0, NULL, NULL, ''),
(377, '40202', 'Idea Director 40202', 'Silla Idea Director 40202', '<p>Silla Idea Director 40202</p>\r\n', 0, 0, 0, NULL, NULL, 5, 0, 0, 0, 0, 0, NULL, NULL, ''),
(378, '07459', 'Idea Interlocutor 40206 SI', 'Silla Interlocutor Idea 40206 SI', '<p>Bot&oacute;n con ajuste en altura de respaldero</p>\r\n\r\n<p>Asiento y respaldero revestido en tela</p>\r\n\r\n<p>Estructura pata S con brazos&nbsp;interligados pintado en negro</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>Consultar disponibilidad de colores</p>\r\n', 0, 0, 0, NULL, NULL, 5, 15, 0, 0, 0, 1, NULL, NULL, '40206 SI'),
(379, '08801', 'Vélo Interlocutor  42106 SI', 'Vélo Interlocutor  42106 SI', '<p>Silla interlocutor</p>\r\n\r\n<p>Respaldero alto&nbsp;en tela microperforado</p>\r\n\r\n<p>Asiento revestido en tela</p>\r\n\r\n<p>Estructura pata S pintado negro con brazos interligados</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p><strong>Consultar disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 16, 0, 0, 0, 1, NULL, NULL, '42106 SI'),
(380, '11825', 'Vélo Presidente 42101', 'Vélo Presidente 42101', '<p>Silla Presidente giratoria</p>\r\n\r\n<p>Soporte lumbar</p>\r\n\r\n<p>Brazos de ID regulable</p>\r\n\r\n<p>Mecanismo Syncron RP</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base de nylon negro</p>\r\n\r\n<p>Rodizio de 65 nyl&oacute;n</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p><strong>Consulte disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 16, 0, 0, 0, 1, NULL, NULL, '42101'),
(381, '12421', 'Vélo Presidente 42101 AC', 'Vélo Presidente 42101 AC', '<p>Silla Presidente giratoria</p>\r\n\r\n<p>Apoya cabeza</p>\r\n\r\n<p>Soporte lumbar</p>\r\n\r\n<p>Brazos de ID regulable</p>\r\n\r\n<p>Mecanismo Syncron RP</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base de nylon negro</p>\r\n\r\n<p>Rodizio de 65 nyl&oacute;n</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p><strong>Consulte disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 16, 0, 0, 0, 1, NULL, NULL, '42101 AC'),
(382, '10427', 'Essence Interlocutor 20506 S', 'Essence Interlocutor 20506 S', '<p>Silla fija aproximaci&oacute;n</p>\r\n\r\n<p>Estructura&nbsp;pata S pintado en negro con rodizio frontal</p>\r\n\r\n<p>Brazos 4D negro</p>\r\n\r\n<p>Revestimiento en cuerina negro</p>\r\n\r\n<p>Consultar opciones de colores</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n', 0, 0, 0, NULL, NULL, 5, 14, 0, 0, 0, 1, NULL, NULL, '20506 S'),
(383, '14011', 'Essence Director 20502 ', 'Essence Director 20502 ', '<p>Poltrona Director con respaldero medio</p>\r\n\r\n<p>Brazos Regulables 4D</p>\r\n\r\n<p>Mecanismo Syncron (RP)</p>\r\n\r\n<p>Base en aluminio</p>\r\n\r\n<p>Rodizio de 65&nbsp;</p>\r\n\r\n<p>Consultar opciones de colores</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n', 0, 0, 0, NULL, NULL, 5, 14, 0, 0, 0, 1, NULL, NULL, '20502'),
(384, '43106 Z ROD', 'Flip con Ruedas 43106 Z ROD', 'Silla Flip con Ruedas 43106 Z ROD', '<p>Estructura Z con ruedas&nbsp;de 5cm</p>\r\n\r\n<p>Brazos integrados</p>\r\n\r\n<p>Respaldo en tela&nbsp; microperforada</p>\r\n', 0, 0, 0, NULL, NULL, 5, 0, 0, 0, 0, 0, NULL, NULL, ''),
(385, '10834', 'Flip Interlocutor 43106 Z', 'Flip Interlocutor 43106 Z', '<p>Respaldero anat&oacute;mico en tela microperforado</p>\r\n\r\n<p>Asiento en cuerina negro</p>\r\n\r\n<p>Estructura Z con brazos interligados pintado en negro</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>Consultar disponiblidad de colores&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 17, 0, 0, 0, 1, NULL, NULL, '43106 Z'),
(386, '10301', 'Flip Cajera 43122', 'Flip Cajera 43122', '<p>Respaldero anat&oacute;mico en tela microperforado en negro</p>\r\n\r\n<p>Sistema de regulaje del respaldero (Altura y profundidad)</p>\r\n\r\n<p>Brazos regulables</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base cajera de metal con capa de protecci&oacute;n pl&aacute;stica negra</p>\r\n\r\n<p>Aro apoya pies regulables</p>\r\n\r\n<p>Zapatas</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>6 a&ntilde;os de garantia contra defectos de fabricaci&oacute;n&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 17, 0, 0, 0, 1, NULL, NULL, '43122'),
(387, '10443', 'Flip Ejecutiva Giratoria 43103 ', 'Flip Ejecutiva Giratoria 43103 ', '<p>Respaldero anatomico en tela microperforado en negro</p>\r\n\r\n<p>Sistema de regulaje del respaldero (Altura y profundidad)</p>\r\n\r\n<p>Brazos regulables</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base de metal con capa de protecci&oacute;n pl&aacute;stica negra</p>\r\n\r\n<p>Rodizio de 50</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>6 a&ntilde;os de garantia contra defectos de fabricaci&oacute;n&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 17, 0, 0, 0, 1, NULL, NULL, '43103'),
(388, '12544', 'COEXMA 12544', 'COEXMA Giratoria 12544', '<p>Mecanismo syncron</p>\r\n\r\n<p>Brazos regulables</p>\r\n\r\n<p>Regulaci&oacute;n de altura a gas</p>\r\n\r\n<p>Base alumin&iacute;o</p>\r\n\r\n<p>Regulaci&oacute;n de profundidad del asiento</p>\r\n\r\n<p>Respaldero pl&aacute;stico engomado con capa de protecci&oacute;n</p>\r\n\r\n<p>Revestimiento en cuerina negro&nbsp;</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n', 1246000, 0, 0, NULL, NULL, 16, 3, 0, 0, 0, 1, NULL, NULL, ''),
(389, '12542', 'COEXMA 12542', 'COEXMA Giratoria 12542', '<p>Mecanismo syncron</p>\r\n\r\n<p>Brazos regulables</p>\r\n\r\n<p>Regulaci&oacute;n de altura a gas</p>\r\n\r\n<p>Base de nylon negro</p>\r\n\r\n<p>Respaldero pl&aacute;stico engomado</p>\r\n\r\n<p>Revestimiento en tela negro&nbsp;</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n', 900000, 0, 0, NULL, NULL, 16, 3, 0, 0, 0, 1, NULL, NULL, ''),
(390, '002272', 'Silla Ergoplax Giratoria con Brazos 33970', 'Silla Ergoplax Giratoria con Brazos 33970', '<p>Asiento y respaldero anat&oacute;mico negro</p>\r\n\r\n<p>Brazos interligados fijos</p>\r\n\r\n<p>Mecanismo Relax</p>\r\n\r\n<p>Base de metal con capa protectora pl&aacute;stica negra</p>\r\n\r\n<p>Espuma solo en asiento</p>\r\n\r\n<p>Capacidad 110 Kg</p>\r\n\r\n<p>&nbsp;</p>\r\n', 520000, 0, 0, NULL, NULL, 17, 24, 1, 0, 15, 1, NULL, NULL, '33970'),
(391, '004561', 'Silla Ergoplax Giratoria sin Brazos 33970', 'Silla Ergoplax Giratoria sin Brazos 33970', '<p>Asiento y respaldero anat&oacute;mico negro</p>\r\n\r\n<p>Mecanismo Relax</p>\r\n\r\n<p>Base de metal con capa protectora pl&aacute;stica negra</p>\r\n\r\n<p>Asiento sin espuma</p>\r\n\r\n<p>Capacidad 110 Kg</p>\r\n', 444000, 0, 0, NULL, NULL, 17, 24, 1, 0, 16, 1, NULL, NULL, '33970'),
(392, '09483', 'Ergoplax Presidente con espuma 33682', 'Ergoplax Presidente con espuma 33682', '<p>Base giratoria de metal con capa protectora pl&aacute;stica</p>\r\n\r\n<p>Ajuste de altura a gas</p>\r\n\r\n<p>Mecanismo relax</p>\r\n\r\n<p>Brazos integrados con apoyo&nbsp;pl&aacute;stico</p>\r\n\r\n<p>Asiento y respaldo pl&aacute;stico&nbsp;negro</p>\r\n\r\n<p>Espuma solo en el asiento</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>Consultar disponibilidad en colores</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 17, 24, 0, 0, 0, 1, NULL, NULL, '33682'),
(393, '09932', 'Silla Ergoplax  34532', 'Silla Ergoplax con espuma en Asiento 34532', '<p>Asiento y respaldero anat&oacute;mico pl&aacute;stico negro</p>\r\n\r\n<p>Estructura fija 4 pies tubular negro</p>\r\n\r\n<p>Capacidad 110 Kg.&nbsp;</p>\r\n\r\n<p>Con espuma solo en asiento</p>\r\n', 271000, 0, 0, NULL, NULL, 17, 24, 1, 0, 12, 1, NULL, NULL, ' 34532'),
(394, '10442', 'Suprema Presidente 42452', 'Suprema Presidente 42452', '<p>Asiento y respaldero revestidos en cuerina negro</p>\r\n\r\n<p>Brazos fijos cromados con apoyo PP</p>\r\n\r\n<p>Mecanismo Relax</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base cromado</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p><strong>Consulte disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 1, 0, 1, NULL, NULL, ''),
(395, '41076', 'Stylus Fija Apilable 41076', 'Stylus Fija Apilable 41076', '<p>Stylus Fija Apilable 41076</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 0, NULL, NULL, ''),
(396, '39847', 'Slytus Giratoria 39847', 'Slytus Giratoria 39847', '<p>Slytus Giratoria 39847</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 0, NULL, NULL, ''),
(397, '14145', 'Beezi Giratoria con Ruedas 39000', 'Beezi Giratoria con Ruedas 39000', '<p>Respaldero y apoya brazo pl&aacute;stico</p>\r\n\r\n<p>Base giratoria cromado</p>\r\n\r\n<p>Mecanismo Relax</p>\r\n\r\n<p>Capadidad 110 Kg.</p>\r\n\r\n<p>Revestimiento del asiento en cuerina negro</p>\r\n', 0, 0, 0, NULL, NULL, 17, 22, 0, 0, 0, 1, NULL, NULL, '39000'),
(398, '14146', 'Beezi Fija 4 Pies sin Brazo 39003', 'Beezi Fija 4 Pies sin Brazo 39003', '<p>Respaldero de&nbsp;pl&aacute;stico</p>\r\n\r\n<p>Estructura tubular cromado</p>\r\n\r\n<p>Capadidad 110 Kg.</p>\r\n\r\n<p>Revestimiento del asiento en cuerina negro</p>\r\n', 0, 0, 0, NULL, NULL, 17, 22, 0, 0, 0, 1, NULL, NULL, '39003'),
(399, '10149', 'Beezi Fija 4 Pies con brazo 39003', 'Beezi Fija 4 Pies con brazo 39003', '<p>Respaldero y apoya brazo pl&aacute;stico</p>\r\n\r\n<p>Estructura tubular cromado</p>\r\n\r\n<p>Capadidad 110 Kg.</p>\r\n\r\n<p>Revestimiento del asiento en cuerina negro</p>\r\n', 0, 0, 0, NULL, NULL, 17, 22, 0, 0, 0, 1, NULL, NULL, ' 39003'),
(400, '30441', 'Silla Operativa Caja 30441', 'Silla Operativa Caja 30441', '<p>Silla caja fija</p>\r\n\r\n<p>Aro apoya de pies regulables</p>\r\n\r\n<p>Base negra</p>\r\n\r\n<p>Con zapata</p>\r\n\r\n<p>Con regulaci&oacute;n de altura</p>\r\n\r\n<p>Brazos SL regulable</p>\r\n\r\n<p>Respaldo regulable</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(401, '11812', 'Realli Presidente 53320', 'Realli Presidente 53320', '<p>Asiento y respaldero revestidos en cuerina</p>\r\n\r\n<p>Apoya brazos fijos cromados con apoyo PP</p>\r\n\r\n<p>Mecanismo Relax</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base de aluminio</p>\r\n\r\n<p>Rodizio de 50 PU</p>\r\n\r\n<p>Capacidad 110 Kg</p>\r\n\r\n<p><strong>Consulte disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(402, '09304', 'Izzi Interlocutor  Pata S 25524', 'Izzi Interlocutor  Pata S 25524', '<p>Asiento y respaldero revestido en cuerina</p>\r\n\r\n<p>Estructura pata S&nbsp;con Brazos interligados cromados</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, 0, 1, NULL, NULL, ''),
(403, '09950', 'Interlocutor Izzi Fija 4 Pies 25525', 'Interlocutor Izzi Fija 4 Pies 25525', '<p>Asiento y respaldero revestido en cuerina</p>\r\n\r\n<p>Estructura 4 pies con Brazos interligados cromados</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, 0, 1, NULL, NULL, ''),
(404, '25422', 'Izzi Director 25422', 'Izzi Director 25422', '<p>Izzi Director 25422</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, 0, 0, NULL, NULL, ''),
(406, '25187', 'Izzi Presidente  25187', 'Silla Izzi Presidente  25187', '<p>Silla Izzi Presidente &nbsp;25187</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, 0, 0, NULL, NULL, ''),
(407, '12005', 'Piena Interlocutor 45602', 'Piena Interlocutor 45602', '<p>Respaldero pl&aacute;stico</p>\r\n\r\n<p>Asiento revestido en tela</p>\r\n\r\n<p>Estructura pata S cromado con brazos interligados</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p><strong>Consultar disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, 0, 0, NULL, NULL, ''),
(408, '37882', 'Brizza Soft Interlocutor 37882', 'Brizza Soft Interlocutor 37882', '<p>Brizza Soft Interlocutor 37882</p>\r\n', 0, 0, 0, NULL, NULL, 17, 23, 0, 0, 0, 0, NULL, NULL, ''),
(409, '37880', 'Brizza Soft Ejecutiva 37880', 'Brizza Soft Ejecutiva 37880', '<p>Brizza Soft Ejecutiva 37880</p>\r\n', 0, 0, 0, NULL, NULL, 17, 23, 0, 0, 0, 0, NULL, NULL, ''),
(410, '37858', 'Brizza Soft Presidente 37858', 'Brizza Soft Presidente 37858', '<p>Brizza Soft Presidente 37858</p>\r\n', 0, 0, 0, NULL, NULL, 17, 23, 0, 0, 0, 0, NULL, NULL, ''),
(411, '10295', 'Brizza Tela Interlocutor 37881', 'Brizza Tela Interlocutor 37881', '<p>Respaldero en Tela microperforado</p>\r\n\r\n<p>Esteructura pata S cromado con brazos interligados</p>\r\n\r\n<p>Revestimiento del asiento en cuerina</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 17, 23, 0, 0, 0, 1, NULL, NULL, '37881'),
(413, '13719', 'Brizza Tela Ejecutiva 37877', 'Brizza Tela Ejecutiva 37877', '<p>Apoyo Lumbar</p>\r\n\r\n<p>Brazos Regulables</p>\r\n\r\n<p>Mecanismo Relax</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base giratoria en aluminio</p>\r\n\r\n<p>Revestimiento del asiento en cuerina</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n', 0, 0, 0, NULL, NULL, 17, 23, 0, 0, 0, 1, NULL, NULL, '37877'),
(414, '13718', 'Brizza Tela Presidente AC 37811 CR', 'Brizza Tela Presidente AC 37811', '<p>Apoya cabeza Regulable</p>\r\n\r\n<p>Apoyo Lumbar</p>\r\n\r\n<p>Brazos Regulables</p>\r\n\r\n<p>Mecanismo Relax</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base giratoria cromada</p>\r\n\r\n<p>Revestimiento del asiento en cuerina</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n', 0, 0, 0, NULL, NULL, 17, 23, 0, 0, 0, 1, NULL, NULL, '37811 CR'),
(415, '000389/000496', 'Silla Ergoplax Fija 000390/000496', 'Silla Ergoplax Fija 000390/000496', '<p>Asiento y respaldero anat&oacute;mico pl&aacute;stico coloridos</p>\r\n\r\n<p>Estructura fija 4 pies tubular negro</p>\r\n\r\n<p>Capacidad 110 Kg.&nbsp;</p>\r\n\r\n<p><strong>Disponible en varios colores</strong></p>\r\n', 225000, 0, 0, NULL, NULL, 17, 24, 0, 0, 0, 1, NULL, NULL, '000390'),
(416, '12398', 'Suprema Interlocutor 46812', 'Silla Interlocutor Suprema 46812', '<p>Silla Aproximaci&oacute;n</p>\r\n\r\n<p>Asiento y respaldero en cuerina</p>\r\n\r\n<p>Estructura Pata S</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p><strong>Consulte disponibilidad de colores</strong></p>\r\n', 1500000, 0, 0, NULL, NULL, 17, 0, 0, 0, 0, 1, NULL, NULL, ''),
(417, '42452', 'Suprema Presidente 42452', 'Suprema Presidente 42452', '<p>Silla Presidente Suprema 42452</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, 0, 0, NULL, NULL, ''),
(419, 'AC40T', 'Cámara de Fermentación Controlada AC40T', 'Cámara de Fermentación Controlada AC40T', '<p>&bull; Largo: 73cm</p>\r\n\r\n<p>&bull; Altura: 2,05mts</p>\r\n\r\n<p>&bull; Profundidad: 1,78mts</p>\r\n\r\n<p>&bull; 40 bandejas de 58x70cm</p>\r\n\r\n<p>&bull; Armario con sistema de retardo de fermentaci&oacute;n</p>\r\n\r\n<p>de masas (Fr&iacute;o) y aceleraci&oacute;n de fermentaci&oacute;n de masas</p>\r\n\r\n<p>(t&eacute;rmico).</p>\r\n\r\n<p>&bull; Controlador digital con funci&oacute;n de programaci&oacute;n de tiempo</p>\r\n\r\n<p>y par&aacute;metros de fr&iacute;o y calor.</p>\r\n\r\n<p>&bull; Sistema de refrigeraci&oacute;n por aire forzado</p>\r\n\r\n<p>&bull; Sistema de calentamiento por medio de 2 resistencias</p>\r\n\r\n<p>de 300w y de 700w.</p>\r\n\r\n<p>&bull; Interior revestido en aluminio corrugado</p>\r\n\r\n<p>&bull; Exterior en acero galvanizado con pintura epoxi.</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(420, 'AC20T', 'Cámara de Fermentación Controlada AC20T', 'Cámara de Fermentación Controlada AC20T', '<p>&bull; Largo: 73cm</p>\r\n\r\n<p>&bull; Altura: 2,05mts</p>\r\n\r\n<p>&bull; Profundidad: 1,02mts</p>\r\n\r\n<p>&bull; 20 bandejas de 58x70cm</p>\r\n\r\n<p>&bull; Armario con sistema de retardo de fermentaci&oacute;n</p>\r\n\r\n<p>de masas (Fr&iacute;o) y aceleraci&oacute;n de fermentaci&oacute;n de masas</p>\r\n\r\n<p>(t&eacute;rmico).</p>\r\n\r\n<p>&bull; Controlador digital con funci&oacute;n de programaci&oacute;n de tiempo</p>\r\n\r\n<p>y par&aacute;metros de fr&iacute;o y calor.</p>\r\n\r\n<p>&bull; Sistema de refrigeraci&oacute;n por aire forzado</p>\r\n\r\n<p>&bull; Sistema de calentamiento por medio de 2 resistencias</p>\r\n\r\n<p>de 300w y de 700w.</p>\r\n\r\n<p>&bull; Interior revestido en aluminio corrugado</p>\r\n\r\n<p>&bull; Exterior en acero galvanizado con pintura epoxi.</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(422, 'BSR-2000', 'Mesada de Trabajo Refrigerada BSR-2000', 'Mesada de Trabajo Refrigerada BSR-2000', '<p>&bull; Almacenamiento de productos refrigerados</p>\r\n\r\n<p>&bull; Temperatura: 0&deg;C a 5&deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: Est&aacute;tica</p>\r\n\r\n<p>&bull; Controlador de temperatura electr&oacute;nico digital</p>\r\n\r\n<p>&bull; Puertas con cierre autom&aacute;tico</p>\r\n\r\n<p>&bull; Aislamiento en poliuretano inyectado</p>\r\n\r\n<p>&bull; Patas regulables</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(423, 'FF4CDP', 'Cocina Funcional FF4CDP', 'Cocina Funcional FF4CDP', '<p>&bull; Estructura reforzada con acabado en pintura&nbsp;a polvo electrost&aacute;tico, con base fosfatizada</p>\r\n\r\n<p>&bull; Opci&oacute;n de quemadores simples o dobles</p>\r\n\r\n<p>&bull; Hornalla de 30x30cm</p>\r\n\r\n<p>&bull; Quemador simple con doble llama.&nbsp;</p>\r\n\r\n<p>&bull; Para Gas de Baja presi&oacute;n&nbsp;</p>\r\n\r\n<p>&bull; Perfil 2</p>\r\n\r\n<p>&bull; C&oacute;digo: FF4CDP</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(424, 'FF2CDP', 'Cocina Funcional FF2CDP', 'Cocina Funcional FF2CDP', '<p>&bull; Estructura reforzada con acabado en pintura&nbsp;a polvo electrost&aacute;tico, con base fosfatizada</p>\r\n\r\n<p>&bull; Opci&oacute;n de quemadores simples o dobles</p>\r\n\r\n<p>&bull; Hornalla de 30x30cm</p>\r\n\r\n<p>&bull; Quemador simple con doble llama.&nbsp;</p>\r\n\r\n<p>&bull; Para Gas de Baja presi&oacute;n&nbsp;</p>\r\n\r\n<p>&bull; Perfil 2</p>\r\n\r\n<p>&bull; C&oacute;digo: FF2CDP</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(425, 'EXTRA E4 ', 'Cocina Industrial EXTRA E4 ', 'Cocina Industrial EXTRA E4 ', '<p>&bull; Altura: 80cm</p>\r\n\r\n<p>&bull; Largo: 74cm</p>\r\n\r\n<p>&bull; Profundidad: 82cm</p>\r\n\r\n<p>&bull; Hornallas en hierro fundido de 30x30cm</p>\r\n\r\n<p>&bull; Quemadores simples de 10mm</p>\r\n\r\n<p>&bull; Estructura en chapa de acero</p>\r\n\r\n<p>&bull; Perfil 5</p>\r\n\r\n<p>&bull; Baja presi&oacute;n</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(426, 'FF1CDP', 'Cocina Funcional FF1CDP', 'Cocina Funcional FF1CDP', '<p>&bull; Estructura reforzada con acabado en pintura&nbsp;a polvo electrost&aacute;tico, con base fosfatizada</p>\r\n\r\n<p>&bull; Opci&oacute;n de quemadores simples o dobles</p>\r\n\r\n<p>&bull; Hornalla de 30x30cm</p>\r\n\r\n<p>&bull; Quemador simple con doble llama.&nbsp;</p>\r\n\r\n<p>&bull; Para Gas de Baja presi&oacute;n&nbsp;</p>\r\n\r\n<p>&bull; Perfil 2</p>\r\n\r\n<p>&bull; C&oacute;digo: FF1CDP</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(427, 'Horno Industrial EXT', 'Horno Industrial EXTRA FIE', 'Horno Industrial EXTRA FIE', '<p>&bull; Altura: 57cm</p>\r\n\r\n<p>&bull; Largo: 43cn</p>\r\n\r\n<p>&bull; Profundidad: 55cm</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(428, 'E6D3E', 'Cocina Industrial EXTRA E6D3E', 'Cocina Industrial EXTRA E6D3E', '<p>&bull; Altura: 80cm</p>\r\n\r\n<p>&bull; Largo: 1,08mts</p>\r\n\r\n<p>&bull; Profundidad: 82cm</p>\r\n\r\n<p>&bull; Hornallas en hierro fundido&nbsp;</p>\r\n\r\n<p>de 30x30cm</p>\r\n\r\n<p>&bull; Quemadores simples de 10mm</p>\r\n\r\n<p>&bull; Quemadores dobles de 12mm</p>\r\n\r\n<p>&bull; Estructura en chapa de acero</p>\r\n\r\n<p>&bull; Perfil 5</p>\r\n\r\n<p>&bull; Baja presi&oacute;n</p>\r\n\r\n<p>&bull; Con espera para horno</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(429, 'EXTRA E6', 'Cocina Industrial EXTRA E6', 'Cocina Industrial EXTRA E6', '<p>&bull; Altura: 80cm</p>\r\n\r\n<p>&bull; Largo: 1,08mts</p>\r\n\r\n<p>&bull; Profundidad: 82cm</p>\r\n\r\n<p>&bull; Hornallas en hierro fundido de 30x30cm</p>\r\n\r\n<p>&bull; Quemadores simples de 10mm</p>\r\n\r\n<p>&bull; Estructura en chapa de acero</p>\r\n\r\n<p>&bull; Perfil 5</p>\r\n\r\n<p>&bull; Baja presi&oacute;n</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(430, 'E4PD2E', 'Cocina Industrial EXTRA E4PD2E', 'Cocina Industrial EXTRA E4PD2E', '<p>&bull; Altura: 80cm</p>\r\n\r\n<p>&bull; Largo: 1,08mts</p>\r\n\r\n<p>&bull; Profundidad: 82cm</p>\r\n\r\n<p>&bull; Hornallas en hierro fundido de 30x30cm</p>\r\n\r\n<p>&bull; Quemadores simples de 10mm</p>\r\n\r\n<p>&bull; Quemadores dobles de 12mm</p>\r\n\r\n<p>&bull; Estructura en chapa de acero</p>\r\n\r\n<p>&bull; Perfil 5</p>\r\n\r\n<p>&bull; Baja presi&oacute;n</p>\r\n\r\n<p>&bull; Con espera para horno</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(431, 'E2PD1', 'Cocina Industrial Extra E2PD1', 'Cocina Industrial Extra E2PD1', '<p>&bull; Altura: 80cm</p>\r\n\r\n<p>&bull; Largo: 74cm</p>\r\n\r\n<p>&bull; Profundidad: 48cm</p>\r\n\r\n<p>&bull; Hornallas en hierro fundido de 30x30cm</p>\r\n\r\n<p>&bull; Quemadores simples de 10mm</p>\r\n\r\n<p>&bull; Quemadores dobles de 12mm</p>\r\n\r\n<p>&bull; Estructura en chapa de acero</p>\r\n\r\n<p>&bull; Perfil 5</p>\r\n\r\n<p>&bull; Baja presi&oacute;n</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(432, 'E1PD ', 'Cocina Industrial Extra E1PD ', 'Cocina Industrial Extra E1PD ', '<p>&bull; Altura: 80cm</p>\r\n\r\n<p>&bull; Largo: 39cm</p>\r\n\r\n<p>&bull; Profundidad: 48cm</p>\r\n\r\n<p>&bull; Hornallas en hierro fundido de 30x30cm</p>\r\n\r\n<p>&bull; Quemadores simples de 10mm</p>\r\n\r\n<p>&bull; Quemadores dobles de 12mm</p>\r\n\r\n<p>&bull; Estructura en chapa de acero</p>\r\n\r\n<p>&bull; Perfil 5</p>\r\n\r\n<p>&bull; Baja presi&oacute;n</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(433, 'MC4P6', 'Heladera Comercial MC4P6', 'Heladera Comercial MC4P6', '<p>&bull; Almacenamiento de productos</p>\r\n\r\n<p>&nbsp;refrigerados</p>\r\n\r\n<p>&bull; Temperatura: 0&deg;C a 5&deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: Aire&nbsp; forzado</p>\r\n\r\n<p>&bull; Controlador de temperatura electr&oacute;nico&nbsp;digital</p>\r\n\r\n<p>&bull; Puertas con cierre autom&aacute;tico</p>\r\n\r\n<p>&bull; Aislamiento en poliuretano inyectado</p>\r\n\r\n<p>&bull; Patas regulables</p>\r\n\r\n<p>&bull; Largo: 1,56mts</p>\r\n\r\n<p>&bull; Altura: 1,94mts</p>\r\n\r\n<p>&bull; Profundidad: 59cm</p>\r\n\r\n<p>&bull; Puerta: 6</p>\r\n\r\n<p>&bull; Volumen: 1160</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(434, ' MC4P ', 'Heladera Comercial  MC4P ', 'Heladera Comercial  MC4P ', '<p>&bull; Almacenamiento de productos</p>\r\n\r\n<p>&nbsp;refrigerados</p>\r\n\r\n<p>&bull; Temperatura: 0&deg;C a 5&deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: Aire&nbsp; forzado</p>\r\n\r\n<p>&bull; Controlador de temperatura electr&oacute;nico&nbsp;digital</p>\r\n\r\n<p>&bull; Puertas con cierre autom&aacute;tico</p>\r\n\r\n<p>&bull; Aislamiento en poliuretano inyectado</p>\r\n\r\n<p>&bull; Patas regulables</p>\r\n\r\n<p>&bull; Largo: 1,08mts</p>\r\n\r\n<p>&bull; Altura: 1,94mts</p>\r\n\r\n<p>&bull; Profundidad: 59cm</p>\r\n\r\n<p>&bull; Puerta: 4</p>\r\n\r\n<p>&bull; Volumen: 753</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(435, 'MC6PP', 'Heladera Comercial MC6PP', 'Heladera Comercial MC6PP', '<p>&bull; Almacenamiento de productos</p>\r\n\r\n<p>&nbsp;refrigerados</p>\r\n\r\n<p>&bull; Temperatura: 0&deg;C a 5&deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: Aire&nbsp; forzado</p>\r\n\r\n<p>&bull; Controlador de temperatura electr&oacute;nico&nbsp;digital</p>\r\n\r\n<p>&bull; Puertas con cierre autom&aacute;tico</p>\r\n\r\n<p>&bull; Aislamiento en poliuretano inyectado</p>\r\n\r\n<p>&bull; Patas regulables</p>\r\n\r\n<p>&bull; Largo: 1,56mts</p>\r\n\r\n<p>&bull; Altura: 1,94mts</p>\r\n\r\n<p>&bull; Profundidad: 59cm</p>\r\n\r\n<p>&bull; Puerta: 6</p>\r\n\r\n<p>&bull; Volumen: 1160</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(436, 'MC4PP', 'Heladera Comercial MC4PP', 'Heladera Comercial MC4PP', '<p>&bull; Almacenamiento de productos</p>\r\n\r\n<p>&nbsp;refrigerados</p>\r\n\r\n<p>&bull; Temperatura: 0&deg;C a 5&deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: Aire&nbsp; forzado</p>\r\n\r\n<p>&bull; Controlador de temperatura electr&oacute;nico&nbsp;digital</p>\r\n\r\n<p>&bull; Puertas con cierre autom&aacute;tico</p>\r\n\r\n<p>&bull; Aislamiento en poliuretano inyectado</p>\r\n\r\n<p>&bull; Patas regulables</p>\r\n\r\n<p>&bull; Largo: 1,08mts</p>\r\n\r\n<p>&bull; Altura: 1,94mts</p>\r\n\r\n<p>&bull; Profundidad: 59cm</p>\r\n\r\n<p>&bull; Puerta: 4</p>\r\n\r\n<p>&bull; Volumen: 753</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(437, 'CO5TE ', 'Horno Convector CO5TE ', 'Horno Convector CO5TE ', '<p>&bull; Capacidad: 5 bandejas de 40x60cm</p>\r\n\r\n<p>&bull; Sistema de rotaci&oacute;n alterna de turbina</p>\r\n\r\n<p>&bull; Aislamiento t&eacute;rmico en fibra cer&aacute;mica</p>\r\n\r\n<p>&bull; Controlador digiral con funciones:</p>\r\n\r\n<p>- Programaci&oacute;n de temperatura</p>\r\n\r\n<p>- Vapor</p>\r\n\r\n<p>- Temporizador</p>\r\n\r\n<p>- Alarma</p>\r\n\r\n<p>&bull; C&aacute;mara interna esmaltada con soporte</p>\r\n\r\n<p>de bandejas desmontables</p>\r\n\r\n<p>&bull; Exterior inoxidable</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(438, 'MAXI M6ED6', 'Cocina Industrial MAXI M6ED6', 'Cocina Industrial MAXI M6ED6', '<p>&bull; Hornallas en hierro fundido de 40x40cm</p>\r\n\r\n<p>&bull; Quemadores simples de 12mm</p>\r\n\r\n<p>&bull; Quemadores dobles de 18mm</p>\r\n\r\n<p>&bull; Estructura en chapa de acero&nbsp;</p>\r\n\r\n<p>&bull; Perfil 10</p>\r\n\r\n<p>&bull; Baja presi&oacute;n</p>\r\n\r\n<p>&bull; Largo: 1,54mts</p>\r\n\r\n<p>&bull; Altura: 80cm</p>\r\n\r\n<p>&bull; Profundidad: 1,06mts</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(439, 'M4ED4', 'Cocina Industrial MAXI M4ED4', 'Cocina Industrial MAXI M4ED4', '<p>&bull; Hornallas en hierro fundido de 40x40cm</p>\r\n\r\n<p>&bull; Quemadores simples de 12mm</p>\r\n\r\n<p>&bull; Quemadores dobles de 18mm</p>\r\n\r\n<p>&bull; Estructura en chapa de acero&nbsp;</p>\r\n\r\n<p>&bull; Perfil 10</p>\r\n\r\n<p>&bull; Baja presi&oacute;n</p>\r\n\r\n<p>&bull; Largo: 1,06mts</p>\r\n\r\n<p>&bull; Altura: 80cm</p>\r\n\r\n<p>&bull; Profundidad: 1,06mts</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(440, 'M2PD2', 'Cocina Industrial MAXI M2PD2', 'Cocina Industrial MAXI M2PD2', '<p>&bull; Hornallas en hierro fundido de 40x40cm</p>\r\n\r\n<p>&bull; Quemadores simples de 12mm</p>\r\n\r\n<p>&bull; Quemadores dobles de 18mm</p>\r\n\r\n<p>&bull; Estructura en chapa de acero&nbsp;</p>\r\n\r\n<p>&bull; Perfil 10</p>\r\n\r\n<p>&bull; Baja presi&oacute;n</p>\r\n\r\n<p>&bull; Largo: 1,06mts</p>\r\n\r\n<p>&bull; Altura: 80cm</p>\r\n\r\n<p>&bull; Profundidad: 59cm</p>\r\n', 0, 0, 0, NULL, NULL, 18, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(441, 'MITEBEP-1900', 'Mesa Inox MITEBEP-1900', 'Mesa Inox MITEBEP-1900', '<p>&bull; Estructura tubular desmontable</p>\r\n\r\n<p>&bull; Tapa en acero inoxidable</p>\r\n\r\n<p>&bull; Patas con pintura epoxi</p>\r\n\r\n<p>&bull; Con z&oacute;calo</p>\r\n\r\n<p>&bull; Largo: 1,90mts</p>\r\n\r\n<p>&bull; Altura: 90cm</p>\r\n\r\n<p>&bull; Profundidad: 70cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(442, 'MITLEP-1900', 'Mesa Inox MITLEP-1900', 'Mesa Inox MITLEP-1900', '<p>&bull; Estructura tubular desmontable</p>\r\n\r\n<p>&bull; Tapa en acero inoxidable</p>\r\n\r\n<p>&bull; Patas con pintura epoxi</p>\r\n\r\n<p>&bull; Largo: 1,90mts</p>\r\n\r\n<p>&bull; Altura: 90cm</p>\r\n\r\n<p>&bull; Profundidad: 70cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(443, 'MESADA', 'MESADA DE TRABAJO REFRIGERADOS', 'MESADA DE TRABAJO REFRIGERADOS', '<p>MESADA DE TRABAJO REFRIGERADOS</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(444, 'EIP2000', 'Isla para Congelados Doble Acción EIP2000', 'Isla para Congelados Doble Acción EIP2000', '<p>&bull; Utilizaci&oacute;n de productos congelados o refrigerados</p>\r\n\r\n<p>&bull; Temperatura: 0&deg;C a 7&deg;C o -18&deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: Est&aacute;tica</p>\r\n\r\n<p>&bull; Parrilas divisorias</p>\r\n\r\n<p>&bull; Molduras en PVC</p>\r\n\r\n<p>&bull; Patas Regulables</p>\r\n\r\n<p>&bull; 3 Puertas</p>\r\n\r\n<p>&bull; Volumen: 55</p>\r\n\r\n<p>&bull; Tapa de vidrio plano</p>\r\n\r\n<p>&bull; Largo: 2,00mts</p>\r\n\r\n<p>&bull; Altura: 97cm</p>\r\n\r\n<p>&bull; Profundidad: 83cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(445, 'EIST3000', 'Isla para Congelados Doble Acción EIST3000', 'Isla para Congelados Doble Acción EIST3000', '<p>&bull; Utilizaci&oacute;n de productos congelados o refrigerados</p>\r\n\r\n<p>&bull; Temperatura: 0&deg;C a 7&deg;C o -18&deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: Est&aacute;tica</p>\r\n\r\n<p>&bull; Parrilas divisorias</p>\r\n\r\n<p>&bull; Molduras en PVC</p>\r\n\r\n<p>&bull; Patas Regulables</p>\r\n\r\n<p>&bull; 4 Puertas</p>\r\n\r\n<p>&bull; Volumen: 86</p>\r\n\r\n<p>&bull; Tapa de vidrio curvo</p>\r\n\r\n<p>&bull; Largo: 3,00mts</p>\r\n\r\n<p>&bull; Altura: 97cm</p>\r\n\r\n<p>&bull; Profundidad: 83cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(446, 'EIST2000', 'Isla para Congelados Doble Acción EIST2000', 'Isla para Congelados Doble Acción EIST2000', '<p>&bull; Utilizaci&oacute;n de productos congelados o refrigerados</p>\r\n\r\n<p>&bull; Temperatura: 0&deg;C a 7&deg;C o -18&deg;C</p>\r\n\r\n<p>&bull; Refrigeraci&oacute;n: Est&aacute;tica</p>\r\n\r\n<p>&bull; Parrilas divisorias</p>\r\n\r\n<p>&bull; Molduras en PVC</p>\r\n\r\n<p>&bull; Patas Regulables</p>\r\n\r\n<p>&bull; 3 Puertas</p>\r\n\r\n<p>&bull; Volumen: 55</p>\r\n\r\n<p>&bull; Tapa de vidrio curvo</p>\r\n\r\n<p>&bull; Largo: 2,00mts</p>\r\n\r\n<p>&bull; Altura: 97cm</p>\r\n\r\n<p>&bull; Profundidad: 83cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(447, 'Freezers FHRV', 'Freezers FHRV', 'Freezers FHRV', '<p>- Utilizaci&oacute;n de productos congelados,&nbsp;</p>\r\n\r\n<p>refrigerados o bebidas</p>\r\n\r\n<p>- Temperatura: 2&deg;C a 8&deg;C o -18&deg;C</p>\r\n\r\n<p>- Refrigeraci&oacute;n: Est&aacute;tica</p>\r\n\r\n<p>- Controlador de temperatura termostato doble acci&oacute;n</p>\r\n\r\n<p>- Puertas en vidrio corredizas</p>\r\n\r\n<p>- Drenaje frontal con tapa</p>\r\n\r\n<p>- Volumen: 420</p>\r\n\r\n<p>- Ruedas</p>\r\n\r\n<p>- Altura: 90cm</p>\r\n\r\n<p>- Largo: 1,35mts</p>\r\n\r\n<p>- Profundidad: 66cm</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(448, 'FHRS', 'Freezers FHRS', 'Freezers FHRS', '<p>- C&oacute;digo fabricante: FHR-420S</p>\r\n\r\n<p>- Utilizaci&oacute;n de productos congelados,&nbsp;</p>\r\n\r\n<p>refrigerados o bebidas</p>\r\n\r\n<p>- Temperatura: 2&deg;C a 8&deg;C o -18&deg;C</p>\r\n\r\n<p>- Refrigeraci&oacute;n: Est&aacute;tica</p>\r\n\r\n<p>- Controlador de temperatura termostato doble acci&oacute;n</p>\r\n\r\n<p>- Tapa ciega&nbsp;</p>\r\n\r\n<p>- Drenaje frontal con tapa</p>\r\n\r\n<p>- Volumen: 420</p>\r\n\r\n<p>- Ruedas</p>\r\n\r\n<p>- Altura: 91cm</p>\r\n\r\n<p>- Largo:&nbsp;1,35mts</p>\r\n\r\n<p>- Profundidad: 66cm</p>\r\n\r\n<p><br />\r\nOTRO TAMA&Ntilde;O</p>\r\n\r\n<p>- C&oacute;digo fabricante: FHR-530S</p>\r\n\r\n<p>- Utilizaci&oacute;n de productos congelados,&nbsp;</p>\r\n\r\n<p>refrigerados o bebidas</p>\r\n\r\n<p>- Temperatura: 2&deg;C a 8&deg;C o -18&deg;C</p>\r\n\r\n<p>- Refrigeraci&oacute;n: Est&aacute;tica</p>\r\n\r\n<p>- Controlador de temperatura termostato doble acci&oacute;n</p>\r\n\r\n<p>- Tapa ciega&nbsp;</p>\r\n\r\n<p>- Drenaje frontal con tapa</p>\r\n\r\n<p>- Volumen: 530</p>\r\n\r\n<p>- Ruedas</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(449, 'COTE1500', 'Check Out  COTE1500', 'Check Out  COTE1500', '<p>&bull; Tapa de acero inoxidable</p>\r\n\r\n<p>&bull; Estructura en chapa de acero con</p>\r\n\r\n<p>pintura anticorrosiva</p>\r\n\r\n<p>&bull; Caja con llave</p>\r\n\r\n<p>&bull; Patas regulables</p>\r\n\r\n<p>&bull; Kit de automatizaci&oacute;n</p>\r\n\r\n<p>&bull; Altura: 93cm</p>\r\n\r\n<p>&bull; Largo: 1,50mts</p>\r\n\r\n<p>&bull; Profundidad: 1,00mts</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(451, 'FC1X1', 'Frutera central FC1X1', 'Frutera central FC1X1', '<p>&bull; Estructura met&aacute;lica</p>\r\n\r\n<p>&bull; Patas regulables</p>\r\n\r\n<p>&bull; Altura: 1,00mts</p>\r\n\r\n<p>&bull; Largo: 1,00mts</p>\r\n\r\n<p>&bull; Profundidad: 1,00mts</p>\r\n', 0, 0, 0, NULL, NULL, 6, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(453, '205-001', 'Carrito de Transporte 200LTS 205-001', 'Carrito de Transporte 200LTS 205-001', '<p>&bull; C&oacute;digo:&nbsp;205-001</p>\r\n\r\n<p>&bull; C&oacute;digo S: 11478</p>\r\n\r\n<p>&bull; Largo: 48cm</p>\r\n\r\n<p>&bull; Altura: 1,15,mts</p>\r\n\r\n<p>&bull; Profundidad: 56cm</p>\r\n', 0, 0, 0, NULL, NULL, 14, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(454, '102-001', 'Carrito para Supermercado 160LTS 102-001', 'Carrito para Supermercado 160LTS 102-001', '<p>&bull; C&oacute;digo:&nbsp;102-001</p>\r\n\r\n<p>&bull; C&oacute;digo S: 003522</p>\r\n\r\n<p>&bull; Largo: 54cm</p>\r\n\r\n<p>&bull; Altura: 98CM</p>\r\n\r\n<p>&bull; Profundidad: 96cm</p>\r\n', 0, 0, 0, NULL, NULL, 14, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(455, '106-001', 'Carrito para Supermercado DUPLOCAR 46LTS 106-001', 'Carrito para Supermercado DUPLOCAR 46LTS 106-001', '<p>&bull; C&oacute;digo:&nbsp;106-001</p>\r\n\r\n<p>&bull; C&oacute;digo S: 11477</p>\r\n\r\n<p>&bull; Largo: 46cm</p>\r\n\r\n<p>&bull; Altura: 1,05mts</p>\r\n\r\n<p>&bull; Profundidad: 78cm</p>\r\n', 0, 0, 0, NULL, NULL, 14, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(456, 'GÓNDOLA LATERAL/PUNT', 'GÓNDOLA LATERAL/PUNTERA', 'GÓNDOLA LATERAL/PUNTERA', '<p>&bull; Altura: 1,75mts</p>\r\n\r\n<p>&bull; Profundidad: 90cm</p>\r\n\r\n<p>&bull; Largo: 96cm</p>\r\n\r\n<p>&bull; 1 bandeja de 96x40cm</p>\r\n\r\n<p>&bull; 4 bandejas de 96x30cm</p>\r\n\r\n<p>&bull; Estructura en chapa de acero con pintura anticorosiva al horno</p>\r\n\r\n<p>&bull; Capacidad por bandeja: 120kg</p>\r\n', 0, 0, 0, NULL, NULL, 16, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(457, 'GÓNDOLA CENTRAL', 'GÓNDOLA CENTRAL', 'GÓNDOLA CENTRAL', '<p>&bull; Altura: 1,75mts</p>\r\n\r\n<p>&bull; Profundidad: 90cm</p>\r\n\r\n<p>&bull; Largo: 96cm</p>\r\n\r\n<p>&bull; 1 bandeja de 96x40cm</p>\r\n\r\n<p>&bull; 8 bandejas de 96x30cm</p>\r\n\r\n<p>&bull; Estructura en chapa de acero con pintura anticorosiva al horno</p>\r\n\r\n<p>&bull; Capacidad por bandeja: 120kg</p>\r\n', 0, 0, 0, NULL, NULL, 16, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(458, '001009', 'Caja Fuerte 30', 'Con la caja fuerte embutido EDW de COEXMA mantén seguro sus objetos de valores y documentos importantes. ', '<p><strong>Medidas Externas: Largo:</strong> 0,375&nbsp;cm -&nbsp;&nbsp;<strong>Alto:</strong>&nbsp;0,345 cm&nbsp; -&nbsp;<strong>Profundidad:</strong>&nbsp;0,19&nbsp;cm&nbsp;</p>\r\n\r\n<p><strong>Medidas Internas:&nbsp; Largo:</strong> 0,315 cm -&nbsp;&nbsp;<strong>Alto:</strong>&nbsp;0,25 cm&nbsp; &nbsp;-&nbsp;&nbsp;<strong>Profundidad:</strong>&nbsp;0,11&nbsp;cm</p>\r\n\r\n<p><strong>Pesa: </strong>6,5&nbsp;kilos</p>\r\n', 0, 0, 290000, NULL, NULL, 8, 3, 0, 0, 0, 1, NULL, NULL, ''),
(459, '08616', 'Silla Operativa Ejecutiva 51003', 'Silla Operativa Ejecutiva 51003', '<p>Respaldero anatomico</p>\r\n\r\n<p>Sistema de Regulaje del Respaldero</p>\r\n\r\n<p>Brazos Regulables</p>\r\n\r\n<p>Sistema de regulaje de altura a gas</p>\r\n\r\n<p>Base de metal con capa protecci&oacute;n de pl&aacute;stico negro</p>\r\n\r\n<p>Capacidad 110 Kg</p>\r\n\r\n<p><strong>Revestimiento disponible en tela y cuerina negro</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n', 861000, 0, 0, NULL, NULL, 17, 0, 1, 0, 7, 1, NULL, NULL, ''),
(460, '51003', 'Silla Operativa Ejecutiva', 'Silla Operativa Ejecutiva', '<p>Silla Operativa Ejecutiva</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 0, NULL, NULL, ''),
(463, '12915', 'Mesa Cuadrada Rattan  12915', 'Mesa Cuadrada Rattan  12915', '<p>Mesa Cuadrada Rattan &nbsp;12915</p>\r\n', 299000, 0, 0, NULL, NULL, 15, 12, 0, 0, NULL, 1, NULL, NULL, ''),
(462, '07963', 'Silla Ergoplax 34532', 'Silla Ergoplax con Espuma en asiento y Respaldero 34532', '<p>Asiento y respaldero anat&oacute;mico pl&aacute;stico negro</p>\r\n\r\n<p>Estructura fija 4 pies tubular negro</p>\r\n\r\n<p>Capacidad 110 Kg.&nbsp;</p>\r\n\r\n<p>Con espuma en asiento y respaldero</p>\r\n', 350000, 0, 0, NULL, NULL, 17, 24, 1, 0, 13, 1, NULL, NULL, '34532'),
(464, '12916', 'Silla Rattan 12916', 'Silla Rattan 12916', '<p>Silla fija Rattan</p>\r\n\r\n<p>Con capacidad para 110 Kg.</p>\r\n\r\n<p>Disponible en color Caf&eacute;</p>\r\n', 234000, 0, 0, NULL, NULL, 15, 12, 0, 0, NULL, 1, NULL, NULL, ''),
(466, '001974', 'Armario de Metal  AL18011', 'Armario de metal de 2 puertas con llaves de 4 bandejas internas, siendo 1 bandeja fija y 3 regulables', '<p><strong>Altura: </strong>2,00 cm</p>\r\n\r\n<p><strong>Largo: </strong>1,20&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad</strong>: 0,40&nbsp;cm</p>\r\n\r\n<p><strong>Chapa:</strong> 26</p>\r\n', 2040000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(467, '000390/002454', 'Longarina 3 Lugares 000390/002454', 'Longarina plástica de 3 Lugares 000388 - 002454', '<p><strong>Medidas:</strong></p>\r\n\r\n<p>Largo:.1.78 cm</p>\r\n\r\n<p>Profundidad:0.53 cm</p>\r\n\r\n<p>Altura: 0.84 cm<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>Capacidad:</strong></p>\r\n\r\n<p>110 Kg/Lugar</p>\r\n\r\n<p><strong>PARA MAS COLORES CONSUTAR DISPONIBILIDAD</strong></p>\r\n', 650000, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(471, 'Test', 'Sillas de Demostracion de COlores', '', '', 200000, 0, 50000, NULL, NULL, 10, 3, 0, 0, 0, 0, NULL, NULL, ''),
(473, '13580', 'Mesa Recta LN 40171', 'Mesa Recta LN 40171', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;1,40 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,60&nbsp;cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,74&nbsp;cm</p>\r\n', 775000, 0, 0, NULL, NULL, 11, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(474, 'LN 40171 + LN 40622', 'Mesa en L LN 40171 + LN 40622', 'Mesa en L LN 40171 + LN 40622', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;1,40 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;1,52&nbsp;cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,74&nbsp;cm</p>\r\n', 1295000, 0, 0, NULL, NULL, 11, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(475, 'LN 40193 + LN 40622', 'Mesa en L LN 40193 + LN 40622', 'Mesa en L LN 40193 + LN 40622', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;1,80 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;1,72&nbsp;cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,74&nbsp;cm</p>\r\n', 1515000, 0, 0, NULL, NULL, 11, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(476, '13584', 'Mesa en L 3C LN 40169', 'Mesa en L 3C LN 40169', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;1,80 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;1,90 cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,75&nbsp;cm</p>\r\n', 2430000, 0, 0, NULL, NULL, 11, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(477, '13585', 'Mesa Auxiliar LN 40622', 'Mesa Auxiliar LN 40622', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;0,92</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,60 cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,75&nbsp;cm</p>\r\n', 520000, 0, 0, NULL, NULL, 11, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(478, '13582', 'Mesa de Reunión LN 40235', 'Mesa de Reunión LN 40235', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong> 2,00 cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp; 0,75 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>1,20 cm</p>\r\n', 1260000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(479, '13583', 'Mesa de Reunión LN 40245', 'Mesa de Reunión LN 40245', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong> 2,30 cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp; 0,75 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>1,20 cm</p>\r\n', 1370000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(480, '13600', 'Mesa de Reunión Redonda LN 40201', 'Mesa de Reunión Redonda LN 40201', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;1,20 cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp; 0,74&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:&nbsp;</strong>1,20 cm</p>\r\n', 897000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(481, '13586', 'Cajonero Fijo LN 40310', 'Cajonero Fijo con 2 cajones y llave frontal ', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong> 0,36 cm</p>\r\n\r\n<p><strong>Alto</strong>:&nbsp; 0,27 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 0,42 cm</p>\r\n', 200000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(482, '13587', 'Cajonero Móvil 3C LN 40321', 'Cajonero Móvil 2 cajones normales y 1 para carpeta colgante con llave frontal para el primer cajón', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Alto</strong>: 0,70 cm</p>\r\n\r\n<p><strong>Largo:</strong>&nbsp; 0,47 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 0,41 cm</p>\r\n', 835000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(483, '13588', 'Cajonero Móvil 4C LN 40322', 'Cajonero Móvil 4 cajones con llave solo del primer cajón ', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;0,70&nbsp;cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,47&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,41&nbsp;cm</p>\r\n', 895000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(484, '13593', 'Archivo 4C LN 40560', 'Archivo cajones para carpetas colgantes sin llaves y 1 nicho superior ', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;1,69&nbsp;cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,47&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,41&nbsp;cm</p>\r\n', 1255000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(485, '13590', 'Armario Alto 2P con nichos laterales LN 40650', 'Armario Alto 2P con nichos laterales LN 40650', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;1,85&nbsp;cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;1,58&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,41&nbsp;cm</p>\r\n', 2450000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(486, '13592', 'Armario 1P Lado Izquierdo con nichos laterales  LN 40656', 'Armario 1P Lado Izquierdo con nichos laterales  LN 40656', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;1,85&nbsp;cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,80 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,41&nbsp;cm</p>\r\n', 1500000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, '');
INSERT INTO `tb_producto` (`id`, `referencia`, `nombre`, `descripcion_corta`, `descripcion_detallada`, `precio`, `stock`, `valor_descuento`, `descripcion`, `valor_mayorista`, `id_marca`, `id_linea`, `destaque`, `recomendado`, `oden_destaque`, `activo`, `unique_hits`, `total_hits`, `modelo`) VALUES
(487, '13591', 'Armario 1P Lado Derecho con nichos laterales LN 40655', 'Armario 1P Lado Derecho con nichos laterales LN 40655', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;1,85&nbsp;cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,80 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,41&nbsp;cm</p>\r\n', 1500000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(488, '13589', 'Armario Credenza LN 40592', 'Armario Credenza con 2 puertas laterales y 2 cajones centrales ', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;1,37&nbsp;cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,75&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,41&nbsp;cm</p>\r\n', 1440000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(489, '13594', 'Armario Bajo 2P LN 40653', 'Armario Bajo con 2 puertas y llave ', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong> 1,58 cm</p>\r\n\r\n<p><strong>Alto:&nbsp;</strong>0,90 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>0,41 cm</p>\r\n', 1600000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(490, '13595', 'Armario Archivero 4C LN 40654', 'Armario Archivero con 4 cajones para carpetas colgantes. Acompaña nichos laterales', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;1,58&nbsp;cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,90&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,41&nbsp;cm</p>\r\n', 1850000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(491, '13596', 'Nicho Decorativo LN 40637', 'Nicho Decorativo LN 40637', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;0,40 cm</p>\r\n\r\n<p><strong>Alto:</strong> 0,40cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 0,20&nbsp; cm</p>\r\n', 150000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(492, '13597', 'Balcón de Recepción en L', 'Balcón de Recepción en L para tu oficina o negocio práctico y sencillo', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo: </strong>1,40 cm</p>\r\n\r\n<p><strong>Alto</strong>: 1,40 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 1,14 cm</p>\r\n', 2230000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(493, '13598', 'Balcón De Recepción Recto ', 'Balcón de Recepción recto para tu oficina o negocio práctico y sencillo', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo: </strong>1,20 cm</p>\r\n\r\n<p><strong>Alto</strong>: 1,14&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,60&nbsp;cm</p>\r\n', 1110000, 0, 0, NULL, NULL, 11, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(494, '13599', 'Panel Para TV 40mm LN 40127', 'Panel Para TV 40mm LN 40127', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;1,20 cm</p>\r\n\r\n<p><strong>Alto:</strong>&nbsp;1,35 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 0,4&nbsp; cm</p>\r\n', 535000, 0, 0, NULL, NULL, 11, 3, 0, 0, 0, 1, NULL, NULL, ''),
(496, 'ATC1560/9045', 'Mesa en L ATC1560 - 9045', 'Moderna, robusta, buen diseño especial para montar en una oficina con su estilo en L minimalista', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo</strong>: 1,50 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;1,50&nbsp;cm</p>\r\n\r\n<p><strong>Altura</strong>: 0,72&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 780000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(495, '12102', 'Mesa Recta ATC1560 ', 'Moderna, robusta, buen diseño especial para montar en una oficina con su estilo recto minimalista', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong> 1,50 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,60 cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,72&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 490000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(497, '12103', 'Mesa Auxiliar ATC9045', 'Complemento L , moderna, robusta, buen diseño especial para montar en una oficina con su estilo recto minimalista', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo</strong>: 90&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:</strong>75&nbsp;cm</p>\r\n\r\n<p><strong>Altura</strong>: 45&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 290000, 0, 0, NULL, NULL, 16, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(498, '14176', 'Mesa Recta COE1260', 'Mesa Recta para oficinas y home office, compacta, material de primera calidad', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;1,20 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,72&nbsp;cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,60&nbsp;cm</p>\r\n', 0, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(499, '14179', 'Armario Bajo Credenza COE1273', 'Armario Bajo Credenza para oficinas y home office, compacta, material de primera calidad', '<p><strong>Medidas: </strong></p>\r\n\r\n<p><strong>Alto: </strong>1,20cm</p>\r\n\r\n<p><strong>Largo: </strong>0,75 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>0,45 cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 740000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(500, 'COE1560', 'Mesa Recta COE1560', 'Mesa Recta para oficinas y home office, compacta, material de primera calidad', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;1,50 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,75&nbsp;cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,60&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 490000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(501, 'COE1560/9045', 'Mesa en L COE1560-9045', 'Mesa en L especial para trabajos en oficinas o Home Office', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo</strong>: 1,50 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;1,50&nbsp;cm</p>\r\n\r\n<p><strong>Altura</strong>: 0,72&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 780000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(502, 'COE1260-9045', 'Mesa en L COE1260-9045', 'Mesa en L especial para trabajos en oficinas o Home Office', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo</strong>: 1,20 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;1,50&nbsp;cm</p>\r\n\r\n<p><strong>Altura</strong>: 0,72&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 720000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(503, '14187', 'Mesa Recta 2C COE1570', 'Mesa Recta 2C  especial para trabajos en oficinas o Home Office', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo</strong>: 1,72&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,74 cm</p>\r\n\r\n<p><strong>Altura</strong>: 0,65&nbsp;cm</p>\r\n', 1185000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(504, '14188', 'Mesa en L 2C COE1716', 'Mesa en L especial para trabajos en oficinas o Home Office', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo</strong>: 1,70&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad: </strong>0,74<strong>&nbsp;</strong>cm</p>\r\n\r\n<p><strong>Altura</strong>: 1,60&nbsp;cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1490000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(505, '14189', 'Mesa de Reunión COE2090', 'Super compacta mesa de reunión COE2090, para reuniones ', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;2,00 cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp; 0,74&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:&nbsp;</strong>0,90 cm</p>\r\n', 0, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(506, '14186', 'Cajonero Fijo 2C COE3340', 'Cajonero Fijo con llave para guardar documentos y papeles importantes ', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo: </strong>0,33 cm</p>\r\n\r\n<p><strong>Alto:</strong> 0,30 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 0,40 cm</p>\r\n\r\n<p>&nbsp;</p>\r\n', 200000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(507, '14183', 'Archivo 4C COE4613', 'Archivo 4 cajones con llave ', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo</strong>: 0,46 cm</p>\r\n\r\n<p><strong>Alto:&nbsp;</strong>1,26 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 0,45 cm</p>\r\n', 910000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(508, '14185', 'Cajonero Móvil 4C COE4641', 'Cajonero Móvil 4 Cajones y llave', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;0,46 cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,67 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,40 cm</p>\r\n', 570000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(509, '14184', 'Cajonero Móvil 3C COE4640', 'Cajonero móvil con 2 cajones normales con llaves y 1 para carpetas colgantes ', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;0,46&nbsp;cm</p>\r\n\r\n<p><strong>Alto:</strong>&nbsp;0,67&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,40 cm</p>\r\n', 570000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(510, '14181', 'Armario Alto 2P COE8016', 'Armario Alto 2 puertas para guardar todo los artículos y papeleos de la oficina', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Alto: </strong>0,80 cm</p>\r\n\r\n<p><strong>Largo:</strong>1,60 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>0<strong>,</strong>45 cm</p>\r\n', 930000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(511, '14182', 'Armario Alto Mixto COE8017', 'Armario Alto para oficinas corporativas y Home Office', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Alto: </strong>0<strong>,</strong>80 cm</p>\r\n\r\n<p><strong>Largo:</strong>1,60 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 0<strong>,</strong>45 cm</p>\r\n', 850000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(512, '14180', 'Armario Bajo 2P COE8073', 'Elegante y super útil  armario bajo', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Alto:</strong> 0,80 cm</p>\r\n\r\n<p><strong>Largo:&nbsp; </strong>0,75 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>0,45 cm</p>\r\n', 550000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(513, '14178', 'Mesa Auxiliar COE9045', 'Mesa Complemento de Escritorio COE9045', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo</strong>: 90&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:</strong>75&nbsp;cm</p>\r\n\r\n<p><strong>Altura</strong>: 45&nbsp;cm</p>\r\n', 290000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(514, '002581', 'Sofá Polly 1L Negro', 'Sofa Polly 1 Lugar Negro', '<p><strong>Medidas:<br />\r\nLargo:</strong> 0,62</p>\r\n\r\n<p><strong>Profundidad: </strong>0,82</p>\r\n\r\n<p><strong>Altura:</strong> 0,82</p>\r\n\r\n<p><strong>Cuerina:</strong></p>\r\n\r\n<p>Negro</p>\r\n', 0, 0, 0, NULL, NULL, 16, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(515, '002702', 'Sofá Bia Negro  1 L', 'Sofá Bia Negro 1L', '<p><strong>Medidas:<br />\r\nLargo:</strong>&nbsp;0,78</p>\r\n\r\n<p><strong>Profundidad: </strong>0,78</p>\r\n\r\n<p><strong>Altura:</strong> 0,72</p>\r\n\r\n<p><strong>Color:</strong></p>\r\n\r\n<p>Negro</p>\r\n', 0, 0, 0, NULL, NULL, 16, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(516, '002700', 'Sofá Polly 2L Negro', 'Sofá Polly 2 Lugares Negro', '<p><strong>Medidas:<br />\r\nLargo:</strong> 1,02&nbsp;</p>\r\n\r\n<p><strong>Profundidad: </strong>0,82</p>\r\n\r\n<p><strong>Altura:</strong> 0,82</p>\r\n\r\n<p><strong>Cuerina:</strong></p>\r\n\r\n<p>Negro</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 16, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(517, '10927', 'Sofá Day 1L', 'Sofá Day 1 Lugar', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong> 0.92<br />\r\n<strong>Profundidad:</strong> 0,75<br />\r\n<strong>Altura:</strong> 0,72</p>\r\n', 0, 0, 0, NULL, NULL, 16, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(518, '10928', 'Sofá Day 2 L', 'Sofá Day 2 L', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong> 1.50<br />\r\n<strong>Profundidad:</strong> 0,75<br />\r\n<strong>Altura:</strong> 0,72</p>\r\n', 0, 0, 0, NULL, NULL, 16, 7, 0, 0, NULL, 1, NULL, NULL, ''),
(519, '10929', 'Sofá Day 3L', 'Sofá Day 3 Lugares', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;2,13<br />\r\n<strong>Profundidad:</strong> 0,75<br />\r\n<strong>Altura:</strong> 0,72</p>\r\n', 0, 0, 0, NULL, NULL, 16, 7, 0, 0, NULL, 1, NULL, NULL, ''),
(520, '08864', 'Longarina Slim 3 L', 'Longarina Slim 3 Lugares', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo</strong>: 1,54</p>\r\n\r\n<p><strong>Profundidad:</strong> 0,57</p>\r\n\r\n<p><strong>Alto</strong>: 0,88</p>\r\n', 0, 0, 0, NULL, NULL, 5, 7, 0, 0, NULL, 1, NULL, NULL, ''),
(521, '12679', 'Longarina COE 3L', 'Longarina COE 3L', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo: </strong>1,85</p>\r\n\r\n<p><strong>Profundidad: </strong>0,62</p>\r\n\r\n<p><strong>Altura:</strong> 0,77</p>\r\n', 0, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(522, '13565', 'Longarina Beezi 3L Negro', 'Longarina Beezi 3L Negro', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo: </strong>1,62<br />\r\n<strong>Profundidad: </strong>0,55<br />\r\n<strong>Altura:</strong> 0,85</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 17, 22, 0, 0, NULL, 1, NULL, NULL, ''),
(523, '13564', 'Longarina Beezi 3L Cromado', 'Longarina BEEZI 3L Cromado', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:&nbsp;</strong>1,62<br />\r\n<strong>Profundidad:&nbsp;</strong>0,55<br />\r\n<strong>Altura:</strong>&nbsp;0,85</p>\r\n', 0, 0, 0, NULL, NULL, 17, 22, 0, 0, NULL, 1, NULL, NULL, ''),
(524, '001046', 'Revistero 746', 'Revistero 746', '<p>Revistero para recepci&oacute;n cromado</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(525, '00132', 'Revistero 747', 'Revistero 747', '<p>Revistero para recepci&oacute;n cromado</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(526, '12658', 'Mesa Centro', 'Mesa Centro', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo: </strong>0,60 cm</p>\r\n\r\n<p><strong>Profundidad:</strong> 0,60 cm</p>\r\n\r\n<p><strong>Alltura: </strong>0,60 cm cm</p>\r\n', 0, 0, 0, NULL, NULL, 9, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(527, '09265', 'Start Extra 4003', 'Start Extra 4003', '<p>Asiento y respaldero revestidos en cuerina</p>\r\n\r\n<p>Apoya brazos en PP</p>\r\n\r\n<p>Brazos regulables</p>\r\n\r\n<p>Mecanismo Relax</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base estampada negra</p>\r\n\r\n<p>Capacidad 140 Kg.</p>\r\n\r\n<p><strong>Consultar disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 11, 0, 0, NULL, 1, NULL, NULL, ''),
(528, '13760', 'Flip Light 45503 S/B Cuerina', 'Flip Light sin posa brazos', '<p>Respaldero anatomico en tela microperforado en negro</p>\r\n\r\n<p>Asiento en cuerina</p>\r\n\r\n<p>Respaldero fijo</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base de metal con capa de protecci&oacute;n pl&aacute;stica negra</p>\r\n\r\n<p>Rodizio de 50</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>6 a&ntilde;os de garantia contra defectos de fabricaci&oacute;n&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 17, 0, 0, NULL, 1, NULL, NULL, '45503'),
(529, '13860', 'Flip Light 45503 C/B Tela', 'Flip Light Con posa Brazos', '<p>Respaldero anatomico en tela microperforado en negro</p>\r\n\r\n<p>Asiento en tela&nbsp;</p>\r\n\r\n<p>Respaldero fijo</p>\r\n\r\n<p>Brazos regulables</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base de metal con capa de protecci&oacute;n pl&aacute;stica negra</p>\r\n\r\n<p>Rodizio de 50</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>6 a&ntilde;os de garantia contra defectos de fabricaci&oacute;n&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 17, 0, 0, NULL, 1, NULL, NULL, '43503'),
(530, '13911', 'Way Gamer - Rojo', 'Way Gamer - 19900 Rojo\r\n', '<p>Brazo 4D Cavaletti</p>\r\n\r\n<p>Mecanismo Syncron&nbsp;(Reclinable con trabas)</p>\r\n\r\n<p>Base Nylon</p>\r\n\r\n<p>Regulador de profundidad del asiento</p>\r\n\r\n<p>Ruedas Pu 65mm (Opcional Nylon 65 mm)</p>\r\n\r\n<p>Costuras de color ne&oacute;n</p>\r\n\r\n<p>Apoya cabeza&nbsp;con cinta de ajuste</p>\r\n\r\n<p>Soporte lumbar ajustable</p>\r\n\r\n<p>Consultar disponibilidad de colores</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(531, '002864', 'Sofá Bia Marrón 1L', 'Sofá Bia Marrón 1L', '<p><strong>Medidas:<br />\r\nLargo:</strong>&nbsp;0,78</p>\r\n\r\n<p><strong>Profundidad: </strong>0,78</p>\r\n\r\n<p><strong>Altura:</strong> 0,72</p>\r\n\r\n<p><strong>Color:</strong></p>\r\n\r\n<p>Marr&oacute;n</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 16, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(532, '002611', 'Sofá Polly 1L Marrón', 'Sofá Polly 1L Marrón', '<p><strong>Medidas:<br />\r\nLargo:</strong>&nbsp;0,62</p>\r\n\r\n<p><strong>Profundidad:&nbsp;</strong>0,82</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,82</p>\r\n\r\n<p><strong>Cuerina:</strong></p>\r\n\r\n<p>Marr&oacute;n</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 16, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(533, '002705', 'Sofá Polly 2L Marrón', 'Sofá Polly 2 Lugares Marrón', '<p><strong>Medidas:<br />\r\nLargo:</strong> 1,02&nbsp;</p>\r\n\r\n<p><strong>Profundidad: </strong>0,82</p>\r\n\r\n<p><strong>Altura:</strong> 0,82</p>\r\n\r\n<p><strong>Cuerina:</strong></p>\r\n\r\n<p>Marr&oacute;n</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 16, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(534, '12003', 'Sofá Speed 53534', '', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo: </strong>0,57 cm<br />\r\n<strong>Profundidad:</strong> 0,69 cm<br />\r\n<strong>Alto: </strong>0,87 cm</p>\r\n\r\n<p><strong>Cuerina:</strong></p>\r\n\r\n<p>Marr&oacute;n</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(539, '003124', 'Conjunto Elotoy', 'Conjunto Elotoy', '<p>Conjunto infantil que ayuda a aprender, ense&ntilde;ar, estimular y compartir</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(540, '003121', 'Conjunto Elotoy', 'Conjunto Elotoy', '<p>Conjunto Elotoy</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(541, '003119', 'Conjunto Elotoy', 'Conjunto Elotoy', '<p>Conjunto infantil que ayuda a aprender, ense&ntilde;ar, estimular y compartir</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(542, '003122', 'Conjunto Elotoy', 'Conjunto Elotoy', '<p>Conjunto infantil que ayuda a aprender, ense&ntilde;ar, estimular y compartir</p>\r\n', 0, 0, 0, NULL, NULL, 17, 0, 0, 0, NULL, 1, NULL, NULL, ''),
(543, '11783', 'Silla Ergoplax Universitario 11783 45549', 'Silla Ergoplax Universitario 111783/45549', '<p>Silla Ergoplax Universitario</p>\r\n\r\n<p>Asiento y respaldero anat&oacute;mico negro</p>\r\n\r\n<p>Pupitre fijo en pl&aacute;stico negro con porta l&aacute;piz</p>\r\n\r\n<p>Estructura tubular pintado en negro</p>\r\n\r\n<p>Capacidad 110 Kg</p>\r\n\r\n<p><strong>Disponible lado derecho e izquierdo</strong></p>\r\n', 299000, 0, 0, NULL, NULL, 17, 24, 0, 0, NULL, 1, NULL, NULL, '11783'),
(544, '13865', 'Flip Light 45503 C/B Cuerina', 'Flip Light Con posa Brazos', '<p>Respaldero anatomico en tela microperforado en negro</p>\r\n\r\n<p>Asiento en cuerina</p>\r\n\r\n<p>Respaldero fijo</p>\r\n\r\n<p>Brazos regulables</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base de metal con capa de protecci&oacute;n pl&aacute;stica negra</p>\r\n\r\n<p>Rodizio de 50</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>6 a&ntilde;os de garantia contra defectos de fabricaci&oacute;n&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 17, 0, 0, NULL, 1, NULL, NULL, '43503'),
(551, '13759', 'Flip Light 45503 S/B Tela', 'Flip Light sin posa brazos', '<p>Respaldero anatomico en tela microperforado en negro</p>\r\n\r\n<p>Asiento en tela</p>\r\n\r\n<p>Respaldero fijo</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base de metal con capa de protecci&oacute;n pl&aacute;stica negra</p>\r\n\r\n<p>Rodizio de 50</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>6 a&ntilde;os de garantia contra defectos de fabricaci&oacute;n&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 17, 0, 0, NULL, 1, NULL, NULL, '45503'),
(545, '13864', 'Flip Light 45503 C/B Tela', 'Flip Light Con posa Brazos', '<p>Respaldero anatomico en tela microperforado en negro</p>\r\n\r\n<p>Asiento en tela&nbsp;</p>\r\n\r\n<p>Respaldero fijo</p>\r\n\r\n<p>Brazos regulables</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base de metal con capa de protecci&oacute;n pl&aacute;stica negra</p>\r\n\r\n<p>Rodizio de 50</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>6 a&ntilde;os de garantia contra defectos de fabricaci&oacute;n&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 17, 0, 0, NULL, 1, NULL, NULL, '43503'),
(546, '13859', 'Flip Light 45503 C/B Tela', 'Flip Light Con posa Brazos', '<p>Respaldero anatomico en tela microperforado en negro</p>\r\n\r\n<p>Asiento en tela&nbsp;</p>\r\n\r\n<p>Respaldero fijo</p>\r\n\r\n<p>Brazos regulables</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base de metal con capa de protecci&oacute;n pl&aacute;stica negra</p>\r\n\r\n<p>Rodizio de 50</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>6 a&ntilde;os de garantia contra defectos de fabricaci&oacute;n&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 17, 0, 0, NULL, 1, NULL, NULL, '43503'),
(547, '13861', 'Flip Light 45503 C/B Tela', 'Flip Light Con posa Brazos', '<p>Respaldero anatomico en tela microperforado en negro</p>\r\n\r\n<p>Asiento en tela&nbsp;</p>\r\n\r\n<p>Respaldero fijo</p>\r\n\r\n<p>Brazos regulables</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base de metal con capa de protecci&oacute;n pl&aacute;stica negra</p>\r\n\r\n<p>Rodizio de 50</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>6 a&ntilde;os de garantia contra defectos de fabricaci&oacute;n&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 17, 0, 0, NULL, 1, NULL, NULL, '43503'),
(548, '13862', 'Flip Light 45503 C/B Tela', 'Flip Light Con posa Brazos', '<p>Respaldero anatomico en tela microperforado en negro</p>\r\n\r\n<p>Asiento en tela&nbsp;</p>\r\n\r\n<p>Respaldero fijo</p>\r\n\r\n<p>Brazos regulables</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base de metal con capa de protecci&oacute;n pl&aacute;stica negra</p>\r\n\r\n<p>Rodizio de 50</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>6 a&ntilde;os de garantia contra defectos de fabricaci&oacute;n&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 17, 0, 0, NULL, 1, NULL, NULL, '43503'),
(549, '13863', 'Flip Light 45503 C/B Tela', 'Flip Light Con posa Brazos', '<p>Respaldero anatomico en tela microperforado en negro</p>\r\n\r\n<p>Asiento en tela&nbsp;</p>\r\n\r\n<p>Respaldero fijo</p>\r\n\r\n<p>Brazos regulables</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base de metal con capa de protecci&oacute;n pl&aacute;stica negra</p>\r\n\r\n<p>Rodizio de 50</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>6 a&ntilde;os de garantia contra defectos de fabricaci&oacute;n&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 17, 0, 0, NULL, 1, NULL, NULL, '43503'),
(550, '13883', 'Flip Light Con posa Brazos', 'Flip Light C/B Tela', '<p>Respaldero anatomico en tela microperforado en negro</p>\r\n\r\n<p>Asiento en tela&nbsp;</p>\r\n\r\n<p>Respaldero fijo</p>\r\n\r\n<p>Brazos regulables</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base de metal con capa de protecci&oacute;n pl&aacute;stica negra</p>\r\n\r\n<p>Rodizio de 50</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>6 a&ntilde;os de garantia contra defectos de fabricaci&oacute;n&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 17, 0, 0, NULL, 1, NULL, NULL, '43503'),
(552, '13758', 'Flip Light 45503 S/B Tela', 'Flip Light sin posa brazos', '<p>Respaldero anatomico en tela microperforado en negro</p>\r\n\r\n<p>Asiento en tela</p>\r\n\r\n<p>Respaldero fijo</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base de metal con capa de protecci&oacute;n pl&aacute;stica negra</p>\r\n\r\n<p>Rodizio de 50</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>6 a&ntilde;os de garantia contra defectos de fabricaci&oacute;n&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 17, 0, 0, NULL, 1, NULL, NULL, '45503'),
(553, '13753', 'Flip Light 45503 S/B Tela', 'Flip Light sin posa brazos', '<p>Respaldero anatomico en tela microperforado en negro</p>\r\n\r\n<p>Asiento en tela</p>\r\n\r\n<p>Respaldero fijo</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base de metal con capa de protecci&oacute;n pl&aacute;stica negra</p>\r\n\r\n<p>Rodizio de 50</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>6 a&ntilde;os de garantia contra defectos de fabricaci&oacute;n&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 17, 0, 0, NULL, 1, NULL, NULL, '45503'),
(554, '13754', 'Flip Light 45503 S/B Tela', 'Flip Light sin posa brazos', '<p>Respaldero anatomico en tela microperforado en negro</p>\r\n\r\n<p>Asiento en tela</p>\r\n\r\n<p>Respaldero fijo</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base de metal con capa de protecci&oacute;n pl&aacute;stica negra</p>\r\n\r\n<p>Rodizio de 50</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>6 a&ntilde;os de garantia contra defectos de fabricaci&oacute;n&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 17, 0, 0, NULL, 1, NULL, NULL, '45503'),
(555, '13755', 'Flip Light 45503 S/B Tela', 'Flip Light sin posa brazos', '<p>Respaldero anatomico en tela microperforado en negro</p>\r\n\r\n<p>Asiento en tela</p>\r\n\r\n<p>Respaldero fijo</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base de metal con capa de protecci&oacute;n pl&aacute;stica negra</p>\r\n\r\n<p>Rodizio de 50</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>6 a&ntilde;os de garantia contra defectos de fabricaci&oacute;n&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 17, 0, 0, NULL, 1, NULL, NULL, '45503'),
(556, '13756', 'Flip Light 45503 S/B Tela', 'Flip Light sin posa brazos', '<p>Respaldero anatomico en tela microperforado en negro</p>\r\n\r\n<p>Asiento en tela</p>\r\n\r\n<p>Respaldero fijo</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base de metal con capa de protecci&oacute;n pl&aacute;stica negra</p>\r\n\r\n<p>Rodizio de 50</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>6 a&ntilde;os de garantia contra defectos de fabricaci&oacute;n&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 17, 0, 0, NULL, 1, NULL, NULL, '45503'),
(557, '13757', 'Flip Light 45503 S/B Tela', 'Flip Light sin posa brazos', '<p>Respaldero anatomico en tela microperforado en negro</p>\r\n\r\n<p>Asiento en tela</p>\r\n\r\n<p>Respaldero fijo</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base de metal con capa de protecci&oacute;n pl&aacute;stica negra</p>\r\n\r\n<p>Rodizio de 50</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p>6 a&ntilde;os de garantia contra defectos de fabricaci&oacute;n&nbsp;</p>\r\n', 0, 0, 0, NULL, NULL, 5, 17, 0, 0, NULL, 1, NULL, NULL, '45503'),
(560, '003040', 'Prime Presidente 20102', 'Prime Giratoria Director Extra 20102', '<p>Asiento y respaldero revestidos en cuerina</p>\r\n\r\n<p>Apoya brazos en PP</p>\r\n\r\n<p>Soporte de brazos interligados cromado</p>\r\n\r\n<p>Mecanismo Relax</p>\r\n\r\n<p>Regulaje de altura a gas</p>\r\n\r\n<p>Base estampada cromada</p>\r\n\r\n<p>Capacidad 110 Kg.</p>\r\n\r\n<p><strong>Consultar disponibilidad de colores</strong></p>\r\n', 0, 0, 0, NULL, NULL, 5, 6, 0, 0, NULL, 1, NULL, NULL, '20102'),
(563, '09956', 'Mesa Gerencial 394405', 'Moderna mesa gerencial imponente, robusta, buen diseño especial para montar en una oficina con su estilo L minimalista, con detalles en aluminio', '<p><strong>Modelo 394405</strong></p>\r\n\r\n<p><strong>Largo:</strong> 1,78&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;2,05&nbsp;cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,75&nbsp;cm</p>\r\n', 0, 0, 0, NULL, NULL, 9, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(564, '13240', 'Armario Bajo 2 Puertas 390503', 'Armario Bajo con llaves para guardar documentos y papeles', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;0,80&nbsp;cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp;0,74cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,45 cm</p>\r\n', 0, 0, 0, NULL, NULL, 9, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(565, '08340', 'Mesa de Reunión 394401', 'Mesa de Reunión 394401', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;2,40 cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp; 0,75 cm</p>\r\n\r\n<p><strong>Profundidad:&nbsp;</strong>1,20 cm</p>\r\n', 0, 0, 0, NULL, NULL, 9, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(566, '13159', 'Mesa de Reunión 394402', 'Mesa de Reunión 394402', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;3,12&nbsp;cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp; 0,75 cm</p>\r\n\r\n<p><strong>Profundidad:&nbsp;</strong>1,20 cm</p>\r\n', 0, 0, 0, NULL, NULL, 9, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(567, '09974', 'Mesa de Reunión Tamburato 5746', 'Elegante mesa de Reunión diseño minimalista louro negro con caja de tomada', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;2,00 cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp; 0,76&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:&nbsp;</strong>1,00 cm</p>\r\n', 2305000, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(568, '004411', 'Mesa de Reunión Tamburato 1079', 'Elegante mesa de Reunión diseño minimalista', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;2,00 cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp; 0,76&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:&nbsp;</strong>1,00 cm</p>\r\n', 2170000, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(569, '001344', 'Mesa de Reunión Tamburato 641', 'Elegante mesa de Reunión diseño minimalista', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo:</strong>&nbsp;2,50 cm</p>\r\n\r\n<p><strong>Altura:</strong>&nbsp; 0,76&nbsp;cm</p>\r\n\r\n<p><strong>Profundidad:&nbsp;</strong>1,00 cm</p>\r\n', 2880000, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(570, '09523', 'Mesa Director  2000 Y 37 2402', 'Moderna, robusta, buen diseño especial para montar en una oficina con su estilo recto minimalista', '<p><strong>Medidas:</strong></p>\r\n\r\n<p><strong>Largo</strong>: 2,00 cm</p>\r\n\r\n<p><strong>Profundidad:</strong>&nbsp;0,80 cm</p>\r\n\r\n<p><strong>Altura</strong>: 0,75&nbsp;cm</p>\r\n', 1595000, 0, 0, NULL, NULL, 10, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(571, '12549', 'COEXMA 12549', 'COEXMA Giratoria 12549', '<p>Mecanismo syncron</p>\r\n\r\n<p>Brazos regulables</p>\r\n\r\n<p>Regulaci&oacute;n de altura a gas</p>\r\n\r\n<p>Base alumin&iacute;o</p>\r\n\r\n<p>Respaldero en tela microperforado</p>\r\n\r\n<p>Asiento revestido&nbsp;en tela&nbsp;negro&nbsp;</p>\r\n\r\n<p>Capacidad 110 Kg</p>\r\n', 1230000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(572, '12548', 'COEXMA 12548', 'COEXMA Giratoria 12548', '<p>Mecanismo syncron</p>\r\n\r\n<p>Brazos regulables</p>\r\n\r\n<p>Regulaci&oacute;n de altura a gas</p>\r\n\r\n<p>Base Nylon negro</p>\r\n\r\n<p>Respaldero en tela microperforado</p>\r\n\r\n<p>Asiento revestido&nbsp;en tela&nbsp;negro&nbsp;</p>\r\n\r\n<p>Capacidad 110 Kg</p>\r\n', 1054000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(573, '12555', 'COEXMA 12555', 'COEXMA Giratoria 12555', '<p>Mecanismo syncron excentrico</p>\r\n\r\n<p>Brazos regulables</p>\r\n\r\n<p>Regulaci&oacute;n de altura a gas</p>\r\n\r\n<p>Base Nylon Gris</p>\r\n\r\n<p>Respaldero en tela microperforado Gris</p>\r\n\r\n<p>Asiento revestido&nbsp;en tela&nbsp;</p>\r\n\r\n<p>Capacidad 110 Kg</p>\r\n', 2128000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(574, '12554', 'COEXMA 12554', 'COEXMA Interlocutor 12554', '<p>Estructura pata S negro</p>\r\n\r\n<p>Brazos regulables</p>\r\n\r\n<p>Respaldero en tela microperforado alto</p>\r\n\r\n<p>Apoyo lumbar</p>\r\n\r\n<p>Asiento revestido&nbsp;en tela&nbsp;</p>\r\n\r\n<p>Capacidad 110 Kg</p>\r\n', 710000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(575, '12550', ' COEXMA 12550', 'COEXMA Giratoria 12550', '<p>Mecanismo syncron</p>\r\n\r\n<p>Brazos regulables</p>\r\n\r\n<p>Regulaci&oacute;n de altura a gas</p>\r\n\r\n<p>Base Nyl&oacute;n</p>\r\n\r\n<p>Respaldero en tela microperforado</p>\r\n\r\n<p>Asiento revestido&nbsp;en tela&nbsp;negro&nbsp;</p>\r\n\r\n<p>Capacidad 110 Kg</p>\r\n', 969000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(576, '13194', 'COEXMA 13194', 'COEXMA 13194', '<p>Asiento y respaldo en tela, grosor&nbsp;de la espuma del asiento de 6cm,&nbsp;</p>\r\n\r\n<p>estructura negra con pintura ep&oacute;xi.</p>\r\n\r\n<p>Color: Tela negro c/ puntos dorados</p>\r\n\r\n<p>Capacidad 110 Kg</p>\r\n\r\n<p>Apilable</p>\r\n', 180000, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(577, '11033', 'Mesa COEXMA Base Negra', 'Mesa COEXMA Base Negra', '<p><strong>Altura: </strong>0,75 cm</p>\r\n\r\n<p><strong>Profundidad: </strong>0,70 cm</p>\r\n\r\n<p><strong>Largo</strong>: 0,70 cm</p>\r\n\r\n<p><strong>Tampo a elecci&oacute;n</strong></p>\r\n\r\n<p><strong>Base negra</strong></p>\r\n', 0, 0, 0, NULL, NULL, 16, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(578, '06622', 'Banqueta 14015 con Respaldo', 'Elegante y firme Banqueta para bares y boutiques, desayunador multi uso por su estilo y design', '<p>Elegante y firme Banqueta con estructura negra y asiento revestido en cuerina&nbsp;negro para bares y boutiques, desayunador multi uso por su estilo y design</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(579, '06676', 'Banqueta Fun 14015 Sin Respaldo', 'Elegante y firme Banqueta para bares y boutiques, desayunador multi uso por su estilo y design', '<p>Elegante y firme Banqueta con estructura negra y asiento revestido en cuerina&nbsp;negra para bares y boutiques, desayunador multi uso por su estilo y design</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(580, 'FUN 14020 Madera', 'Banqueta FUN 14020 Madera', 'FUN 14020 Madera', '<p>Elegante y firme Banqueta Spin para bares y boutiques multi uso por su estilo y design</p>\r\n', 0, 0, 0, NULL, NULL, 9, 3, 0, 0, NULL, 0, NULL, NULL, ''),
(581, '09763', 'Banqueta Baja 14015 Sin Respaldo', 'Elegante y firme Banqueta baja para bares y boutiques, desayunador multi uso por su estilo y design', '<p>Elegante y firme Banqueta con estructura negra y asiento revestido en cuerina&nbsp;negro para bares y boutiques, desayunador multi uso por su estilo y design</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(582, '13392', 'Banqueta Baja 14015 Sin Respaldo', 'Elegante y firme Banqueta baja para bares y boutiques, desayunador multi uso por su estilo y design', '<p>Elegante y firme Banqueta con estructura cromado y asiento revestido en cuerina&nbsp;rojo para bares y boutiques, desayunador multi uso por su estilo y design</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(583, '05916', 'Banqueta 14015 con Respaldo', 'Elegante y firme Banqueta para bares y boutiques, desayunador multi uso por su estilo y design', '<p>Elegante y firme Banqueta con estructura croamda y asiento revestido en cuerina&nbsp;negra para bares y boutiques, desayunador multi uso por su estilo y design</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(584, '13496', ' Banqueta 14015 con Respaldo', 'Elegante y firme Banqueta para bares y boutiques, desayunador multi uso por su estilo y design', '<p>Elegante y firme Banqueta con estructura negra y asiento revestido en cuerina&nbsp;rojo para bares y boutiques, desayunador multi uso por su estilo y design</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(585, '14437', 'Banqueta FUN 14020 Estofada', 'Elegante y firme Banqueta baja para bares y boutiques, desayunador multi uso por su estilo y design', '<p>Elegante y firme Banqueta con estructura cromado y asiento revestido en cuerina&nbsp;negro para bares y boutiques, desayunador multi uso por su estilo y design</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(586, '12630', 'Banqueta Baja 14015 Con Respaldo', 'Elegante y firme Banqueta baja para bares y boutiques, desayunador multi uso por su estilo y design', '<p>Elegante y firme Banqueta con estructura cromado y asiento revestido en cuerina&nbsp;rojo para bares y boutiques, desayunador multi uso por su estilo y design</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(587, '005341', 'Banqueta Baja 14015 Con Respaldo', 'Elegante y firme Banqueta baja para bares y boutiques, desayunador multi uso por su estilo y design', '<p>Elegante y firme Banqueta con estructura cromado y asiento revestido en cuerina negro para bares y boutiques, desayunador multi uso por su estilo y design</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(588, '13393', 'Banqueta Baja 14015 Sin Respaldo', 'Elegante y firme Banqueta baja para bares y boutiques, desayunador multi uso por su estilo y design', '<p>Elegante y firme Banqueta con estructura negra y asiento revestido en cuerina rojo para bares y boutiques, desayunador multi uso por su estilo y design</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(589, '07210', 'Banqueta Baja 14015 Sin Respaldo', 'Elegante y firme Banqueta baja para bares y boutiques, desayunador multi uso por su estilo y design', '<p>Elegante y firme Banqueta con estructura cromada y asiento revestido en cuerina negro para bares y boutiques, desayunador multi uso por su estilo y design</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(590, '12375', 'Banqueta Fun 14015 Sin Respaldo', 'Elegante y firme Banqueta para bares y boutiques, desayunador multi uso por su estilo y design', '<p>Elegante y firme Banqueta con estructura negra y asiento revestido en cuerina&nbsp;roja para bares y boutiques, desayunador multi uso por su estilo y design</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 1, NULL, NULL, ''),
(591, '004938', 'Banqueta Fun 14015 Sin Respaldo', 'Elegante y firme Banqueta para bares y boutiques, desayunador multi uso por su estilo y design', '<p>Elegante y firme Banqueta con estructura cromado y asiento revestido en cuerina&nbsp;negro para bares y boutiques, desayunador multi uso por su estilo y design</p>\r\n', 0, 0, 0, NULL, NULL, 5, 3, 0, 0, NULL, 1, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_producto_atributo`
--

CREATE TABLE `tb_producto_atributo` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_atributo` int(11) NOT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_producto_atributo`
--

INSERT INTO `tb_producto_atributo` (`id`, `id_producto`, `id_atributo`, `nombre`, `activo`) VALUES
(1, 35, 4, '4', 1),
(2, 35, 1, '1', 1),
(3, 34, 1, NULL, 1),
(8, 34, 4, NULL, 1),
(9, 471, 1, NULL, 1),
(10, 471, 4, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_producto_atr_valor`
--

CREATE TABLE `tb_producto_atr_valor` (
  `id` int(11) NOT NULL,
  `id_atributo` int(11) NOT NULL,
  `id_atr_valor` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_producto_atr_valor`
--

INSERT INTO `tb_producto_atr_valor` (`id`, `id_atributo`, `id_atr_valor`, `activo`) VALUES
(1, 2, 3, 1),
(2, 1, 8, 1),
(3, 1, 9, 1),
(4, 2, 4, 1),
(5, 2, 1, 1),
(6, 3, 1, 1),
(15, 8, 7, 1),
(14, 8, 6, 1),
(11, 3, 4, 1),
(16, 10, 7, 1),
(17, 9, 3, 1),
(18, 9, 5, 1),
(19, 10, 9, 1),
(20, 9, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_producto_categoria`
--

CREATE TABLE `tb_producto_categoria` (
  `id_producto` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_producto_categoria`
--

INSERT INTO `tb_producto_categoria` (`id_producto`, `id_categoria`) VALUES
(33, 1),
(33, 4),
(33, 166),
(34, 1),
(34, 4),
(34, 140),
(35, 1),
(35, 187),
(36, 1),
(36, 4),
(36, 143),
(38, 1),
(38, 4),
(38, 162),
(39, 1),
(39, 4),
(39, 166),
(40, 1),
(40, 4),
(40, 164),
(41, 1),
(41, 4),
(41, 165),
(42, 1),
(42, 4),
(42, 162),
(43, 1),
(43, 4),
(43, 166),
(45, 2),
(45, 7),
(45, 147),
(46, 2),
(46, 7),
(46, 145),
(47, 2),
(47, 7),
(47, 146),
(48, 2),
(48, 7),
(48, 147),
(49, 2),
(50, 2),
(50, 7),
(50, 149),
(51, 2),
(51, 7),
(51, 150),
(52, 2),
(52, 7),
(52, 151),
(53, 2),
(53, 7),
(54, 2),
(54, 7),
(54, 153),
(55, 1),
(55, 5),
(55, 154),
(56, 1),
(56, 5),
(56, 155),
(57, 1),
(57, 5),
(57, 156),
(58, 1),
(58, 5),
(58, 157),
(59, 1),
(59, 5),
(59, 158),
(60, 1),
(60, 5),
(60, 159),
(61, 1),
(61, 4),
(61, 142),
(62, 1),
(62, 4),
(62, 162),
(63, 1),
(63, 4),
(63, 193),
(63, 194),
(64, 1),
(64, 4),
(64, 164),
(65, 1),
(65, 4),
(65, 166),
(66, 1),
(66, 168),
(66, 186),
(67, 2),
(67, 7),
(67, 136),
(68, 2),
(68, 7),
(68, 170),
(69, 2),
(69, 7),
(69, 136),
(70, 2),
(70, 7),
(70, 136),
(71, 2),
(71, 7),
(71, 136),
(72, 2),
(72, 7),
(72, 136),
(73, 2),
(73, 7),
(73, 145),
(74, 2),
(74, 7),
(74, 136),
(75, 2),
(75, 7),
(75, 136),
(76, 2),
(76, 7),
(76, 136),
(77, 2),
(77, 7),
(77, 136),
(78, 2),
(78, 7),
(78, 145),
(79, 2),
(79, 7),
(79, 145),
(80, 2),
(80, 7),
(80, 145),
(81, 2),
(81, 7),
(81, 145),
(82, 2),
(82, 7),
(82, 145),
(83, 2),
(83, 7),
(83, 145),
(84, 2),
(84, 7),
(84, 145),
(85, 2),
(85, 7),
(85, 145),
(86, 2),
(86, 7),
(86, 145),
(87, 2),
(87, 7),
(87, 145),
(88, 2),
(88, 7),
(88, 145),
(89, 2),
(89, 7),
(89, 145),
(90, 2),
(90, 7),
(90, 145),
(91, 2),
(91, 7),
(91, 145),
(92, 2),
(92, 7),
(92, 145),
(93, 2),
(93, 7),
(93, 145),
(94, 2),
(94, 7),
(94, 145),
(95, 2),
(95, 7),
(95, 145),
(96, 2),
(96, 7),
(96, 146),
(97, 2),
(97, 7),
(97, 146),
(98, 2),
(98, 7),
(98, 146),
(99, 2),
(99, 7),
(99, 146),
(100, 2),
(100, 7),
(100, 146),
(101, 2),
(101, 7),
(101, 146),
(102, 2),
(102, 7),
(102, 146),
(103, 2),
(103, 7),
(103, 146),
(104, 2),
(104, 7),
(104, 146),
(105, 2),
(105, 7),
(105, 146),
(106, 2),
(106, 7),
(106, 146),
(107, 2),
(107, 7),
(107, 146),
(108, 2),
(109, 2),
(109, 7),
(109, 146),
(110, 2),
(110, 7),
(110, 137),
(111, 2),
(111, 7),
(111, 137),
(112, 2),
(112, 7),
(112, 137),
(113, 2),
(113, 7),
(113, 137),
(114, 2),
(114, 7),
(114, 137),
(115, 2),
(115, 7),
(115, 137),
(116, 2),
(116, 7),
(116, 137),
(117, 2),
(117, 7),
(117, 137),
(118, 2),
(118, 7),
(118, 137),
(119, 2),
(119, 7),
(119, 137),
(120, 2),
(120, 7),
(120, 137),
(121, 2),
(121, 7),
(121, 137),
(122, 2),
(122, 7),
(122, 137),
(123, 2),
(123, 7),
(123, 137),
(124, 2),
(124, 7),
(124, 147),
(125, 2),
(125, 7),
(125, 147),
(126, 2),
(126, 7),
(126, 147),
(127, 2),
(127, 7),
(127, 147),
(128, 2),
(128, 7),
(128, 147),
(129, 2),
(129, 7),
(129, 147),
(130, 2),
(130, 7),
(130, 147),
(131, 2),
(131, 7),
(131, 147),
(132, 2),
(132, 7),
(132, 147),
(133, 2),
(133, 7),
(133, 147),
(134, 2),
(134, 7),
(134, 147),
(135, 2),
(135, 7),
(135, 147),
(136, 2),
(136, 7),
(136, 147),
(137, 2),
(137, 7),
(137, 147),
(138, 2),
(138, 7),
(138, 147),
(139, 2),
(139, 7),
(139, 147),
(140, 2),
(140, 7),
(140, 147),
(141, 2),
(141, 7),
(141, 147),
(142, 2),
(142, 7),
(142, 147),
(143, 2),
(143, 7),
(143, 147),
(144, 2),
(144, 7),
(144, 147),
(145, 2),
(145, 7),
(145, 147),
(146, 2),
(146, 7),
(146, 147),
(147, 2),
(147, 7),
(147, 147),
(148, 2),
(148, 7),
(148, 147),
(149, 2),
(149, 7),
(149, 147),
(150, 2),
(150, 7),
(150, 147),
(151, 2),
(151, 7),
(151, 147),
(152, 2),
(152, 7),
(152, 147),
(153, 2),
(153, 7),
(153, 147),
(154, 2),
(154, 7),
(154, 147),
(155, 2),
(155, 7),
(155, 147),
(156, 2),
(156, 7),
(156, 147),
(157, 2),
(157, 7),
(157, 147),
(158, 2),
(158, 7),
(158, 147),
(159, 2),
(159, 7),
(159, 147),
(160, 2),
(160, 7),
(160, 147),
(161, 2),
(161, 7),
(161, 147),
(162, 2),
(162, 7),
(162, 147),
(163, 2),
(163, 7),
(163, 147),
(164, 2),
(164, 7),
(164, 147),
(165, 2),
(165, 7),
(165, 147),
(166, 2),
(166, 7),
(166, 147),
(167, 2),
(167, 7),
(167, 147),
(168, 2),
(168, 7),
(168, 147),
(169, 2),
(169, 7),
(169, 147),
(170, 2),
(170, 7),
(170, 147),
(171, 2),
(171, 7),
(171, 147),
(172, 2),
(172, 7),
(172, 147),
(173, 2),
(173, 7),
(173, 147),
(174, 2),
(174, 7),
(174, 147),
(175, 2),
(175, 7),
(175, 147),
(176, 2),
(176, 7),
(176, 147),
(177, 2),
(177, 7),
(177, 147),
(178, 1),
(178, 4),
(178, 140),
(179, 1),
(179, 4),
(179, 140),
(180, 1),
(180, 4),
(180, 140),
(181, 1),
(181, 4),
(181, 140),
(182, 1),
(182, 4),
(182, 166),
(183, 1),
(183, 4),
(183, 141),
(184, 1),
(184, 4),
(185, 1),
(185, 6),
(185, 186),
(186, 1),
(186, 4),
(186, 141),
(187, 1),
(187, 4),
(187, 166),
(188, 1),
(188, 4),
(188, 166),
(189, 1),
(189, 4),
(189, 166),
(190, 1),
(190, 4),
(190, 166),
(191, 1),
(191, 4),
(191, 166),
(192, 1),
(192, 4),
(192, 166),
(193, 1),
(193, 4),
(193, 166),
(194, 1),
(194, 4),
(194, 166),
(195, 1),
(195, 4),
(195, 166),
(196, 1),
(196, 4),
(196, 166),
(197, 1),
(197, 4),
(197, 166),
(198, 1),
(198, 4),
(198, 141),
(199, 1),
(199, 4),
(199, 141),
(200, 1),
(200, 4),
(200, 141),
(201, 1),
(201, 4),
(201, 141),
(202, 1),
(202, 4),
(202, 162),
(203, 1),
(203, 4),
(203, 162),
(204, 1),
(204, 4),
(204, 162),
(205, 1),
(205, 4),
(205, 166),
(206, 1),
(206, 4),
(206, 166),
(207, 1),
(207, 4),
(207, 166),
(208, 1),
(208, 4),
(208, 166),
(209, 1),
(209, 4),
(209, 166),
(210, 1),
(210, 4),
(210, 166),
(211, 1),
(211, 4),
(211, 166),
(212, 1),
(212, 4),
(212, 166),
(213, 1),
(213, 4),
(213, 162),
(214, 1),
(214, 4),
(214, 166),
(215, 1),
(215, 4),
(215, 166),
(216, 1),
(216, 4),
(216, 166),
(217, 1),
(217, 4),
(217, 166),
(218, 1),
(218, 4),
(218, 166),
(219, 1),
(219, 4),
(219, 166),
(220, 1),
(220, 4),
(220, 166),
(221, 1),
(221, 187),
(222, 1),
(222, 4),
(222, 142),
(223, 1),
(223, 4),
(223, 142),
(224, 1),
(224, 4),
(224, 142),
(225, 1),
(225, 4),
(225, 142),
(226, 1),
(226, 4),
(226, 164),
(227, 1),
(227, 4),
(227, 164),
(228, 1),
(228, 4),
(228, 164),
(229, 1),
(229, 4),
(229, 164),
(230, 1),
(230, 4),
(230, 164),
(231, 1),
(231, 4),
(231, 164),
(232, 1),
(232, 4),
(232, 164),
(233, 1),
(233, 4),
(233, 164),
(234, 1),
(234, 4),
(234, 193),
(234, 194),
(235, 1),
(235, 4),
(235, 163),
(236, 1),
(236, 4),
(236, 163),
(237, 1),
(237, 168),
(238, 1),
(238, 4),
(238, 165),
(239, 1),
(239, 4),
(239, 165),
(240, 1),
(240, 4),
(240, 166),
(241, 1),
(241, 4),
(241, 166),
(242, 1),
(242, 4),
(242, 166),
(243, 1),
(243, 4),
(243, 166),
(244, 1),
(244, 4),
(244, 166),
(245, 1),
(245, 4),
(245, 166),
(246, 1),
(246, 4),
(246, 166),
(247, 1),
(247, 4),
(247, 166),
(248, 1),
(248, 4),
(248, 166),
(249, 1),
(249, 4),
(249, 166),
(250, 1),
(250, 4),
(250, 166),
(251, 1),
(251, 4),
(251, 166),
(252, 1),
(252, 4),
(252, 166),
(253, 1),
(253, 4),
(253, 166),
(254, 1),
(254, 4),
(254, 165),
(255, 1),
(255, 4),
(255, 165),
(256, 1),
(256, 4),
(256, 143),
(257, 1),
(257, 4),
(257, 143),
(258, 1),
(258, 4),
(258, 143),
(259, 1),
(259, 4),
(259, 166),
(260, 1),
(260, 4),
(260, 166),
(261, 1),
(261, 3),
(261, 6),
(261, 183),
(261, 186),
(261, 193),
(262, 1),
(262, 3),
(262, 6),
(262, 183),
(262, 186),
(263, 1),
(263, 6),
(263, 186),
(264, 1),
(264, 6),
(264, 183),
(265, 1),
(265, 6),
(265, 183),
(266, 1),
(266, 3),
(266, 6),
(266, 183),
(266, 186),
(266, 193),
(267, 1),
(267, 6),
(267, 183),
(268, 1),
(268, 3),
(268, 6),
(268, 183),
(268, 186),
(268, 193),
(269, 1),
(269, 6),
(270, 1),
(270, 6),
(271, 1),
(271, 6),
(272, 1),
(272, 6),
(273, 1),
(273, 6),
(274, 1),
(274, 6),
(274, 138),
(275, 1),
(275, 6),
(276, 1),
(276, 6),
(276, 138),
(277, 1),
(277, 6),
(277, 138),
(278, 1),
(278, 4),
(278, 143),
(279, 1),
(279, 4),
(279, 143),
(280, 1),
(280, 6),
(280, 138),
(281, 1),
(281, 6),
(281, 138),
(282, 1),
(282, 6),
(282, 138),
(283, 1),
(283, 6),
(283, 138),
(284, 1),
(284, 6),
(284, 184),
(285, 1),
(285, 3),
(285, 6),
(285, 184),
(285, 186),
(285, 193),
(286, 1),
(286, 3),
(286, 6),
(286, 184),
(286, 186),
(287, 1),
(287, 3),
(287, 4),
(287, 186),
(287, 193),
(288, 1),
(288, 6),
(289, 1),
(289, 4),
(289, 185),
(289, 193),
(290, 1),
(290, 6),
(291, 1),
(291, 6),
(292, 1),
(292, 6),
(293, 1),
(293, 185),
(293, 193),
(294, 1),
(294, 4),
(294, 185),
(294, 193),
(295, 1),
(295, 6),
(296, 1),
(296, 4),
(296, 181),
(296, 193),
(297, 1),
(297, 4),
(297, 181),
(297, 193),
(298, 1),
(298, 181),
(298, 193),
(299, 1),
(299, 4),
(299, 181),
(299, 193),
(300, 1),
(300, 4),
(300, 181),
(300, 193),
(301, 1),
(301, 4),
(301, 181),
(301, 193),
(302, 1),
(302, 4),
(302, 181),
(302, 193),
(303, 1),
(303, 3),
(303, 4),
(303, 181),
(303, 182),
(303, 193),
(304, 1),
(304, 4),
(304, 181),
(304, 193),
(305, 1),
(305, 4),
(305, 144),
(305, 163),
(305, 185),
(305, 193),
(305, 194),
(306, 1),
(306, 4),
(306, 185),
(306, 193),
(307, 1),
(307, 4),
(307, 185),
(307, 193),
(308, 1),
(308, 4),
(308, 185),
(308, 193),
(309, 1),
(309, 4),
(309, 185),
(309, 193),
(310, 1),
(310, 4),
(310, 144),
(310, 185),
(310, 193),
(310, 194),
(311, 1),
(311, 4),
(311, 144),
(311, 163),
(311, 185),
(311, 193),
(311, 194),
(312, 1),
(312, 4),
(312, 193),
(312, 194),
(313, 1),
(313, 4),
(313, 193),
(313, 194),
(314, 1),
(314, 4),
(314, 185),
(314, 193),
(315, 1),
(315, 4),
(315, 185),
(315, 193),
(316, 1),
(316, 4),
(316, 185),
(316, 193),
(317, 1),
(317, 4),
(317, 163),
(317, 185),
(317, 193),
(319, 1),
(319, 4),
(319, 185),
(319, 193),
(320, 1),
(320, 3),
(320, 4),
(320, 182),
(320, 190),
(320, 193),
(321, 1),
(321, 3),
(321, 4),
(321, 182),
(322, 1),
(322, 3),
(322, 4),
(322, 182),
(323, 1),
(323, 4),
(323, 185),
(323, 193),
(324, 1),
(324, 3),
(324, 4),
(324, 182),
(325, 1),
(325, 3),
(325, 6),
(325, 182),
(325, 184),
(326, 1),
(326, 3),
(326, 6),
(326, 182),
(326, 184),
(327, 1),
(327, 3),
(327, 4),
(327, 6),
(327, 182),
(327, 184),
(327, 193),
(328, 1),
(328, 3),
(328, 4),
(328, 182),
(329, 1),
(329, 3),
(329, 4),
(329, 182),
(329, 193),
(330, 1),
(331, 1),
(331, 3),
(331, 4),
(331, 182),
(331, 190),
(331, 193),
(332, 1),
(332, 3),
(332, 4),
(332, 182),
(332, 190),
(332, 193),
(333, 1),
(333, 3),
(333, 4),
(333, 182),
(335, 1),
(335, 3),
(335, 4),
(335, 186),
(335, 193),
(336, 1),
(336, 3),
(336, 4),
(336, 186),
(336, 193),
(337, 1),
(337, 3),
(337, 4),
(337, 186),
(337, 193),
(338, 1),
(338, 3),
(338, 4),
(338, 186),
(338, 193),
(339, 1),
(339, 3),
(339, 4),
(339, 186),
(339, 193),
(340, 1),
(340, 3),
(340, 4),
(340, 186),
(340, 193),
(341, 1),
(341, 3),
(341, 4),
(341, 186),
(342, 1),
(342, 3),
(342, 4),
(342, 186),
(342, 193),
(343, 1),
(343, 3),
(343, 4),
(343, 186),
(343, 193),
(344, 1),
(344, 3),
(344, 4),
(344, 186),
(344, 193),
(345, 1),
(345, 3),
(345, 4),
(345, 186),
(345, 193),
(346, 1),
(346, 3),
(346, 4),
(346, 186),
(346, 193),
(347, 1),
(347, 3),
(347, 4),
(347, 186),
(347, 193),
(348, 1),
(348, 3),
(348, 4),
(348, 186),
(348, 193),
(349, 1),
(349, 3),
(349, 4),
(349, 186),
(349, 193),
(350, 1),
(350, 3),
(350, 4),
(350, 186),
(350, 193),
(351, 1),
(351, 3),
(351, 4),
(351, 186),
(351, 193),
(352, 1),
(352, 3),
(352, 4),
(352, 186),
(352, 193),
(353, 1),
(353, 3),
(353, 4),
(353, 186),
(353, 193),
(354, 1),
(354, 3),
(354, 4),
(354, 186),
(354, 193),
(355, 1),
(355, 3),
(355, 4),
(355, 186),
(355, 193),
(356, 1),
(356, 3),
(356, 4),
(356, 186),
(357, 1),
(357, 3),
(357, 4),
(357, 186),
(357, 193),
(358, 1),
(358, 3),
(358, 186),
(358, 193),
(359, 1),
(359, 3),
(359, 186),
(359, 193),
(360, 1),
(360, 3),
(360, 4),
(360, 186),
(360, 193),
(361, 1),
(361, 3),
(361, 4),
(361, 186),
(362, 1),
(362, 3),
(362, 4),
(362, 186),
(363, 1),
(363, 3),
(363, 4),
(363, 186),
(364, 1),
(364, 3),
(364, 4),
(364, 186),
(364, 193),
(365, 1),
(365, 3),
(365, 4),
(365, 186),
(365, 193),
(366, 1),
(366, 3),
(366, 4),
(366, 186),
(366, 193),
(368, 1),
(368, 3),
(368, 4),
(368, 186),
(368, 193),
(370, 1),
(370, 3),
(370, 4),
(370, 186),
(370, 193),
(371, 1),
(371, 3),
(371, 186),
(372, 1),
(372, 3),
(372, 4),
(372, 186),
(372, 193),
(373, 1),
(373, 3),
(373, 4),
(373, 186),
(373, 193),
(374, 1),
(374, 3),
(374, 4),
(374, 186),
(374, 193),
(375, 1),
(375, 3),
(375, 4),
(375, 186),
(375, 193),
(376, 1),
(376, 3),
(376, 4),
(376, 186),
(377, 1),
(377, 3),
(377, 4),
(377, 186),
(378, 1),
(378, 3),
(378, 4),
(378, 186),
(378, 193),
(379, 1),
(379, 3),
(379, 4),
(379, 186),
(379, 193),
(380, 1),
(380, 3),
(380, 4),
(380, 186),
(380, 193),
(381, 1),
(381, 3),
(381, 4),
(381, 186),
(381, 193),
(382, 1),
(382, 3),
(382, 4),
(382, 186),
(382, 193),
(383, 1),
(383, 3),
(383, 4),
(383, 186),
(383, 193),
(384, 1),
(384, 3),
(384, 4),
(384, 186),
(385, 1),
(385, 3),
(385, 4),
(385, 186),
(385, 193),
(386, 1),
(386, 3),
(386, 4),
(386, 186),
(386, 193),
(387, 1),
(387, 3),
(387, 4),
(387, 186),
(387, 193),
(388, 1),
(388, 4),
(388, 166),
(389, 1),
(389, 4),
(389, 166),
(390, 1),
(390, 3),
(390, 4),
(390, 182),
(390, 193),
(391, 1),
(391, 3),
(391, 4),
(391, 182),
(391, 193),
(392, 1),
(392, 3),
(392, 4),
(392, 193),
(393, 1),
(393, 3),
(393, 4),
(393, 182),
(393, 190),
(393, 193),
(394, 1),
(394, 3),
(394, 4),
(394, 182),
(394, 190),
(395, 1),
(395, 3),
(395, 4),
(396, 1),
(396, 3),
(396, 4),
(397, 1),
(397, 3),
(397, 4),
(397, 193),
(398, 1),
(398, 3),
(398, 4),
(398, 190),
(398, 193),
(399, 1),
(399, 3),
(399, 4),
(399, 190),
(399, 193),
(400, 1),
(400, 3),
(400, 4),
(401, 1),
(401, 3),
(401, 4),
(401, 190),
(402, 1),
(402, 3),
(402, 4),
(403, 1),
(403, 3),
(403, 4),
(404, 1),
(404, 3),
(404, 4),
(406, 1),
(406, 3),
(406, 4),
(407, 1),
(407, 3),
(407, 4),
(407, 190),
(407, 193),
(408, 1),
(408, 3),
(408, 4),
(408, 193),
(409, 1),
(409, 3),
(409, 4),
(409, 193),
(410, 1),
(410, 3),
(410, 4),
(410, 193),
(411, 1),
(411, 3),
(411, 4),
(411, 190),
(411, 193),
(413, 1),
(413, 3),
(413, 4),
(413, 190),
(413, 193),
(414, 1),
(414, 3),
(414, 4),
(414, 190),
(414, 193),
(415, 1),
(415, 3),
(415, 4),
(415, 182),
(415, 193),
(416, 1),
(416, 3),
(416, 4),
(416, 182),
(416, 190),
(416, 193),
(417, 1),
(417, 3),
(417, 4),
(417, 190),
(418, 2),
(418, 7),
(418, 136),
(419, 2),
(419, 7),
(419, 147),
(420, 2),
(420, 7),
(420, 147),
(421, 2),
(421, 7),
(421, 148),
(422, 2),
(422, 7),
(422, 148),
(423, 2),
(423, 7),
(423, 148),
(424, 2),
(424, 7),
(424, 148),
(425, 2),
(425, 7),
(425, 148),
(426, 2),
(426, 7),
(426, 148),
(427, 2),
(427, 7),
(427, 148),
(428, 2),
(428, 7),
(428, 148),
(429, 2),
(429, 7),
(429, 148),
(430, 2),
(430, 7),
(430, 148),
(431, 2),
(431, 7),
(431, 148),
(432, 2),
(432, 7),
(432, 148),
(433, 2),
(433, 7),
(433, 148),
(434, 2),
(434, 7),
(434, 148),
(435, 2),
(435, 7),
(435, 148),
(436, 2),
(436, 7),
(436, 148),
(437, 2),
(437, 7),
(437, 148),
(438, 2),
(438, 7),
(438, 148),
(439, 2),
(439, 7),
(439, 148),
(440, 2),
(440, 7),
(440, 148),
(441, 2),
(441, 7),
(441, 148),
(442, 2),
(442, 7),
(442, 148),
(443, 2),
(443, 7),
(443, 148),
(444, 2),
(444, 7),
(444, 149),
(445, 2),
(445, 7),
(445, 149),
(446, 2),
(446, 7),
(446, 149),
(447, 2),
(447, 7),
(447, 149),
(448, 2),
(448, 7),
(448, 149),
(449, 2),
(449, 7),
(449, 150),
(450, 2),
(450, 7),
(450, 151),
(451, 2),
(451, 7),
(451, 151),
(452, 2),
(452, 7),
(452, 153),
(453, 2),
(453, 7),
(453, 153),
(454, 2),
(454, 7),
(454, 153),
(455, 2),
(455, 7),
(455, 153),
(456, 2),
(456, 7),
(456, 153),
(457, 2),
(457, 7),
(457, 153),
(458, 1),
(458, 4),
(458, 140),
(459, 1),
(459, 3),
(459, 4),
(459, 182),
(460, 1),
(462, 1),
(462, 3),
(462, 4),
(462, 182),
(462, 190),
(462, 193),
(463, 1),
(463, 6),
(463, 138),
(464, 1),
(464, 6),
(464, 184),
(465, 1),
(465, 4),
(465, 164),
(466, 1),
(466, 4),
(466, 164),
(467, 1),
(471, 1),
(471, 6),
(471, 183),
(472, 1),
(472, 4),
(472, 165),
(473, 1),
(473, 4),
(473, 165),
(474, 1),
(474, 4),
(474, 165),
(475, 1),
(475, 4),
(475, 165),
(476, 1),
(476, 4),
(476, 165),
(477, 1),
(477, 4),
(477, 165),
(478, 1),
(478, 4),
(478, 143),
(479, 1),
(479, 4),
(479, 143),
(480, 1),
(480, 4),
(480, 143),
(481, 1),
(481, 4),
(481, 162),
(482, 1),
(482, 4),
(482, 162),
(483, 1),
(483, 4),
(483, 162),
(484, 1),
(484, 4),
(484, 162),
(485, 1),
(485, 4),
(485, 141),
(486, 1),
(486, 4),
(486, 141),
(487, 1),
(487, 4),
(487, 141),
(488, 1),
(488, 4),
(488, 141),
(489, 1),
(489, 4),
(489, 141),
(490, 1),
(490, 4),
(490, 141),
(491, 1),
(491, 4),
(491, 144),
(492, 1),
(492, 4),
(492, 163),
(493, 1),
(493, 4),
(493, 163),
(494, 1),
(494, 4),
(494, 144),
(495, 1),
(495, 4),
(495, 165),
(496, 1),
(496, 4),
(496, 165),
(497, 1),
(497, 4),
(497, 165),
(498, 1),
(498, 4),
(498, 165),
(499, 1),
(499, 4),
(499, 141),
(500, 1),
(500, 4),
(500, 165),
(501, 1),
(501, 4),
(501, 165),
(502, 1),
(502, 4),
(502, 165),
(503, 1),
(503, 4),
(503, 165),
(504, 1),
(504, 4),
(504, 165),
(505, 1),
(505, 4),
(505, 143),
(506, 1),
(506, 4),
(506, 162),
(507, 1),
(507, 4),
(507, 162),
(508, 1),
(508, 4),
(508, 162),
(509, 1),
(509, 4),
(509, 162),
(510, 1),
(510, 4),
(510, 141),
(511, 1),
(511, 4),
(511, 141),
(512, 1),
(512, 4),
(512, 141),
(513, 1),
(513, 4),
(513, 165),
(514, 1),
(514, 4),
(514, 193),
(514, 194),
(515, 1),
(515, 4),
(515, 193),
(515, 194),
(516, 1),
(516, 4),
(516, 193),
(516, 194),
(517, 1),
(517, 193),
(517, 194),
(518, 1),
(518, 193),
(518, 194),
(519, 1),
(519, 193),
(519, 194),
(520, 1),
(520, 185),
(520, 193),
(521, 1),
(521, 185),
(521, 193),
(522, 1),
(522, 185),
(522, 193),
(523, 1),
(523, 185),
(523, 193),
(524, 1),
(524, 4),
(524, 144),
(524, 163),
(525, 1),
(525, 4),
(525, 144),
(525, 163),
(526, 1),
(526, 4),
(526, 163),
(527, 1),
(527, 3),
(527, 186),
(527, 193),
(528, 1),
(528, 3),
(528, 186),
(528, 193),
(529, 1),
(529, 3),
(529, 186),
(529, 193),
(530, 1),
(530, 9),
(530, 193),
(531, 1),
(531, 193),
(531, 194),
(532, 1),
(532, 193),
(532, 194),
(533, 1),
(533, 193),
(533, 194),
(534, 1),
(534, 193),
(534, 194),
(535, 1),
(535, 185),
(535, 193),
(536, 1),
(536, 185),
(536, 193),
(537, 1),
(537, 4),
(537, 144),
(537, 163),
(537, 185),
(537, 193),
(537, 194),
(538, 1),
(538, 181),
(538, 193),
(539, 1),
(539, 181),
(539, 193),
(540, 1),
(540, 181),
(540, 193),
(541, 1),
(541, 181),
(541, 193),
(542, 1),
(542, 181),
(542, 193),
(543, 1),
(543, 3),
(543, 181),
(543, 182),
(543, 193),
(544, 1),
(544, 3),
(544, 186),
(544, 193),
(545, 1),
(545, 3),
(545, 186),
(545, 193),
(546, 1),
(546, 3),
(546, 186),
(546, 193),
(547, 1),
(547, 3),
(547, 186),
(547, 193),
(548, 1),
(548, 3),
(548, 186),
(548, 193),
(549, 1),
(549, 3),
(549, 186),
(549, 193),
(550, 1),
(550, 3),
(550, 186),
(550, 193),
(551, 1),
(551, 3),
(551, 186),
(551, 193),
(552, 1),
(552, 3),
(552, 186),
(552, 193),
(553, 1),
(553, 3),
(553, 186),
(553, 193),
(554, 1),
(554, 3),
(554, 186),
(554, 193),
(555, 1),
(555, 3),
(555, 186),
(555, 193),
(556, 1),
(556, 3),
(556, 186),
(556, 193),
(557, 1),
(557, 3),
(557, 186),
(557, 193),
(560, 1),
(560, 3),
(560, 186),
(560, 193),
(562, 1),
(562, 4),
(562, 165),
(563, 1),
(563, 4),
(563, 165),
(564, 1),
(564, 4),
(564, 141),
(565, 1),
(565, 4),
(565, 143),
(566, 1),
(566, 4),
(566, 143),
(567, 1),
(567, 4),
(567, 166),
(568, 1),
(568, 4),
(568, 166),
(569, 1),
(569, 4),
(569, 166),
(570, 1),
(570, 4),
(570, 166),
(571, 1),
(571, 4),
(571, 166),
(572, 1),
(572, 4),
(572, 166),
(573, 1),
(573, 4),
(573, 166),
(574, 1),
(574, 4),
(574, 166),
(575, 1),
(575, 4),
(575, 166),
(576, 1),
(576, 4),
(576, 166),
(577, 1),
(577, 6),
(577, 138),
(578, 1),
(578, 6),
(578, 183),
(579, 1),
(579, 6),
(579, 183),
(580, 1),
(580, 6),
(580, 183),
(581, 1),
(581, 6),
(581, 183),
(582, 1),
(582, 6),
(582, 183),
(583, 1),
(583, 6),
(583, 183),
(584, 1),
(584, 6),
(584, 183),
(585, 1),
(585, 6),
(585, 183),
(586, 1),
(586, 6),
(586, 183),
(587, 1),
(587, 6),
(587, 183),
(588, 1),
(588, 6),
(588, 183),
(589, 1),
(589, 6),
(589, 183),
(590, 1),
(590, 6),
(590, 183),
(591, 1),
(591, 6),
(591, 183);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_producto_combinacion`
--

CREATE TABLE `tb_producto_combinacion` (
  `id_combinacion` int(11) NOT NULL,
  `id_producto_atr_valor` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_producto_combinacion`
--

INSERT INTO `tb_producto_combinacion` (`id_combinacion`, `id_producto_atr_valor`) VALUES
(1, 2),
(1, 5),
(2, 1),
(2, 2),
(3, 6),
(3, 14),
(4, 16),
(4, 17),
(5, 16),
(5, 18),
(6, 17),
(6, 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_producto_img`
--

CREATE TABLE `tb_producto_img` (
  `id` int(11) NOT NULL,
  `url` varchar(80) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_producto_img`
--

INSERT INTO `tb_producto_img` (`id`, `url`, `id_producto`, `orden`, `activo`) VALUES
(39, 'armario-bajo-con-puertas-5705-60806.jpeg', 33, 1, 1),
(40, 'caja-fuerte-40-77851.jpeg', 34, 2, 1),
(41, 'caja-fuerte-40-40519.jpeg', 34, 1, 1),
(42, 'call-center-simple-98264-26723.jpeg', 35, 1, 1),
(43, 'mesa-en-l-reuniÓn-con-pie-op-de-metal-90116-70162.jpeg', 36, 1, 1),
(44, 'cajonero-fijo-de-2-cajones-mu-30301-66675.jpeg', 38, 1, 1),
(235, 'balcón-de-recepción-tamburato-5774-99467.jpeg', 39, 3, 1),
(233, 'balcón-de-recepción-tamburato-5774-68259.jpeg', 39, 1, 1),
(234, 'balcón-de-recepción-tamburato-5774-50655.jpeg', 39, 2, 1),
(48, 'estante-mÉtalico-5-bandejas-82214.jpeg', 40, 1, 1),
(49, 'mesa-angular-90007-25694.jpeg', 41, 1, 1),
(50, 'cod42-2021-01-28-CAJONERO MÓVIL 3 CAJONES ATC4640 GEBB WORK.jpg', 42, 1, 1),
(51, 'soporte-para-monitor-43292.jpeg', 43, 2, 1),
(52, 'soporte-para-monitor-68600.jpeg', 43, 1, 1),
(53, 'armario-para-panes-apas2000-75751.jpeg', 45, 1, 1),
(54, 'visacooler-frÍos-y-lÁcteos-asfl-3pp-56075.jpeg', 46, 1, 1),
(55, 'cod47-2021-02-18-BALCÓN DE PESAJE LÍNEA PLUS BBP1000.jpg', 47, 1, 1),
(56, 'vitrina-new-panorámica-caja-vnpcx730-34516.jpeg', 48, 1, 1),
(57, 'isla-para-congelados-doble-acción-eip3000-30867.jpeg', 50, 1, 1),
(60, 'check-out-cote2050-38812.jpeg', 51, 1, 1),
(59, 'frutera-central-fcce-24cx-44507.jpeg', 52, 1, 1),
(61, 'licuadora-industrial-basculante-bm-122-(baja-rotación)-82341.jpeg', 53, 1, 1),
(62, 'carrito-para-supermercado-90lts-104-002-22589.jpeg', 54, 1, 1),
(64, 'persianas-horizontales-89493.jpeg', 55, 1, 1),
(65, 'cod56-2021-02-01-PERSIANAS VERTICALES NOBRE.jpg', 56, 1, 1),
(67, 'persianas-verticales-en-tela-61439.jpeg', 57, 1, 1),
(68, 'persianas-roló-61533.jpeg', 58, 1, 1),
(69, 'cod59-2021-02-10-PERSIANAS ROMANAS NOBRE.jpg', 59, 1, 0),
(70, 'persiana-double-visión--19838.jpeg', 60, 1, 1),
(666, 'longarina-flip-43110-94841.jpeg', 315, 1, 1),
(72, 'plataforma-de-trabajo-dupla-pie-painel-98181-43551.jpeg', 61, 1, 1),
(73, 'cod62-2021-01-28-CAJONERO MÓVIL 4 CAJONES ATC4641 GEBB WORK.jpg', 62, 1, 1),
(74, 'cod63-2021-01-29-SOFÁ DE ESPERA BOX 36105 1L CAVALETTI.jpg', 63, 1, 1),
(232, 'estante-metálico-5-bandejas--25472.jpeg', 64, 1, 1),
(76, 'mesa-recta-tamburato-1700-5894--26330.jpeg', 65, 1, 1),
(77, 'amazonas-paraguay-86575.jpeg', 66, 1, 0),
(78, 'amazonas-paraguay-45907.jpeg', 66, 2, 0),
(79, 'amazonas-paraguay-28337.jpeg', 66, 3, 0),
(80, 'amazonas-paraguay-31551.jpeg', 66, 4, 0),
(81, 'amazonas-paraguay-82592.jpeg', 66, 5, 0),
(82, 'amazonas-paraguay-31869.jpeg', 66, 6, 0),
(83, 'amazonas-paraguay-95010.jpeg', 66, 7, 0),
(84, 'amazonas-paraguay-47645.jpeg', 66, 8, 0),
(86, 'amazonas-paraguay-96823.jpeg', 66, 2, 1),
(87, 'amazonas-paraguay-78168.jpeg', 66, 3, 1),
(88, 'amazonas-paraguay-95474.jpeg', 66, 4, 1),
(89, 'amazonas-paraguay-69343.jpeg', 66, 6, 1),
(90, 'cod67-2021-02-18-FABRICADORA DE HIELO MFG75.jpg', 67, 1, 1),
(91, 'cod68-2021-02-18-FABRICADORA DE HIELO MFG150.jpg', 68, 1, 1),
(92, 'cod69-2021-02-18-FABRICADORA DE HIELO MFG50.jpg', 69, 1, 1),
(93, 'cod70-2021-02-18-AUTOSERVICIO PARA CONGELADOS VCCG600S.jpg', 70, 1, 1),
(94, 'cod71-2021-02-18-AUTO SERVICIO FRÍOS Y LÁCTEOS ASFL3000.jpg', 71, 1, 1),
(95, 'cod72-2021-02-18-AUTOSERVICIOS BEBIDAS.jpg', 72, 1, 1),
(96, 'cod73-2021-02-18-VISACOOLER FRÍOS Y LÁCTEOS ASFL-3PP.jpg', 73, 1, 1),
(97, 'autoservicio-fríos-y-lácteos-asfl2000-53311.jpeg', 74, 1, 1),
(101, 'auto-atendimiento-abierto-conveniencia-asac1200-98824.jpeg', 76, 1, 1),
(100, 'autoservicio-fríos-y-lácteos-asfl1240-13913.jpeg', 75, 1, 1),
(103, 'cod77-2021-02-18-AUTO ATENDIMIENTO ABIERTO CONVENIENCIA ASAC900.jpg', 77, 1, 1),
(104, 'cod78-2021-02-18-VISACOOLER MULTI USO VCM400 1.jpg', 78, 1, 1),
(668, 'visacooler-multi-uso-vcm400-96323.jpeg', 78, 2, 1),
(107, 'visa-cooler-multiuso-vcm400-76677.jpeg', 79, 1, 1),
(108, 'visa-cooler-multiuso-vcm400-55928.jpeg', 79, 2, 1),
(109, 'visa-cooler-para-cerveza-puerta-solida-vcc400s-79906.jpeg', 80, 1, 1),
(110, 'visa-cooler-para-cerveza-puerta-solida-vcc600s-14502.jpeg', 81, 1, 1),
(111, 'visa-cooler-para-cerveza-puerta-solida-vcc600s-59751.jpeg', 81, 1, 1),
(112, 'visa-cooler-extra-frio-vcexf1300-78935.jpeg', 82, 1, 1),
(113, 'visa-cooler-extra-frio-vcexf600-60862.jpeg', 83, 1, 1),
(114, 'visa-cooler-extra-frio-vcexf410-94734.jpeg', 84, 1, 1),
(115, 'visa-cooler-multiuso-vmc1300-26610.jpeg', 85, 1, 1),
(116, 'visa-cooler-multiuso-vmc3p-29429.jpeg', 86, 1, 1),
(117, 'visa-cooler-adega-home-wine-230-litros-68011.jpeg', 87, 1, 1),
(118, 'visa-cooler-adega-home-wine-130-litros-96943.jpeg', 88, 1, 1),
(119, 'visa-cooler-adega-home-wine-86-litros-89218.jpeg', 89, 1, 1),
(120, 'visa-cooler-slim-home-beer-puerta-de-vidrio-230l-25193.jpeg', 90, 1, 1),
(121, 'visa-cooler-slim-home-beer-puerta-de-vidrio-130l-36039.jpeg', 91, 1, 1),
(122, 'visa-cooler-slim-home-beer-puerta-de-vidrio-86l-58685.jpeg', 92, 1, 1),
(123, 'visa-cooler-slim-home-beer-puerta-solida-230l-23572.jpeg', 93, 1, 1),
(124, 'visa-cooler-slim-home-beer-puerta-solida-130l-94213.jpeg', 94, 1, 1),
(125, 'visa-cooler-slim-home-beer-puerta-solida-86l-41605.jpeg', 95, 1, 1),
(126, 'balcón-de-pesaje-línea-plus-bbp1000-24030.jpeg', 96, 1, 1),
(128, 'mini-cámara-para-carnes-línea-plus-mcp2800-44899.jpeg', 97, 1, 1),
(129, 'mini-cámara-para-carnes-línea-plus-mcp2800-35441.jpeg', 97, 2, 1),
(130, 'mini-cámara-para-carnes-línea-plus-mcp1800-95335.jpeg', 98, 1, 1),
(131, 'mini-cámara-para-carnes-línea-plus-mcp1800-33838.jpeg', 98, 2, 1),
(132, 'mini-cámara-para-carnes-línea-plus-mcp1350-92964.jpeg', 99, 1, 1),
(133, 'mini-cámara-para-carnes-línea-plus-mcp1350-62542.jpeg', 99, 2, 1),
(134, 'ablandador-de-carne-acie-15-14626.jpeg', 100, 1, 1),
(135, 'moledor-de-carne-mcie-98-82627.jpeg', 101, 1, 1),
(136, 'moledor-de-carne-mcie-22-10599.jpeg', 102, 1, 1),
(137, 'moledor-de-carnes-mcie-10-51730.jpeg', 103, 1, 1),
(138, 'mini-sierra-carnicera-para-carnes-y-cartílagos-con-molino-msbpe180-34829.jpeg', 104, 1, 1),
(139, 'mini-sierra-carnicera-para-carnes-y-cartílagos-msbe-180-92624.jpeg', 105, 1, 1),
(140, 'sierra-carnicera-inox-para-carnes-y-huesos-stie325-86151.jpeg', 106, 1, 1),
(141, 'sierra-carnicera-para-carnes-y-huesos-sbe282-86500.jpeg', 107, 1, 1),
(142, 'embutidor-de-chorizos-73336.jpeg', 108, 1, 1),
(143, 'linea-eap-33615.jpeg', 109, 1, 1),
(144, 'linea-eap-16809.jpeg', 109, 2, 1),
(147, 'armario-para-panes-apas2000-18122.jpeg', 110, 1, 1),
(146, 'amazonas-paraguay-85110.jpeg', 66, 1, 1),
(148, 'armario-para-panes-aptu2000-97464.jpeg', 111, 1, 1),
(149, 'isla-para-panes-aipp2000-14708.jpeg', 112, 1, 1),
(150, 'armario-para-panes-apc2000-29020.jpeg', 113, 1, 1),
(151, 'armario-para-panes-astppg2000-12013.jpeg', 114, 1, 1),
(152, 'armario-para-espetos-apte1000-73506.jpeg', 115, 1, 1),
(153, 'armario-de-defumados-apd1000-84059.jpeg', 116, 1, 1),
(154, 'armario-para-temperos-apt1000-85498.jpeg', 117, 1, 1),
(155, 'armario-para-carbón-apc1000-10183.jpeg', 118, 1, 1),
(156, 'bodega-mixta-para-vinos-aac1000-95520.jpeg', 119, 1, 1),
(157, 'bodega-tonel-para-vino-aab1000-34673.jpeg', 120, 1, 1),
(158, 'isla-para-vinos-aai2000-96890.jpeg', 121, 1, 1),
(159, 'bodega-estante-para-vinos-aap1000-91187.jpeg', 122, 1, 1),
(160, 'bodega-vertical-para-vinos-aav10000-75331.jpeg', 123, 1, 1),
(161, 'vitrina-new-panorámica-caja-vnpcx730-37046.jpeg', 48, 2, 1),
(162, 'vitrina-new-panorámica-estufa-vnpe730-82680.jpeg', 124, 1, 1),
(163, 'vitrina-new-panorámica-estufa-vnpe730-32607.jpeg', 124, 2, 1),
(164, 'vitrina-new-panorámica-seca-vnps1260-49675.jpeg', 125, 1, 1),
(165, 'vitrina-new-panorámica-seca-vnps1260-77627.jpeg', 125, 2, 1),
(166, 'vitrina-new-panorámica-refrigerada-vnprpf1260--25029.jpeg', 126, 1, 1),
(167, 'vitrina-new-panorámica-refrigerada-vnprpf1260--26341.jpeg', 126, 2, 1),
(168, 'horno-turbo-convector-ftde-10--97840.jpeg', 127, 1, 1),
(169, 'horno-turbo-convector-ftde-5-21506.jpeg', 128, 1, 1),
(170, 'horno-turbo-convector-ftde-5-46096.jpeg', 128, 1, 1),
(171, 'horno-turbo-convector-ftdem-5-70611.jpeg', 129, 1, 1),
(172, 'batidora-planetaria-vbp-12-73985.jpeg', 130, 1, 1),
(173, 'batidora-planetaria-vbp-05-48396.jpeg', 131, 1, 1),
(174, 'cámara-de-fermentación-controlada-ac40t-31458.jpeg', 132, 1, 1),
(175, 'cámara-de-fermentación-controlada-ac20t-20247.jpeg', 133, 1, 1),
(176, 'cilindro-laminador-térmico-1004-19469.jpeg', 134, 1, 1),
(177, 'cilindro-laminador-eléctrico-1002--34808.jpeg', 135, 1, 1),
(178, 'molino-de-pan-56319.jpeg', 136, 1, 1),
(179, 'modeladora-de-pan-felipe-y-baguette-mpv-35-74562.jpeg', 137, 1, 1),
(180, 'divisora-de-pan-54826.jpeg', 138, 1, 1),
(181, 'cortador-de-pan-para-sándwich-98233.jpeg', 139, 1, 1),
(182, 'cilindro-laminado-de-mesa-16739.jpeg', 140, 1, 1),
(183, 'cilindro-laminador-de-pie-clvt-50-44438.jpeg', 141, 1, 1),
(184, 'cilindro-laminador-de-pie-clpv-39-28400.jpeg', 142, 1, 1),
(185, 'amasadora-rápida-25kg-64666.jpeg', 143, 1, 1),
(186, 'amasadora-rápida-15kg-69329.jpeg', 144, 1, 1),
(187, 'amasadora-rápida-5kg--33730.jpeg', 145, 1, 1),
(188, 'amasadora-espiral-40kg--39557.jpeg', 146, 1, 1),
(189, 'amasadora-espiral-25kg--91055.jpeg', 147, 1, 1),
(190, 'amasadora-semi-rápida-basculante-25g-14989.jpeg', 148, 1, 1),
(191, 'amasadora-semi-rápida-basculante-5kg-73856.jpeg', 149, 1, 1),
(192, 'vitrina-térmica-1,00mts-new-titatium-33528.jpeg', 150, 1, 1),
(193, 'vitrina-térmica-60cm-new-titatium-69503.jpeg', 151, 1, 1),
(194, 'vitrina-seca-1,00mts-new-titanium-87615.jpeg', 152, 1, 1),
(195, 'vitrina-seca-60cm-new-titanium--77231.jpeg', 153, 1, 1),
(196, 'vitrina-refrigerada-1,50mts-new-titanium-77972.jpeg', 154, 1, 1),
(197, 'vitrina-refrigerada-60cm-new-titanium-24737.jpeg', 155, 1, 1),
(198, 'vitrina-esquinero-línea-titanium-36035.jpeg', 156, 1, 1),
(199, 'vitrina-caja-linea-titanium-68162.jpeg', 157, 1, 1),
(200, 'vitrina-seca-linea-titanium-23196.jpeg', 158, 1, 1),
(201, 'vitrina-refrigerada-linea-titanium-84781.jpeg', 159, 1, 1),
(202, 'vitrina-térmica-linea-titanium-49078.jpeg', 160, 1, 1),
(203, 'vitrina-panorámica-esquinera-vpcv1360-19669.jpeg', 161, 1, 1),
(204, 'vitrina-panorámica-caja-vpcx800-79465.jpeg', 162, 1, 1),
(205, 'vitrina-panoramica-estufa-vpe600-17006.jpeg', 163, 1, 1),
(206, 'vitrina-panorámica-seca-vps1200-60166.jpeg', 164, 1, 1),
(207, 'vitrina-panorámica-refrigerada-vprs1200-62603.jpeg', 165, 1, 1),
(208, 'vitrina-panorámica-doble-placa-fría-vpr2pf1200--21017.jpeg', 166, 1, 1),
(209, 'vitrina-seca-linea-platinium-47118.jpeg', 167, 1, 1),
(210, 'vitrina-refrigerada-linea-platinium--42532.jpeg', 168, 1, 1),
(211, 'vitrina-térmica-linea-platinium--37248.jpeg', 169, 1, 1),
(212, 'vitrina-caja-linea-platinium--36517.jpeg', 170, 1, 1),
(213, 'vitrina-curva-linea-platinium--15232.jpeg', 171, 1, 1),
(214, 'vitrina-refrigerada-linea-show-case-titanium--34203.jpeg', 172, 1, 1),
(215, 'vitrina-seca-linea-show-case-titanium--56534.jpeg', 173, 1, 1),
(216, 'vitrina-térmica-linea-show-case-titanium--44025.jpeg', 174, 1, 1),
(217, 'vitrina-refrigerada-linea-show-case-titanium--74403.jpeg', 175, 1, 1),
(218, 'vitrina-seca-linea-show-case-titanium--34945.jpeg', 176, 1, 1),
(219, 'vitrina-térmica-linea-show-case-titanium--62203.jpeg', 177, 1, 1),
(220, 'caja-fuerte-80-61144.jpeg', 178, 1, 1),
(221, 'caja-fuerte-80-25759.jpeg', 178, 2, 1),
(222, 'caja-fuerte-100-97521.jpeg', 179, 1, 1),
(223, 'caja-fuerte-100-37055.jpeg', 179, 2, 1),
(224, 'caja-fuerte-60-60665.jpeg', 180, 1, 1),
(225, 'cod180-2020-12-17-muebles-de-oficina-caja-fuerte-caja-fuerte-60-coexma-muebles-d', 180, 2, 0),
(226, 'caja-fuerte-60-37020.jpeg', 180, 3, 1),
(227, 'caja-fuerte-120-61902.jpeg', 181, 1, 1),
(228, 'caja-fuerte-120-24581.jpeg', 181, 2, 1),
(229, 'cod182-2021-01-28-ARMARIO 2 PUERTAS 1100 Y37 2002.jpg', 182, 1, 1),
(231, 'cod183-2021-04-07-ARMARIO BAJO CREDENZA 90514 AVANTTI.jpg', 183, 1, 1),
(236, 'aramario-alto-semi-abierto-90528-65334.jpeg', 184, 1, 1),
(237, 'armario-alto-de-2-puertas-62111.jpeg', 186, 1, 1),
(238, 'cod187-2021-01-28-ARMARIO 2 PUERTAS 1100 Y37 2002 ARTANY.jpg', 187, 1, 1),
(239, 'armario-bajo-de-2-puertas-800-y37-2101-99286.jpeg', 187, 2, 1),
(240, 'armario-4-puertas-1400-y37-2109-44925.jpeg', 188, 1, 1),
(241, 'armario-4-puertas-1400-y37-2109-78037.jpeg', 188, 2, 1),
(242, 'armario-4-puertas-1600-y37-2111-91460.jpeg', 189, 1, 1),
(243, 'armario-4-puertas-1600-y37-2111-21667.jpeg', 189, 2, 1),
(244, 'armario-aparador-1600-y37-2104-31649.jpeg', 190, 1, 1),
(245, 'cod191-2021-04-08-RECORTE.jpg', 191, 1, 1),
(246, 'armario-directoria-con-cajones-1800-y37-5713-99179.jpeg', 191, 2, 1),
(248, 'cod192-2021-01-28-ARMARIO 2 PUERTAS 1600 Y37 2204 ARTANY.jpg', 192, 1, 1),
(249, 'cod192-2021-01-28-ARMARIO 2 PUERTAS 1600 Y37 2204 ARTANY 2.jpg', 192, 2, 1),
(250, 'armario-bajo-2-puertas-654-72558.jpeg', 193, 1, 1),
(251, 'armario-bajo-2-puertas-654-38027.jpeg', 193, 2, 1),
(252, 'armario-bajo-con-puertas-5773-64378.jpeg', 194, 1, 1),
(253, 'armario-bajo-con-puertas-5773-93658.jpeg', 194, 2, 1),
(254, 'armario-alto-tamburato-5774-82753.jpeg', 195, 1, 1),
(255, 'armario-alto-tamburato-5774-25500.jpeg', 195, 2, 1),
(257, 'armario-alto-tamburato-con-puertas-corredizas-5780-79492.jpeg', 197, 1, 1),
(258, 'armario-alto-tamburato-con-puertas-corredizas-5780-97299.jpeg', 197, 2, 1),
(260, 'armario-alto-2-puertas-5775---5776-23075.jpeg', 196, 1, 1),
(261, 'armario-alto-2-puertas-5775---5776-51384.jpeg', 196, 2, 1),
(262, 'armario-alto-2-puertas-5775---5776-42473.jpeg', 196, 3, 1),
(263, 'cod198-2021-01-28-ARMARIO BAJO 2 PUERTAS ATC8073 GEBB WORK.jpg', 198, 1, 1),
(264, 'cod198-2021-01-28-ARMARIO BAJO 2 PUERTAS ATC8073 GEBB WORK 2.jpg', 198, 2, 1),
(265, 'armario-bajo-credenza-atc1273--28022.jpeg', 199, 1, 1),
(266, 'armario-bajo-credenza-atc1273--75213.jpeg', 199, 2, 1),
(267, 'armario-alto-semi-abierto-atc8017-53592.jpeg', 200, 1, 1),
(268, 'armario-alto-semi-abierto-atc8017-17579.jpeg', 200, 2, 1),
(269, 'armario-alto-atc8016-98870.jpeg', 201, 1, 1),
(270, 'armario-alto-atc8016-29956.jpeg', 201, 2, 1),
(271, 'cajonero-móvil-de-3-cajones-90732-82839.jpeg', 202, 1, 1),
(272, 'cajonero-móvil-de-4-cajones-90731--75074.jpeg', 203, 1, 1),
(273, 'cajonero-móvil-4-cajones-atc4641-94173.jpeg', 62, 2, 1),
(274, 'cod204-2021-01-28-ARCHIVO DE 4 CAJONES ATC4613 GEBB WORK.jpg', 204, 1, 1),
(275, 'archivo-de-4-cajones-atc4613-62735.jpeg', 204, 2, 1),
(276, 'cajonero-fijo-2-cajones-y37-2610-27344.jpeg', 205, 1, 1),
(277, 'cajonero-fijo-2-cajones-y37-2610-85295.jpeg', 205, 2, 1),
(278, 'cajonero-de-3-cajones--y37-2603--49142.jpeg', 206, 1, 1),
(279, 'cajonero-de-3-cajones-y37-2604-45496.jpeg', 207, 1, 1),
(280, 'cajonero-de-3-cajones-y37-2604-27819.jpeg', 207, 2, 1),
(281, 'archivo-de-4-cajones--y37-2602-73206.jpeg', 208, 1, 1),
(282, 'cajonero-fijo-de-2-cajones-666-25898.jpeg', 209, 1, 1),
(283, 'cajonero-de-3-cajones-649-62043.jpeg', 210, 1, 1),
(284, 'cajonero-de-3-cajones-649-31230.jpeg', 210, 2, 1),
(285, 'cajonero-con-3-cajones-648-71924.jpeg', 211, 1, 1),
(286, 'archivo-de-4-cajones-657-35591.jpeg', 212, 1, 1),
(287, 'archivo-de-4-cajones-657-29088.jpeg', 212, 2, 1),
(288, 'cajonero-fijo-2-cajones-atc3340-85301.jpeg', 213, 1, 1),
(289, 'soporte-para-monitor-64114.jpeg', 214, 1, 1),
(290, 'soporte-para-monitor-33411.jpeg', 214, 2, 1),
(291, 'porta-cpu-5212-48379.jpeg', 215, 1, 1),
(292, 'porta-cpu-5212-46551.jpeg', 215, 2, 1),
(293, 'apoyo-para-pies-5214-85794.jpeg', 216, 1, 1),
(294, 'basurero-ejecutivo-827-21772.jpeg', 217, 1, 1),
(295, 'basurero-ejecutivo-827-93679.jpeg', 217, 2, 1),
(296, 'nicho-ejecutivo-41454.jpeg', 218, 1, 1),
(297, 'nicho-ejecutivo-65295.jpeg', 218, 2, 1),
(298, 'painel-ejecutivo-1043-54203.jpeg', 219, 1, 1),
(299, 'painel-ejecutivo-1043-22727.jpeg', 219, 2, 1),
(300, 'aparador-ejecutivo-1049-68280.jpeg', 220, 1, 1),
(301, 'aparador-ejecutivo-1049-37720.jpeg', 220, 2, 1),
(302, 'call-center-duplo-98266-19637.jpeg', 221, 1, 1),
(304, 'cod222-2021-04-08-plata.jpg', 222, 1, 1),
(939, 'cod222-2021-04-08-plata 2.jpg', 222, 2, 1),
(941, 'Área-de-colaboración-94424.jpeg', 236, 2, 1),
(306, 'cod223-2021-04-08-plata 3.jpg', 223, 1, 1),
(940, 'plataforma-de-trabajo-3982013-67032.jpeg', 223, 2, 1),
(308, 'plataforma-de-trabajo-98225-66208.jpeg', 224, 1, 1),
(309, 'cod225-2021-04-07-PLATAFORMA 1.jpg', 225, 1, 1),
(942, 'cod235-2021-04-08-balcon rojo.jpg', 235, 2, 1),
(312, 'casillero-de-metal-p6--32783.jpeg', 226, 1, 1),
(313, 'casillero-de-metal-p8--14148.jpeg', 227, 1, 1),
(314, 'casillero-de-metal-p12-11163.jpeg', 228, 1, 1),
(315, 'casillero-de-metal-p16-51393.jpeg', 229, 1, 1),
(316, 'casillero-de-metal-p20-21974.jpeg', 230, 1, 1),
(317, 'armario-de-metal--58654.jpeg', 231, 1, 1),
(721, 'armario-de-metal- al18005-27062.jpeg', 465, 1, 1),
(319, 'archivo-de-metal-aql-22002---22003-93942.jpeg', 232, 1, 1),
(320, 'archivo-de-metal-aql-22002-33775.jpeg', 233, 1, 1),
(321, 'cod235-2021-01-29-BALCÓN DE RECEPCIÓN 98272 AVANTTI.jpg', 235, 1, 1),
(328, 'cod236-2021-04-08-BALCON.jpg', 236, 1, 1),
(324, 'sofá-de-espera-box-36105-2l--94726.jpeg', 234, 1, 1),
(325, 'sofá-de-espera-box-36105-2l--27548.jpeg', 234, 2, 1),
(326, 'sofá-de-espera-box-36105-1l--91941.jpeg', 63, 2, 1),
(327, 'sofá-de-espera-box-36105-1l--80973.jpeg', 63, 3, 1),
(329, 'sala-de-reuniones-73071.jpeg', 237, 1, 1),
(330, 'sala-de-reuniones-53852.jpeg', 237, 2, 1),
(331, 'sala-de-reuniones-46966.jpeg', 237, 3, 1),
(332, 'sala-de-reuniones-53457.jpeg', 237, 4, 1),
(333, 'proyectos-para-oficinas,-reuniones-y-sala-de-estar-87751.jpeg', 66, 9, 1),
(334, 'proyectos-para-oficinas,-reuniones-y-sala-de-estar-53665.jpeg', 66, 10, 1),
(335, 'linea-acta-meas-recta-94001--93215.jpeg', 238, 1, 1),
(336, 'mesa-create-90003-y-90004-88896.jpeg', 239, 1, 1),
(337, 'mesa-operacional-1200-y37-2203-86534.jpeg', 240, 1, 1),
(338, 'mesa-operacional-1200-y37-2203-40042.jpeg', 240, 2, 1),
(339, 'mesa-operacional-1400-y37-2204-59520.jpeg', 241, 1, 1),
(943, 'mesa-de-reunión-tamburato-642-44992.jpeg', 568, 1, 1),
(341, 'mesa-dialogo-1400-y-1600-y-37-98478.jpeg', 242, 1, 1),
(342, 'mesa-dialogo-1400-y-1600-y-37-20562.jpeg', 242, 2, 1),
(343, 'mesa-gerencial-1600-y-1800-y-37-12532.jpeg', 243, 1, 1),
(344, 'mesa-gerencial-1600-y-1800-y-37-58064.jpeg', 243, 2, 1),
(345, 'mesa-director--2000-y-37-2402-96922.jpeg', 244, 1, 1),
(347, 'cod245-2021-04-09-mesa.jpg', 245, 1, 1),
(948, 'mesa-director--2000-y-37-2402-60564.jpeg', 570, 1, 1),
(349, 'cod246-2021-01-29-MESA DIRECTOR 2000 Y37 5607 ARTANY.jpg', 246, 1, 1),
(350, 'cod246-2021-01-29-MESA DIRECTOR 2000 Y37 5607 ARTANY 2.jpg', 246, 2, 1),
(351, 'mesa-tamburato--origami-li-ld-68517.jpeg', 247, 1, 1),
(352, 'mesa-tamburato--origami-li-ld-94468.jpeg', 247, 2, 1),
(353, 'mesa-tamburato--origami-li-ld-97938.jpeg', 247, 3, 1),
(354, 'mesa-tamburato-1250-y-1430--40150.jpeg', 248, 1, 1),
(355, 'mesa-tamburato-1250-y-1430--35945.jpeg', 248, 2, 1),
(356, 'mesa-tamburato-1500-1800-96990.jpeg', 249, 1, 1),
(357, 'mesa-tamburato-1500-1800-82377.jpeg', 249, 2, 1),
(358, 'mesa-tamburato-con-vidrio-51426.jpeg', 250, 1, 1),
(359, 'no-image.png', 250, 2, 1),
(360, 'mesa-tamburato-con-cajones-87299.jpeg', 251, 1, 1),
(361, 'mesa-tamburato-con-cajones-91272.jpeg', 251, 2, 1),
(362, 'mesa-tamburato-con-cajones-74722.jpeg', 251, 3, 1),
(363, 'cod252-2021-04-09-luro.jpg', 252, 1, 1),
(364, 'cod252-2021-04-09-louro 3.jpg', 252, 2, 1),
(365, 'cod252-2021-04-09-louro 2.jpg', 252, 3, 1),
(366, 'mesa-director-5741-5761-39979.jpeg', 253, 1, 1),
(367, 'mesa-director-5741-5761-41968.jpeg', 253, 2, 1),
(368, 'mesa-director-5741-5761-75139.jpeg', 253, 3, 1),
(369, 'mesa-en-l-atc1260-atc9145-y-atc1560-atc9145--37613.jpeg', 254, 1, 1),
(370, 'mesa-recta-atc1260-atc1560-88433.jpeg', 255, 1, 1),
(371, 'mesa-de-reunión-2000-90428-92176.jpeg', 256, 1, 1),
(372, 'mesa-de-reunión-oval--90403-63583.jpeg', 257, 1, 1),
(373, 'mesa-de-reunión-redonda-90406-96034.jpeg', 258, 1, 1),
(374, 'cod259-2021-04-08-MESA DE REUNIÓN 2000 Y37 5621 ARTANY 2.jpg', 259, 1, 1),
(375, 'cod259-2021-04-08-MESA DE REUNIÓN 2000 Y37 5621 ARTANY.jpg', 259, 2, 1),
(376, 'mesa-de-reunión-tamburato-5744-61972.jpeg', 260, 1, 1),
(377, 'mesa-de-reunión-tamburato-5744-72846.jpeg', 260, 2, 1),
(378, 'persiana-double-visión--56316.jpeg', 60, 2, 1),
(379, 'persiana-double-visión--43555.jpeg', 60, 3, 1),
(380, 'persiana-double-visión--84240.jpeg', 60, 4, 1),
(381, 'persianas-roló-24420.jpeg', 58, 2, 1),
(382, 'persianas-roló-64875.jpeg', 58, 3, 1),
(383, 'persianas-roló-40189.jpeg', 58, 4, 1),
(384, 'persianas-horizontales-15467.jpeg', 55, 2, 1),
(385, 'persianas-horizontales-14746.jpeg', 55, 3, 1),
(386, 'persianas-horizontales-61963.png', 55, 4, 1),
(387, 'persianas-romanas-66382.jpeg', 59, 3, 1),
(388, 'persianas-romanas-43258.jpeg', 59, 4, 1),
(392, 'persianas-verticales-78352.jpeg', 56, 3, 1),
(389, 'cod56-2021-02-01-PERSIANAS VERTICALES NOBRE 3.jpg', 56, 2, 1),
(390, 'persianas-verticales-en-tela-92826.png', 57, 2, 1),
(391, 'persianas-verticales-en-tela-54896.jpeg', 57, 3, 1),
(393, 'persianas-verticales-54175.jpeg', 56, 4, 1),
(394, 'persianas-verticales-49652.jpeg', 56, 5, 1),
(395, 'banqueta-spin-36802-baja-67282.jpeg', 185, 1, 1),
(396, 'banqueta-spin-36814-29886.jpeg', 261, 1, 1),
(397, 'banqueta-go-34020-82022.jpeg', 262, 1, 1),
(398, 'banqueta-fun-14015-baja-61147.jpeg', 263, 1, 1),
(399, 'cod263-2021-02-01-BANQUETA FUN 14015 BAJA CAVALETTI 2.jpg', 263, 1, 1),
(400, 'banqueta-fun-14015-respaldo-22302.jpeg', 264, 1, 1),
(968, 'banqueta-fun-14015-con-respaldo-90864.jpeg', 264, 2, 1),
(402, 'banqueta-fun-14015-sin-respaldo-41640.jpeg', 265, 1, 1),
(969, 'banqueta-fun-14015-sin-respaldo-23287.jpeg', 265, 2, 1),
(404, 'banqueta-fun-fun-14016-67590.jpeg', 266, 1, 1),
(405, 'banqueta-fun-fun-14016-19870.jpeg', 266, 2, 1),
(406, 'banqueta-fun-14020-estofada-32681.jpeg', 267, 1, 1),
(972, 'banqueta-14015-con-respaldo-29011.jpeg', 583, 1, 1),
(971, 'banqueta-fun-14020-estofada-89852.jpeg', 267, 2, 1),
(409, 'banqueta-fun-14020-madera-92505.jpeg', 268, 1, 1),
(410, 'banqueta-fun-14020-madera-35274.jpeg', 268, 2, 1),
(411, 'banqueta-9009-ca021-48055.jpeg', 269, 1, 1),
(412, 'banqueta-lilian-ca006--83037.jpeg', 270, 1, 1),
(413, 'banqueta-vigo-ca054-77746.jpeg', 271, 1, 1),
(414, 'banqueta-vigo-ca054-40149.jpeg', 271, 2, 1),
(415, 'banqueta-vigo-ca054-25140.jpeg', 271, 3, 1),
(416, 'baqueta-apollo-ca047--13281.jpeg', 272, 1, 1),
(417, 'baqueta-apollo-ca047--90711.jpeg', 272, 2, 1),
(418, 'mesa-rectangular-tratoria-mj023-44099.jpeg', 273, 1, 1),
(419, 'cod274-2021-02-10-MESA CLASSIC PLASNEW 2.jpg', 274, 3, 1),
(420, 'cod274-2021-02-10-MESA CLASSIC PLASNEW 3.jpg', 274, 2, 1),
(421, 'cod274-2021-02-10-MESA CLASSIC PLASNEW 4.jpg', 274, 1, 1),
(422, 'cod274-2021-02-10-MESA CLASSIC PLASNEW.jpg', 274, 4, 1),
(423, 'mesa-cuadrada-tratoria-mj019-29712.jpeg', 275, 1, 1),
(424, 'mesa-pub-redonda-plegable-ba001-38455.jpeg', 276, 1, 1),
(425, 'mesa-pub-redonda-plegable-ba001-11138.jpeg', 276, 2, 1),
(426, 'mesa-pub-redonda-plegable-ba001-96601.jpeg', 276, 3, 1),
(427, 'mesa-bar-izi-redonda-mj037-49057.jpeg', 277, 1, 1),
(428, 'mesa-spin-36805-redonda-56707.jpeg', 278, 1, 1),
(429, 'mesa-spin-36805-cuadrada-33590.jpeg', 279, 1, 1),
(430, 'mesa-bistro-service-48638.jpeg', 280, 1, 1),
(431, 'mesa-coexma-base-cromada-96869.png', 281, 1, 1),
(432, 'mesa-coexma-base-cromada-74538.png', 281, 2, 1),
(433, 'mesa-coexma-base-gris-38748.jpeg', 282, 1, 1),
(434, 'mesa-coexma-base-gris-15319.jpeg', 282, 2, 1),
(435, 'mesa-coexma-46335.jpeg', 283, 1, 1),
(436, 'mesa-coexma-95864.jpeg', 283, 2, 1),
(437, 'mesa-coexma-93919.jpeg', 283, 3, 1),
(438, 'silla-fija-13194-48821.png', 284, 1, 1),
(440, 'silla-joy-4-pies-83596.jpeg', 285, 1, 1),
(965, 'banqueta-fun-14020-madera-63642.jpeg', 580, 1, 1),
(964, 'fun-14015-s.-respaldo-54003.jpeg', 579, 1, 1),
(446, 'cod285-2021-04-09-32.jpg', 285, 2, 1),
(447, 'cod285-2021-04-09-Sin título.jpg', 285, 3, 1),
(963, 'banqueta-fun-14015-respaldo-71830.jpeg', 578, 1, 1),
(449, 'silla-1001-94683.jpeg', 286, 1, 1),
(450, 'silla-colectiva-1003--66893.jpeg', 287, 1, 1),
(451, 'silla-colectiva-1003--68679.jpeg', 287, 2, 1),
(452, 'silla-mobi-ca083-62948.jpeg', 288, 1, 1),
(453, 'silla-sky-con-brazos-ca012--21944.jpeg', 289, 1, 1),
(454, 'silla-sky-con-brazos-ca012--77681.jpeg', 289, 2, 1),
(455, 'silla-lilian-ca129-39872.jpeg', 290, 1, 1),
(456, 'silla-lilian-ca129-69316.jpeg', 290, 2, 1),
(457, 'silla-1001-ca003-72961.jpeg', 291, 1, 1),
(458, 'silla-9009-ca017-86302.jpeg', 292, 1, 1),
(459, 'silla-calcutá-ca107-81489.jpeg', 293, 1, 1),
(460, 'silla-mónaco-con-brazos-ca030-99960.jpeg', 294, 1, 1),
(461, 'silla-mónaco-con-brazos-ca030-45219.jpeg', 294, 2, 1),
(462, 'silla-mónaco-con-brazos-ca030-59999.jpeg', 294, 3, 1),
(463, 'silla-vogel-ca059-62613.jpeg', 295, 1, 1),
(464, 'silla-vogel-ca059-27757.jpeg', 295, 2, 1),
(465, 'silla-vogel-ca059-79153.jpeg', 295, 3, 1),
(466, 'cod296-2021-03-26-conjunto-retangular-adulto-10-4.jpg', 296, 2, 1),
(467, 'cod296-2021-03-26-infan.jpg', 296, 6, 1),
(468, 'cod297-2021-03-26-conjunto-retangular-adulto-12-4.jpg', 297, 1, 1),
(469, 'cod298-2021-03-26-conjunto-retangular-adulto-10-4.jpg', 298, 1, 1),
(470, 'conjunto-eloplax-infantil--14091.jpeg', 299, 1, 1),
(471, 'conjunto-eloplax-juvenil-28616.jpeg', 300, 1, 1),
(472, 'conjunto-eloplax-adulto-59716.jpeg', 301, 1, 1),
(473, 'cod302-2021-03-26-elo.jpg', 302, 2, 1),
(880, 'conjunto-elotoy-56433.jpeg', 302, 1, 1),
(475, 'cod302-2021-03-26-elo dime.jpg', 302, 3, 1),
(477, 'silla-pupitre-universitario-57223.jpeg', 303, 1, 1),
(717, 'silla-ergoplax-con-espuma-base-y-respaldero-34532-68668.jpeg', 462, 1, 1),
(479, 'mesita-+-silla-12373---003002---07030-73512.jpeg', 304, 1, 1),
(480, 'mesita-+-silla-12373---003002---07030-97798.jpeg', 304, 2, 1),
(877, 'mesa-sublime-40040---40039-62512.png', 305, 1, 1),
(482, 'cod305-2021-03-25-Sublime-03.jpg', 305, 2, 1),
(483, 'cod306-2021-03-25-b9250405-3375-4f4a-a1b6-ad24582c202a 23.jpg', 306, 1, 1),
(484, 'silla-fija-stay-33206-37456.jpeg', 307, 3, 1),
(486, 'cod308-2021-03-25-stretch-0004.jpg', 308, 1, 1),
(487, 'sillón-stretch-sky-36906-72440.jpeg', 308, 2, 1),
(488, 'sillón-stretch-6906--36106.jpeg', 309, 1, 1),
(489, 'sillón-stretch-6906--73876.jpeg', 309, 2, 1),
(490, 'sillón-stretch-6906--46641.jpeg', 309, 3, 1),
(491, 'mesa-ottoman-36914-12260.jpeg', 310, 1, 1),
(492, 'mesa-ottoman-36914-34985.jpeg', 310, 2, 1),
(493, 'mesa-lateral-stretch-36901-89506.jpeg', 311, 2, 1),
(494, 'mesa-lateral-stretch-36901-29352.jpeg', 311, 1, 1),
(495, 'cod312-2021-03-25-289-86.jpg', 312, 1, 1),
(867, 'sofá-speed-53534-39244.jpeg', 313, 3, 1),
(497, 'sofá-speed-53534-62629.jpeg', 313, 2, 1),
(498, 'longarina-stay-3-lugares-33110-57071.jpeg', 314, 1, 1),
(499, 'longarina-beezi-39007--20159.jpeg', 316, 1, 1),
(500, 'cod317-2021-03-25-tri-1.png', 317, 2, 1),
(501, 'longarina-3-lugares-13198---13199---09420-67745.jpeg', 319, 1, 1),
(502, 'silla-director-brizza-37877-73669.jpeg', 320, 1, 1),
(503, 'silla-interlocutor-36235-55896.jpeg', 321, 1, 1),
(504, 'silla-secretaria-60006---39777-78729.jpeg', 322, 1, 1),
(506, 'cod323-2021-03-25-821382.jpeg', 323, 1, 1),
(507, 'silla-director-operativa-36234-37059.jpeg', 324, 1, 1),
(508, 'silla-classics-sin-brazos-30106.jpeg', 325, 6, 1),
(509, 'silla-classics-sin-brazos-10518.jpeg', 325, 2, 1),
(510, 'silla-classics-sin-brazos-97933.jpeg', 325, 3, 1),
(511, 'silla-classics-sin-brazos-75227.jpeg', 325, 4, 1),
(512, 'silla-classics-sin-brazos-31210.jpeg', 325, 5, 1),
(513, 'silla-classics-sin-brazos-40961.jpeg', 325, 1, 1),
(514, 'silla-classic-con-brazos-97359.jpeg', 326, 5, 1),
(515, 'silla-classic-con-brazos-25249.jpeg', 326, 2, 1),
(516, 'silla-classic-con-brazos-43843.jpeg', 326, 3, 1),
(517, 'silla-classic-con-brazos-63335.jpeg', 326, 4, 1),
(518, 'silla-classic-con-brazos-11491.jpeg', 326, 1, 1),
(519, 'silla-plástica-fija-000388---000496-87355.jpeg', 327, 1, 1),
(520, 'cod328-2021-02-24-SILLA FIJA 60017 - 39742 PLAXMETAL.jpg', 328, 1, 1),
(521, 'cod329-2021-02-24-SILLA CAJERA.jpg', 329, 1, 1),
(522, 'silla-secretaria-30473-23987.jpeg', 330, 1, 1),
(523, 'cod331-2021-02-24-SILLA BRIZZA PRESIDENTE 37811 PLAXMETAL.jpg', 331, 1, 1),
(524, 'silla-interlocutor-37881-31972.jpeg', 332, 1, 1),
(525, 'silla-presidente-36233-84168.jpeg', 333, 1, 1),
(526, 'silla-newnet-ejecutiva-16503-soft-17599.jpeg', 335, 1, 1),
(527, 'interlocutor-flip-43106-si-72870.jpeg', 336, 1, 1),
(528, 'interlocutor-flip-43106-si-72204.jpeg', 336, 2, 1),
(529, 'cod337-2021-02-09-SILLA PRESIDENTE SIN AC BRIZZA TELA 46338.jpg', 337, 1, 1),
(530, 'silla-newnet-presidente-16501-ac-soft-18724.jpeg', 338, 1, 1),
(754, 'cod472-2021-04-07-mesa lunasa.jpg', 472, 1, 1),
(532, 'silla-newnet-presidente-16501-ac-soft-28781.jpeg', 338, 3, 1),
(533, 'cod339-2021-02-09-PRESIDENTE ESSENCE 20501 CAVALETTI 4.jpg', 339, 1, 1),
(534, 'presidente-essence-20501-73111.jpeg', 339, 2, 1),
(535, 'presidente-essence-20501-29818.jpeg', 339, 3, 1),
(536, 'presidente-essence-20501-56478.jpeg', 339, 4, 1),
(537, 'presidente-essence-20501-12470.jpeg', 339, 5, 1),
(538, 'presidente-essence-20501-15814.jpeg', 339, 6, 1),
(539, 'silla-director-prime-20202-28518.jpeg', 340, 1, 1),
(540, 'silla-caja-start-4022-69590.jpeg', 341, 1, 1),
(541, 'silla-presidente-leef-4510-74707.jpeg', 342, 2, 1),
(542, 'silla-presidente-leef-4510-64833.jpeg', 342, 1, 1),
(543, 'silla-presidente-leef-4510-57362.jpeg', 342, 3, 1),
(544, 'silla-check-out-88695.jpeg', 343, 2, 1),
(545, 'silla-check-out-47341.jpeg', 343, 1, 1),
(546, 'interlocutor-prime-20306-elÍptica-18563.jpeg', 344, 1, 1),
(547, 'cod345-2021-03-03-20302A.jpg', 345, 2, 1),
(548, 'silla-presidente-prime-20301-52130.jpeg', 346, 1, 1),
(549, 'interlocutor-prime-20206-s-56719.jpeg', 347, 1, 1),
(550, 'silla-presidente-prime-20201-85255.jpeg', 348, 1, 1),
(551, 'silla-director-prime-extra-20103-33900.jpeg', 349, 1, 1),
(552, 'silla-interlocutor-prime-20106-s-56850.jpeg', 350, 1, 1),
(553, 'silla-presidente-prime-20101-16835.jpeg', 351, 1, 1),
(554, 'silla-interlocutor-newnet-16506-s-soft-93738.jpeg', 352, 1, 1),
(555, 'silla-newnet-presidente-16501-soft-17747.jpeg', 353, 1, 1),
(556, 'silla-newnet-ejecutiva-16003-80014.jpeg', 355, 1, 1),
(557, 'silla-newnert-director-16002-68837.jpeg', 356, 1, 1),
(558, 'cod357-2021-02-25-16001-AC-Syncron-StampadaCRO.jpg', 357, 1, 1),
(559, 'cod358-2021-04-14-master.jpg', 358, 1, 1),
(560, 'silla-master-director-20002--89875.jpeg', 359, 1, 1),
(561, 'silla-master-presidente-20001-61494.jpeg', 360, 1, 1),
(562, 'silla-interlocutor-chroma-14007-85192.jpeg', 361, 1, 1),
(742, 'colectiva-1003--67937.jpeg', 287, 3, 1),
(564, 'silla-chroma-presidente-14001-47175.jpeg', 363, 1, 1),
(565, 'silla-interlocutor-air-27006-41483.jpeg', 364, 1, 1),
(566, 'cod365-2021-02-25-AIR EJECUTIVA 27001 CAVALETTI 3.jpg', 365, 1, 1),
(567, 'silla-air-ejecutiva-27001-36791.jpeg', 365, 2, 1),
(568, 'cod365-2021-02-25-AIR 1.jpg', 365, 3, 1),
(569, 'silla-air-ejecutiva-27001-84268.jpeg', 365, 4, 1),
(570, 'silla-air-ejecutiva-27001-14039.jpeg', 365, 5, 1),
(571, 'silla-air-ejecutiva-27001-19110.jpeg', 365, 6, 1),
(572, 'c4-director-29001-71234.jpeg', 366, 1, 1),
(574, 'c4-director-29001-50897.jpeg', 366, 3, 1),
(575, 'c4-director-29001-15413.jpeg', 366, 4, 1),
(576, 'silla-c4-presidente-29001-ac-42341.jpeg', 368, 5, 1),
(577, 'silla-c4-presidente-29001-ac-64908.jpeg', 368, 2, 1),
(578, 'silla-c4-presidente-29001-ac-54271.jpeg', 368, 3, 1),
(579, 'silla-c4-presidente-29001-ac-74290.jpeg', 368, 4, 1),
(738, 'c4-presidente-29001-ac-67033.jpeg', 368, 1, 1),
(581, 'cod370-2021-02-25-C3 PRESIDENTE AC 28001 CAVALETTI.jpg', 370, 1, 1),
(582, 'cod370-2021-02-25-C3 PRESIDENTE AC 28001 CAVALETTI 2.jpg', 370, 2, 1),
(583, 'silla-c3-ejecutiva-28001-12692.jpeg', 370, 3, 1),
(584, 'silla-c3-ejecutiva-28001-74645.jpeg', 370, 4, 1),
(585, 'silla-interlocutor-mais-37006-s-13719.jpeg', 371, 1, 1),
(586, 'silla-interlocutor-mais-37006-s-44105.jpeg', 371, 2, 1),
(587, 'silla-mais-ejecutiva-giratoria-38592.jpeg', 372, 1, 1),
(588, 'silla-mais-director-37001-84957.jpeg', 373, 1, 1),
(590, 'silla-mais-director-37001-89093.jpeg', 373, 3, 1),
(591, 'silla-mais-director-37001-94120.jpeg', 373, 4, 1),
(592, 'silla-mais-director-37001-29258.jpeg', 373, 5, 1),
(593, 'silla-mais-director-37001-88295.jpeg', 373, 6, 1),
(594, 'cod374-2021-02-25-CAVALETTI-IDEA-BASE-NYLON.png', 374, 1, 1),
(753, 'newnet-presidente-16001-ac-99850.jpeg', 357, 2, 1),
(596, 'cod375-2021-02-25-IDEA DIRECTOR 40202 CAVALETTI.jpg', 375, 3, 1),
(597, 'silla-interlocutor-idea-40106-soft-22553.jpeg', 376, 1, 1),
(598, 'silla-idea-director-40202-29903.jpeg', 377, 1, 1),
(601, 'silla-interlocutor-vélo-42106-sl-88390.jpeg', 379, 2, 1),
(600, 'silla-interlocutor-idea-40206-si-90697.jpeg', 378, 1, 1),
(811, 'cod399-2021-03-04-beezi rojo.jpg', 399, 1, 1),
(603, 'cod380-2021-02-09-VÉLO PRESIDENTE 42101 CAVALETTI.jpg', 380, 4, 1),
(604, 'silla-vélo-presidente-42101-28321.jpeg', 380, 5, 1),
(804, 'vélo-presidente-42101-ac-29006.jpeg', 381, 1, 1),
(805, 'vélo-presidente-42101-ac-45054.jpeg', 381, 2, 1),
(607, 'silla-vélo-presidente-42101-ac-92141.jpeg', 381, 6, 1),
(608, 'silla-vélo-presidente-42101-ac-13510.jpeg', 381, 5, 1),
(609, 'silla-vélo-presidente-42101-ac-47633.jpeg', 381, 4, 1),
(610, 'interlocutor-essence-20506-27930.jpeg', 382, 1, 1),
(611, 'interlocutor-essence-20506-14303.jpeg', 382, 2, 1),
(612, 'silla-essence-presidente-20502-sin-ac-85898.jpeg', 383, 1, 1),
(613, 'silla-essence-presidente-20502-sin-ac-39975.jpeg', 383, 2, 1),
(614, 'silla-flip-con-ruedas-43106-z-rod-14252.jpeg', 384, 1, 1),
(615, 'silla-flip-fija-43106-z-76998.jpeg', 385, 1, 1),
(616, 'silla-flip-caja-fija-43122-13943.jpeg', 386, 1, 1),
(617, 'silla-flip-caja-fija-43122-89116.jpeg', 386, 2, 1),
(618, 'silla-flip-caja-fija-43122-37190.jpeg', 386, 3, 1),
(619, 'silla-flip--ejecutiva-giratoria-43103--79186.jpeg', 387, 1, 1),
(620, 'silla-flip--ejecutiva-giratoria-43103--26237.jpeg', 387, 2, 1),
(621, 'silla-flip--ejecutiva-giratoria-43103--89420.jpeg', 387, 3, 1),
(622, 'silla-flip--ejecutiva-giratoria-43103--66354.jpeg', 387, 4, 1),
(623, 'silla-giratoria-coexma-12544-69692.jpeg', 388, 1, 1),
(624, 'silla-giratoria-coexma-12544-65169.jpeg', 388, 2, 1),
(625, 'silla-giratoria-coexma-12542-20785.jpeg', 389, 1, 1),
(626, 'silla-giratoria-coexma-12542-26613.jpeg', 389, 2, 1),
(627, 'cod390-2021-02-24-Silla Ergoplax Giratoria con Brazos 33970.jpg', 390, 1, 1),
(628, 'silla-secretaria-ergoplax-33970-87886.jpeg', 391, 1, 1),
(630, 'silla-presidente-ergoplax-con-acolchado-33682-88892.jpeg', 392, 1, 1),
(631, 'silla-fija-ergoplax-con-estofado-34532-74008.jpeg', 393, 1, 1),
(632, 'silla-presidente-suprema-42452-82973.jpeg', 394, 1, 1),
(633, 'stylus-fija-apilable-41076-25388.jpeg', 395, 1, 1),
(634, 'stylus-fija-apilable-41076-93543.jpeg', 395, 2, 1),
(635, 'slytus-giratoria-39847-76029.jpeg', 396, 1, 1),
(636, 'slytus-giratoria-39847-54562.jpeg', 396, 2, 1),
(637, 'slytus-giratoria-39847-88475.jpeg', 396, 3, 1),
(638, 'cod397-2021-02-25-BEEZI GIRATORIA.jpg', 397, 4, 1),
(726, 'beezi-fija-pies-sin-brazo-39003-86723.jpeg', 398, 1, 1),
(640, 'beezi-fija-4-pies-39003-66186.jpeg', 399, 4, 1),
(641, 'silla-operativa-caja-30441-96651.jpeg', 400, 1, 1),
(642, 'realli-presidente-53320-41094.jpeg', 401, 1, 1),
(643, 'interlocutor-izzi-pata-s-25524-71211.jpeg', 402, 1, 1),
(644, 'interlocutor-izzi-fija-4-pies-25525-14018.jpeg', 403, 1, 1),
(645, 'izzi-director-25422-39226.jpeg', 404, 1, 1),
(646, 'silla-izzi-presidente--25187-67602.jpeg', 406, 1, 1),
(647, 'silla-interlocutor-piena-45602-66474.jpeg', 407, 1, 1),
(648, 'silla-interlocutor-piena-45602-51281.jpeg', 407, 2, 1),
(649, 'silla-interlocutor-piena-45602-49286.png', 407, 3, 1),
(651, 'brizza-soft-interlocutor-37882-59858.jpeg', 408, 1, 1),
(652, 'brizza-soft-ejecutiva-37880-78777.jpeg', 409, 1, 1),
(653, 'brizza-soft-presidente-37858-78257.jpeg', 410, 1, 1),
(654, 'cod411-2021-02-25-br.jpg', 411, 1, 1),
(733, 'brizza-tela-interlocutor-37881-81043.jpeg', 411, 2, 1),
(656, 'cod413-2021-02-25-BRISA EJEC 1.png', 413, 1, 1),
(657, 'brizza-tela-presidente-ac-37811-85224.jpeg', 414, 1, 1),
(658, 'cod415-2021-02-25-SILLA PLÁSTICA FIJA COLOR AZUL.jpg', 415, 1, 1),
(659, 'silla-interlocutor-suprema-46812-34367.jpeg', 416, 4, 1),
(803, 'suprema-interlocutor-46812-64858.jpeg', 416, 1, 1),
(661, 'silla-interlocutor-suprema-46812-58384.jpeg', 416, 3, 1),
(802, 'suprema-interlocutor-46812-34369.jpeg', 416, 2, 1),
(663, 'silla-presidente-suprema-42452-30550.jpeg', 417, 1, 1),
(664, 'silla-presidente-suprema-42452-84204.jpeg', 417, 2, 1),
(665, 'silla-presidente-suprema-42452-87164.jpeg', 417, 3, 1),
(667, 'enfriador-y-dosificador-de-agua-rdan-100-78039.jpeg', 418, 1, 1),
(669, 'autoservicios-bebidas-34654.jpeg', 72, 2, 1),
(670, 'autoservicios-bebidas-54852.jpeg', 72, 3, 1),
(671, 'cámara-de-fermentación-controlada-ac40t-28621.jpeg', 419, 1, 1),
(672, 'cámara-de-fermentación-controlada-ac20t-97328.jpeg', 420, 1, 1),
(673, 'cámara-de-fermentación-controlada-ac20t-45013.jpeg', 420, 1, 1),
(674, 'mesada-de-trabajo-refrigerada-bsrc-2000-14012.jpeg', 421, 1, 1),
(675, 'cod422-2021-02-19-MESADA DE TRABAJO REFRIGERADA BSR-2000.jpg', 422, 1, 1),
(676, 'cod423-2021-02-19-COCINA FUNCIONAL FF4CDP.jpg', 423, 1, 1),
(677, 'cocina-funcional-ff2cdp-71837.jpeg', 424, 1, 1),
(678, 'cocina-industrial-extra-e4--39807.jpeg', 425, 1, 1),
(679, 'cocina-funcional-ff1cdp-30114.jpeg', 426, 1, 1),
(680, 'horno-industrial-extra-fie-36836.jpeg', 427, 1, 1),
(681, 'cocina-industrial-extra-e6d3e-57504.jpeg', 428, 1, 1),
(682, 'cocina-industrial-extra-e6-30527.jpeg', 429, 1, 1),
(683, 'cocina-industrial-extra-e4pd2e-95541.jpeg', 430, 1, 1),
(684, 'cocina-industrial-extra-e2pd1-12736.jpeg', 431, 1, 1),
(685, 'cocina-industrial-extra-e1pd--91493.jpeg', 432, 1, 1),
(686, 'heladera-comercial-mc4p6-21349.jpeg', 433, 1, 1),
(687, 'heladera-comercial--mc4p--34861.jpeg', 434, 1, 1),
(688, 'heladera-comercial-mc6pp-36089.jpeg', 435, 1, 1),
(689, 'heladera-comercial-mc4pp-98801.jpeg', 436, 1, 1),
(690, 'horno-convector-co5te--23983.jpeg', 437, 1, 1),
(691, 'cocina-industrial-maxi-m6ed6-68281.jpeg', 438, 1, 1),
(692, 'cocina-industrial-maxi-m4ed4-93024.jpeg', 439, 1, 1),
(693, 'cocina-industrial-maxi-m2pd2-78617.jpeg', 440, 1, 1),
(694, 'mesa-inox-mitebep-1900-67735.jpeg', 441, 1, 1),
(695, 'mesa-inox-mitlep-1900-36003.jpeg', 442, 1, 1),
(696, 'mesada-de-trabajo-refrigerados-94156.jpeg', 443, 1, 1),
(697, 'mesada-de-trabajo-refrigerados-53273.jpeg', 443, 2, 1),
(698, 'mesada-de-trabajo-refrigerados-44534.jpeg', 443, 3, 1),
(699, 'isla-para-congelados-doble-acción-eip2000-27309.jpeg', 444, 1, 1),
(700, 'isla-para-congelados-doble-acción-eist3000-86849.jpeg', 445, 1, 1),
(701, 'isla-para-congelados-doble-acción-eist3000-57022.jpeg', 445, 2, 1),
(702, 'isla-para-congelados-doble-acción-eist3000-17307.jpeg', 445, 3, 1),
(703, 'isla-para-congelados-doble-acción-eist3000-16987.jpeg', 445, 4, 1),
(704, 'isla-para-congelados-doble-acción-eist3000-68518.jpeg', 445, 5, 1),
(705, 'isla-para-congelados-doble-acción-eist3000-53947.jpeg', 445, 6, 1),
(706, 'isla-para-congelados-doble-acción-eist2000-60591.jpeg', 446, 1, 1),
(707, 'cod446-2021-02-19-ISLA PARA CONGELADOS DOBLE ACCIÓN EIST2000 2.jpg', 446, 2, 1),
(708, 'cod446-2021-02-19-ISLA PARA CONGELADOS DOBLE ACCIÓN EIST2000 3.jpg', 446, 3, 1),
(709, 'cod446-2021-02-19-ISLA PARA CONGELADOS DOBLE ACCIÓN EIST2000 5.jpg', 446, 4, 1),
(710, 'isla-para-congelados-doble-acción-eist2000-86049.jpeg', 446, 5, 1),
(711, 'isla-para-congelados-doble-acción-eist2000-13595.jpeg', 446, 6, 1),
(712, 'freezers-fhrv-48021.jpeg', 447, 1, 1),
(835, 'cod458-2021-04-14-30.jpg', 458, 1, 1),
(715, 'silla-operativa-ejecutiva-89444.jpeg', 460, 1, 1),
(716, 'silla-operativa-ejecutiva-51003-40935.jpeg', 459, 1, 1),
(718, 'mesa-cuadrada-rattan--12915-19740.jpeg', 463, 1, 1),
(719, 'silla-rattan-12916-38554.jpeg', 464, 1, 1),
(798, 'prime-director--20302-51984.jpeg', 345, 1, 1),
(720, 'silla-interlocutor-newnet-16006-s-43859.jpeg', 354, 1, 1),
(722, 'armario-de-metal- al18011-55333.jpeg', 466, 1, 1),
(723, '002454-21556.jpeg', 467, 1, 1),
(724, 'beezi-fija-4-pies-39003-92252.jpeg', 399, 3, 1),
(725, 'cod398-2021-02-25-BEEZI 3.jpg', 398, 2, 1),
(727, 'beezi-fija-pies-sin-brazo-39003-25300.jpeg', 398, 3, 1),
(728, 'beezi-fija-pies-sin-brazo-39003-19715.jpeg', 398, 4, 1),
(729, 'beezi-fija-4-pies-con-brazo-39003-17726.jpeg', 399, 2, 1),
(730, 'beezi-fija-4-pies-con-ruedas-39004-86154.jpeg', 397, 2, 1),
(731, 'beezi-fija-4-pies-con-ruedas-39004-51732.jpeg', 397, 3, 1),
(732, 'beezi-fija-4-pies-con-ruedas-39004-41322.jpeg', 397, 1, 1),
(734, 'brizza-tela-interlocutor-37881-60390.jpeg', 411, 3, 1),
(735, 'brizza-tela-interlocutor-37881-12562.jpeg', 411, 4, 1),
(736, 'silla-briza-tela-ejecutiva-37877-74491.jpeg', 413, 2, 1),
(737, 'silla-briza-tela-ejecutiva-37877-65321.jpeg', 413, 3, 1),
(739, 'air-interlocutor--27006-32196.jpeg', 364, 2, 1),
(740, 'cod343-2021-02-25-confi.png', 343, 3, 1),
(741, 'chroma-secretaria-14004-50683.jpeg', 362, 2, 1),
(744, 'chroma-presidente-14001-47210.jpeg', 363, 2, 1),
(745, 'flip-interlocutor-43106-z-29099.jpeg', 385, 2, 1),
(746, 'flip-interlocutor--43106-si-95909.jpeg', 336, 3, 1),
(748, 'idea-director-40102-soft-31363.jpeg', 375, 2, 1),
(750, 'idea-director-40102-soft-48992.jpeg', 375, 1, 1),
(751, 'cod374-2021-02-25-40101.jpg', 374, 1, 1),
(931, 'cod496-2021-04-07-AMBIENTAL GEBB WORK.jpg', 496, 2, 1),
(756, 'mesa-recta-ln-40171-62105.png', 473, 1, 1),
(758, 'mesa-en-l-ln-40171-+-ln-40622-53971.jpeg', 474, 1, 1),
(929, 'mesa-en-l-ln-40171-+-ln-40622-85441.jpeg', 474, 2, 1),
(760, 'mesa-en-l-ln-40193-+-ln-40622-60759.jpeg', 475, 1, 1),
(930, 'mesa-en-l-ln-40193-+-ln-40622-74452.jpeg', 475, 2, 1),
(762, 'mesa-en-l-3c-ln-40169-18230.png', 476, 1, 1),
(763, 'mesa-en-l-3c-ln-40169-68843.jpeg', 476, 2, 1),
(764, 'mesa-auxiliar-ln-40622-70384.png', 477, 1, 1),
(927, 'mesa-auxiliar-ln-40622-60415.jpeg', 477, 2, 1),
(767, 'mesa-de-reunión-ln-40235-77533.png', 478, 1, 1),
(768, 'mesa-de-reunión-ln-40235-53900.jpeg', 478, 2, 1),
(769, 'mesa-de-reunión-ln-40245-36758.png', 479, 1, 1),
(770, 'mesa-de-reunión-ln-40245-72575.jpeg', 479, 2, 1),
(771, 'mesa-de-reunión-redonda-ln-40201-31575.png', 480, 1, 1),
(937, 'mesa-de-reunión-394401-48306.jpeg', 565, 1, 1),
(773, 'cajonero-fijo-ln-40310-97109.png', 481, 1, 1),
(774, 'cajonero-móvil-3c-ln-40321-24230.png', 482, 1, 1),
(775, 'cajonero-móvil-3c-ln-40321-91819.jpeg', 482, 2, 1),
(776, 'cajonero-móvil-4c-ln-40322-86748.png', 483, 1, 1),
(778, 'archivo-4c-ln-40560-44028.png', 484, 1, 1),
(779, 'archivo-4c-ln-40560-11134.jpeg', 484, 2, 1),
(780, 'armario-alto-2p-ln-40650-75090.png', 485, 1, 1),
(781, 'armario-alto-2p-ln-40650-23952.jpeg', 485, 2, 1),
(782, 'cod486-2021-03-02-iz.jpg', 486, 1, 1),
(783, 'armario-1p-lado-izquierdo-ln-40656-68025.jpeg', 486, 2, 1),
(784, 'armario-1p-lado-derecho-ln-40655-43163.jpeg', 487, 1, 1),
(785, 'armario-1p-lado-derecho-ln-40655-71687.jpeg', 487, 2, 1),
(786, 'cod488-2021-03-02-08.png', 488, 1, 1),
(787, 'balcón-credenza-ln-40592-68787.jpeg', 488, 2, 1),
(788, 'balcón-bajo-2p-ln-40653-44171.png', 489, 1, 1),
(789, 'balcón-bajo-2p-ln-40653-49762.jpeg', 489, 2, 1),
(790, 'balcón-archivero-4c-ln-40654-45615.png', 490, 1, 1),
(791, 'balcón-archivero-4c-ln-40654-63384.jpeg', 490, 2, 1),
(792, 'nicho-decorativo-ln-40637-39657.png', 491, 1, 1),
(793, 'balcón-de-recepción-ln-40814-74728.png', 492, 1, 1),
(794, 'balcón-de-recepción-ln-40814-83160.png', 492, 2, 1),
(795, 'balcón-recepción-recto-ln-40854-51798.png', 493, 1, 1),
(796, 'panel-para-tv-40mm-ln-40127-48136.png', 494, 1, 1),
(797, 'panel-para-tv-40mm-ln-40127-58674.jpeg', 494, 2, 1),
(799, 'prime-giratoria-director-extra-20103-86188.jpeg', 349, 2, 1),
(800, 'realli-presidente-53320-22439.jpeg', 401, 2, 1),
(801, 'realli-presidente-53320-41042.png', 401, 3, 1),
(806, 'vélo-presidente-42101-ac-34084.jpeg', 381, 3, 1),
(807, 'vélo-presidente-42101-99318.jpeg', 380, 1, 1),
(808, 'vélo-presidente-42101-94273.jpeg', 380, 2, 1),
(809, 'vélo-presidente-42101-59629.jpeg', 380, 3, 1),
(810, 'vélo-interlocutor--42106-sl-62973.png', 379, 1, 1),
(812, 'test2-24959.jpeg', 471, 1, 1),
(813, 'mesa-recta-atc1560 -67948.jpeg', 495, 1, 1),
(814, 'mesa-en-l-atc1560-9045-83464.jpeg', 496, 1, 1),
(815, 'mesa-atc9045-29370.jpeg', 497, 1, 1),
(816, 'cod498-2021-04-07-COE1560.jpg', 498, 1, 1),
(817, 'cod499-2021-04-14-arma 4.jpg', 499, 1, 1),
(818, 'cod500-2021-04-07-COE1560.jpg', 500, 1, 1),
(819, 'cod501-2021-04-07-COE1560-9045.jpg', 501, 1, 1),
(820, 'cod502-2021-04-07-COE1560-9045.jpg', 502, 1, 1),
(821, 'cod503-2021-04-07-COE1570.jpg', 503, 1, 1),
(822, 'cod504-2021-04-07-COE1716.jpg', 504, 1, 1),
(823, 'cod505-2021-04-14-mesas.jpg', 505, 1, 1),
(824, 'cod506-2021-04-14-cajon.jpg', 506, 1, 1),
(825, 'cod507-2021-04-14-archi.jpg', 507, 1, 1),
(826, 'cod509-2021-04-14-archi 2.jpg', 509, 1, 1),
(827, 'cod508-2021-04-14-archi 3.jpg', 508, 1, 1),
(828, 'cod510-2021-04-14-arma.jpg', 510, 1, 1),
(829, 'cod511-2021-04-14-arma 2.jpg', 511, 1, 1),
(830, 'cod512-2021-04-14-arma 3.jpg', 512, 1, 1),
(831, 'cod513-2021-04-07-COE9045.jpg', 513, 1, 1),
(832, 'cod514-2021-03-25-POLLY NEGRO 1 L.jpg', 514, 1, 1),
(833, 'cod516-2021-03-25-polly 2 l negro.jpg', 516, 1, 1),
(834, 'cod515-2021-03-25-bia negro.jpg', 515, 1, 1),
(866, 'sofá-day-1l-10093.jpeg', 517, 1, 1),
(837, 'cod518-2021-04-14-day.jpg', 518, 1, 1),
(838, 'cod519-2021-04-14-day day.jpg', 519, 1, 1),
(839, 'cod520-2021-04-14-3 l.jpg', 520, 1, 1),
(840, 'cod521-2021-04-14-coez.jpg', 521, 1, 1),
(841, 'cod522-2021-03-25-BEEZI LONGA.jpg', 522, 1, 1),
(842, 'cod523-2021-03-25-LONGA.jpg', 523, 1, 1),
(843, 'cod524-2021-04-14-revistero.jpg', 524, 1, 1),
(844, 'cod525-2021-04-14-revistero 2.jpg', 525, 1, 1),
(845, 'cod526-2021-04-14-centro.jpg', 526, 1, 1),
(846, 'cod527-2021-04-14-start.jpg', 527, 1, 1),
(847, 'cod528-2021-04-05-F NEGRO.jpg', 528, 1, 1),
(920, 'flip-light-sin-posa-brazos-94844.jpeg', 552, 1, 1),
(919, 'flip-light-sin-posa-brazos-62512.jpeg', 551, 1, 1),
(913, 'flip-light-con-posa-brazos-50289.jpeg', 545, 1, 1),
(851, 'cod529-2021-04-05-FP NEGRO.jpg', 529, 1, 1),
(912, 'flip-light-con-posa-brazos-12185.jpeg', 544, 1, 1),
(853, 'cod530-2021-04-14-gamer 3.jpg', 530, 1, 1),
(854, 'cod530-2021-04-14-ok.jpg', 530, 2, 1),
(855, 'cod530-2021-04-14-gamer 2.jpg', 530, 3, 1),
(856, 'cod530-2021-04-14-gamer 4.jpg', 530, 4, 1),
(857, 'bia-86831.jpeg', 515, 2, 1),
(858, 'sofá-bia-marrón-1l-60593.jpeg', 531, 1, 1),
(859, 'sofá-bia-marrón-1l-81320.jpeg', 531, 2, 1),
(860, 'sofá-polly-1l-marrón-81311.jpeg', 532, 2, 1),
(861, 'sofá-polly-1l-marrón-27773.jpeg', 532, 1, 1),
(862, 'polly-1l-24240.jpeg', 514, 2, 1),
(863, 'sofá-polly-2l-negro-40059.jpeg', 516, 2, 1),
(864, 'sofá-polly-2-lugares-marrón-77375.jpeg', 533, 1, 1),
(865, 'sofá-polly-2-lugares-marrón-32187.jpeg', 533, 2, 1),
(868, 'sofá-speed-53534-70959.jpeg', 534, 2, 1),
(869, 'sofá-speed-53534-66456.jpeg', 534, 1, 1),
(870, 'cod307-2021-03-25-large_thumbnail.jpg', 307, 1, 1),
(871, 'cod535-2021-03-25-longarina-stay-3-lugares-33110-57071 negro.jpg', 535, 1, 1),
(872, 'silla-fija-stay-33206-con-estofado-18897.jpeg', 306, 2, 1),
(873, 'sillón-stretch-sky-36906-31642.jpeg', 536, 1, 1),
(874, 'silla-calcutá-ca107-61496.jpeg', 293, 2, 1),
(875, 'silla-calcutá-ca107-71443.jpeg', 293, 3, 1),
(876, 'longarina-ergoplax-3-lugares-28447-63603.jpeg', 317, 1, 1),
(878, 'cod537-2021-03-25-mesa centro vidrio.jpg', 537, 1, 1),
(879, 'mesa-sublime-40040 -36230.jpeg', 537, 2, 1),
(881, 'cod538-2021-03-26-elo lila.jpg', 538, 1, 1),
(882, 'conjunto-elotoy-44814.jpeg', 538, 2, 1),
(883, 'conjunto-elotoy-24844.jpeg', 538, 3, 1),
(884, 'conjunto-elotoy-33341.jpeg', 539, 1, 1),
(885, 'conjunto-elotoy-55156.jpeg', 539, 2, 1),
(886, 'conjunto-elotoy-95075.jpeg', 539, 3, 1),
(887, 'conjunto-elotoy-27850.jpeg', 540, 1, 1),
(888, 'conjunto-elotoy-11282.jpeg', 540, 2, 1),
(889, 'conjunto-elotoy-76198.jpeg', 540, 3, 1),
(890, 'conjunto-elotoy-35700.jpeg', 542, 1, 1),
(891, 'conjunto-elotoy-63384.jpeg', 541, 1, 1),
(892, 'conjunto-elotoy-64054.jpeg', 542, 2, 1),
(893, 'conjunto-elotoy-16932.jpeg', 541, 2, 1),
(894, 'conjunto-elotoy-29392.jpeg', 542, 3, 1),
(895, 'conjunto-elotoy-94075.jpeg', 541, 3, 1),
(897, 'conjunto-rectangular-adulto-28368.jpeg', 298, 2, 1),
(898, 'conjunto-rectangular-adulto-50089.jpeg', 298, 3, 1),
(899, 'conjunto-rectangular-adulto-42936.jpeg', 298, 4, 1),
(900, 'conjunto-rectangular-adulto-99794.jpeg', 298, 5, 1),
(901, 'conjunto-rectangular-adulto-86096.jpeg', 298, 6, 1),
(902, 'conjunto-rectangular-infantil-48486.jpeg', 296, 1, 1),
(903, 'conjunto-rectangular-infantil-95563.jpeg', 296, 3, 1),
(904, 'conjunto-rectangular-infantil-19332.jpeg', 296, 4, 1),
(905, 'conjunto-rectangular-infantil-44293.jpeg', 296, 5, 1),
(906, 'conjunto-rectangular-juvenil-57831.jpeg', 297, 2, 1),
(907, 'conjunto-rectangular-juvenil-18918.jpeg', 297, 3, 1),
(908, 'conjunto-rectangular-juvenil-30342.jpeg', 297, 4, 1),
(909, 'conjunto-rectangular-juvenil-93209.jpeg', 297, 5, 1),
(910, 'conjunto-rectangular-juvenil-98275.jpeg', 297, 6, 1),
(911, 'silla-ergoplax-universitario-11783-45549-77480.jpeg', 543, 1, 1),
(914, 'flip-light-con-posa-brazos-15282.jpeg', 546, 1, 1),
(915, 'flip-light-con-posa-brazos-36308.jpeg', 547, 1, 1),
(916, 'flip-light-con-posa-brazos-68990.jpeg', 548, 1, 1),
(917, 'flip-light-con-posa-brazos-50547.jpeg', 549, 1, 1),
(918, 'flip-light-con-posa-brazos-32423.jpeg', 550, 1, 1),
(921, 'flip-light-sin-posa-brazos-42634.jpeg', 553, 1, 1),
(922, 'flip-light-sin-posa-brazos-47747.jpeg', 554, 1, 1),
(923, 'flip-light-sin-posa-brazos-15249.jpeg', 555, 1, 1),
(924, 'flip-light-sin-posa-brazos-69793.jpeg', 556, 1, 1),
(925, 'flip-light-sin-posa-brazos-56964.jpeg', 557, 1, 1),
(926, 'mesa-recta-create-390004-68133.jpeg', 562, 1, 1),
(932, 'mesa-en-l-atc1260---9045-94994.jpeg', 254, 2, 1),
(933, 'mesa-gerencial-394405-52116.jpeg', 563, 1, 1),
(934, 'mesa-gerencial-394405-98406.jpeg', 563, 2, 1),
(935, 'mesa-signa-recta-394001--80585.jpeg', 238, 2, 1),
(936, 'armario-bajo-2-puertas-390503-96593.jpeg', 564, 1, 1),
(938, 'mesa-de-reunión-394402-63315.jpeg', 566, 1, 1),
(944, 'mesa-de-reunión-tamburato-641-35995.jpeg', 569, 1, 1),
(945, 'mesa-de-reunión-tamburato-5746-71766.jpeg', 567, 2, 1),
(946, 'mesa-de-reunión-tamburato-5746-12711.jpeg', 567, 1, 1),
(947, 'mesa-de-reunión-tamburato-5746-48683.jpeg', 567, 3, 1),
(949, 'coexma-12549-75510.jpeg', 571, 1, 1),
(950, 'coexma-12549-72318.jpeg', 571, 2, 1),
(951, 'cod571-2021-04-09-SILLA 1.jpg', 571, 3, 1),
(952, 'coexma-12548-34404.jpeg', 572, 1, 1),
(953, 'coexma-12548-48188.jpeg', 572, 2, 1),
(954, 'coexma-12555-19314.jpeg', 573, 2, 1),
(955, 'coexma-12555-11984.jpeg', 573, 1, 1),
(956, 'coexma-12555-91082.jpeg', 574, 1, 1),
(957, 'coexma-12555-67140.jpeg', 574, 2, 1),
(958, '-coexma-12542-38426.jpeg', 575, 1, 1),
(959, '-coexma-12542-50663.jpeg', 575, 2, 1),
(960, 'coexma-13194-51686.jpeg', 576, 1, 1),
(961, 'mesa-coexma-base-negra-90416.jpeg', 577, 1, 1),
(962, 'cod577-2021-04-09-MESA COEXMA BASE NEGRO COEXMA 2.jpg', 577, 2, 1),
(966, 'fun-14015-s-respaldo-18697.jpeg', 581, 1, 1),
(967, 'banqueta-fun-14015-sin-respaldo-64666.jpeg', 582, 1, 1),
(970, 'banqueta-fun-14015-sin-respaldo-92293.jpeg', 582, 2, 1),
(973, 'banqueta-14015-con-respaldo-73751.jpeg', 583, 2, 1),
(974, '-banqueta-14015-con-respaldo-26435.jpeg', 584, 1, 1),
(975, '-banqueta-14015-con-respaldo-36072.jpeg', 584, 2, 1),
(976, 'banqueta-fun-14020-estofada-40605.jpeg', 585, 1, 1),
(977, 'banqueta-fun-14020-estofada-71740.jpeg', 585, 2, 1),
(978, 'cod586-2021-04-09-ENANO.jpg', 586, 1, 1),
(979, 'cod587-2021-04-09-ENANO NEGRO.jpg', 587, 1, 1),
(980, 'banqueta-baja-14015-sin-respaldo-41968.jpeg', 588, 1, 1),
(981, 'banqueta-baja-14015-sin-respaldo-97466.jpeg', 589, 1, 1),
(982, 'banqueta-fun-14015-sin-respaldo-21442.jpeg', 590, 1, 1),
(983, 'banqueta-fun-14015-sin-respaldo-90699.jpeg', 590, 2, 1);
INSERT INTO `tb_producto_img` (`id`, `url`, `id_producto`, `orden`, `activo`) VALUES
(984, 'banqueta-fun-14015-sin-respaldo-56890.jpeg', 591, 1, 1),
(985, 'banqueta-fun-14015-sin-respaldo-18816.jpeg', 591, 2, 1),
(986, 'prime-presidente-20102-40656.jpeg', 560, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_producto_stock`
--

CREATE TABLE `tb_producto_stock` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_combinacion` int(11) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `precio` int(11) DEFAULT NULL,
  `valor_descuento` double DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_producto_stock`
--

INSERT INTO `tb_producto_stock` (`id`, `id_producto`, `id_combinacion`, `stock`, `precio`, `valor_descuento`, `activo`) VALUES
(117, 38, NULL, 10, 200000, NULL, 1),
(118, 40, NULL, 10, 382000, NULL, 1),
(119, 42, NULL, 10, 570000, NULL, 1),
(120, 62, NULL, 10, 570000, NULL, 1),
(121, 64, NULL, 10, 420000, NULL, 1),
(122, 65, NULL, 10, 1111000, NULL, 1),
(123, 185, NULL, 10, 50000, NULL, 1),
(124, 190, NULL, 10, 1466000, NULL, 1),
(125, 191, NULL, 10, 1910000, NULL, 1),
(126, 193, NULL, 10, 710000, NULL, 1),
(127, 194, NULL, 10, 2233000, NULL, 1),
(128, 196, NULL, 10, 1980000, NULL, 1),
(129, 197, NULL, 10, 2695000, NULL, 1),
(130, 198, NULL, 10, 550000, NULL, 1),
(131, 199, NULL, 10, 740000, NULL, 1),
(132, 200, NULL, 10, 850000, NULL, 1),
(133, 201, NULL, 10, 930000, NULL, 1),
(134, 204, NULL, 10, 910000, NULL, 1),
(135, 205, NULL, 10, 330000, NULL, 1),
(136, 207, NULL, 10, 803000, NULL, 1),
(137, 211, NULL, 10, 950000, NULL, 1),
(138, 220, NULL, 10, 923000, NULL, 1),
(139, 227, NULL, 10, 1285000, NULL, 1),
(140, 228, NULL, 10, 1820000, NULL, 1),
(141, 229, NULL, 10, 2320000, NULL, 1),
(142, 230, NULL, 10, 2495000, NULL, 1),
(143, 231, NULL, 10, 1065000, NULL, 1),
(144, 232, NULL, 10, 1077000, NULL, 1),
(145, 465, NULL, 10, 1500000, NULL, 1),
(146, 233, NULL, 10, 775000, NULL, 1),
(147, 241, NULL, 10, 771000, NULL, 1),
(148, 242, NULL, 10, 1069000, NULL, 1),
(149, 244, NULL, 10, 1595000, NULL, 1),
(150, 245, NULL, 10, 2133000, NULL, 1),
(151, 246, NULL, 10, 2320000, NULL, 1),
(152, 252, NULL, 10, 2273000, NULL, 1),
(153, 254, NULL, 10, 720000, NULL, 1),
(154, 255, NULL, 10, 430000, NULL, 1),
(155, 259, NULL, 10, 1735000, NULL, 1),
(156, 260, NULL, 10, 2170000, NULL, 1),
(157, 274, NULL, 10, 302000, NULL, 1),
(158, 303, NULL, 10, 299000, NULL, 1),
(159, 320, NULL, 10, 970000, NULL, 1),
(160, 321, NULL, 10, 715000, NULL, 1),
(161, 322, NULL, 10, 378000, NULL, 1),
(162, 323, NULL, 10, 590000, NULL, 1),
(163, 324, NULL, 10, 838000, NULL, 1),
(164, 325, NULL, 10, 188000, NULL, 1),
(165, 326, NULL, 10, 208000, NULL, 1),
(166, 327, NULL, 10, 186000, NULL, 1),
(167, 328, NULL, 2, 296000, NULL, 1),
(168, 329, NULL, 10, 505000, NULL, 1),
(169, 331, NULL, 5, 1190000, NULL, 1),
(170, 332, NULL, 10, 752000, NULL, 1),
(171, 333, NULL, 10, 880000, NULL, 1),
(172, 472, NULL, 10, 995000, NULL, 1),
(173, 388, NULL, 10, 1246000, NULL, 1),
(174, 389, NULL, 10, 900000, NULL, 1),
(175, 390, NULL, 10, 520000, NULL, 1),
(176, 391, NULL, 10, 444000, NULL, 1),
(177, 393, NULL, 10, 271000, NULL, 1),
(178, 415, NULL, 10, 225000, NULL, 1),
(179, 416, NULL, 10, 1500000, NULL, 1),
(180, 459, NULL, 10, 861000, NULL, 1),
(181, 463, NULL, 10, 299000, NULL, 1),
(182, 462, NULL, 10, 350000, NULL, 1),
(183, 464, NULL, 10, 234000, NULL, 1),
(184, 466, NULL, 10, 2040000, NULL, 1),
(185, 467, NULL, 10, 650000, NULL, 1),
(186, 471, NULL, 10, 200000, NULL, 1),
(187, 473, NULL, 10, 775000, NULL, 1),
(188, 474, NULL, 10, 1295000, NULL, 1),
(189, 475, NULL, 10, 1515000, NULL, 1),
(190, 476, NULL, 10, 2430000, NULL, 1),
(191, 477, NULL, 10, 520000, NULL, 1),
(192, 478, NULL, 10, 1260000, NULL, 1),
(193, 479, NULL, 10, 1370000, NULL, 1),
(194, 480, NULL, 10, 897000, NULL, 1),
(195, 481, NULL, 10, 200000, NULL, 1),
(196, 482, NULL, 10, 835000, NULL, 1),
(197, 483, NULL, 10, 895000, NULL, 1),
(198, 484, NULL, 10, 1255000, NULL, 1),
(199, 485, NULL, 10, 2450000, NULL, 1),
(200, 486, NULL, 10, 1500000, NULL, 1),
(201, 487, NULL, 10, 1500000, NULL, 1),
(202, 488, NULL, 10, 1440000, NULL, 1),
(203, 489, NULL, 10, 1600000, NULL, 1),
(204, 490, NULL, 10, 1850000, NULL, 1),
(205, 491, NULL, 10, 150000, NULL, 1),
(206, 492, NULL, 10, 2230000, NULL, 1),
(207, 493, NULL, 10, 1110000, NULL, 1),
(208, 494, NULL, 10, 535000, NULL, 1),
(209, 496, NULL, 10, 780000, NULL, 1),
(210, 495, NULL, 10, 490000, NULL, 1),
(211, 497, NULL, 10, 290000, NULL, 1),
(212, 499, NULL, 10, 740000, NULL, 1),
(213, 500, NULL, 10, 490000, NULL, 1),
(214, 501, NULL, 10, 780000, NULL, 1),
(215, 502, NULL, 10, 720000, NULL, 1),
(216, 503, NULL, 9, 1185000, NULL, 1),
(217, 504, NULL, 10, 1490000, NULL, 1),
(218, 506, NULL, 10, 200000, NULL, 1),
(219, 507, NULL, 10, 910000, NULL, 1),
(220, 508, NULL, 10, 570000, NULL, 1),
(221, 509, NULL, 10, 570000, NULL, 1),
(222, 510, NULL, 10, 930000, NULL, 1),
(223, 511, NULL, 10, 850000, NULL, 1),
(224, 512, NULL, 10, 550000, NULL, 1),
(225, 513, NULL, 10, 290000, NULL, 1),
(226, 543, NULL, 10, 299000, NULL, 1),
(227, 567, NULL, 10, 2305000, NULL, 1),
(228, 568, NULL, 10, 2170000, NULL, 1),
(229, 569, NULL, 10, 2880000, NULL, 1),
(230, 570, NULL, 10, 1595000, NULL, 1),
(231, 571, NULL, 10, 1230000, NULL, 1),
(232, 572, NULL, 10, 1054000, NULL, 1),
(233, 573, NULL, 10, 2128000, NULL, 1),
(234, 574, NULL, 10, 710000, NULL, 1),
(235, 575, NULL, 10, 969000, NULL, 1),
(236, 576, NULL, 10, 180000, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_stock_valor`
--

CREATE TABLE `tb_stock_valor` (
  `id_atr_valor` int(11) NOT NULL,
  `id_stock` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_stock_valor`
--

INSERT INTO `tb_stock_valor` (`id_atr_valor`, `id_stock`, `id_producto`) VALUES
(9, 18, 458),
(13, 18, 458),
(10, 19, 458),
(12, 19, 458),
(9, 20, 458),
(12, 20, 458),
(11, 21, 458),
(13, 21, 458),
(11, 22, 458),
(12, 22, 458),
(11, 23, 458),
(13, 23, 458),
(14, 23, 458);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tiendas`
--

CREATE TABLE `tb_tiendas` (
  `id` int(11) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `activo` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_tiendas`
--

INSERT INTO `tb_tiendas` (`id`, `nombre`, `activo`) VALUES
(1, 'Muebles de Oficina', 1),
(2, 'Refrigeración & Gastronomia', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_unidades`
--

CREATE TABLE `tb_unidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `horarios` text COLLATE utf8_unicode_ci NOT NULL,
  `img_url` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `telefonos` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `tienda` int(11) NOT NULL DEFAULT '1',
  `activo` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tb_unidades`
--

INSERT INTO `tb_unidades` (`id`, `nombre`, `direccion`, `horarios`, `img_url`, `telefonos`, `tienda`, `activo`) VALUES
(1, 'Casa Matriz - CDE', '<br>Avda. Alejo Garcia c/ Cañada del Carmen', 'Lunes a viernes<br>\r\n07:00 a 12:00 hs<br>\r\n13:30 a 17:00 hs<br>\r\nSábados:<br>\r\n07:00 a 12:00 hs', 'ciudad-del-este-65947.jpeg', '<br>(061) 500 972<br>  (061) 509 035', 1, 1),
(2, 'Sucursal 1 - Asunción', '<br>Avda. Dr. Guido Boggiani 7489 c/ E. Ayala', 'Lunes a viernes<br>\r\n07:00 a 12:00 hs<br>\r\n13:30 a 17:00 hs<br>\r\nSábados:<br>\r\n07:00 a 12:00 hs', 'asunción-73917.jpeg', '<br>(021) 510 111<br><br>', 1, 1),
(3, 'Sucursal 2 - San Lorenzo', '<br>Atilio Galfre, Esquina Itá Ybaté, Km. 8,5 ', 'Lunes a viernes<br>\r\n07:30 a 12:00 hs<br>\r\n13:00 a 17:30 hs<br>\r\nSábados:<br>\r\n07:00 a 12:00 hs', 'san-lorenzo-92690.jpeg', '<br>(021) 507 050<br><br>  ', 2, 1),
(4, 'Refrigeración & Gastronomía - Ciudad del Este', '', '', 'no-image.png', '+595 973 642631', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `id` int(11) NOT NULL,
  `usuario` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `tipo` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_usuario`
--

INSERT INTO `tb_usuario` (`id`, `usuario`, `password`, `nombre`, `tipo`) VALUES
(1, 'Richard', '411b920a7b812856d682d5d888119490', 'Muebles de Oficina', 0),
(6, 'ana', 'e10adc3949ba59abbe56e057f20f883e', 'Bar', 1),
(8, 'leandro@coexma.com.py', '93aa8e136da486058c38d0f1d98f3c0e', 'Lendro Gonzalez', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_usuario_cliente`
--

CREATE TABLE `tb_usuario_cliente` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `email_verificado` date DEFAULT NULL,
  `contrasena` varchar(100) NOT NULL,
  `creado_en` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_usuario_cliente`
--

INSERT INTO `tb_usuario_cliente` (`id`, `id_cliente`, `email`, `email_verificado`, `contrasena`, `creado_en`) VALUES
(28, 28, 'jundanielvallejostaniwaki@gmail.com', NULL, '32eea26b19d73f402e0a9ad72cef5943', '2021-05-10'),
(27, 27, 'reneortega2609@gmail.com', NULL, '73f307447160cb507b68446e50a7ddb7', '2021-05-06'),
(26, 26, 'gerencia@integrallogistics.com.py', NULL, 'eafe0f0ab91e13b31354b45ba72a6697', '2021-05-04'),
(25, 25, 'joseaguilera1709@gmail.com', NULL, 'b0e887c60954b43df604433ca2a93fc6', '2021-04-26'),
(24, 24, 'reneortega260@gmail.com', NULL, 'df82bf9f2b475d5f79cdf2a8986c6ca8', '2021-04-26'),
(23, 23, 'alycelundy@iswc.info\r\n', NULL, '7f406127c54a6420a19552e3047990a3', '2021-04-26'),
(22, 22, 'capacitcursoscde@gmail.com', NULL, '411b920a7b812856d682d5d888119490', '2021-04-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_vendedores`
--

CREATE TABLE `tb_vendedores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `unidad` int(11) DEFAULT NULL,
  `cargo` varchar(40) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `link_email` varchar(255) DEFAULT NULL,
  `skype` varchar(50) DEFAULT NULL,
  `link_skype` varchar(255) DEFAULT NULL,
  `telefono_a` varchar(50) DEFAULT NULL,
  `link_telefono_a` varchar(255) DEFAULT NULL,
  `telefono_b` varchar(50) DEFAULT NULL,
  `link_telefono_b` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(50) DEFAULT NULL,
  `link_whatsapp` varchar(255) DEFAULT NULL,
  `espanol` int(11) NOT NULL,
  `ingles` int(11) NOT NULL,
  `portugues` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_vendedores`
--

INSERT INTO `tb_vendedores` (`id`, `nombre`, `unidad`, `cargo`, `foto`, `email`, `link_email`, `skype`, `link_skype`, `telefono_a`, `link_telefono_a`, `telefono_b`, `link_telefono_b`, `whatsapp`, `link_whatsapp`, `espanol`, `ingles`, `portugues`) VALUES
(1, 'Luis Salinas', 2, 'Vendedor', 'luis-salinas-2021-03-26-04-54-33.png', 'luis@coexma.com.py', 'mailto:luis@coexma.com.py?Subject=Contato site', 'luis_14092', 'callto://+luis_14092', '(021) 510 111', 'tel:021510111', '(021) 510 111', 'tel:021510111', '+595 983136085', 'https://api.whatsapp.com/send?phone=595983136085', 1, 0, 0),
(2, 'Paola González ', 1, 'Vendedor', 'paola-gonzález--2021-02-05-08-00-17png', 'paola@coexma.com.py', 'mailto:paola@coexma.com.py?Subject=Contato site', ' Paola_55 ', 'callto://+ Paola_55 ', ' (061) 500 972 ', 'tel:061500972', ' (061) 509 035 ', 'tel:061509035', ' +595 986 463200 ', 'https://api.whatsapp.com/send?phone=595986463200', 1, 0, 1),
(3, 'Lourdes Lobos', 1, 'Vendedor', 'lourdes-lobos-2021-02-05-07-43-53png', 'lourdes@coexma.com.py', 'mailto:lourdes@coexma.com.py?Subject=Contato site', ' lourdes_3137 ', 'callto://+ lourdes_3137 ', ' (061) 500 972 ', 'tel:061500972', ' (061) 509 035 ', 'tel:061509035', ' +595 986611003 ', 'https://api.whatsapp.com/send?phone=595986611003', 1, 0, 0),
(4, 'Marcos Oliveira', 2, 'Vendedor', 'marcos-oliveira-2021-02-05-07-39-52png', 'marcos@coexma.com.py', 'mailto:marcos@coexma.com.py?Subject=Contato site', '', '', '(021) 510 111 ', 'tel:021510111', ' (021) 510 111 ', 'tel:021510111', ' +595 982 133053 ', 'https://api.whatsapp.com/send?phone=595982133053', 1, 1, 1),
(5, 'Fernando Bastiani', 1, 'Vendedor', 'fernando-bastiani-2021-02-05-08-01-49png', 'fernando@coexma.com.py', 'mailto:fernando@coexma.com.py?Subject=Contato site', 'fernando_14850 ', 'callto://+fernando_14850 ', '061 500 972', 'tel:061500972', '061 509 035', 'tel:061509035', '+ 595 986 782 006', 'https://api.whatsapp.com/send?phone=595986782006', 1, 0, 1),
(6, 'Cynthia Lopez', 3, 'Vendedor', 'cynthia-lopez-2021-03-26-04-49-23.jpeg', 'cynthia@coexma.com.py', 'mailto:cynthia@coexma.com.py?Subject=Contato site', '.cid.71cde67d7edbe38d', 'callto://+.cid.71cde67d7edbe38d', '021 507050', 'tel:021507050', '021 507050', 'tel:021507050', '+595 983 338 230', 'https://api.whatsapp.com/send?phone=595983338230', 1, 0, 1),
(7, 'Nancy Colmán', 3, 'Vendedor', 'nancy-colmán-2021-03-26-04-57-34.png', 'nancy@coexma.com.py', 'mailto:nancy@coexma.com.py?Subject=Contato site', 'nancy_9565', 'callto://+nancy_9565', '(021) 644 294', 'tel:021644294', '(021) 644 294', 'tel:021644294', '+595 986700180', 'https://api.whatsapp.com/send?phone=595986700180', 1, 0, 1),
(8, 'María Ines Armoa', 2, 'Vendedor', 'maría-ines-armoa-2021-03-26-04-55-04.png', 'ines@coexma.com.py', 'mailto:ines@coexma.com.py?Subject=Contato site', '', '', '(021) 510 111 ', 'tel:021510111', '(021) 510 111 ', 'tel:021510111', '+595 982 523285', 'https://api.whatsapp.com/send?phone=595982523285', 1, 0, 1),
(9, 'Telemarketing', 4, 'Vendedor', 'telemarketing-2021-04-23-02-47-27.jpeg', 'leandro@coexma.com.py', 'mailto:leandro@coexma.com.py?Subject=Contato site', '', '', '+595 973 642631', 'tel:595973642631', '', '', '+595 973 642631', 'https://api.whatsapp.com/send?phone=595973642631', 1, 0, 1),
(11, 'Rosalia Martinez', 3, 'Vendedor', 'rosalia-martinez-2021-04-28-11-15-46.jpeg', 'rosalia@coexma.com.py', 'mailto:rosalia@coexma.com.py?Subject=Contato site', '', '', '', '', '', '', '+595983318181', 'https://api.whatsapp.com/send?phone=595983318181', 1, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `estado` int(2) NOT NULL DEFAULT '0',
  `totalMonto` decimal(15,2) DEFAULT NULL,
  `hash_pedido` varchar(255) DEFAULT NULL,
  `maxDateForPayment` varchar(120) DEFAULT NULL,
  `compradorId` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `mail_config`
--
ALTER TABLE `mail_config`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_atributo`
--
ALTER TABLE `tb_atributo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_atr_valor`
--
ALTER TABLE `tb_atr_valor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_banner`
--
ALTER TABLE `tb_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_categoria`
--
ALTER TABLE `tb_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_ciudad`
--
ALTER TABLE `tb_ciudad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_cli_direccion`
--
ALTER TABLE `tb_cli_direccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_contacto`
--
ALTER TABLE `tb_contacto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_curriculm`
--
ALTER TABLE `tb_curriculm`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_curriculum`
--
ALTER TABLE `tb_curriculum`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_curriculum_experiencia`
--
ALTER TABLE `tb_curriculum_experiencia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_departamento`
--
ALTER TABLE `tb_departamento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_linea`
--
ALTER TABLE `tb_linea`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_marca`
--
ALTER TABLE `tb_marca`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_met_envio`
--
ALTER TABLE `tb_met_envio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_met_pago`
--
ALTER TABLE `tb_met_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_newsletter`
--
ALTER TABLE `tb_newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_pedido`
--
ALTER TABLE `tb_pedido`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_pedido_express`
--
ALTER TABLE `tb_pedido_express`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_ped_detalle`
--
ALTER TABLE `tb_ped_detalle`
  ADD PRIMARY KEY (`id_pedido`,`id_producto`,`id_stock`);

--
-- Indices de la tabla `tb_ped_status`
--
ALTER TABLE `tb_ped_status`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_preguntas`
--
ALTER TABLE `tb_preguntas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_preguntas_respuestas`
--
ALTER TABLE `tb_preguntas_respuestas`
  ADD PRIMARY KEY (`id_res`);

--
-- Indices de la tabla `tb_producto`
--
ALTER TABLE `tb_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_producto_atributo`
--
ALTER TABLE `tb_producto_atributo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_producto_atr_valor`
--
ALTER TABLE `tb_producto_atr_valor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_producto_categoria`
--
ALTER TABLE `tb_producto_categoria`
  ADD PRIMARY KEY (`id_producto`,`id_categoria`);

--
-- Indices de la tabla `tb_producto_combinacion`
--
ALTER TABLE `tb_producto_combinacion`
  ADD PRIMARY KEY (`id_combinacion`,`id_producto_atr_valor`);

--
-- Indices de la tabla `tb_producto_img`
--
ALTER TABLE `tb_producto_img`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_producto_stock`
--
ALTER TABLE `tb_producto_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_stock_valor`
--
ALTER TABLE `tb_stock_valor`
  ADD PRIMARY KEY (`id_atr_valor`,`id_stock`);

--
-- Indices de la tabla `tb_unidades`
--
ALTER TABLE `tb_unidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_usuario_cliente`
--
ALTER TABLE `tb_usuario_cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_vendedores`
--
ALTER TABLE `tb_vendedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_atributo`
--
ALTER TABLE `tb_atributo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tb_atr_valor`
--
ALTER TABLE `tb_atr_valor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tb_banner`
--
ALTER TABLE `tb_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `tb_categoria`
--
ALTER TABLE `tb_categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT de la tabla `tb_ciudad`
--
ALTER TABLE `tb_ciudad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT de la tabla `tb_cliente`
--
ALTER TABLE `tb_cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `tb_cli_direccion`
--
ALTER TABLE `tb_cli_direccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `tb_contacto`
--
ALTER TABLE `tb_contacto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tb_curriculm`
--
ALTER TABLE `tb_curriculm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_curriculum`
--
ALTER TABLE `tb_curriculum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tb_curriculum_experiencia`
--
ALTER TABLE `tb_curriculum_experiencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tb_departamento`
--
ALTER TABLE `tb_departamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tb_linea`
--
ALTER TABLE `tb_linea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `tb_marca`
--
ALTER TABLE `tb_marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `tb_met_envio`
--
ALTER TABLE `tb_met_envio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tb_met_pago`
--
ALTER TABLE `tb_met_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tb_newsletter`
--
ALTER TABLE `tb_newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `tb_pedido`
--
ALTER TABLE `tb_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `tb_pedido_express`
--
ALTER TABLE `tb_pedido_express`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=373;

--
-- AUTO_INCREMENT de la tabla `tb_ped_status`
--
ALTER TABLE `tb_ped_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tb_preguntas`
--
ALTER TABLE `tb_preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tb_preguntas_respuestas`
--
ALTER TABLE `tb_preguntas_respuestas`
  MODIFY `id_res` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `tb_producto`
--
ALTER TABLE `tb_producto`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=592;

--
-- AUTO_INCREMENT de la tabla `tb_producto_atributo`
--
ALTER TABLE `tb_producto_atributo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tb_producto_atr_valor`
--
ALTER TABLE `tb_producto_atr_valor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tb_producto_img`
--
ALTER TABLE `tb_producto_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=987;

--
-- AUTO_INCREMENT de la tabla `tb_producto_stock`
--
ALTER TABLE `tb_producto_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT de la tabla `tb_unidades`
--
ALTER TABLE `tb_unidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tb_usuario_cliente`
--
ALTER TABLE `tb_usuario_cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `tb_vendedores`
--
ALTER TABLE `tb_vendedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

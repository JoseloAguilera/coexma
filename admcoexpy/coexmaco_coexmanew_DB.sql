-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.21 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla coexmaco_coexmanew_db.mail_config
CREATE TABLE IF NOT EXISTS `mail_config` (
  `id` int(11) NOT NULL,
  `assunto` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `email_to` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `email_from` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `email_cc` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_atributo
CREATE TABLE IF NOT EXISTS `tb_atributo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_atr_valor
CREATE TABLE IF NOT EXISTS `tb_atr_valor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_atributo` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_banner
CREATE TABLE IF NOT EXISTS `tb_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `text_alt` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `orden` int(11) NOT NULL,
  `posicion` tinyint(1) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_categoria
CREATE TABLE IF NOT EXISTS `tb_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `id_padre` int(11) DEFAULT NULL,
  `menu` tinyint(1) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `descripcion` text,
  `url` varchar(80) DEFAULT 'no-image.png',
  `orden` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=203 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_categoria_tienda
CREATE TABLE IF NOT EXISTS `tb_categoria_tienda` (
  `id_tienda` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_ciudad
CREATE TABLE IF NOT EXISTS `tb_ciudad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_cliente
CREATE TABLE IF NOT EXISTS `tb_cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `apellido` varchar(80) DEFAULT NULL,
  `ruc` varchar(20) DEFAULT NULL COMMENT 'RUC, RG, CI',
  `documento` varchar(50) DEFAULT NULL,
  `razon_social` varchar(80) DEFAULT NULL,
  `mayorista` tinyint(1) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_cli_direccion
CREATE TABLE IF NOT EXISTS `tb_cli_direccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `calle` varchar(80) NOT NULL,
  `ciudad` varchar(80) NOT NULL,
  `departamento` varchar(80) NOT NULL,
  `referencia` varchar(80) DEFAULT NULL,
  `favorito` tinyint(1) NOT NULL COMMENT '0 -> no 1 -> sí',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_contacto
CREATE TABLE IF NOT EXISTS `tb_contacto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `asunto` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `mensaje` longtext COLLATE utf8_unicode_ci NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_curriculm
CREATE TABLE IF NOT EXISTS `tb_curriculm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `cedula` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `id_ciudad` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_departamento` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `area` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_curriculum
CREATE TABLE IF NOT EXISTS `tb_curriculum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `cedula` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `id_ciudad` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_departamento` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `area` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `url_cv` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_curriculum_experiencia
CREATE TABLE IF NOT EXISTS `tb_curriculum_experiencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_curriculum` int(11) NOT NULL,
  `empresa` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `desde` date NOT NULL,
  `hasta` date NOT NULL,
  `cargo` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_departamento
CREATE TABLE IF NOT EXISTS `tb_departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_linea
CREATE TABLE IF NOT EXISTS `tb_linea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_marca
CREATE TABLE IF NOT EXISTS `tb_marca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `url` varchar(80) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_met_envio
CREATE TABLE IF NOT EXISTS `tb_met_envio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(80) NOT NULL,
  `costo` double DEFAULT '0',
  `coordinar_env` int(11) NOT NULL DEFAULT '0',
  `default` int(11) DEFAULT '0',
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_met_envio_costo
CREATE TABLE IF NOT EXISTS `tb_met_envio_costo` (
  `id` int(11) DEFAULT NULL,
  `id_met_envio` int(11) DEFAULT NULL,
  `id_ciudad` int(11) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `tiempo_entrega` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_met_pago
CREATE TABLE IF NOT EXISTS `tb_met_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(80) NOT NULL,
  `default` int(11) DEFAULT NULL,
  `instrucciones` mediumtext,
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_newsletter
CREATE TABLE IF NOT EXISTS `tb_newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_pais
CREATE TABLE IF NOT EXISTS `tb_pais` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_pedido
CREATE TABLE IF NOT EXISTS `tb_pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_cliente` int(11) NOT NULL,
  `id_met_pago` int(11) NOT NULL,
  `id_met_envio` int(11) NOT NULL,
  `id_cli_direccion` int(11) NOT NULL DEFAULT '1',
  `total` double NOT NULL,
  `id_factura` int(11) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `total_envio` double DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_pedido_express
CREATE TABLE IF NOT EXISTS `tb_pedido_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_desde` varchar(45) DEFAULT 'Formulario',
  `nombre` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `ciudad` varchar(80) NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `mensaje` text,
  `vendedor` int(11) DEFAULT NULL,
  `full_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=373 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_ped_detalle
CREATE TABLE IF NOT EXISTS `tb_ped_detalle` (
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_stock` int(11) NOT NULL,
  `combinacion` varchar(100) DEFAULT NULL,
  `valor_unitario` double NOT NULL,
  `ctd` int(11) NOT NULL,
  `descuento` double DEFAULT NULL,
  `valor_total` double NOT NULL,
  PRIMARY KEY (`id_pedido`,`id_producto`,`id_stock`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_ped_status
CREATE TABLE IF NOT EXISTS `tb_ped_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_preguntas
CREATE TABLE IF NOT EXISTS `tb_preguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(150) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_preguntas_opciones
CREATE TABLE IF NOT EXISTS `tb_preguntas_opciones` (
  `id` int(11) DEFAULT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `valor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_preguntas_respuestas
CREATE TABLE IF NOT EXISTS `tb_preguntas_respuestas` (
  `id_res` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(50) DEFAULT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `id_respuesta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_res`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_producto
CREATE TABLE IF NOT EXISTS `tb_producto` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
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
  `modelo` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=592 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_producto_atributo
CREATE TABLE IF NOT EXISTS `tb_producto_atributo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `id_atributo` int(11) NOT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_producto_atr_valor
CREATE TABLE IF NOT EXISTS `tb_producto_atr_valor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_atributo` int(11) NOT NULL,
  `id_atr_valor` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_producto_categoria
CREATE TABLE IF NOT EXISTS `tb_producto_categoria` (
  `id_producto` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`,`id_categoria`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_producto_combinacion
CREATE TABLE IF NOT EXISTS `tb_producto_combinacion` (
  `id_combinacion` int(11) NOT NULL,
  `id_producto_atr_valor` int(11) NOT NULL,
  PRIMARY KEY (`id_combinacion`,`id_producto_atr_valor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_producto_img
CREATE TABLE IF NOT EXISTS `tb_producto_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(80) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=987 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_producto_stock
CREATE TABLE IF NOT EXISTS `tb_producto_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `id_combinacion` int(11) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `precio` int(11) DEFAULT NULL,
  `valor_descuento` double DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=237 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_stock_valor
CREATE TABLE IF NOT EXISTS `tb_stock_valor` (
  `id_atr_valor` int(11) NOT NULL,
  `id_stock` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  PRIMARY KEY (`id_atr_valor`,`id_stock`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_tiendas
CREATE TABLE IF NOT EXISTS `tb_tiendas` (
  `id` int(11) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `activo` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_unidades
CREATE TABLE IF NOT EXISTS `tb_unidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `horarios` text COLLATE utf8_unicode_ci NOT NULL,
  `img_url` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `telefonos` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `tienda` int(11) NOT NULL DEFAULT '1',
  `activo` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_usuario
CREATE TABLE IF NOT EXISTS `tb_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `tipo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_usuario_cliente
CREATE TABLE IF NOT EXISTS `tb_usuario_cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `email_verificado` date DEFAULT NULL,
  `contrasena` varchar(100) NOT NULL,
  `creado_en` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.tb_vendedores
CREATE TABLE IF NOT EXISTS `tb_vendedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `portugues` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coexmaco_coexmanew_db.transactions
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(11) NOT NULL,
  `pagado` int(2) NOT NULL DEFAULT '0',
  `forma_pago` varchar(80) NOT NULL DEFAULT '0',
  `fecha_pago` varchar(80) NOT NULL DEFAULT '0',
  `monto` decimal(15,2) DEFAULT NULL,
  `fecha_maxima_pago` varchar(120) DEFAULT NULL,
  `hash_pedido` varchar(255) DEFAULT NULL,
  `numero_pedido` varchar(255) DEFAULT NULL,
  `cancelado` int(2) DEFAULT NULL,
  `forma_pago_identificador` int(2) DEFAULT NULL,
  `compradorId` int(11) DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

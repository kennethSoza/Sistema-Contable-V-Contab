-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: SistemaContable
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asiento_contable`
--

DROP TABLE IF EXISTS `asiento_contable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asiento_contable` (
  `idasiento_contable` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del asiento contable',
  `codigo_asiento` varchar(30) NOT NULL COMMENT 'El código que la empresa le brinda al asiento contable',
  `codigo_cuenta_debe` varchar(50) DEFAULT NULL COMMENT 'Código de la cuenta del debe',
  `importe_debe` double DEFAULT NULL COMMENT 'El importe debe que se reflejara en la cuenta ',
  `codigo_cuenta_haber` varchar(50) DEFAULT NULL COMMENT 'código de la cuenta del haber',
  `importe_haber` double DEFAULT NULL COMMENT 'El importe del haber que se reflejara en la cuenta',
  `estado` varchar(12) NOT NULL COMMENT 'estado del asiento contable, activo o inactivo\n',
  `fecha_del_asiento` date NOT NULL COMMENT 'fecha en la que se realiza el asiento',
  `usuario` int(11) NOT NULL COMMENT 'Id del usuario que realizo el asiento (seguridad)',
  `cuenta` int(11) NOT NULL COMMENT 'Id de la cuenta a la que se le esta haciendo el asiento contable',
  `empresa` int(11) NOT NULL COMMENT 'Id de la empresa o surcusal que hace el asiento contable',
  `entrada_comprobante_diario` int(11) NOT NULL,
  PRIMARY KEY (`idasiento_contable`),
  KEY `fk_asiento_contable_usuario1_idx` (`usuario`),
  KEY `fk_asiento_contable_catalogo_de_cuentas1_idx` (`cuenta`),
  KEY `fk_asiento_contable_detalle_empresa1_idx` (`empresa`),
  KEY `fk_asiento_contable_comprobante_diario1_idx` (`entrada_comprobante_diario`),
  CONSTRAINT `fk_asiento_contable_catalogo_de_cuentas1` FOREIGN KEY (`cuenta`) REFERENCES `catalogo_de_cuentas` (`idcatalogo_de_cuentas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asiento_contable_comprobante_diario1` FOREIGN KEY (`entrada_comprobante_diario`) REFERENCES `comprobante_diario` (`idlibro_diario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asiento_contable_detalle_empresa1` FOREIGN KEY (`empresa`) REFERENCES `detalle_empresa` (`idempresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asiento_contable_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='Tabla con los datos del asiento contable';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asiento_contable`
--

LOCK TABLES `asiento_contable` WRITE;
/*!40000 ALTER TABLE `asiento_contable` DISABLE KEYS */;
INSERT INTO `asiento_contable` VALUES (1,'1','1000000000',50,'2000000000',150,'Activo','2020-05-08',1,3,1,1),(2,'2','2000000000',50,'1000000000',50,'Activo','2020-05-08',1,2,1,2);
/*!40000 ALTER TABLE `asiento_contable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogo_de_cuentas`
--

DROP TABLE IF EXISTS `catalogo_de_cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogo_de_cuentas` (
  `idcatalogo_de_cuentas` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID de la tabla',
  `numero_cuenta` varchar(50) NOT NULL COMMENT 'El número que la empresa le proporcionan a la cuenta',
  `nombre__cuenta` varchar(50) NOT NULL COMMENT 'Nombre de la cuenta',
  `descripcion_cuenta` varchar(140) NOT NULL COMMENT 'Descripción de la cuenta',
  `estado` varchar(12) NOT NULL COMMENT 'estado de la cuenta activo o inactivo',
  `pais` varchar(35) NOT NULL COMMENT 'pais de la cuenta',
  `cuenta_padre` int(11) DEFAULT '1' COMMENT 'Dato que convierte a esta tabla en una recursiva, este dato indica si es la padre de una subcuenta,\\\\\\\\npuede ser nulo',
  `usuario` int(11) NOT NULL COMMENT 'Id del usuario que creo la cuenta',
  `naturaleza` int(11) NOT NULL COMMENT 'Id de la naturaleza de la cuenta',
  `empresa` int(11) NOT NULL COMMENT 'Id de la empresa o surcusal al que pertenece la cuenta',
  PRIMARY KEY (`idcatalogo_de_cuentas`),
  KEY `fk_catalogo_de_cuentas_catalogo_de_cuentas1_idx` (`cuenta_padre`),
  KEY `fk_catalogo_de_cuentas_usuario1_idx` (`usuario`),
  KEY `fk_catalogo_de_cuentas_naturaleza1_idx` (`naturaleza`),
  KEY `fk_catalogo_de_cuentas_detalle_empresa1_idx` (`empresa`),
  CONSTRAINT `fk_catalogo_de_cuentas_catalogo_de_cuentas1` FOREIGN KEY (`cuenta_padre`) REFERENCES `catalogo_de_cuentas` (`idcatalogo_de_cuentas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_catalogo_de_cuentas_detalle_empresa1` FOREIGN KEY (`empresa`) REFERENCES `detalle_empresa` (`idempresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_catalogo_de_cuentas_naturaleza1` FOREIGN KEY (`naturaleza`) REFERENCES `naturaleza` (`idnaturaleza`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_catalogo_de_cuentas_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='El catálogo de cuentas con los datos básicos de la cuentas.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo_de_cuentas`
--

LOCK TABLES `catalogo_de_cuentas` WRITE;
/*!40000 ALTER TABLE `catalogo_de_cuentas` DISABLE KEYS */;
INSERT INTO `catalogo_de_cuentas` VALUES (1,'0000000000','CUENTA DEFAULT','ESTA NO ES UNA CUENTA, SOLO SIRVE PARA RELLANAR EL CAMPO EN LAS CUENTAS PADRES','Activa','NICARAGUA',2,1,1,1),(2,'2000000000','Cuenta de prueba pasiva','Esta es una cuenta de prueba pasiva','Activa','NICARAGUA',1,1,2,1),(3,'1000000000','Cuenta de prueba Activa','Esta es una cuenta de prueba Activa','Activa','Nicaragua',1,1,1,1),(4,'3000000000','Cuenta de prueba','Cuenta de prueba 3','Activa','Nicaragua',1,1,2,1);
/*!40000 ALTER TABLE `catalogo_de_cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprobante_diario`
--

DROP TABLE IF EXISTS `comprobante_diario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprobante_diario` (
  `idlibro_diario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la tabla',
  `fecha_del_movimiento` date NOT NULL COMMENT 'Fecha en la que se hizo el movimiento',
  `concepto_movimiento` varchar(80) NOT NULL COMMENT 'El concepto en el que se hace el movimiento',
  `importe_debe` float DEFAULT NULL COMMENT 'Importe debe a la cuenta',
  `importe_haber` float DEFAULT NULL COMMENT 'Importe del haber de la cuenta',
  `estado` varchar(12) NOT NULL COMMENT 'Estado del comprobante diario, activo o inactivo',
  `usuario` int(11) NOT NULL COMMENT 'Id del usuario que hizo la entrada',
  `empresa` int(11) NOT NULL COMMENT 'Id de la empresa de la cual proviene la entrada',
  `cuenta` int(11) NOT NULL COMMENT 'Id de la cuenta',
  `periodo_contable` varchar(30) NOT NULL COMMENT 'Id del período al que pertenece la entrada',
  PRIMARY KEY (`idlibro_diario`),
  KEY `fk_comprobante_diario_usuario1_idx` (`usuario`),
  KEY `fk_comprobante_diario_detalle_empresa1_idx` (`empresa`),
  KEY `fk_comprobante_diario_catalogo_de_cuentas1_idx` (`cuenta`),
  KEY `fk_comprobante_diario_periodo_contable1_idx` (`periodo_contable`),
  CONSTRAINT `fk_comprobante_diario_catalogo_de_cuentas1` FOREIGN KEY (`cuenta`) REFERENCES `catalogo_de_cuentas` (`idcatalogo_de_cuentas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comprobante_diario_detalle_empresa1` FOREIGN KEY (`empresa`) REFERENCES `detalle_empresa` (`idempresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comprobante_diario_periodo_contable1` FOREIGN KEY (`periodo_contable`) REFERENCES `periodo_contable` (`idperiodo_contable`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comprobante_diario_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='Tabla con los datos del libro diario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobante_diario`
--

LOCK TABLES `comprobante_diario` WRITE;
/*!40000 ALTER TABLE `comprobante_diario` DISABLE KEYS */;
INSERT INTO `comprobante_diario` VALUES (1,'2020-05-08','Haciendo la prueba',50,50,'Activo',1,1,3,'MAY2020'),(2,'2020-05-08','Haciendo la prueba',50,150,'Activo',1,1,2,'MAY2020');
/*!40000 ALTER TABLE `comprobante_diario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_empresa`
--

DROP TABLE IF EXISTS `detalle_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_empresa` (
  `idempresa` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de la tabla',
  `nombre_empresa` varchar(25) NOT NULL COMMENT 'nombre de la empresa',
  `nombre_comercial` varchar(25) NOT NULL COMMENT 'nombre de la surcusal',
  `direccion_empresa` varchar(145) NOT NULL COMMENT 'DIrección de la surcusal o empresa',
  `departamento_empresa` varchar(30) NOT NULL COMMENT 'departamento de la sucursal o empresa',
  `correo_empresa` varchar(35) NOT NULL COMMENT 'Correo de la sucursal o empresa',
  `estado` varchar(12) NOT NULL COMMENT 'Estado de la empresa o surcusal',
  PRIMARY KEY (`idempresa`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='detalles de los establecimientos y otras cuestiones de la empresa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_empresa`
--

LOCK TABLES `detalle_empresa` WRITE;
/*!40000 ALTER TABLE `detalle_empresa` DISABLE KEYS */;
INSERT INTO `detalle_empresa` VALUES (1,'POPS','POPS MANAGUA','De donde venden chicha, tre cuadras al sur','MANAGUA','popman@gmail.com','Activo'),(2,'POPS','POPS GRANADA','De donde el árbol, cinco cuadras al norte','GRANADA','popgran@gmail.com','Activo'),(3,'POPS','POPS ESTELÍ','De donde el chino, seis cuadras al este','ESTELÍ','popest@gmail.com','Activo'),(4,'POPS','POPS MASAYA','Del jocote, siete cuadras al norte','MASAYA','popmas@gmail.com','Activo');
/*!40000 ALTER TABLE `detalle_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `idempleado` varchar(10) NOT NULL COMMENT 'id de la tabla',
  `fecha_ingreso` date DEFAULT NULL COMMENT 'Fecha de ingreso del empleado',
  `cargo_empleado` int(11) NOT NULL,
  `cedula` varchar(25) NOT NULL COMMENT 'Cedula del empleado',
  `nombre_empleado` varchar(30) NOT NULL COMMENT 'nombre del empleado',
  `apellido_empleado` varchar(30) NOT NULL COMMENT 'apellido del empleado',
  `telefono_convencional_empleado` varchar(10) DEFAULT NULL COMMENT 'teléfono convencional o de la casa del empleado',
  `celular_empleado` varchar(10) DEFAULT NULL COMMENT 'telefono celular del empleado',
  `correo_empleado` varchar(35) NOT NULL COMMENT 'correo del empleado',
  `direccion_empleado` varchar(145) NOT NULL COMMENT 'Dirección del domicilio del empleado',
  `sueldo` varchar(45) NOT NULL COMMENT 'sueldo del empleado',
  `estado` varchar(12) NOT NULL COMMENT 'Estado del empleado, activo o inactivo',
  PRIMARY KEY (`idempleado`),
  KEY `fk_empleado_rol1_idx` (`cargo_empleado`),
  CONSTRAINT `fk_empleado_rol1` FOREIGN KEY (`cargo_empleado`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla con la información de los empleados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES ('ASOZA','2020-05-02',6,'001-180695-7889D','ANNA','SOZA','2249-5889','84778328','asoza@gmail.com','De donde la planta 7 cuadras al norte','6000','Activo'),('DSOZA','2020-05-02',3,'001-190401-4985P','DELVER','SOZA','2239-7745','86113057','dsoza@gmail.com','De donde el gallo, cuatro cuadras al oeste','75000','Activo'),('JMORALES','2020-05-02',2,'001-120599-8974K','JAVIER','MORALES','2354-8891','78743047','jmorales@gmail.com','Ciudad Siniestra','76660','Activo'),('KSOZA','2020-05-02',1,'001-090900-1034U','KENNETH','SOZA','2251-4889','81453991','kentho9913@gmail.com','De donde fue el COSEP, tres cuadras al lago','90000','Activo');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro_mayor`
--

DROP TABLE IF EXISTS `libro_mayor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libro_mayor` (
  `idlibro_mayor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la tabla',
  `mes` varchar(10) DEFAULT NULL COMMENT 'Mes de los datos de la cuenta',
  `total_haber` float DEFAULT NULL COMMENT 'Total del haber dentro de la cuenta',
  `total_debe` float DEFAULT NULL COMMENT 'Total debe de la cuenta',
  `estado` varchar(12) DEFAULT NULL COMMENT 'estado de la cuenta ',
  `concepto_mayor` varchar(45) DEFAULT NULL COMMENT 'Anotación conceptual del registro',
  `asiento_contable` int(11) NOT NULL COMMENT 'Id del asiento contable ',
  `periodo_contable` varchar(30) NOT NULL COMMENT 'Id del período al que pertenece el libro',
  `empresa` int(11) NOT NULL COMMENT 'Id de  la empresa a la que pertenece',
  `cuenta` int(11) NOT NULL COMMENT 'id de la cuenta del libro',
  `usuario` int(11) NOT NULL COMMENT 'Id del usuario que hizo la entrada (seguridad)',
  PRIMARY KEY (`idlibro_mayor`),
  KEY `fk_libro_mayor_asiento_contable1_idx` (`asiento_contable`),
  KEY `fk_libro_mayor_periodo_contable1_idx` (`periodo_contable`),
  KEY `fk_libro_mayor_detalle_empresa1_idx` (`empresa`),
  KEY `fk_libro_mayor_catalogo_de_cuentas1_idx` (`cuenta`),
  KEY `fk_libro_mayor_usuario1_idx` (`usuario`),
  CONSTRAINT `fk_libro_mayor_asiento_contable1` FOREIGN KEY (`asiento_contable`) REFERENCES `asiento_contable` (`idasiento_contable`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_libro_mayor_catalogo_de_cuentas1` FOREIGN KEY (`cuenta`) REFERENCES `catalogo_de_cuentas` (`idcatalogo_de_cuentas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_libro_mayor_detalle_empresa1` FOREIGN KEY (`empresa`) REFERENCES `detalle_empresa` (`idempresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_libro_mayor_periodo_contable1` FOREIGN KEY (`periodo_contable`) REFERENCES `periodo_contable` (`idperiodo_contable`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_libro_mayor_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='Tabla que contiene los datos del libro mayor';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro_mayor`
--

LOCK TABLES `libro_mayor` WRITE;
/*!40000 ALTER TABLE `libro_mayor` DISABLE KEYS */;
INSERT INTO `libro_mayor` VALUES (1,'MAYO',50,50,'Activo','Esta es una prueba xd',1,'MAY2020',1,3,1),(2,'MAYO',50,150,'Activo','Esta es una prueba',2,'MAY2020',1,2,1);
/*!40000 ALTER TABLE `libro_mayor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moneda`
--

DROP TABLE IF EXISTS `moneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moneda` (
  `idmoneda` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la tabla',
  `nombre_moneda` varchar(45) NOT NULL COMMENT 'El nombre de la moneda',
  `cod_iso` varchar(5) NOT NULL COMMENT 'Código ISO de la moneda ',
  `pais` varchar(35) NOT NULL COMMENT 'País de origen del moneda en cuestión',
  `tasa_conversion` float NOT NULL COMMENT 'Conversión de la moneda espcificada',
  `estado` varchar(12) NOT NULL COMMENT 'Estado de la moneda, activo o inactivo',
  `usuario` int(11) NOT NULL COMMENT 'Id del usuario, para verificar los cambios que se hagan en la tabla',
  PRIMARY KEY (`idmoneda`),
  KEY `fk_moneda_usuario1_idx` (`usuario`),
  CONSTRAINT `fk_moneda_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='Tabla de cambio de moneda';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moneda`
--

LOCK TABLES `moneda` WRITE;
/*!40000 ALTER TABLE `moneda` DISABLE KEYS */;
INSERT INTO `moneda` VALUES (4,'CÓRDOBA','NIO','NICARAGUA',1,'Activo',1),(5,'DÓLAR ESTADOUNIDENSE','USD','ESTADOS UNIDOS',34.55,'Activo',1),(6,'COLON','CRC','COSTA RICA',0.061,'Activo',1);
/*!40000 ALTER TABLE `moneda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `naturaleza`
--

DROP TABLE IF EXISTS `naturaleza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `naturaleza` (
  `idnaturaleza` int(11) NOT NULL COMMENT 'El id de la tabla',
  `nombre_naturaleza` varchar(20) NOT NULL COMMENT 'El nombre de naturaleza',
  `descripcion_naturaleza` varchar(45) NOT NULL COMMENT 'La descripción de la naturaleza',
  `estado` varchar(12) DEFAULT NULL COMMENT 'Estado de la naturaleza 1 para activo 0 para inactivo',
  PRIMARY KEY (`idnaturaleza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla donde se almacenan los tipos de naturalezas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `naturaleza`
--

LOCK TABLES `naturaleza` WRITE;
/*!40000 ALTER TABLE `naturaleza` DISABLE KEYS */;
INSERT INTO `naturaleza` VALUES (1,'Deudora','Indica que una cuenta es de naturaleza pasiva','Activa'),(2,'Acreedora','Indica que una cuenta es de naturaleza pasiva','Activa');
/*!40000 ALTER TABLE `naturaleza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcion`
--

DROP TABLE IF EXISTS `opcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcion` (
  `idopcion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de la tabla',
  `nombre_opcion` varchar(40) NOT NULL COMMENT 'nombre de la opcion disponible',
  `formulario_opcion` varchar(40) NOT NULL COMMENT 'el fomrmulario que da acceso la opcion',
  `estado` varchar(12) NOT NULL COMMENT 'Estado de la opción, activo o inactivo\n',
  PRIMARY KEY (`idopcion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='Opciones disponibles dentro del programa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcion`
--

LOCK TABLES `opcion` WRITE;
/*!40000 ALTER TABLE `opcion` DISABLE KEYS */;
INSERT INTO `opcion` VALUES (1,'Opción Formulario Menú Principal','Menú Principal','Activo'),(2,'Opción Catálogo de Cuentas','Gestión de catálogo de cuenta','Activo');
/*!40000 ALTER TABLE `opcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodo_contable`
--

DROP TABLE IF EXISTS `periodo_contable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periodo_contable` (
  `idperiodo_contable` varchar(30) NOT NULL COMMENT 'Id del período contable',
  `fecha_inicio` date NOT NULL COMMENT 'la fecha que inicia el período contable',
  `fecha_fin` date NOT NULL COMMENT 'la fecha en que culmina el período contable',
  `estado` varchar(12) DEFAULT NULL COMMENT 'esto del periodo contable, activo o inactivo',
  `empresa` int(11) NOT NULL COMMENT 'id de la empresa',
  `usuario` int(11) NOT NULL COMMENT 'id del usuario, mayormente para seguiradad, es decir registra el id del usuario que ingreo el período contable',
  PRIMARY KEY (`idperiodo_contable`),
  KEY `fk_periodo_contable_detalle_empresa1_idx` (`empresa`),
  KEY `fk_periodo_contable_usuario1_idx` (`usuario`),
  CONSTRAINT `fk_periodo_contable_detalle_empresa1` FOREIGN KEY (`empresa`) REFERENCES `detalle_empresa` (`idempresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_periodo_contable_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla donde se almacena la información de los períodos contables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodo_contable`
--

LOCK TABLES `periodo_contable` WRITE;
/*!40000 ALTER TABLE `periodo_contable` DISABLE KEYS */;
INSERT INTO `periodo_contable` VALUES ('JUN2020','2020-06-01','2020-06-30','Activo',1,1),('MAY2020','2020-05-01','2020-05-31','Activo',1,1);
/*!40000 ALTER TABLE `periodo_contable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de la tabla',
  `nombre_rol` varchar(30) NOT NULL COMMENT 'Nombre del rol',
  `estado` varchar(12) NOT NULL COMMENT 'estado del rol, activo o inactivo\n',
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='Tabla de roles del sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Gerente General','Activo'),(2,'Asistente de Bodega','Activo'),(3,'Administrador','Activo'),(4,'Asistente','Activo'),(5,'Auxiliar','Activo'),(6,'Vendedor','Activo'),(7,'Contador','Activo');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_opcion`
--

DROP TABLE IF EXISTS `rol_opcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol_opcion` (
  `idrol_opcion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID de la tabla',
  `estado` varchar(12) NOT NULL COMMENT 'estado si esta activo o inactivo',
  `fechacreacion` date NOT NULL COMMENT 'fecha de asignaciones de opciones segun rol',
  `rol` int(11) NOT NULL COMMENT 'id del rol',
  `opcion` int(11) NOT NULL COMMENT 'el id de la opcion',
  PRIMARY KEY (`idrol_opcion`),
  KEY `fk_rol_opcion_rol1_idx` (`rol`),
  KEY `fk_rol_opcion_opcion1_idx` (`opcion`),
  CONSTRAINT `fk_rol_opcion_opcion1` FOREIGN KEY (`opcion`) REFERENCES `opcion` (`idopcion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rol_opcion_rol1` FOREIGN KEY (`rol`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='Tabla de las opciones por rol';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_opcion`
--

LOCK TABLES `rol_opcion` WRITE;
/*!40000 ALTER TABLE `rol_opcion` DISABLE KEYS */;
INSERT INTO `rol_opcion` VALUES (1,'Activo','2020-05-05',1,1),(2,'Activo','2020-05-05',1,2);
/*!40000 ALTER TABLE `rol_opcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla',
  `usuario` varchar(15) NOT NULL COMMENT 'usuario que utilizara el empleado',
  `contrasenia` varchar(10) NOT NULL COMMENT 'contraseña que el empleado coloca a su usuario',
  `fechacreacion` date NOT NULL COMMENT 'Como su nombre indica, la fecha de creacion del usuario',
  `estado` varchar(12) NOT NULL COMMENT 'El estado del usuario, activo o inactivo',
  `empleado` varchar(10) NOT NULL COMMENT 'Id del empleado al que pertenece la cuenta',
  `empresa` int(11) NOT NULL COMMENT 'Id de la empresa al que pertenece la cuenta',
  PRIMARY KEY (`idusuario`),
  KEY `fk_usuario_empleado1_idx` (`empleado`),
  KEY `fk_usuario_detalle_empresa1_idx` (`empresa`),
  CONSTRAINT `fk_usuario_detalle_empresa1` FOREIGN KEY (`empresa`) REFERENCES `detalle_empresa` (`idempresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_empleado1` FOREIGN KEY (`empleado`) REFERENCES `empleado` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='Tabla del esquema de seguridad';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'ksoza','nose','2020-05-07','Activo','KSOZA',1),(2,'dsoza','nosexd','2020-05-07','Activo','DSOZA',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_rol`
--

DROP TABLE IF EXISTS `usuario_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_rol` (
  `idusuario_rol` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de la tabla',
  `fechacreacion` date DEFAULT NULL COMMENT 'Fecha en la que se asigno un rol a un usuario',
  `usuario` int(11) NOT NULL COMMENT 'id del usuario',
  `rol` int(11) NOT NULL COMMENT 'id del rol del usuario',
  `estado` varchar(12) NOT NULL COMMENT 'estado, activo o inactivo',
  PRIMARY KEY (`idusuario_rol`),
  KEY `fk_usuario_rol_usuario_idx` (`usuario`),
  KEY `fk_usuario_rol_rol1_idx` (`rol`),
  CONSTRAINT `fk_usuario_rol_rol1` FOREIGN KEY (`rol`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_rol_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='Tabla con los roles de cada usuario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_rol`
--

LOCK TABLES `usuario_rol` WRITE;
/*!40000 ALTER TABLE `usuario_rol` DISABLE KEYS */;
INSERT INTO `usuario_rol` VALUES (1,'2020-05-07',1,1,'Activo'),(2,'2020-05-07',2,3,'Activo');
/*!40000 ALTER TABLE `usuario_rol` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-13 18:29:32

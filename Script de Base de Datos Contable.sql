-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SistemaContable
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SistemaContable
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SistemaContable` DEFAULT CHARACTER SET utf8mb4 ;
USE `SistemaContable` ;

-- -----------------------------------------------------
-- Table `SistemaContable`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaContable`.`empleado` (
  `idempleado` VARCHAR(10) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'id de la tabla',
  `fecha_ingreso` DATE NULL COMMENT 'Fecha de ingreso del empleado',
  `cedula` VARCHAR(25) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'Cedula del empleado',
  `nombre_cargo` VARCHAR(25) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NULL COMMENT 'nombre del cargo del empleado',
  `nombre_empleado` VARCHAR(30) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'nombre del empleado',
  `apellido_empleado` VARCHAR(30) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'apellido del empleado',
  `telefono_convencional_empleado` VARCHAR(10) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NULL COMMENT 'teléfono convencional o de la casa del empleado',
  `celular_empleado` VARCHAR(10) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NULL COMMENT 'telefono celular del empleado',
  `correo_empleado` VARCHAR(35) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'correo del empleado',
  `direccion_empleado` VARCHAR(145) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'Dirección del domicilio del empleado',
  `sueldo` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'sueldo del empleado',
  `estado` VARCHAR(12) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'Estado del empleado, activo o inactivo',
  PRIMARY KEY (`idempleado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = 'Tabla con la información de los empleados';


-- -----------------------------------------------------
-- Table `SistemaContable`.`detalle_empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaContable`.`detalle_empresa` (
  `idempresa` INT NOT NULL AUTO_INCREMENT COMMENT 'id de la tabla',
  `nombre_empresa` VARCHAR(25) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'nombre de la empresa',
  `nombre_comercial` VARCHAR(25) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'nombre de la surcusal',
  `direccion_empresa` VARCHAR(145) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'DIrección de la surcusal o empresa',
  `departamento_empresa` VARCHAR(30) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'departamento de la sucursal o empresa',
  `correo_empresa` VARCHAR(35) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'Correo de la sucursal o empresa',
  `estado` VARCHAR(12) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'Estado de la empresa o surcusal',
  PRIMARY KEY (`idempresa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = 'detalles de los establecimientos y otras cuestiones de la empresa';


-- -----------------------------------------------------
-- Table `SistemaContable`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaContable`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla',
  `usuario` VARCHAR(15) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'usuario que utilizara el empleado',
  `contraseña` VARCHAR(10) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'contraseña que el empleado coloca a su usuario',
  `fechacreacion` DATE NOT NULL COMMENT 'Como su nombre indica, la fecha de creacion del usuario',
  `estado` VARCHAR(12) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'El estado del usuario, activo o inactivo',
  `empleado` VARCHAR(10) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'Id del empleado al que pertenece la cuenta',
  `empresa` INT NOT NULL COMMENT 'Id de la empresa al que pertenece la cuenta',
  PRIMARY KEY (`idusuario`, `empleado`, `empresa`),
  INDEX `fk_usuario_empleado1_idx` (`empleado` ASC),
  INDEX `fk_usuario_detalle_empresa1_idx` (`empresa` ASC),
  CONSTRAINT `fk_usuario_empleado1`
    FOREIGN KEY (`empleado`)
    REFERENCES `SistemaContable`.`empleado` (`idempleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_detalle_empresa1`
    FOREIGN KEY (`empresa`)
    REFERENCES `SistemaContable`.`detalle_empresa` (`idempresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = 'Tabla del esquema de seguridad';


-- -----------------------------------------------------
-- Table `SistemaContable`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaContable`.`rol` (
  `idrol` INT NOT NULL AUTO_INCREMENT COMMENT 'id de la tabla',
  `nombre_rol` VARCHAR(15) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'Nombre del rol',
  `estado` VARCHAR(12) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'estado del rol, activo o inactivo\n',
  PRIMARY KEY (`idrol`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = 'Tabla de roles del sistema';


-- -----------------------------------------------------
-- Table `SistemaContable`.`usuario_rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaContable`.`usuario_rol` (
  `idusuario_rol` INT NOT NULL AUTO_INCREMENT COMMENT 'id de la tabla',
  `fechacreacion` DATE NULL COMMENT 'Fecha en la que se asigno un rol a un usuario',
  `usuario` INT NOT NULL COMMENT 'id del usuario',
  `rol` INT NOT NULL COMMENT 'id del rol del usuario',
  `estado` VARCHAR(12) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'estado, activo o inactivo',
  PRIMARY KEY (`idusuario_rol`, `usuario`, `rol`),
  INDEX `fk_usuario_rol_usuario_idx` (`usuario` ASC),
  INDEX `fk_usuario_rol_rol1_idx` (`rol` ASC),
  CONSTRAINT `fk_usuario_rol_usuario`
    FOREIGN KEY (`usuario`)
    REFERENCES `SistemaContable`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_rol_rol1`
    FOREIGN KEY (`rol`)
    REFERENCES `SistemaContable`.`rol` (`idrol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = 'Tabla con los roles de cada usuario';


-- -----------------------------------------------------
-- Table `SistemaContable`.`opcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaContable`.`opcion` (
  `idopcion` INT NOT NULL AUTO_INCREMENT COMMENT 'id de la tabla',
  `nombre_opcion` VARCHAR(15) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'nombre de la opcion disponible',
  `formulario_opcion` VARCHAR(25) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'el fomrmulario que da acceso la opcion',
  `estado` VARCHAR(12) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'Estado de la opción, activo o inactivo\n',
  PRIMARY KEY (`idopcion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = 'Opciones disponibles dentro del programa';


-- -----------------------------------------------------
-- Table `SistemaContable`.`rol_opcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaContable`.`rol_opcion` (
  `idrol_opcion` INT NOT NULL AUTO_INCREMENT COMMENT 'ID de la tabla',
  `estado` VARCHAR(12) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'estado si esta activo o inactivo',
  `fechacreacion` DATE NOT NULL COMMENT 'fecha de asignaciones de opciones segun rol',
  `rol` INT NOT NULL COMMENT 'id del rol',
  `opcion` INT NOT NULL COMMENT 'el id de la opcion',
  PRIMARY KEY (`idrol_opcion`, `rol`, `opcion`),
  INDEX `fk_rol_opcion_rol1_idx` (`rol` ASC),
  INDEX `fk_rol_opcion_opcion1_idx` (`opcion` ASC),
  CONSTRAINT `fk_rol_opcion_rol1`
    FOREIGN KEY (`rol`)
    REFERENCES `SistemaContable`.`rol` (`idrol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rol_opcion_opcion1`
    FOREIGN KEY (`opcion`)
    REFERENCES `SistemaContable`.`opcion` (`idopcion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = 'Tabla de las opciones por rol';


-- -----------------------------------------------------
-- Table `SistemaContable`.`moneda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaContable`.`moneda` (
  `idmoneda` INT NOT NULL AUTO_INCREMENT COMMENT 'Id de la tabla',
  `nombre_moneda` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'El nombre de la moneda',
  `cod_iso` VARCHAR(3) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'Código ISO de la moneda ',
  `pais` VARCHAR(35) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'País de origen del moneda en cuestión',
  `tasa_conversion` FLOAT NOT NULL COMMENT 'Conversión de la moneda espcificada',
  `estado` VARCHAR(12) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'Estado de la moneda, activo o inactivo',
  `usuario` INT NOT NULL COMMENT 'Id del usuario, para verificar los cambios que se hagan en la tabla',
  PRIMARY KEY (`idmoneda`, `usuario`),
  INDEX `fk_moneda_usuario1_idx` (`usuario` ASC),
  CONSTRAINT `fk_moneda_usuario1`
    FOREIGN KEY (`usuario`)
    REFERENCES `SistemaContable`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = 'Tabla de cambio de moneda';


-- -----------------------------------------------------
-- Table `SistemaContable`.`naturaleza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaContable`.`naturaleza` (
  `idnaturaleza` INT NOT NULL COMMENT 'El id de la tabla',
  `nombre_naturaleza` VARCHAR(20) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'El nombre de naturaleza',
  `descripcion_naturaleza` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'La descripción de la naturaleza',
  `estado` VARCHAR(12) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NULL COMMENT 'Estado de la naturaleza 1 para activo 0 para inactivo',
  PRIMARY KEY (`idnaturaleza`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = 'Tabla donde se almacenan los tipos de naturalezas';


-- -----------------------------------------------------
-- Table `SistemaContable`.`catalogo_de_cuentas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaContable`.`catalogo_de_cuentas` (
  `idcatalogo_de_cuentas` INT NOT NULL AUTO_INCREMENT COMMENT 'ID de la tabla',
  `numero_cuenta` VARCHAR(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'El número que la empresa le proporcionan a la cuenta',
  `nombre__cuenta` VARCHAR(20) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'Nombre de la cuenta',
  `descripcion_cuenta` VARCHAR(40) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'Descripción de la cuenta',
  `estado` VARCHAR(12) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'estado de la cuenta activo o inactivo',
  `pais` VARCHAR(35) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'pais de la cuenta',
  `cuenta_padre` INT NULL COMMENT 'Dato que convierte a esta tabla en una recursiva, este dato indica si es la padre de una subcuenta,\npuede ser nulo',
  `usuario` INT NOT NULL COMMENT 'Id del usuario que creo la cuenta',
  `naturaleza` INT NOT NULL COMMENT 'Id de la naturaleza de la cuenta',
  `empresa` INT NOT NULL COMMENT 'Id de la empresa o surcusal al que pertenece la cuenta',
  PRIMARY KEY (`idcatalogo_de_cuentas`, `usuario`, `naturaleza`, `empresa`),
  INDEX `fk_catalogo_de_cuentas_catalogo_de_cuentas1_idx` (`cuenta_padre` ASC),
  INDEX `fk_catalogo_de_cuentas_usuario1_idx` (`usuario` ASC),
  INDEX `fk_catalogo_de_cuentas_naturaleza1_idx` (`naturaleza` ASC),
  INDEX `fk_catalogo_de_cuentas_detalle_empresa1_idx` (`empresa` ASC),
  CONSTRAINT `fk_catalogo_de_cuentas_catalogo_de_cuentas1`
    FOREIGN KEY (`cuenta_padre`)
    REFERENCES `SistemaContable`.`catalogo_de_cuentas` (`idcatalogo_de_cuentas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_catalogo_de_cuentas_usuario1`
    FOREIGN KEY (`usuario`)
    REFERENCES `SistemaContable`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_catalogo_de_cuentas_naturaleza1`
    FOREIGN KEY (`naturaleza`)
    REFERENCES `SistemaContable`.`naturaleza` (`idnaturaleza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_catalogo_de_cuentas_detalle_empresa1`
    FOREIGN KEY (`empresa`)
    REFERENCES `SistemaContable`.`detalle_empresa` (`idempresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = 'El catálogo de cuentas con los datos básicos de la cuentas.';


-- -----------------------------------------------------
-- Table `SistemaContable`.`asiento_contable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaContable`.`asiento_contable` (
  `idasiento_contable` INT NOT NULL AUTO_INCREMENT COMMENT 'Id del asiento contable',
  `codigo_asiento` VARCHAR(30) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'El código que la empresa le brinda al asiento contable',
  `codigo_cuenta_debe` VARCHAR(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NULL COMMENT 'Código de la cuenta del debe',
  `importe_debe` DOUBLE NULL COMMENT 'El importe debe que se reflejara en la cuenta ',
  `codigo_cuenta_haber` VARCHAR(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NULL COMMENT 'código de la cuenta del haber',
  `importe_haber` DOUBLE NULL COMMENT 'El importe del haber que se reflejara en la cuenta',
  `estado` VARCHAR(12) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'estado del asiento contable, activo o inactivo\n',
  `fecha_del_asiento` DATE NOT NULL COMMENT 'fecha en la que se realiza el asiento',
  `usuario` INT NOT NULL COMMENT 'Id del usuario que realizo el asiento (seguridad)',
  `cuenta` INT NOT NULL COMMENT 'Id de la cuenta a la que se le esta haciendo el asiento contable',
  `empresa` INT NOT NULL COMMENT 'Id de la empresa o surcusal que hace el asiento contable',
  PRIMARY KEY (`idasiento_contable`, `usuario`, `cuenta`, `empresa`),
  INDEX `fk_asiento_contable_usuario1_idx` (`usuario` ASC),
  INDEX `fk_asiento_contable_catalogo_de_cuentas1_idx` (`cuenta` ASC),
  INDEX `fk_asiento_contable_detalle_empresa1_idx` (`empresa` ASC),
  CONSTRAINT `fk_asiento_contable_usuario1`
    FOREIGN KEY (`usuario`)
    REFERENCES `SistemaContable`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_asiento_contable_catalogo_de_cuentas1`
    FOREIGN KEY (`cuenta`)
    REFERENCES `SistemaContable`.`catalogo_de_cuentas` (`idcatalogo_de_cuentas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_asiento_contable_detalle_empresa1`
    FOREIGN KEY (`empresa`)
    REFERENCES `SistemaContable`.`detalle_empresa` (`idempresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = 'Tabla con los datos del asiento contable';


-- -----------------------------------------------------
-- Table `SistemaContable`.`periodo_contable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaContable`.`periodo_contable` (
  `idperiodo_contable` VARCHAR(30) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'Id del período contable',
  `fecha_inicio` DATE NOT NULL COMMENT 'la fecha que inicia el período contable',
  `fecha_fin` DATE NOT NULL COMMENT 'la fecha en que culmina el período contable',
  `estado` VARCHAR(12) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NULL COMMENT 'esto del periodo contable, activo o inactivo',
  `empresa` INT NOT NULL COMMENT 'id de la empresa',
  `usuario` INT NOT NULL COMMENT 'id del usuario, mayormente para seguiradad, es decir registra el id del usuario que ingreo el período contable',
  PRIMARY KEY (`idperiodo_contable`, `empresa`, `usuario`),
  INDEX `fk_periodo_contable_detalle_empresa1_idx` (`empresa` ASC),
  INDEX `fk_periodo_contable_usuario1_idx` (`usuario` ASC),
  CONSTRAINT `fk_periodo_contable_detalle_empresa1`
    FOREIGN KEY (`empresa`)
    REFERENCES `SistemaContable`.`detalle_empresa` (`idempresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_periodo_contable_usuario1`
    FOREIGN KEY (`usuario`)
    REFERENCES `SistemaContable`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = 'Tabla donde se almacena la información de los períodos contables';


-- -----------------------------------------------------
-- Table `SistemaContable`.`comprobante_diario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaContable`.`comprobante_diario` (
  `idlibro_diario` INT NOT NULL AUTO_INCREMENT COMMENT 'Id de la tabla',
  `fecha_del_movimiento` DATE NOT NULL COMMENT 'Fecha en la que se hizo el movimiento',
  `concepto_movimiento` VARCHAR(80) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'El concepto en el que se hace el movimiento',
  `importe_debe` FLOAT NULL COMMENT 'Importe debe a la cuenta',
  `importe_haber` FLOAT NULL COMMENT 'Importe del haber de la cuenta',
  `estado` VARCHAR(12) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'Estado del comprobante diario, activo o inactivo',
  `asiento_contable` INT NOT NULL COMMENT 'Id del asiento contable al que pertenece',
  `usuario` INT NOT NULL COMMENT 'Id del usuario que hizo la entrada',
  `empresa` INT NOT NULL COMMENT 'Id de la empresa de la cual proviene la entrada',
  `cuenta` INT NOT NULL COMMENT 'Id de la cuenta',
  `periodo_contable` VARCHAR(30) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'Id del período al que pertenece la entrada',
  PRIMARY KEY (`idlibro_diario`, `asiento_contable`, `usuario`, `empresa`, `cuenta`, `periodo_contable`),
  INDEX `fk_comprobante_diario_asiento_contable1_idx` (`asiento_contable` ASC),
  INDEX `fk_comprobante_diario_usuario1_idx` (`usuario` ASC),
  INDEX `fk_comprobante_diario_detalle_empresa1_idx` (`empresa` ASC),
  INDEX `fk_comprobante_diario_catalogo_de_cuentas1_idx` (`cuenta` ASC),
  INDEX `fk_comprobante_diario_periodo_contable1_idx` (`periodo_contable` ASC),
  CONSTRAINT `fk_comprobante_diario_asiento_contable1`
    FOREIGN KEY (`asiento_contable`)
    REFERENCES `SistemaContable`.`asiento_contable` (`idasiento_contable`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comprobante_diario_usuario1`
    FOREIGN KEY (`usuario`)
    REFERENCES `SistemaContable`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comprobante_diario_detalle_empresa1`
    FOREIGN KEY (`empresa`)
    REFERENCES `SistemaContable`.`detalle_empresa` (`idempresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comprobante_diario_catalogo_de_cuentas1`
    FOREIGN KEY (`cuenta`)
    REFERENCES `SistemaContable`.`catalogo_de_cuentas` (`idcatalogo_de_cuentas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comprobante_diario_periodo_contable1`
    FOREIGN KEY (`periodo_contable`)
    REFERENCES `SistemaContable`.`periodo_contable` (`idperiodo_contable`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = 'Tabla con los datos del libro diario';


-- -----------------------------------------------------
-- Table `SistemaContable`.`libro_mayor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaContable`.`libro_mayor` (
  `idlibro_mayor` INT NOT NULL COMMENT 'Id de la tabla',
  `mes` VARCHAR(10) NULL COMMENT 'Mes de los datos de la cuenta',
  `total_haber` FLOAT NULL COMMENT 'Total del haber dentro de la cuenta',
  `total_debe` FLOAT NULL COMMENT 'Total debe de la cuenta',
  `estado` VARCHAR(12) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NULL COMMENT 'estado de la cuenta ',
  `concepto_mayor` VARCHAR(45) NULL COMMENT 'Anotación conceptual del registro',
  `asiento_contable` INT NOT NULL COMMENT 'Id del asiento contable ',
  `periodo_contable` VARCHAR(30) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL COMMENT 'Id del período al que pertenece el libro',
  `empresa` INT NOT NULL COMMENT 'Id de  la empresa a la que pertenece',
  `cuenta` INT NOT NULL COMMENT 'id de la cuenta del libro',
  `usuario` INT NOT NULL COMMENT 'Id del usuario que hizo la entrada (seguridad)',
  PRIMARY KEY (`idlibro_mayor`, `asiento_contable`, `periodo_contable`, `empresa`, `cuenta`, `usuario`),
  INDEX `fk_libro_mayor_asiento_contable1_idx` (`asiento_contable` ASC),
  INDEX `fk_libro_mayor_periodo_contable1_idx` (`periodo_contable` ASC),
  INDEX `fk_libro_mayor_detalle_empresa1_idx` (`empresa` ASC),
  INDEX `fk_libro_mayor_catalogo_de_cuentas1_idx` (`cuenta` ASC),
  INDEX `fk_libro_mayor_usuario1_idx` (`usuario` ASC),
  CONSTRAINT `fk_libro_mayor_asiento_contable1`
    FOREIGN KEY (`asiento_contable`)
    REFERENCES `SistemaContable`.`asiento_contable` (`idasiento_contable`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_libro_mayor_periodo_contable1`
    FOREIGN KEY (`periodo_contable`)
    REFERENCES `SistemaContable`.`periodo_contable` (`idperiodo_contable`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_libro_mayor_detalle_empresa1`
    FOREIGN KEY (`empresa`)
    REFERENCES `SistemaContable`.`detalle_empresa` (`idempresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_libro_mayor_catalogo_de_cuentas1`
    FOREIGN KEY (`cuenta`)
    REFERENCES `SistemaContable`.`catalogo_de_cuentas` (`idcatalogo_de_cuentas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_libro_mayor_usuario1`
    FOREIGN KEY (`usuario`)
    REFERENCES `SistemaContable`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = 'Tabla que contiene los datos del libro mayor';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

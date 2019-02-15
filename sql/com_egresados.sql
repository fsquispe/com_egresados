-- -----------------------------------------------------
-- Table jos_egresados_tSemestre
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS jos_egresados_tSemestre (
  codSemestre INT NOT NULL AUTO_INCREMENT ,
  nombre VARCHAR(10) NOT NULL ,
  PRIMARY KEY (codSemestre) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table jos_egresados_tEgresado
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS jos_egresados_tEgresado (
  codEgresado VARCHAR(6) NOT NULL ,
  codCuenta INT NOT NULL ,
  nombre VARCHAR(45) NOT NULL ,
  apellidoPaterno VARCHAR(60) NOT NULL ,
  apellidoMaterno VARCHAR(60) NOT NULL ,
  anyoIngreso INT(4) NOT NULL ,
  anyoEgreso INT(4) NOT NULL ,
  codSemestre INT NOT NULL ,
  PRIMARY KEY (codEgresado) ,
  INDEX fk_jos_egresados_tEgresado_jos_egresados_tSemestre1 (codSemestre ASC) ,
  CONSTRAINT fk_jos_egresados_tEgresado_jos_egresados_tSemestre1
    FOREIGN KEY (codSemestre ) REFERENCES jos_egresados_tSemestre (codSemestre ) ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table jos_egresados_tPais
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS jos_egresados_tPais (
  codPais INT NOT NULL AUTO_INCREMENT ,
  nombre VARCHAR(25) NOT NULL ,
  PRIMARY KEY (codPais) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table jos_egresados_tEstadoCivil
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS jos_egresados_tEstadoCivil (
  codEstadoCivil INT NOT NULL AUTO_INCREMENT ,
  nombre VARCHAR(15) NOT NULL ,
  PRIMARY KEY (codEstadoCivil) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table jos_egresados_tDatosAdicionales
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS jos_egresados_tDatosAdicionales (
  codDatosAdicionales INT NOT NULL AUTO_INCREMENT ,
  codAlumno VARCHAR(6) NOT NULL ,
  fechaNacimiento INT NOT NULL ,
  lugarNacimiento VARCHAR(45) NOT NULL ,
  codPais INT NOT NULL ,
  direccion VARCHAR(100) NOT NULL ,
  codEstadoCivil INT NOT NULL ,
  telefonoFijo VARCHAR(15) NOT NULL ,
  telefonoMovil VARCHAR(15) NOT NULL ,
  website VARCHAR(100) NOT NULL ,
  acercaDeEgresado VARCHAR(250) NOT NULL ,
  PRIMARY KEY (codDatosAdicionales) ,
  INDEX fk_jos_egresados_tDatosAdicionales_jos_egresados_tEgresado (codAlumno ASC) ,
  INDEX fk_jos_egresados_tDatosAdicionales_jos_egresados_tPais1 (codPais ASC) ,
  INDEX fk_jos_egresados_tDatosAdicionales_jos_egresados_tEstadoCivil1 (codEstadoCivil ASC) ,
  UNIQUE INDEX codAlumno_UNIQUE (codAlumno ASC) ,
  CONSTRAINT fk_jos_egresados_tDatosAdicionales_jos_egresados_tEgresado
    FOREIGN KEY (codAlumno )
    REFERENCES jos_egresados_tEgresado (codEgresado )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_jos_egresados_tDatosAdicionales_jos_egresados_tPais1
    FOREIGN KEY (codPais )
    REFERENCES jos_egresados_tPais (codPais )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_jos_egresados_tDatosAdicionales_jos_egresados_tEstadoCivil1
    FOREIGN KEY (codEstadoCivil )
    REFERENCES jos_egresados_tEstadoCivil (codEstadoCivil )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table jos_egresados_tTipoCurso
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS jos_egresados_tTipoCurso (
  codTipoCurso INT NOT NULL AUTO_INCREMENT ,
  nombre VARCHAR(45) NOT NULL ,
  PRIMARY KEY (codTipoCurso) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table jos_egresados_tTipoMedicion
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS jos_egresados_tTipoMedicion (
  codTipoMedicion INT NOT NULL AUTO_INCREMENT ,
  nombre VARCHAR(25) NOT NULL ,
  PRIMARY KEY (codTipoMedicion) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table jos_egresados_tEstudio
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS jos_egresados_tEstudio (
  codEstudio INT NOT NULL AUTO_INCREMENT ,
  codAlumno VARCHAR(6) NOT NULL ,
  nombre VARCHAR(100) NOT NULL ,
  codTipoCurso INT NOT NULL ,
  codPais INT NOT NULL ,
  duracion INT NOT NULL ,
  codTipoMedicion INT NOT NULL ,
  fechaInicio INT NOT NULL ,
  fechaFin INT NOT NULL ,
  PRIMARY KEY (codEstudio) ,
  INDEX fk_jos_egresados_tEstudio_jos_egresados_tEgresado1 (codAlumno ASC) ,
  INDEX fk_jos_egresados_tEstudio_jos_egresados_tTipoCurso1 (codTipoCurso ASC) ,
  INDEX fk_jos_egresados_tEstudio_jos_egresados_tPais1 (codPais ASC) ,
  INDEX fk_jos_egresados_tEstudio_jos_egresados_tTipoMedicion1 (codTipoMedicion ASC) ,
  CONSTRAINT fk_jos_egresados_tEstudio_jos_egresados_tEgresado1
    FOREIGN KEY (codAlumno )
    REFERENCES jos_egresados_tEgresado (codEgresado )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_jos_egresados_tEstudio_jos_egresados_tTipoCurso1
    FOREIGN KEY (codTipoCurso )
    REFERENCES jos_egresados_tTipoCurso (codTipoCurso )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_jos_egresados_tEstudio_jos_egresados_tPais1
    FOREIGN KEY (codPais )
    REFERENCES jos_egresados_tPais (codPais )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_jos_egresados_tEstudio_jos_egresados_tTipoMedicion1
    FOREIGN KEY (codTipoMedicion )
    REFERENCES jos_egresados_tTipoMedicion (codTipoMedicion )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table jos_egresados_tTrabajo
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS jos_egresados_tTrabajo (
  codTrabajo INT NOT NULL AUTO_INCREMENT ,
  codEgresado VARCHAR(6) NOT NULL ,
  nombreEmpresa VARCHAR(45) NOT NULL ,
  puesto VARCHAR(45) NOT NULL ,
  rubro VARCHAR(35) NOT NULL ,
  responsabilidades VARCHAR(45) NOT NULL ,
  codPais INT NOT NULL ,
  fechaInicio INT NOT NULL ,
  fechaFin INT NOT NULL ,
  PRIMARY KEY (codTrabajo) ,
  INDEX fk_jos_egresados_tTrabajo_jos_egresados_tEgresado1 (codEgresado ASC) ,
  INDEX fk_jos_egresados_tTrabajo_jos_egresados_tPais1 (codPais ASC) ,
  CONSTRAINT fk_jos_egresados_tTrabajo_jos_egresados_tEgresado1
    FOREIGN KEY (codEgresado )
    REFERENCES jos_egresados_tEgresado (codEgresado )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_jos_egresados_tTrabajo_jos_egresados_tPais1
    FOREIGN KEY (codPais )
    REFERENCES jos_egresados_tPais (codPais )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


/******************DATOS***************/

INSERT INTO jos_egresados_tSemestre (nombre) VALUES ('--');

INSERT INTO jos_egresados_tSemestre (nombre) VALUES
('2005-I'),
('2005-II'),
('2006-I'),
('2006-II'),
('2007-I'),
('2007-II'),
('2008-I'),
('2008-II'),
('2009-I'),
('2009-II'),
('2010-I'),
('2010-II'),
('2011-I'),
('2011-II');

INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('060585', 'VICTOR GABRIEL', 'JALISTO', 'CAMACHO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050473', 'BORIS', 'CHULLO', 'LLAVE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050469', 'ALFREDO', 'CCASA', 'CONDORI',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('060149', 'JOHN EDGAR', 'VARGAS', 'MUÑOZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('060145', 'WILFREDO', 'MARQUEZ', 'BOZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('070712', 'MILAGROS', 'MORON', 'QUISPE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050489', 'LUIS ANGEL', 'RONDON', 'CONDORI',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050471', 'JUAN JESUS', 'CRUZ', 'CARTAJENA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('030162', 'WILLY GUSTAVO', 'UGARTE', 'ROJAS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('030416', 'LUIS CARLOS', 'ATAYUPANQUI', 'GARCIA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050498', 'WILLIAM DAVID', 'VARGAS', 'MUÑOZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('062857', 'LISETH URPY', 'SEGUNDO', 'CARPIO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('070687', 'RICHARD ALEXANDER', 'CASTRO', 'MAMANI',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('051697', 'SHIRLEY RUTH', 'VELAZQUE', 'ROJAS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010550', 'PABLO CESAR', 'ZEA', 'ARANIBAR',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('060578', 'PAUL', 'FLORES', 'CRUZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('041575', 'ANAIS FIORELA', 'LUNA', 'ESTRADA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('041577', 'CARLA ROCIO', 'TUNQUI', 'NEIRA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('043038', 'RUBEN', 'CRUZ', 'HUACARPUMA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050501', 'GABRIELA', 'ZUÑIGA', 'ROJAS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010529', 'ROCIO DEL PILAR', 'HUISA', 'MANZANARES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('060569', 'ANA ROCIO', 'CARDENAS', 'MAITA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('040370', 'ERNESTO RAIMER', 'CRUZ', 'MOLLAPAZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('052106', 'ROY', 'DELGADO', 'HERRERA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050476', 'MIJAIL', 'GAMARRA', 'HOLGUIN',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('043037', 'HUGO', 'CONTRERAS', 'ESPINOZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050493', 'DIEGO ARMANDO', 'TORRES', 'APAZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('051694', 'LUZ INDIRA', 'TICONA', 'FELIX',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('060566', 'NURIA', 'ARAOZ', 'TARCO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('070719', 'JAIRO WILFREDO', 'PUENTE DE LA VEGA', 'CHAVEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990634', 'LUIS MANUEL', 'GUILLEN', 'VILLAFUERTE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('042272', 'GILMAR OCTAVIO', 'CORIMANYA', 'QUISPE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('032116', 'KATYA JHISNEY', 'AQUEHUA', 'TARCO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('020558', 'GIZUMI', 'LAVILLA', 'QUISPE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('052108', 'PAUL PABEL', 'HINOJOSA', 'HUAMAN',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('042275', 'WILLIAN', 'MAMANI', 'LOAYZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('022177', 'NILTON ALEX', 'ROSAS', 'GUTIERREZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('032644', 'HOLGUER', 'BORDA', 'LUZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980483', 'CHRISTIAN ALFONSO', 'CARDENAS', 'BEJAR',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050481', 'GUIDO', 'MAMANI', 'CCALLACCASI',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010545', 'PAUL', 'SANCHEZ', 'CASTRO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990624', 'JONEL', 'CCENTE', 'ZUZUNAGA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990653', 'JENIFFER RAQUEL', 'SANDY', 'TORRES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010536', 'FANNY', 'NINA', 'PARAVECINO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990662', 'DORA ALCIRA', 'VASQUEZ', 'AGUILAR',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('032654', 'BORIS', 'VERA', 'QUISPE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('012123', 'OSCAR PORFIRIO', 'YUPANQUI', 'HUAMAN',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('002081', 'CHRISTIAN HELER', 'CHEVARRIA', 'MAR',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('022163', 'VERONIKA', 'GALLEGOS', 'AYBAR',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('030161', 'REYBER YURI', 'PALMA', 'QUISPE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('030418', 'JAQUELINE KAREN', 'CCANA', 'PARRA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('031137', 'HUGO JOEL', 'QUISPE', 'ONOFRE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('032653', 'LEWIS EDHER', 'VALENZUELA', 'ALEGRIA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('051687', 'MARY HELEN', 'CONZA', 'BERROCAL',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('073323', 'SHEILA KATHERINE', 'VENERO', 'FERRO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010533', 'WILSON', 'MONTALVO', 'GUEVARA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001673', 'JORGE WASHINGTON', 'RUIZ CARO', 'LARREA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('002082', 'UBERTO CESAR', 'GONZALEZ', 'BENDEZU',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003022', 'JHON DANY', 'MAMANI', 'CANAHUIRE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('941705', 'FANY', 'ARROYO', 'ACOSTUPA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('941708', 'FELICIA', 'BOCANGEL', 'VILLENA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('941728', 'EDITH', 'QUISPE', 'HOLGADO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('030158', 'FRISEIDA', 'AGUILAR', 'PINTO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('052105', 'RUFO', 'BOLIVAR', 'CONDORHUAMAN',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('020206', 'GEIDY', 'HANCCO', 'QUISPE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('030421', 'JUAN MIGUEL', 'CHECCORI', 'HUARHUA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('031565', 'JORGE HENRY', 'CUENCA', 'BEJAR',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('032651', 'ALEXANDER MARIO', 'SOTO', 'BUENO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('041576', 'GEORGE ROSENDO', 'NAVARRETE', 'POLO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('962177', 'WILLIAM', 'CCENTE', 'QUIJANO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010528', 'RENE', 'HUAMANI', 'AGUILAR',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('043041', 'IVANIA', 'PEREZ', 'PORTUGAL',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990650', 'MIRIAM', 'SALAS', 'CHAMBI',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('062862', 'EDITH PAMELA', 'ZEVALLOS', 'DE LA SOTA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990622', 'JULIO', 'CASTILLO', 'TITO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('020556', 'YHON MODESTO', 'ACURIO', 'CAYTUIRO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('032124', 'JANETH DEL PILAR', 'SHAPIAMA', 'QUISPE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980489', 'CARLOS GUILLERMO', 'CHILLIHUANI', 'CANO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001672', 'FRINNE', 'ROMAN', 'CHALCO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('040988', 'ALFREDO', 'ZAVALA', 'SULCA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('060573', 'JONNY JIMMY', 'CHAMBI', 'HUILLCA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010517', 'LUIS ANGEL', 'CORDOVA', 'CUELLAR',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010524', 'SHARMELY', 'CHUCTAYA', 'ALONSO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('021058', 'GIOMAR OLIVER', 'SEQUEIROS', 'OLIVERA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('043039', 'EDWIN EDGARDO', 'LIPA', 'MERCADO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('042280', 'WILLIAN', 'ZAMALLOA', 'PARO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('021048', 'MICHAEL', 'CUBA', 'SOTELO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('021055', 'CARMEN YULI', 'QUISPE', 'HUAMAN',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('040976', 'REYNALDO', 'CACERES', 'VILLENA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('042278', 'JUAN AMILCAR', 'TTITO', 'TTITO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050485', 'FREDERICK JACINTO', 'PAUCARA', 'NUÑEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('040368', 'HANS HARLEY', 'CCACYAHUILLCA', 'BEJAR',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('981837', 'ESTHER IRENE', 'DEL ROSARIO', 'MAMANI',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050488', 'JANETH ISABEL', 'QUISPE', 'PAÑO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990643', 'NANCY', 'DELGADO', 'TAMATA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('960279', 'RIMBER', 'PAZ', 'GUZMAN',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('060577', 'CINTIA YULISA', 'FERNANDEZ', 'GUEVARA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('020208', 'EDERT', 'OCHOA', 'MUÑOZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('032117', 'MARIELA', 'ATAUSINCHI', 'FERNANDEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('040157', 'MIGUEL ANGEL', 'GALARRETA', 'VALVERDE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001671', 'YOSHIMORI', 'LAVILLA', 'QUISPE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('021045', 'DANTE RAUF', 'ANAMPA', 'CONTRERAS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050466', 'LIBIO ANTERO', 'BENITES', 'CONDORI',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001668', 'ALEXANDER', 'CONCHA', 'ABARCA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('981855', 'ELAYNE INES', 'PAZ', 'LOVATON',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050487', 'YESIKA MILDRED', 'QUISPE', 'HUAMAN',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050462', 'TEOFILO', 'ANDRADE', 'FARFAN',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('052115', 'HELEN MELODIE', 'SANCHEZ', 'MORA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('060594', 'JUSTO ABEL', 'VARGAS', 'PANTOJA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('950273', 'ELEAZAR', 'GIL', 'HERRERA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('021053', 'PAUL', 'PANIAGUA', 'PANCORBO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001667', 'LISSETH', 'ARAUJO', 'TORRES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('060591', 'EDSON JHUNIOR', 'SEQUEIROS', 'RODRIGUEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001235', 'LEWIS MILTON', 'SONCCO', 'ARAUJO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('022180', 'ROBERT', 'TTITO', 'REYES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('981840', 'DIEGO', 'ENRIQUEZ', 'APARICIO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('981848', 'SUSI', 'HUAMAN', 'DE LA VEGA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('043033', 'HERSON CARLOS', 'AUCAISE', 'QUISPE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050499', 'DAVID', 'VERA', 'MUÑOZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('992099', 'ANTHONY CARLOS', 'AGUIRRE', 'BERRIO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('042267', 'LUIS GRIMALDO', 'APAZA', 'QUISPE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('992167', 'BETTY', 'ESCALANTE', 'CHOQUE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('022167', 'MARISOL', 'MACHACA', 'TINTAYA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('040983', 'JOEL EDU', 'SANCHEZ', 'CASTRO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980492', 'HEBER', 'FERNANDEZ', 'JARA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003033', 'HAROLD DWIGHT', 'VALDIVIA', 'GARCIA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001217', 'LINDA YANET', 'ALEGRE', 'CAHUAS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003031', 'PEDRO VICTOR', 'RAMOS', 'CHAVEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050463', 'MARIO ALEJANDRO', 'AYRAMPO', 'ARRIAGA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003012', 'MIJAIL', 'ECHARRI', 'FARFAN',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('031128', 'JOHN ERICK', 'HANCO', 'RAMOS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('040984', 'GABRIELA', 'SANCHEZ', 'ESPIRILLA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990632', 'OMAR ALFREDO', 'GALIANO', 'CCUNO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('992160', 'FIDEL', 'ACHANCARAY', 'MANOTUPA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('992163', 'ELMER', 'CAMA', 'CACERES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('932316', 'JULIO CESAR', 'DUEÑAS', 'BUSTINZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('042271', 'MARIELA DIANNET', 'CONDORI', 'RIVERA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050496', 'HITLHER', 'VALENCIA', 'PACHECO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001670', 'EMERSON', 'CHAPARRO', 'AMPA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010516', 'NILTON', 'CANAZA', 'QUISPE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('031129', 'MIRSHA YESENIA', 'HUAMAN', 'AIMITUMA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050464', 'ALBERT', 'BAYRO', 'ALVAREZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('052110', 'CESAR', 'HUAMAN', 'TRINIDAD',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980493', 'DANY BRALU', 'GAMARRA', 'HUAMBO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990636', 'AGUEDO', 'HUAMANI', 'HUAYHUA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('012107', 'GEISER', 'CHALCO', 'CHALLCO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010513', 'LIZ DENISSE', 'APARICIO', 'AMANCA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010519', 'ANDERSON BUDDY', 'CUNDIA', 'DELGADO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('040377', 'JANNET ROCIO', 'TORPOCO', 'CRUZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980479', 'JOSE JAVIER', 'BOLUARTE', 'PALMA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('932307', 'ROBERT WILBERT', 'ALZAMORA', 'PAREDES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('021503', 'JUAN CARLOS', 'POMPILLA', 'TTITO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050472', 'MARIA LAURA', 'CHAVEZ', 'CABRERA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980472', 'JULIO ANTHONY', 'AGUILAR', 'CASTILLO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050465', 'HELARD ALBERTO', 'BECERRA', 'MARTINEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('030422', 'RUTH ISABEL', 'CHOQQUE', 'HUILLCA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('960243', 'SILMERT RONY', 'BECERRA', 'MONTOYA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('981830', 'RONALD', 'CAPARO', 'CABRERA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001223', 'ALEXANDRA DIANA', 'CCOICCA', 'QUINTANA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('032650', 'FRANKLIN JOEL', 'QUISPE', 'GARCES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('031133', 'EDDY', 'PONCE DE LEON', 'HUAMAN',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003009', 'AMILCAR', 'CARRASCO', 'ESPINOZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('022176', 'CARLA YULI', 'ROSALES', 'CHACON',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('030423', 'JHOMBERT', 'FERNANDEZ', 'PEZUA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('030428', 'KARINA', 'PUMA', 'HUAÑEC',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990639', 'MARITZA KATHERINE', 'IRPANOCCA', 'CUSIMAYTA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010541', 'JAIME', 'RAMIREZ', 'ÑAUPAC',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980517', 'MANUEL', 'TERRONES', 'COELLO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('992179', 'JOSE ANTONIO', 'POMPILLA', 'TTITO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('002085', 'JENNY', 'PANTIGOSO', 'GASTAÑAGA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('932320', 'FREDDY', 'HOLGUIN', 'GALLEGOS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050014', 'HARLEY', 'VERA', 'OLIVERA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990619', 'YAJAIRA', 'CANAL', 'VEGA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('040374', 'MARLENY', 'LUQUE', 'CARBAJAL',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('041455', 'JOSE LUIS', 'SONCCO', 'ALVAREZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('981864', 'PERCY', 'USUCACHI', 'HERRERA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('941737', 'TANY', 'VILLALBA', 'VILLALBA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990659', 'ANDRES', 'TINCO', 'AYME',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('022173', 'DUSBIN', 'QUIÑONEZ', 'MOSQUIPA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('012118', 'JUAN CARLOS', 'POLO', 'LLAVILLA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('020209', 'ANGELICA MARIA', 'PEREZ', 'OVIEDO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990645', 'EDWARD GERARDO', 'MONTALVO', 'DELGADO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('022157', 'KATIA IRIS', 'CAMACHO', 'CACERES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003026', 'JORGE', 'MENDOZA', 'QUISPE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('022166', 'MARIO FERNANDO', 'GONGORA', 'QUINTANILLA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('040369', 'TANIA', 'COAQUIRA', 'FLORES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010522', 'MIGUEL ANGEL', 'CHEVARRIA', 'MAMANI',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('932311', 'MAGALY SILVIA', 'CARPIO', 'LAUCATA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003030', 'JUVENAL', 'QUISPITUPA', 'YUPA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('022164', 'VLADIMIR', 'GAMARRA', 'RUPA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('932342', 'RONY', 'VILLAFUERTE', 'SERNA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('971430', 'ELVIS ARTURO', 'CRUZ', 'CABALLERO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003025', 'ALVARO', 'MENDOZA', 'ESCALANTE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('981850', 'EDITH YOLANDA', 'MAMANI', 'SUCARI',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('930498', 'OLLANTAY', 'MEDINA', 'HUAMAN',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('981835', 'LILY', 'CRUZ', 'AGUILAR',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('972466', 'LUIS', 'CARRILLO', 'GUTIERREZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003029', 'PAUL', 'PEÑA', 'MANRIQUE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('972444', 'NAYRRUT', 'AYERBE', 'LEON',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('031130', 'ORLANDO', 'MAMANI', 'CHUCO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('992176', 'HERBERT AUGUSTO', 'MONTAÑEZ', 'BUSTAMANTE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('020207', 'EDHELMIRA', 'LIMA', 'MEDINA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('030159', 'NOEL ROJER', 'JARITA', 'SANCHEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('032646', 'BETSY ROXANA', 'CONDORI', 'PARIGUANA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980516', 'WILIAM', 'TAMAYO', 'CASTILLO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010546', 'MIGUEL ARMANDO', 'TITO', 'ASCUE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('960259', 'MARCO ANTONIO', 'FLORES', 'SANTOS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('992169', 'ROISER MARIO', 'GARCIA', 'CASANI',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('021052', 'DINA', 'MAMANI', 'DELGADO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('022169', 'LUIS DANIEL', 'MENDOZA', 'PANIURA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980484', 'KATHERINE', 'CARRILLO', 'HUAMAN',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('002075', 'GREGORIO ALEXANDER', 'ALVAREZ', 'PAREDES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990654', 'TONY', 'SERRANO', 'CARBAJAL',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('981858', 'RAUL', 'QUINTANA', 'HILARES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('932308', 'ALEXANDER', 'BEISAGA', 'LUNA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980487', 'ANIBAL', 'CUNO', 'CHOQUEHUANCA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001234', 'ANGELA', 'ROJAS', 'PORTUGAL',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('002428', 'JAQUELINE', 'SALAS', 'CCENTE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('031564', 'PAVEL', 'CONCHA', 'ABARCA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('042276', 'YURI PERCY', 'ROJAS', 'TRUJILLO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990628', 'EDITH KARINA', 'CHUMPISUCA', 'CARRION',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('941710', 'CARLOS ALBERTO', 'BRIONES', 'SANTOS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('992181', 'RAUL EVERT', 'SEGOVIA', 'DIAZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('021050', 'RICHARD', 'CHAMPI', 'CHECYA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('022172', 'ALEXANDER', 'PILARES', 'MAMANI',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('040375', 'EDER JORDAN', 'QUISPE', 'QUISPE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('940400', 'JUAN LARRY', 'DINOS', 'ROJAS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('940386', 'ROXANA KAREN', 'APARICIO', 'CARRASCO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990626', 'GUIDO FERNANDO', 'CHEVARRIA', 'ORMACHEA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('002086', 'DAYSI ANGELICA', 'QUINTANILLA', 'CHAVEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('981832', 'HAROLD SANTIAGO', 'CARRION', 'LAZO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('951303', 'SHEYLA', 'SALAS', 'RIOS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('022181', 'DOLLY PATRICIA', 'VALDIVIA', 'PONCE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('930489', 'AMARILIS', 'CUARESMA', 'ZEVALLOS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('012114', 'JOSE RODOLFO', 'GIL', 'BECERRA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050478', 'LINDER', 'HUAMAN', 'QUISPE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980510', 'DARWIN DENIS', 'QUISPE', 'LLANCACURO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('981857', 'JACQUELINA', 'PERALTA', 'INGLES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001230', 'LILI VERONICA', 'HURTADO', 'CAHUANA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('940416', 'WILBERT', 'NIÑO DE GUZMAN', 'CASTRO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001232', 'EVELYN', 'MEZA', 'ROJAS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('032118', 'DIANA NIEVES', 'CASAFRANCA', 'RAMIREZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('981843', 'ELIZABETH', 'FERNANDEZ', 'CHURA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('981861', 'HUMBERTO', 'SILVERA', 'REYNAGA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001666', 'ANA MARIA', 'APARICIO', 'CARRASCO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('042274', 'GORKY', 'LEZAMA', 'TTITO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('012103', 'BERTHA', 'AEDO', 'CCANA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('940427', 'LIZBETT', 'VERGARA', 'ORDOÑEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('960260', 'EBERT', 'GOMEZ', 'AIQUIPA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('951294', 'NICO', 'MENDOZA', 'SALAS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003024', 'MAAIEKE', 'MAYORGA', 'CASTILLO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('002083', 'DIENER', 'HUAYLLANI', 'GARCIA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('012120', 'DELIA', 'TACO', 'PEDRAZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('030818', 'VANESSA', 'OCHOA', 'ÑAUPAC',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('040981', 'EUDES DANISSA', 'ESPINO', 'CHOQQUE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('971440', 'ALEX FERNANDO', 'HUILLCA', 'HUAMAN',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('002084', 'JUVIT', 'MIRANO', 'CHARA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('020557', 'RENZO HELI', 'GALVEZ', 'ZUÑIGA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('930493', 'CARLOS', 'HUALLPARIMACHI', 'SUAREZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003023', 'HILDEBRANDO', 'MARIACA', 'QUISPE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('020713', 'RUTH DANIELLA', 'MUJICA', 'DEL CARPIO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('030429', 'JEASON SERGIO', 'QUISPE', 'PAÑO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('043040', 'FRANKLIN YURI', 'PALOMINO', 'CAMACHO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('020204', 'JEAN CARLO', 'GALIANO', 'VARGAS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('992187', 'JHON DAVIS', 'VARGAS', 'VALENCIA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('012108', 'ENRIQUE', 'CHANCO', 'MONTEAGUDO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('981860', 'ALEX', 'SARMIENTO', 'HUANCA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('022162', 'CHRISTIAN JUNIOR', 'ECHEVARRIA', 'HUAMANI',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('020212', 'NEFI HUMBERTO', 'TICA', 'GONZALES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('030817', 'ZORAIDA', 'HUISA', 'MANZANARES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980485', 'JAIME', 'CONDORI', 'ESPINOZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001222', 'JUAN CARLOS', 'CALLA', 'NINA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003011', 'FANY', 'DAVILA', 'ZAMALLOA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('972473', 'ROLANDO', 'LAURENTE', 'FLORES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('981867', 'FLOR CAROLINA', 'ZAMBRANO', 'LUZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050470', 'ROLANDO', 'COLQUI', 'MIRANO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('951281', 'MARCO ANTONIO', 'CAMACHO', 'CACERES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('030430', 'JULIO VLADIMIR', 'QUISPE', 'SOTA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990620', 'JOHN', 'CANDIA', 'ARCE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990656', 'RAUL', 'HUILLCA', 'HUALLPARIMACHI',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('951290', 'ROXANA', 'HUAYHUAS', 'MANYA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('022154', 'JOHN EDWARD', 'ARIAS', 'ORIHUELA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010542', 'KARLA CATHERINE', 'ROJAS', 'PEDRAZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('022158', 'RENE ANTOINE', 'CARRION', 'GALIANO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('930491', 'JOSE AMERICO', 'GAMARRA', 'PACHECO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('951309', 'OLMER CLAUDIO', 'VILLENA', 'LEON',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('960266', 'WILLTRAHAM', 'JORDAN', 'ROJAS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('932326', 'ROGER', 'NUÑEZ', 'VALDEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('940392', 'DENNIS IVAN', 'CANDIA', 'OVIEDO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('992171', 'KELVIN JACK', 'HUAMAN', 'APAZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('041453', 'EVELYN', 'ARAMBURU', 'CORNEJO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990640', 'OMAR', 'LATORRE', 'VILCA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('992189', 'FIORELLA', 'VELARDE', 'ESENARRO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('981851', 'JIMMY JOSEPH', 'MARTIARENA', 'CONDORI',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003027', 'IVETTE GISELA', 'MOSQUEIRA', 'PANCORBO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010523', 'LEONID', 'CHILO', 'SALAZAR',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('022174', 'LUIS HAROLD', 'QUISPE', 'HERRERA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('972462', 'ROMA YRINNA', 'BLANCO', 'ARAOZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003008', 'FATIMA', 'CAITUIRO', 'MONGE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003017', 'CHRIS KELLY', 'HERRERA', 'DUEÑAS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003037', 'DANIEL', 'ZARATE', 'PANTIGOSO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('992172', 'MAGALLY YAJAHIRA', 'HUAMAN', 'PAREDES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('042273', 'KAROLINA', 'HUAMANI', 'DIAZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980504', 'JUVENAL', 'OJEDA', 'PRO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('992166', 'ISAAC ERICK', 'ENCALADA', 'HUACAC',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('981838', 'DANI ALBIN', 'DELGADO', 'QUISPE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('031138', 'JOSE ANGEL', 'VELASCO', 'RENDON',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('043044', 'DARIO CESAR', 'SALCEDO', 'MORENO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('002088', 'MARIA ANTONIETA', 'REYES', 'JIMENEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('012122', 'GUIDO EDUARDO', 'VALDEZ', 'TEJEIRA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001225', 'REDI', 'ECHARRI', 'ROZAS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('032123', 'CHRISTIAM', 'PARIGUANA', 'CHIPANA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050500', 'EDWARD', 'VICENTE', 'MENDOZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('940396', 'WILLIAM ALBERTO', 'CHAVEZ', 'ESPINOZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('932319', 'EDWARD JAVIER', 'HERRERA', 'AGUIRRE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980515', 'JUAN TEOFILO', 'SUYO', 'CHOQUE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990651', 'ERICK DAVID', 'SALAS', 'MARMANILLO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('012110', 'VANESSA MARIBEL', 'CHOQUE', 'SOTO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('020205', 'EVERTH JUVENAL', 'GALLEGOS', 'PUMA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010514', 'DELZY DAFNE', 'BECERRA', 'AUCCAHUALLPA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('992183', 'TITO OSWALDO', 'TAPIA', 'HANCCO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('972474', 'CARMEN ROSA', 'LEVA', 'HUAMANTALLA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980496', 'MARIBEL', 'HUAYLLARO', 'VIZARRIETA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('992185', 'ALFREDO', 'USCAPI', 'QUISPE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('012101', 'ALEXANDER', 'ACURIO', 'LUNA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001027', 'SIGRID ESTHER', 'ORTIZ', 'CAMACHO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003048', 'PEDRO FREDY', 'DIAZ', 'BARRAGAN',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('972467', 'YESICA', 'CHACON', 'GONZALEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980495', 'MARGOT', 'HUANCA', 'QUISPE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990635', 'ROBERTH VIRGILIO', 'CUELLAR', 'ALARCON',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003019', 'YANET', 'HUAYTA', 'TORRES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('012119', 'VICTOR DARIO', 'SOSA', 'JAUREGUI',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('932325', 'ALAIN MARCEL', 'MOSCOSO', 'MORALES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('981866', 'YUREMA', 'VERA', 'GARCIA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990616', 'EDSON', 'BEDOYA', 'AYERBE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('040979', 'EDELMIRA', 'DAVILA', 'ANDRADE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('040987', 'JULIETA', 'VALENZUELA', 'GRANDA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('932324', 'KARELIA', 'MEDINA', 'MIRANDA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990534', 'ELIZABETH', 'VARGAS', 'PORTILLA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('021056', 'VITTALIN', 'QUISPE', 'SURCO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('050494', 'HECTOR EDUARDO', 'UGARTE', 'ROJAS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('940407', 'ARTEMIO', 'GOMEZ', 'QUISPE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990647', 'GRETTY MAIBELY', 'OCHOA', 'TAPIA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('972480', 'OLIVER ALBERTO', 'NUÑEZ', 'MALAGA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980480', 'JOSE', 'BUSTAMANTE', 'MORALES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003035', 'JEREMY GILBERTO', 'VERGARA', 'ECHEGARAY',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('932334', 'FABIOLA', 'ROZAS', 'FLORES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('971413', 'CARLOS JAVIER', 'AGUILAR', 'DELGADO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010537', 'LIZ KELLY', 'OLARTE', 'LEIVA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('992165', 'VILLANEL MARCO', 'COAQUIRA', 'CARDENAS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010538', 'PERCY', 'OQUENDO', 'CARREÑO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001229', 'MARITZA', 'HUANACO', 'HAQUEHUA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('972476', 'ELVIS PERCY', 'MAMANI', 'CONTO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980500', 'ARTURO', 'MIRANDA', 'VERA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990661', 'CARLOS EDMUNDO', 'VARGAS', 'MEJIA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('012116', 'FRANCK PAUL', 'MERCADO', 'MAR',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001226', 'HELLEN SASKIA', 'GONZALES', 'SOSA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('930504', 'FERNANDO', 'PUMA', 'HUAÑEC',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('930506', 'CESAR RAME', 'SUMA', 'TAIRO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('981844', 'ELKY', 'FIGUEROA', 'MORMONTOY',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('992184', 'JUDITH', 'TINCO', 'HUALLPA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010521', 'ELARD ELISBAN', 'CHACON', 'OSIS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('032126', 'JULIO CESAR', 'SORIA', 'ORIHUELA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('930492', 'YURIN FERMIN', 'HOLGUINO', 'BORDA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('951282', 'MIRIAM', 'CARBAJAL', 'LEON',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('012113', 'ANTONIO ALBERTO', 'ESPINOZA', 'VILLANUEVA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('043042', 'GLADYS', 'QUISPE', 'ITUSACA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('972489', 'GABRIELA', 'TINTAYA', 'GALICIA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('981859', 'ALEJANDRO', 'SARA', 'POCCOHUANCA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990037', 'DARCY ARTURO', 'CAPARO', 'ACURIO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980505', 'DENNYS', 'ORDOÑEZ', 'PALOMINO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('932309', 'CARLOS ALBERTO', 'CALDERON', 'MENDOZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('012105', 'MARCO', 'CAÑARI', 'MANUTUPA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('951311', 'NATALY', 'YNGA', 'HUILCA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('972468', 'CARLOS ENRIQUE', 'CHAIN', 'ROSADO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('932321', 'ELY KLEMER', 'ITURRIAGA', 'LUNA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990660', 'DICK', 'TUPAYACHI', 'TRUJILLO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('932315', 'EFRAINA GLADYS', 'CUTIPA', 'ARAPA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990559', 'YANINA HERLY', 'CORNEJO', 'OSORIO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('971470', 'MIGUEL', 'TRIVEÑO', 'VILCHEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('992186', 'VLADIMIR SERGUEI', 'VARGAS', 'BELLOTA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('022179', 'ELEAZAR', 'SANCHEZ', 'QUINTANA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('040366', 'RONALD GERARDO', 'CACERES', 'HUAYCOCHEA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('930480', 'WILLIAM', 'BANDA', 'APARICIO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('031135', 'DAVID JERONIMO', 'QUISPE', 'CUTIPA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980499', 'VERONICA SUJEY', 'MENDEZ', 'MENDOCILLA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('021057', 'AVELUZ', 'RODRIGUEZ', 'AYLLONE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('971466', 'PETTER ROLAND', 'SANTOS', 'CARBAJAL',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990648', 'GODOFREDO', 'POCCORI', 'UMERES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980481', 'JESSI CELEDONIO', 'BUSTAMANTE', 'RODRIGUEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001231', 'URIEL', 'LACUTA', 'FARFAN',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('930477', 'MIGUEL ANGEL', 'ARREDONDO', 'CASTILLO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('032643', 'YOHAN', 'ARAGON', 'GRAJEDA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990541', 'WUILLIAN', 'ALAGON', 'MARTINEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010548', 'WILBERT', 'TTITO', 'AUCCAISE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980473', 'LINO ALFONSO', 'ALVAREZ', 'HUAMANI',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980476', 'ABRAHAM', 'AYMITUMA', 'AYMITUMA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980506', 'JULIO CESAR', 'ORTEGA', 'CAMPANA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('030417', 'MIGUEL ANGEL', 'BRAVO', 'OLAYUNCA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('971417', 'JIMMY', 'APARICIO', 'VARGAS MACHUCA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('971434', 'OSCAR', 'ESCALANTE', 'ALVARO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010532', 'JIMMY', 'MIRANDA', 'ZANABRIA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('021047', 'FELIX WILMER', 'CONDORI', 'LIMA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('960280', 'CINTHYA', 'RIVERO', 'OBLITAS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('020201', 'ALFREDO', 'COLLANTES', 'MENDOZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('971457', 'JUAN OSWALDO', 'PFUÑO', 'GIL',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990630', 'JOSE CARLOS', 'ENRIQUEZ', 'PONCE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('031131', 'MARCIO FERNANDO', 'MERMA', 'QUISPE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('971428', 'MARIA DEL CARMEN', 'COA', 'TAIPE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003015', 'ALEX SANDER', 'GALLEGOS', 'CASTILLO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980503', 'JOSE CARLOS', 'NAVARRO', 'VEGA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('992177', 'BERLY', 'MOREANO', 'LOAYZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('950286', 'JOSE LUIS', 'MUÑOZ', 'YEPEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('930511', 'ALEX', 'VENERO', 'JAIMES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('962186', 'MARCO ANTONIO', 'ESPINOZA', 'ROSALES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003028', 'JUAN CARLOS', 'PALOMINO', 'HENKON',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980497', 'ALEX', 'MATUTTI', 'SANCHEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001224', 'YESENIA', 'CONCHA', 'RAMOS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('020211', 'VLADIMIR', 'RAMOS', 'DIAZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('012106', 'RAUL', 'COAQUIRA', 'NINA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('932338', 'JULIO LUIS', 'SOLORZANO', 'CHOQUE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980488', 'EDITH', 'CUSIYUPANQUI', 'LOPEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('021502', 'JORGE', 'PFUÑO', 'BARRIOS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('992180', 'HECTOR HUGO', 'RAMOS', 'BEJAR',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('930479', 'ROBERTO FABIO', 'AYQUIPA', 'BECERRA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('040977', 'MARIBEL', 'CAMA', 'CACERES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980508', 'MIGUEL ENRIQUE', 'PACOHUANCA', 'CANDIA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990655', 'JUBER JERSSON', 'SERRANO', 'CERVANTES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('022171', 'PEDRO JUAN', 'MONZON', 'FERNANDEZ BACA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('962203', 'JOSE CARLOS', 'UNIYSONCO', 'PEREZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('021054', 'LUIS RENAN', 'QUINTO', 'CCAHUANA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('930476', 'JUAN AUGUSTO', 'AEDO', 'BELLOTA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('960268', 'JUAN CARLOS', 'LUQUE', 'CUTIPA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003032', 'JOSE ISAAC', 'VALDEZ', 'BRIONES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980498', 'JEANETH MARLENY', 'MAXI', 'CAMA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001029', 'YADIRA', 'MOTTA', 'MIRANDA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('971460', 'ITALA MELINA', 'QUINTANILLA', 'CHAVEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('940419', 'JAIME', 'QUISPE', 'MACEDO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010527', 'JINMY DAVID', 'HUALLPAMAYTA', 'CANSINO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('971437', 'LUIS FILIO', 'HERBAS', 'MORENO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('960244', 'YESSENIA', 'BERNALES', 'GUZMAN',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('020199', 'CARLOS ALBERTO', 'BORDA', 'BENITO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('992170', 'VIVIANA', 'GONZALES', 'MIRANDA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003014', 'TANIA KARINA', 'GALIANO', 'ZUÑIGA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990658', 'JORGE CARLOS', 'TEJADA', 'AUCCACUSI',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('932318', 'IGOR VICENTE', 'GONGORA', 'FOLLANO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('951278', 'JAIME', 'ARCE', 'OJEDA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980518', 'JORGE', 'VENERO', 'JAIMES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('932329', 'ELOY', 'PAREDES', 'QUISPE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990044', 'JOHN WALTER', 'HOLGUIN', 'GARATE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('962198', 'JOHN JOSEPH', 'ORTIZ', 'SANCHEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('972485', 'DANIEL', 'SANTIAGO', 'WARTHON',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('951279', 'CARLOS HERNAN', 'ARRIAGA', 'CARREÑO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('971415', 'JUVENAL', 'AMACHI', 'GIL',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010515', 'JORGE OMAR', 'CALDERON', 'YAÑEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980009', 'SILVIA', 'LOVATON', 'RAMIREZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990638', 'CARLA', 'ALVAREZ', 'DELGADO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('002078', 'PEDRO SIMON', 'CCAHUANA', 'HUARANCCA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('012112', 'RAY', 'DUEÑAS', 'JIMENEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('012121', 'OSCAR WILLY', 'TTITO', 'CHAMPI',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('930503', 'LUIS ALBERTO', 'PORTUGAL', 'MORALES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010531', 'JUAN CARLOS', 'LAZO', 'MAMANI',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('962184', 'HENRY SAMUEL', 'DUEÑAS', 'DE LA CRUZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('932339', 'MICHAEL', 'SUCNO', 'DAVALOS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980490', 'ALEXANDER', 'DIAZ', 'BARRAGAN',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('021059', 'FRANKLIN', 'VILLAFUERTE', 'GAMARRA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('002426', 'EDWIN MIGUEL', 'ALVARADO', 'CHOQUE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('962174', 'LIZ KATHERIN', 'CALLER', 'ESPINOZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('972464', 'VICTORIA', 'CALLAÑAUPA', 'MANSILLA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001669', 'VALOIS', 'CUBA', 'VILLENA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('951305', 'ANTONIO MARCOS', 'SOSA', 'ATAPAUCAR',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('971455', 'PERCY', 'PALIZA', 'ESCALANTE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010549', 'NANCY', 'TTITO', 'QUISPE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('941186', 'HEBERTH', 'QUISPE', 'ORCCOHUARANCCA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('971436', 'TESORO KI', 'GONZALES', 'MIRANDA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('031136', 'INES', 'QUISPE', 'HUAMANI',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010534', 'ROGER GRIMALDO', 'MOSCOSO', 'MAMANI',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('962183', 'CARLA JESSICA', 'DONDERO', 'VILLANUEVA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980514', 'NILTON', 'SULLCA', 'RECHARTE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('002087', 'SILVIA', 'QUISPE', 'PUMA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('962207', 'FRANCISCO', 'VERA', 'BEJAR',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('950292', 'WALDO', 'PEREZ', 'MAROCHO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980470', 'NOVA EUGENIA', 'ACUÑA', 'AGUIRRE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('932336', 'ROXANA', 'SALAZAR', 'PEÑA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('962175', 'YENY MIRIAN', 'CARRASCO', 'HANCCO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('940390', 'BORIS WILDE', 'CALLUARI', 'ESPINOZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('950262', 'MAURA', 'CANCHA', 'GUTIERREZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003013', 'BORIS', 'FLORES', 'ALOSILLA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('930482', 'HILLARY', 'CAITUIRO', 'MONGE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('951307', 'FLAVIO', 'TOMAYCONZA', 'GARATE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('960252', 'STEPHAN JHOEL', 'COSIO', 'LOAIZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('011389', 'LUZ GISELLA', 'CALDERON', 'MONTEAGUDO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990642', 'JONAS VALENTIN', 'COAQUIRA', 'MAMANI',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003020', 'MONICA', 'LEON', 'TINTA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('932331', 'YNGRID LIZETH', 'RAMIREZ', 'TORRES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('960289', 'YERKO JESUS NIKOLA', 'YANZICH', 'VILLAGARCIA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980494', 'MARCO ANTONIO', 'HERRERA', 'TORREZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('021051', 'RINA', 'ERAZO', 'DURAN',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('971456', 'MERY', 'PEREZ', 'RADO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('962173', 'ROSARIO PARNABET', 'CADENILLAS', 'FLORES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('940387', 'JORGE EMILIO', 'BUSTOS', 'HERRERA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990629', 'JULIO CESAR', 'CHUMPISUCA', 'CCOLCCA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001220', 'RUBEN', 'APAZA', 'APAZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('902493', 'JORGE', 'TELLO', 'GUTIERREZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('002425', 'CIRO', 'ALEGRIA', 'MERMA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('960256', 'DARIO FRANCISCO', 'DUEÑAS', 'BUSTINZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('971453', 'INDIRA', 'MONZON', 'CONDORI',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('950272', 'LINO', 'GARAY', 'HONOR',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('992161', 'MARTHA', 'APAZA', 'HUALLPA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('951308', 'MIGUEL ANGEL', 'VENEGAS', 'VERGARA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001233', 'EVER', 'RECHARTE', 'OSCCO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('981863', 'JULIO', 'USCACHI', 'HAQQUEHUA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('020198', 'VLADIMIR ILICH', 'ASCUE', 'LOVON',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('930507', 'RILDO MOISES', 'TAPIA', 'PACHECO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('932328', 'RAFAEL', 'PANIHUARA', 'LLANCAY',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001227', 'HOLGUER', 'GUTIERREZ', 'HUAMAN',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('950288', 'ELIZABETH', 'PALMA', 'ORTEGA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('971461', 'LAURA', 'QUISPE', 'ABARCA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('971449', 'IRMA', 'MAMANI', 'CASTILLO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('021049', 'EDWARD', 'CUCCHI', 'TRONCOSO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('932322', 'RAFAHEL', 'LIGAS', 'OVALLE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('950295', 'PERCY', 'ROJAS', 'AIQUIPA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990663', 'CECILIA INES', 'VEGA CENTENO', 'GAMARRA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('992173', 'LEANDRO', 'HUANCA', 'JANCCO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('962182', 'MARLISSE', 'CUBA', 'DEL CASTILLO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990657', 'ISAAC WILLIAM', 'TAPIA', 'LLERENA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('930508', 'SANDRA', 'VALENZA', 'OYOLA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('002089', 'CHRISTIAN', 'VALENCIA', 'DE LA CUBA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('930509', 'FRITZ WILMER', 'VALLE', 'CUELLAR',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('960257', 'BENJAMIN', 'ESPEJO', 'ALVAREZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('962169', 'NICOLAS', 'BRAVO', 'ZAVALETA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001073', 'LUIS', 'ARAOZ', 'CUBA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('951283', 'DAVID ENRIQUE', 'CCORI', 'SALAZAR',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('951289', 'CARLOS', 'ESTRADA', 'GALDOS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990621', 'CESAR AMERICO', 'CARRILLO', 'YEPEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('002076', 'LUIS MARCELINO', 'ARENAS', 'JARA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('981845', 'ROSALYN', 'GIBAJA', 'CARDENAS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('960263', 'FELIX ENRIQUE', 'HUAMAN', 'ATAULLUCO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980511', 'CARLOS RAMON', 'QUISPE', 'ONOFRE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('992188', 'OSCAR EMERSON', 'VEGA', 'SOSA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001228', 'ELVER FAUSTO', 'HERRERA', 'SALAS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('941733', 'EFRAIN', 'SARMIENTO', 'HUANCA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('972461', 'RICHARD RAUL', 'ARANIBAR', 'APAZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('930497', 'SUREM HORACIO', 'MAYO', 'GONZALES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980471', 'MARIANELA', 'ACURIO', 'CARREÑO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('010539', 'ANDY JASON', 'PUENTE DE LA VEGA', 'MIRANDA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('930487', 'EDWIN', 'CHAPARRO', 'AMPA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001028', 'JIMMY', 'CARBAJAL', 'FERNANDEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('950296', 'ESTANISLAO', 'VARGAS', 'GONZALEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('940428', 'JUAN CARLOS', 'WARTON', 'SANCHEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('981828', 'STEVE', 'AGUILAR', 'VALER',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('950266', 'JULIO EDWAR', 'CONCHA', 'LOPEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('002077', 'JHULVER RENAN', 'CASTILLA', 'CONDORI',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('951300', 'JUAN MIGUEL', 'RAMOS', 'CHOQUECONZA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('001219', 'JUAN CHRISTIAN', 'ANDIA', 'CHOQUE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('941715', 'VICTOR ALBERTO', 'CASTRO', 'CACERES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('960277', 'JOSE LUIS', 'ORTEGA', 'ZARATE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('951285', 'FRANCO MAURICIO', 'CUNZA', 'VALDEIGLESIAS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('971443', 'CESAR AUGUSTO', 'LARREA', 'GALLEGOS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('971429', 'YOVER', 'COLLANTES', 'VALER',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('972470', 'PROSPERO', 'GUTIERREZ', 'HUAMAN',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('930500', 'LIWI', 'MOLERO', 'ESCOBAR',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('960284', 'NAHYLA', 'SUMIRE', 'GIBAJA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980475', 'LEONIEL', 'ARROYO', 'ZEVALLOS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('940429', 'JUDITH YOVANA', 'ZELA', 'AGUIRRE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('941724', 'DANTE', 'PACHECO', 'MIRANDA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('971459', 'ELMER', 'PUMA', 'TTITO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('960267', 'RAUL YURI', 'LOVON', 'SALCEDO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('003021', 'MARCO AURELIO', 'LOAIZA', 'ALVAREZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('960282', 'JOSE LUIS', 'SEQUEIROS', 'MEDINA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('962187', 'LUIS ALBERTO', 'FERRO', 'VASQUEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('971439', 'ROGER', 'HUARACHA', 'RAMOS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('960269', 'MARCO ANTONIO', 'MAYHUIRE', 'CORDOVA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('950289', 'PAOLA', 'PAZ', 'BACA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('990617', 'LUIS RAFAEL', 'CALLAPIÑA', 'COSIO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('960241', 'ALFREDO', 'BACA', 'MUÑIZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('930499', 'IVAN LEONARDO', 'MIRANDA', 'CERVANTES',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('941712', 'CESAR JOSE', 'CABRERA', 'ALVAREZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('932314', 'CLEBER', 'CISNEROS', 'VALDEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('930501', 'GIOVANNI', 'MOTTA', 'COLQUE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('941731', 'ROXANA INDIRA', 'SALAZAR', 'VIVANCO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('940401', 'ELIDA', 'FALCON', 'HUALLPA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('941721', 'CARLOS ERNESTO', 'GUTIERREZ', 'PALOMINO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('972483', 'ROSA VICTORIA', 'ROBLES', 'PONCE',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('960251', 'NIL', 'CORRALES', 'SEQUEIROS',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('980478', 'RONALD ALEXANDER', 'BARRIONUEVO', 'NAVARRO',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('960245', 'JAVIER', 'BUSTAMANTE', 'GUEVARA',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('960274', 'JULIO DENIS', 'MORA', 'ALFEREZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('962180', 'VICTOR RAUL', 'CJUNO', 'HUAMAN',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('950257', 'MANUEL JESUS', 'BACA', 'FERNANDEZ',1);
INSERT INTO jos_egresados_tEgresado (codEgresado, nombre, apellidoPaterno, apellidoMaterno, codSemestre) VALUES ('951299', 'FERNANDO', 'POLANCO', 'GUEVARA',1);


INSERT INTO jos_egresados_tPais (nombre) VALUES
('AFGANISTÁN'),
('ALBANIA'),
('ALEMANIA'),
('ANGOLA'),
('ANTIGUA Y BARBUDA'),
('ARABIA SAUDÍ'),
('ARGELIA'),
('ARGENTINA'),
('ARMENIA'),
('AUSTRALIA'),
('AUSTRIA'),
('AZERBAIYÁN'),
('BAHAMAS'),
('BAHREIN'),
('BANGLADESH'),
('BARBADOS'),
('BÉLGICA'),
('BELICE'),
('BENÍN'),
('BIELORRUSIA'),
('BOLIVIA'),
('BOSNIA-HERZEGOVINA'),
('BOTSUANA'),
('BRASIL'),
('BRUNEI'),
('BULGARIA'),
('BURKINA FASO'),
('BURUNDI'),
('BUTÁN'),
('CABO VERDE'),
('CAMBOYA'),
('CAMERÚN'),
('CANADÁ'),
('CHAD'),
('CHILE'),
('CHINA'),
('CHIPRE'),
('COLOMBIA'),
('COMORES'),
('CONGO'),
('CONGO (RDC)'),
('COREA DEL NORTE'),
('COREA DEL SUR'),
('COSTA DE MARFIL'),
('COSTA RICA'),
('CROACIA'),
('CUBA'),
('DINAMARCA'),
('DOMINICA'),
('E.R.Y. DE MACEDONIA'),
('ECUADOR'),
('EGIPTO'),
('EL SALVADOR'),
('EMIRATOS ÁRABES UNIDOS'),
('ERITREA'),
('ESLOVAQUIA'),
('ESLOVENIA'),
('ESPAÑA'),
('ESTADOS UNIDOS'),
('ESTONIA'),
('ETIOPÍA'),
('FIJI'),
('FILIPINAS'),
('FINLANDIA'),
('FRANCIA'),
('GABÓN'),
('GAMBIA'),
('GEORGIA'),
('GHANA'),
('GRANADA'),
('GRECIA'),
('GUATEMALA'),
('GUINEA'),
('GUINEA ECUATORIAL'),
('GUINEA-BISSAU'),
('GUYANA'),
('HAITÍ'),
('HONDURAS'),
('HUNGRÍA'),
('INDIA'),
('INDONESIA'),
('IRÁN'),
('IRAQ'),
('IRLANDA'),
('ISLANDIA'),
('ISLAS MARSHALL'),
('ISLAS SALOMÓN'),
('ISRAEL'),
('ITALIA'),
('JAMAICA'),
('JAPÓN'),
('JORDANIA'),
('KAZAJSTÁN'),
('KENIA'),
('KIRGUIZISTÁN'),
('KIRIBATI'),
('KUWAIT'),
('LAOS'),
('LESOTO'),
('LETONIA'),
('LÍBANO'),
('LIBERIA'),
('LIBIA'),
('LIECHTENSTEIN'),
('LITUANIA'),
('LUXEMBURGO'),
('MADAGASCAR'),
('MALASIA'),
('MALAWI'),
('MALDIVAS'),
('MALÍ'),
('MALTA'),
('MARRUECOS'),
('MAURICIO'),
('MAURITANIA'),
('MÉXICO'),
('MICRONESIA'),
('MOLDAVIA'),
('MONGOLIA'),
('MOZAMBIQUE'),
('MYANMAR'),
('NAMIBIA'),
('NAURU'),
('NEPAL'),
('NICARAGUA'),
('NÍGER'),
('NIGERIA'),
('NORUEGA'),
('NUEVA ZELANDA'),
('OMÁN'),
('PAÍSES BAJOS'),
('PAKISTÁN'),
('PANAMÁ'),
('PAPÚA-NUEVA GUINEA'),
('PARAGUAY'),
('PERÚ'),
('POLONIA'),
('PORTUGAL'),
('QATAR'),
('REINO UNIDO'),
('REPÚBLICA CENTROAFRICANA'),
('REPÚBLICA CHECA'),
('REPÚBLICA DOMINICANA'),
('RUANDA'),
('RUMANIA'),
('RUSIA'),
('SAINT KITTS Y NEVIS'),
('SAMOA'),
('SAN VICENTE Y LAS GRANADINAS'),
('SANTA LUCÍA'),
('SANTO TOMÉ Y PRÍNCIPE'),
('SENEGAL'),
('SEYCHELLES'),
('SIERRA LEONA'),
('SINGAPUR'),
('SIRIA'),
('SOMALIA'),
('SRI LANKA'),
('SUAZILANDIA'),
('SUDÁFRICA'),
('SUDÁN'),
('SUECIA'),
('SUIZA'),
('SURINAM'),
('TAILANDIA'),
('TANZANIA'),
('TAYIKISTÁN'),
('TIMOR LESTE'),
('TOGO'),
('TONGA'),
('TRINIDAD Y TOBAGO'),
('TÚNEZ'),
('TURKMENISTÁN'),
('TURQUÍA'),
('TUVALU'),
('UCRANIA'),
('UGANDA'),
('URUGUAY'),
('UZBEKISTÁN'),
('VANUATU'),
('VATICANO'),
('VENEZUELA'),
('VIETNAM'),
('YEMEN'),
('YIBUTI'),
('ZAMBIA'),
('ZIMBABUE');

INSERT INTO jos_egresados_tEstadoCivil (nombre) VALUES
('SOLTERO'),
('CASADO'),
('VIUDO'),
('DIVORCIADO');

INSERT INTO jos_egresados_tTipoCurso (nombre) VALUES
('DIPLOMADO'),
('DOCTORADO'),
('ESPECIALIZACIÓN'),
('GRADUACIÓN'),
('IDIOMAS'),
('MAESTRÍA'),
('TÉCNICO');

INSERT INTO jos_egresados_tTipoMedicion (nombre) VALUES
('HORAS'),
('DIAS'),
('SEMANAS'),
('MESES'),
('AÑOS');

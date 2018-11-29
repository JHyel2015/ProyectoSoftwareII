-- MySQL dump 10.16  Distrib 10.1.31-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: sistemaoa
-- ------------------------------------------------------
-- Server version	10.1.31-MariaDB

create database if not exists sistemaoa;

use sistemaoa;

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
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador` (
  `idAdministrador` int(11) NOT NULL AUTO_INCREMENT,
  `nombreAdmin` varchar(50) NOT NULL,
  `usuarioAdmin` varchar(15) NOT NULL,
  `pwAdmin` varchar(255) NOT NULL,
  PRIMARY KEY (`idAdministrador`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'Administrador','admin','$2y$10$nXfCxVyPD5M8nTsPR3Dk3.tBDBY2WZKrQqFuKXk7pGy/DjPkjNIKC');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Stored Procedures for table 'administrador'
--
-- Select usuario Administrador

DROP procedure IF EXISTS `selectUsuarioAdministrador`;

DELIMITER $$
CREATE PROCEDURE `selectUsuarioAdministrador` (
	IN usuario varchar(15)
)
BEGIN

	SELECT * FROM administrador
    WHERE usuarioAdmin = usuario;
END$$

DELIMITER ;

-- Select a Administrador

DROP procedure IF EXISTS `seleccionarUnAdministrador`;

DELIMITER $$
CREATE PROCEDURE `seleccionarUnAdministrador` (
	IN idAdmin int(11)
)
BEGIN

	SELECT * FROM administrador WHERE idAdministrador = idAdmin;

END$$

DELIMITER ;

-- Editar Administrador

DROP procedure IF EXISTS `editarAdministrador`;

DELIMITER $$
CREATE PROCEDURE `editarAdministrador` (
	IN nombreAdminN varchar(50),
    IN usuarioAdminN varchar(15),
    IN idAdminN int(11)
)
BEGIN

	UPDATE administrador SET
                nombreAdmin = nombreAdminN,
                usuarioAdmin = usuarioAdminN
                WHERE idAdministrador = idAdminN;

END$$

DELIMITER ;

-- Editar password Administrador

DROP procedure IF EXISTS `cambiarPwAdministrador`;

DELIMITER $$
CREATE PROCEDURE `cambiarPwAdministrador` (
	IN pwAdminN varchar(50),
    IN idAdminN int(11)
)
BEGIN

	UPDATE administrador
    SET pwAdmin = pwAdminN
    WHERE idAdministrador = idAdminN;

END$$

DELIMITER ;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera` (
  `idCarrera` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCarrera` varchar(100) NOT NULL,
  `idFacultad` int(11) NOT NULL,
  PRIMARY KEY (`idCarrera`),
  KEY `idFacultad` (`idFacultad`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Física',1),(2,'Matemáticas',1),(3,'Ingeniería Matemática',1),(4,'Ingeniería en Ciencias Económicas y Financieras',1),(5,'Maestría en Física',1),(6,'Ingeniería Empresarial',2),(7,'Ingeniería de la Producción',2),(8,'Maestría en Sistemas de Gestión Integrados',2),(9,'Maestría en Gestión de Talento Humano',2),(10,'Ingeniería Civil',3),(11,'Ingeniería Ambiental',3),(12,'Ingeniería Eléctrica',4),(13,'Ingeniería en Electrónica y Control',4),(14,'Ingeniería en Electrónica y Redes de Información',4),(15,'Ingeniería en Electrónica y Telecomunicaciones',4),(16,'Maestría en Ciencias de Ingeniería Eléctrica',4),(17,'Maestría en Conectividad y Redes de Telecomunicaciones',4),(18,'Maestría en Automatización y Control Electrónico Industrial',4),(19,'Maestría en Administración de Negocios Eléctricos',4),(20,'Maestría en Ingeniería Eléctrica en Distribución',4),(21,'Maestría en Redes Eléctricas Inteligentes',4),(22,'Ingeniería en Geología',5),(23,'Ingeniería en Petróleos',5),(24,'Ingenieria Mecanica',6),(25,'Maestria en Mecatronica y Robotica',6),(26,'Maestria en Sistemas Automotrices',6),(27,'Maestria en Diseño y Simulacion',6),(28,'Programa Doctoral en Ciencias de la Mecanica',6),(29,'Ingeniería Agroindustrial',7),(30,'Ingeniería Química',7),(31,'Ingeniería en Software',8),(32,'Ingeniería en Computación',8),(33,'Ingeniería en Sistemas Informaticos y de Computacion',8),(34,'Maestría y Especialista en Gestión de las Comunicaciones y Tecnología de la Información',8),(35,'Maestría en Ciencias de la Computación',8),(36,'Maestría en Sistemas de Información',8),(37,'Doctorado en Informática',8),(38,'Tecnología en Electrónica y Telecomunicaciones',9),(39,'Tecnología en Análisis de Sistemas Informáticos',9),(40,'Tecnología en Electromecánica',9),(41,'Tecnología en Agua y Saneamiento Ambiental',9);
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Stored Procedures for table carrera
--
-- Select carrera per facultad

-- SP repetido en codigo fuente
DROP procedure IF EXISTS `selectCarreraXFacultad`;

DELIMITER $$
CREATE PROCEDURE `selectCarreraXFacultad` ()
BEGIN

	SELECT c.idCarrera, c.nombreCarrera, f.nombreFacultad
    FROM carrera c JOIN facultad f
    ON c.idFacultad = f.idFacultad;
END$$

DELIMITER ;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentario` (
  `idComentario` int(11) NOT NULL AUTO_INCREMENT,
  `detalleComent` text NOT NULL,
  `idOA` int(11) NOT NULL,
  `idProfesor` int(11) NOT NULL,
  PRIMARY KEY (`idComentario`),
  KEY `idOA` (`idOA`),
  KEY `idProfesor` (`idProfesor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Stored procedures for table `comentario`

-- Insert a comentario

DROP procedure IF EXISTS `insertarComentario`;

DELIMITER $$
CREATE PROCEDURE `insertarComentario` (
	IN detalleN text,
    IN idOAN int(11),
    IN idProfesorN int(11))
BEGIN

	INSERT INTO comentario (detalleComent, idOA, idProfesor)
            VALUES (detalleN, idOAN, idProfesorN);

END$$

DELIMITER ;

-- select comentarioXprofesor

DROP procedure IF EXISTS `seleccionarComentarioXProfesor`;

DELIMITER $$
CREATE PROCEDURE `seleccionarComentarioXProfesor` ()
BEGIN

	SELECT * FROM objetoaprendizaje oa JOIN profesor p ON oa.idProfesor = p.idProfesor;

END$$

DELIMITER ;


-- Insert a seleccionar Comentario De Un Profesor

DROP procedure IF EXISTS `seleccionarComentarioDeUnProfesor`;

DELIMITER $$
CREATE PROCEDURE `seleccionarComentarioDeUnProfesor` (
	IN idOAN int(11)
)
BEGIN

	(SELECT detalleComent, fecha, nombresProf, apellidosProf, c.idProfesor as idUsuario, idComentario as id, idOA
	FROM comentario c JOIN profesor p
		ON p.idProfesor = c.idProfesor
    WHERE idOA = idOAN)
    
    union
    
    (SELECT detalleComent, fecha, nombresEst, apellidosEst, c.idProfesor as idUsuario, idComentario as id, idOA
	FROM comentario c JOIN estudiante p
	ON p.idEstudiante = c.idProfesor
    WHERE idOA = idOAN)
    order by fecha;
END$$

DELIMITER ;

-- Delete comentario

DROP procedure IF EXISTS `eliminarComentario`;

DELIMITER $$
CREATE PROCEDURE `eliminarComentario` (
	IN idOAN int(11),
    IN idComentarioN int(11)
)
BEGIN

	DELETE FROM comentario WHERE idOA = idOAN and idComentario=idComentarioN;

END$$

DELIMITER ;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `idDepartamento` int(11) NOT NULL AUTO_INCREMENT,
  `nombreDepartamento` varchar(100) NOT NULL,
  `idFacultad` int(11) NOT NULL,
  PRIMARY KEY (`idDepartamento`),
  KEY `idFacultad` (`idFacultad`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Departamento de Física (DF)',1),(2,'Departamento de Matemática (DM)',1),(3,'Departamento de Ciencias Administrativas (DEPCA)',2),(4,'Departamento de Estudios Organizacionales Desarrollo Humano (DESODEH)',2),(5,'Departamento de Ingeniería Civil y Ambiental (DICA)',3),(6,'Departamento de Automatización y Control Industrial (DACI)',4),(7,'Departamento de Energía Eléctrica (DEE)',4),(8,'Departamento de Electrónica, Telecomunicaciones y Redes de Información (DETRI)',4),(9,'Departamento de Geología (DG)',5),(10,'Departamento de Petróleos (DP)',5),(11,'Departamento de Ingenieria Mecanica (DIM)',6),(12,'Departamento de Materiales (DMT)',6),(13,'Departamento de Ingeniería Química (DIQ)',7),(14,'Departamento de Ciencias de Alimentos y Biotecnología (DECAB)',7),(15,'Departamento de Ciencias Nucleares (DCN)',7),(16,'Departamento de Metalurgia Extractiva (DEMEX)',7),(17,'Departamento de Informática y Ciencias de la Computación (DICC)',8),(18,'Departamento de Formacion Basica (DFB)',10),(19,'Instituto Geofisico',10),(20,'Departamento de Ciencias Sociales',10);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

-- Stored procedures for table `departamento`

-- Select Despartamento per Facultad

DROP procedure IF EXISTS `seleccionarDepartamentoXFacultad`;

DELIMITER $$
CREATE PROCEDURE `seleccionarDepartamentoXFacultad`()
BEGIN

	SELECT d.idDepartamento, d.nombreDepartamento, f.nombreFacultad
    FROM departamento d JOIN facultad f
    ON d.idFacultad = f.idFacultad;

END$$

DELIMITER ;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiante` (
  `idEstudiante` int(11) NOT NULL AUTO_INCREMENT,
  `cedulaEst` varchar(10) NOT NULL,
  `nombresEst` varchar(50) NOT NULL,
  `apellidosEst` varchar(50) NOT NULL,
  `correoEst` varchar(50) NOT NULL,
  `idCarrera` int(11) NOT NULL,
  `usuarioEst` varchar(15) NOT NULL,
  `pwEst` varchar(255) NOT NULL,
  PRIMARY KEY (`idEstudiante`),
  KEY `idCarrera` (`idCarrera`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Stored procedures for table `estudiante`

-- Insert a Estudiante

DROP procedure IF EXISTS `insertarEstudiante`;

DELIMITER $$
CREATE PROCEDURE `insertarEstudiante` (
	IN cedulaE varchar(10),
    IN nombresE varchar(50),
    IN apellidosE varchar(50),
    IN correoE varchar(50),
    IN carreraE int(11),
    IN usuarioE varchar(25),
    IN pwE varchar(225))
BEGIN

	INSERT INTO estudiante (cedulaEst, nombresEst, apellidosEst, correoEst, idCarrera, usuarioEst, pwEst)
              VALUES (cedulaE, nombresE, apellidosE, correoE, carreraE, usuarioE, pwE);

END$$

DELIMITER ;

-- Select usuario Estudiante

DROP procedure IF EXISTS `selectUsuarioEstudiante`;

DELIMITER $$
CREATE PROCEDURE `selectUsuarioEstudiante` (
	IN usuario varchar(15)
)
BEGIN

	SELECT * FROM estudiante
    WHERE usuarioEst = usuario;

END$$

DELIMITER ;

-- Select a Estudiante

DROP procedure IF EXISTS `seleccionarUnEstudiante`;

DELIMITER $$
CREATE PROCEDURE `seleccionarUnEstudiante` (
	IN idEN int(11)
)
BEGIN

	SELECT * FROM estudiante WHERE idEstudiante = idEN;

END$$

DELIMITER ;

-- Editar Estudiante

DROP procedure IF EXISTS `editarEstudiante`;

DELIMITER $$
CREATE PROCEDURE `editarEstudiante` (
	IN nombresN varchar(50),
    IN apellidosN varchar(50),
    IN correoN varchar(50),
    IN idCarreraN int(11),
    IN usuarioN varchar(15),
    IN idEN int(11)
)
BEGIN

	UPDATE estudiante SET
                nombresEst = nombresN,
                apellidosEst = apellidosN,
                correoEst = correoN,
                idCarrera = idCarreraN,
                usuarioEst = usuarioN
                WHERE idEstudiante = idEN;

END$$

DELIMITER ;

-- Editar password Estudiante

DROP procedure IF EXISTS `cambiarPwEstudiante`;

DELIMITER $$
CREATE PROCEDURE `cambiarPwEstudiante` (
	IN pwEstN varchar(50),
    IN idEN int(11)
)
BEGIN

	UPDATE estudiante SET pwEst = pwEstN
	WHERE idEstudiante = idEN;

END$$

DELIMITER ;

-- Delete estudiante

DROP procedure IF EXISTS `eliminarEstudiante`;

DELIMITER $$
CREATE PROCEDURE `eliminarEstudiante` (
	IN idEN int(11))
BEGIN

	DELETE FROM estudiante WHERE idEstudiante = idEN;

END$$

DELIMITER ;

-- Select Estudiante per Carrera

DROP procedure IF EXISTS `seleccionarEstudianteXCarrera`;

DELIMITER $$
CREATE PROCEDURE `seleccionarEstudianteXCarrera`()
BEGIN

	SELECT * FROM estudiante e JOIN carrera c ON e.idCarrera = c.idCarrera;

END$$

DELIMITER ;


--
-- Table structure for table `facultad`
--

DROP TABLE IF EXISTS `facultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facultad` (
  `idFacultad` int(11) NOT NULL AUTO_INCREMENT,
  `nombreFacultad` varchar(100) NOT NULL,
  PRIMARY KEY (`idFacultad`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultad`
--

LOCK TABLES `facultad` WRITE;
/*!40000 ALTER TABLE `facultad` DISABLE KEYS */;
INSERT INTO `facultad` VALUES (1,'Facultad de Ciencias'),(2,'Facultad de Ciencias Administrativas'),(3,'Facultad de Ing. Civil y Ambiental'),(4,'Facultad de Ing. Electrica y Electronica'),(5,'Facultad de Geologia y Petroleos'),(6,'Facultad de Ing. Mecanica'),(7,'Facultad de Ing. Quimica y Agroindustria'),(8,'Facultad de Ing. de Sistemas'),(9,'Escuela de Formacion de Tecnologos'),(10,'Otros');
/*!40000 ALTER TABLE `facultad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objetoaprendizaje`
--

DROP TABLE IF EXISTS `objetoaprendizaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objetoaprendizaje` (
  `idOA` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 NOT NULL,
  `autor` varchar(100) CHARACTER SET utf8 NOT NULL,
  `descripcion` varchar(1000) CHARACTER SET utf8 NOT NULL,
  `fecha` date NOT NULL,
  `p_clave` varchar(200) CHARACTER SET utf8 NOT NULL,
  `institucion` varchar(100) CHARACTER SET utf8 NOT NULL,
  `tamano` varchar(100) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `fecha_ing` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ruta_zip` varchar(200) NOT NULL,
  `idProfesor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Stored Procedures for table 'objetoaprendizaje'
--
-- InsertarObjetoAprendizaje

DROP procedure IF EXISTS `insertarOA`;

DELIMITER $$
CREATE PROCEDURE `insertarOA` (
	IN nombreOA varchar(50),
    IN autorOA varchar(100),
    IN descripcionOA varchar(1000),
    IN fechaOA date,
    IN p_claveOA varchar(200),
    IN institucionOA varchar(100),
    IN tamanoOA varchar(100),
    IN tipoOA varchar(10),
    IN ruta_zipOA varchar(200),
    IN idProfesorOA int(11))
BEGIN

	INSERT INTO objetoaprendizaje (nombre, autor, descripcion, fecha, p_clave, institucion, tamano, tipo, ruta_zip, idProfesor)
                VALUES (nombreOA, autorOA, descripcionOA, fechaOA, p_claveOA, institucionOA, tamanoOA, tipoOA, ruta_zipOA, idProfesorOA);

END$$

DELIMITER ;

-- Editar Objeto Aprendizaje

DROP procedure IF EXISTS `editarUnOA`;

DELIMITER $$
CREATE PROCEDURE `editarUnOA` (
	IN nombreOA varchar(50),
    IN autorOA varchar(100),
    IN descripcionOA varchar(1000),
    IN fechaOA date,
    IN p_claveOA varchar(200),
    IN institucionOA varchar(100),
    IN idOAN int(11)
)
BEGIN

	UPDATE objetoaprendizaje SET
                nombre = nombreOA,
                autor = autorOA,
                descripcion = descripcionOA,
                fecha = fechaOA,
                p_clave = p_claveOA,
                institucion = institucionOA
                WHERE idOA = idOAN;

END$$

DELIMITER ;


-- Select a Objeto Aprendizaje

DROP procedure IF EXISTS `seleccionarUnOA`;

DELIMITER $$
CREATE PROCEDURE `seleccionarUnOA` (
	IN idOAN int(11)
)
BEGIN

	SELECT nombre, descripcion, autor, institucion, DATE_FORMAT(fecha,'%Y-%m-%d') as fecha_f, p_clave
    FROM objetoaprendizaje WHERE idOA = idOAN;
END$$

DELIMITER ;

-- Delete objeto aprendizaje

DROP procedure IF EXISTS `eliminarOA`;

DELIMITER $$
CREATE PROCEDURE `eliminarOA` (
	IN idOAN int(11))
BEGIN

	DELETE FROM objetoaprendizaje WHERE idOA = idOAN;

END$$

DELIMITER ;

-- Select ruta e id de OAs de un profesor

DROP procedure IF EXISTS `seleccionarRutaOAsProfesor`;

DELIMITER $$
CREATE PROCEDURE `seleccionarRutaOAsProfesor` (
	IN idProfesorOA int(11))
BEGIN

	SELECT idOA, ruta_zip FROM objetoaprendizaje
    WHERE idProfesor = idProfesorOA;

END$$

DELIMITER ;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesor` (
  `idProfesor` int(11) NOT NULL AUTO_INCREMENT,
  `cedulaProf` varchar(10) NOT NULL,
  `nombresProf` varchar(50) NOT NULL,
  `apellidosProf` varchar(50) NOT NULL,
  `correoProf` varchar(50) NOT NULL,
  `idDepartamento` int(11) NOT NULL,
  `usuarioProf` varchar(15) NOT NULL,
  `pwProf` varchar(255) NOT NULL,
  PRIMARY KEY (`idProfesor`),
  KEY `idDepartamento` (`idDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Stored Procedures for table 'profesor'
--
-- InsertarProfesor


DROP procedure IF EXISTS `insertarProfesor`;

DELIMITER $$
CREATE PROCEDURE `insertarProfesor` (
	IN cedulaP varchar(10),
    IN nombresP varchar(50),
    IN apellidosP varchar(50),
    IN correoP varchar(50),
    IN idDep int(11))
BEGIN

	INSERT INTO profesor (cedulaProf, nombresProf, apellidosProf, correoProf, idDepartamento) VALUES (cedulaP, nombresP, apellidosP, correoP, idDep);

END$$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `insertarProfesorDirecto` (
	IN cedulaP varchar(10),
    IN nombresP varchar(50),
    IN apellidosP varchar(50),
    IN correoP varchar(50),
    IN idDep int(11),
    IN usuarioP varchar(20),
    IN pwP varchar(255))
BEGIN

	INSERT INTO profesor (cedulaProf, nombresProf, apellidosProf, correoProf, idDepartamento, usuarioProf, pwProf) VALUES (cedulaP, nombresP, apellidosP, correoP, idDep,usuarioP, pwP);

END$$

DELIMITER ;

-- Select usuario Profesor

DROP procedure IF EXISTS `selectUsuarioProfesor`;

DELIMITER $$
CREATE PROCEDURE `selectUsuarioProfesor` (
	IN usuario varchar(15)
)
BEGIN

	SELECT * FROM profesor WHERE usuarioProf = usuario;

END$$

DELIMITER ;

-- Select a Profesor

DROP procedure IF EXISTS `seleccionarUnProfesor`;

DELIMITER $$
CREATE PROCEDURE `seleccionarUnProfesor` (
	IN idProfesorN int(11)
)
BEGIN

	SELECT * FROM profesor WHERE idProfesor = idProfesorN;

END$$

DELIMITER ;

-- Editar Profesor

DROP procedure IF EXISTS `editarProfesor`;

DELIMITER $$
CREATE PROCEDURE `editarProfesor` (
	IN nombresProfN varchar(50),
    IN apellidosProfN varchar(50),
    IN correoProfN varchar(50),
    IN idDepartamentoN int(11),
    IN usuarioProfN varchar(15),
    IN idProfesorN int(11)
)
BEGIN

	UPDATE profesor SET
                nombresProf = nombresProfN,
                apellidosProf = apellidosProfN,
                correoProf = correoProfN,
                idDepartamento = idDepartamentoN,
                usuarioProf = usuarioProfN
                WHERE idProfesor = idProfesorN;

END$$

DELIMITER ;

-- Agregar usuario y pw de profesor

DROP procedure IF EXISTS `editarProfesorUsuarioPw`;

DELIMITER $$
CREATE PROCEDURE `editarProfesorUsuarioPw` (
	IN usuarioProfN varchar(15),
    IN pwProfN varchar(255),
    IN idProfesorN int(11)
)
BEGIN

	UPDATE profesor SET
                usuarioProf = usuarioProfN,
                pwProf = pwProfN
                WHERE idProfesor = idProfesorN;

END$$

DELIMITER ;

-- cambiar pw de profesor

DROP procedure IF EXISTS `cambiarProfesorPw`;

DELIMITER $$
CREATE PROCEDURE `cambiarProfesorPw` (
	IN pwProfN varchar(255),
    IN idProfesorN int(11)
)
BEGIN

	UPDATE profesor
    SET pwProf = pwProfN
    WHERE idProfesor = idProfesorN;

END$$

DELIMITER ;

-- Delete profesor

DROP procedure IF EXISTS `eliminarProfesor`;

DELIMITER $$
CREATE PROCEDURE `eliminarProfesor` (
	IN idProfesorN int(11))
BEGIN

	DELETE FROM profesor WHERE idProfesor = idProfesorN;

END$$

DELIMITER ;

-- Select Profesor per Departamento sin usuario

DROP procedure IF EXISTS `seleccionarProfesorXDepartamentoSinUsuario`;

DELIMITER $$
CREATE PROCEDURE `seleccionarProfesorXDepartamentoSinUsuario`()
BEGIN

	SELECT idProfesor, cedulaProf, nombresProf, apellidosProf, correoProf, nombreDepartamento
    FROM profesor p JOIN departamento d ON p.idDepartamento = d.idDepartamento
    WHERE usuarioProf = '';

END$$

DELIMITER ;

-- Select Profesor per Departamento con usuario

DROP procedure IF EXISTS `seleccionarProfesorXDepartamentoConUsuario`;

DELIMITER $$
CREATE PROCEDURE `seleccionarProfesorXDepartamentoConUsuario`()
BEGIN

	SELECT * FROM profesor p JOIN departamento d ON p.idDepartamento = d.idDepartamento
    WHERE usuarioProf != '';

END$$

DELIMITER ;

--
-- Table structure for table `rutaoa`
--

DROP TABLE IF EXISTS `rutaoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rutaoa` (
  `idRuta` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) DEFAULT NULL,
  `idOA` int(11) DEFAULT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rutaoa` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idRuta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rutaoa`
--

LOCK TABLES `rutaoa` WRITE;
/*!40000 ALTER TABLE `rutaoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `rutaoa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Stored procedures for table `rutaoa`

-- Insert a rutaoa

DROP procedure IF EXISTS `insertarRutaoa`;

DELIMITER $$
CREATE PROCEDURE `insertarRutaoa` (
	IN idUserN int(11),
    IN idOAN int(11),
    IN userNameN varchar(20),
    IN rutaoaN varchar(200))
BEGIN

	INSERT INTO rutaoa (idUser, idOA, username, rutaoa)
                VALUES (idUserN, idOAN, userNameN, rutaoaN);
END$$

DELIMITER ;

-- Select a rutaoa

DROP procedure IF EXISTS `seleccionarRutaoa`;

DELIMITER $$
CREATE PROCEDURE `seleccionarRutaoa` (
	IN idOAN int(11),
    IN idUserN int(11),
    IN userNameN varchar(20))
BEGIN

	SELECT * FROM rutaoa
    WHERE idOA = idOAN AND idUser = idUserN AND username = userNameN;

END$$

DELIMITER ;

-- Delete rutaoa

DROP procedure IF EXISTS `eliminarRutaoa`;

DELIMITER $$
CREATE PROCEDURE `eliminarRutaoa` (
	IN idUserN int(11),
    IN userNameN varchar(20))
BEGIN

	DELETE FROM rutaoa WHERE idUser = idUserN AND username = userNameN;

END$$

DELIMITER ;


-- Dump completed on 2018-02-20 18:06:13


-- CREACION TABLA NOMINA DE PROFESORES
DROP TABLE IF EXISTS `nominaprofesores`;

CREATE TABLE `sistemaoa`.`nominaprofesores` (
  `idNominaProfesores` INT NOT NULL AUTO_INCREMENT,
  `nombreCompleto` VARCHAR(80) NULL,
  `puestoInstitucional` VARCHAR(80) NULL,
  `departamento` VARCHAR(80) NULL,
  `telefonoInstitucional` VARCHAR(10) NULL,
  `extensionTelefonica` VARCHAR(6) NULL,
  `correoInstitucional` VARCHAR(35) NULL,
  PRIMARY KEY (`idNominaProfesores`));

  INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ABAD MERCHAN GUIDO ANDRES','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 3, GRADO 5)','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','1804','andres.abad@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ABAD TORRES JACKELINE','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 1, GRADO 3)','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2203','jackeline.abad@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ACERO QUILUMBAQUIN WILSON ARMANDO','ANALISTA DE REDES DE MONITOREO GEOFISICO 1','PROYECTOS EPN','02-2976300','6708','wilson.acero@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ACEVEDO DAVILA ANA LORENA','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','5217','lorena.acevedo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ACEVEDO TAPIA PAUL ANDRES','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1501','paul.acevedo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ACOSTA CASTILLO MARCIA ESTEFANIA','ASISTENTE DE PRESUPUESTO','DIRECCIÓN FINANCIERA','02-2976300','1201','marcia.acosta@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ACOSTA HURTADO TANIA ALEYDA','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3125','tania.acosta@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ACOSTA REYES ANDRES EMILIO','AUXILIAR DE MONITOREO','INSTITUTO GEOFÍSICO','02-2976300','6701','andres.acosta02@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ACUÑA BERMEO CRISTINA FERNANDA','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 2, GRADO 4)','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','1804','cristina.acuna@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ACUÑA RIVERA MARCELA ESTEFANIA','TECNICO DOCENTE','DEPARTAMENTO DE MATERIALES','02-2976300','3701','marcela.acunar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ACURIO MENDEZ ELIANA MARIBEL','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE FÍSICA','02-2976300','1501','eliana.acurio@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AGUADO CASO MATEO','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 3, GRADO 5)','DEPARTAMENTO DE GEOLOGÍA','02-2976300','3306','mateo.aguado@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AGUAIZA TASINCHANA SANTIAGO XAVIER','ANALISTA DE REDES DE MONITOREO GEOFISICO 1','PROYECTOS EPN','02-2976300','6702','santiago.aguaiza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AGUAYO CHICAISA LUIS ALFREDO','AUXILIAR DE SERVICIOS','DIRECCIÓN ADMINISTRATIVA','02-2976300','2009','luis.aguayo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AGUIAR PONTES JOSAFA DE JESUS','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 3, GRADO 5)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4701','josafa.aguiar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AGUILAR ALVAREZ SANDRA NATHALY','ASISTENTE DE TECNOLOGIA DE LA INFORMACIONY COMUNICACIONES','FACULTAD DE INGENIERÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','0','sandra.aguilar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AGUILAR BARRERA SUSANA DE LOS ANGELES','RESPONSABLE ADMINISTRATIVO','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4701','susana.aguilar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AGUILAR GANCINO ELIZABETH CRISTINA','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','-','elizabeth.aguilar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AGUILAR JARAMILLO JORGE ARTURO','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 2, GRADO 4)','INSTITUTO GEOFÍSICO','02-2976300','6708','jorge.aguilar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AGUILAR PAREDES DAVID PAUL','ADMINISTRADOR 2','INSTITUTO GEOFÍSICO','02-2976300','0','david.aguilar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AGUINAGA BARRAGAN ALVARO GONZALO XAVIER','PROFESOR PRINCIPAL A TIEMPO COMPLETO(NIVEL 1, GRADO 6), DIRECTOR DE LA ESFOT','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3700','alvaro.aguinaga@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AGUIRRE CABRERA MARIA ELENA','SECRETARIA EJECUTIVA 1','FACULTAD DE INGENIERÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2203','maria.aguirre@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AGUIRRE COBA JENNY EDITH','TECNICO DOCENTE','DEPARTAMENTO DE MATEMÁTICA','02-2976300','','jenny.aguirre@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AILLON CARRASCO PAULINA MARIANELA','RESPONSABLE DE PLANIFICACIÓN','DIRECCIÓN DE PLANIFICACIÓN','02-2976300','1323','paulina.aillon@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AIMACAÑA CHUQUILLA WALTER OSWALDO','CHOFER','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','110','walter.aimacana@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AIMACAÑA COBO WILMER PAUL','TECNICO DE MANTENIMIENTO','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','203','wilmer.aimacana@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALARCON PEREZ CARLOS DAVID','ASISTENTE DE CAPACITACION','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','107','carlos.alarcon@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALBAN RUIZ LUIS ALFREDO','PROFESOR PRINCIPAL A TIEMPO PARCIAL','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','luis.alban@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALCIVAR ESPIN ROBERTO ANDRES','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','1804','roberto.alcivar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALCOCER CASTILLO CHRISTIAN FABIAN','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','christian.alcocera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALDAS CARRASCO MIGUEL FERNANDO','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 3, GRADO 5)','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','2125','miguel.aldas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALDAS GARCES FRANKLIN BOLIVAR','ASISTENTE OBSERVATORIO ASTRONOMICO','OBSERVATORIO ASTRONÓMICO','02-2976300','6801','franklin.aldas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALDAS SANDOVAL MARIA BELEN','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1903','maria.aldas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALDAZ DIAZ GLADYS MARLENE','ANALISTA ADMINISTRATIVO DE LINGÜISTICA','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','203','gladys.aldaz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALEJANDRO PEREZ TREISSY ALISON','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','','treissy.alejandro@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALLAN IBARRA ESTEBAN GABRIEL','ASISTENTE DE RELACIONES INSTITUCIONALES','DIRECCIÓN DE RELACIONESINSTITUCIONALES','02-2976300','1301','esteban.allan@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALMACHI NACIMBA JUAN CARLOS','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','juan.almachij@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALMEIDA CERVANTES LUIS HOMERO','BIBLIOTECARIO 2','FACULTAD DE INGENIERÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2720','luis.almeida@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALMEIDA MIRANDA ELIANA SOFIA','ASISTENTE DE PLANIFICACION','DIRECCIÓN DE PLANIFICACIÓN','02-2976300','1321','eliana.almeida@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALMEIDA MOLINA LUIS ANIBAL','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2720','luis.almeidal@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALMEIDA MORILLO STEFANIE LUCIA','ANALISTA DE REDES DE MONITOREO GEOFISICO 1','PROYECTOS EPN','02-2976300','6701','stefanie.almeida@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALMEIDA NARANJO CRISTINA ELIZABETH','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE MATERIALES','02-2976300','3701','cristina.almeidan@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALMEIDA PORRAS GABRIEL EDMUNDO','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','-','gabriel.almeida@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALMEIDA RODRIGUEZ CARLOS ALBERTO','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 1, GRADO 3)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1501','carlos.almeidar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALMEIDA VACA MARCO ANDRES','ANALISTA DE REDES DE MONITOREO GEOFISICO 1','PROYECTOS EPN','02-2976300','6701','marco.almeida@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALMENDARIZ GALLO DIEGO PATRICIO','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','BIBLIOTECA GENERAL','02-2976300','1361','diego.almendariz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALOMOTO BANSUI NELSON RAUL','DECANO','FACULTAD DE CIENCIASADMINISTRATIVAS','02-2976300','1056','nelson.alomoto@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALQUINGA ANGO ANDRES ROLANDO','TECNICO DE MANTENIMIENTO','METALMECÁNICA SAN BARTOLO','02-2976300','2670823','andres.alquinga@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALVARADO CEVALLOS ALEXANDRA PATRICIA','JEFA DEL DEPARTAMENTO DE GEOFÍSICA','INSTITUTO GEOFÍSICO','02-2976300','6707','alexandra.alvarado@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALVARADO ORELLANA WASHINGTON BOLIVAR','PROFESOR TIEMPO PARCIAL PRINCIPAL 1','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','washington.alvarado@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALVARADO RAMIREZ KARLA MARIA','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 2, GRADO 4)','DEPARTAMENTO DE CIENCIASADMINISTRATIVAS','02-2976300','1653','karla.alvarado@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALVAREZ ERAZO FRANCISCO XAVIER','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','francisco.alvarez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALVAREZ MEZA YAZMINA ALEJANDRA','RESPONSABLE ADMINISTRATIVA','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','0','yazmina.alvarez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALVAREZ RUEDA ROBIN GERARDO','PROFESOR PRINCIPAL A TIEMPO COMPLETO (NIVEL 1, GRADO 6)','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2213','robin.alvarez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALVAREZ VARGAS PAULINA ALEJANDRA','ASISTENTE DE TECNOLOGIAS DE LA INFORMACIONY COMUNICACION','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','155','paulina.alvarez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ALVEAR ESPINOSA DIEGO GIOVANNY','TECNICO DE TECNOLOGIAS DE INFORMACION YCOMUNICACIONES','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','150','diego.alvear@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AMORES MOYA ANDREA MIRELLA','ADMINISTRADOR 3','DIRECCIÓN ADMINISTRATIVA','02-2976300','0','andrea.amores@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ANAGUANO CORELLA MAYRA TATIANA','ESPECIALISTA DE CIENCIA DE ALIMENTOS Y BIOTECNOLOGIA','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','4246','mayra.anaguano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ANALUISA PICHUCHO NESTOR RAMIRO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE CIENCIASSOCIALES','02-2976300','-','ramiro.analuisa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ANCHATUÑA GRANADA BYRON ROLANDO','TECNICO EN METALMECANICA','METALMECÁNICA SAN BARTOLO','02-2976300','0','byron.anchatuna@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ANCHUNDIA RUIZ MERCY DENISSE','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 3','DEPARTAMENTO DE MATEMÁTICA','02-2976300','','mercy.anchundia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ANCHUNDIA VALENCIA CARLOS EDUARDO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4701','carlos.anchundia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ANDRADE ACOSTA DAVID MARCOS','TECNICO DOCENTE','DEPARTAMENTO DE FÍSICA','02-2976300','1501','david.andradea@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ANDRADE HINOJOSA WILLIAM HUMBERTO','PROFESOR PRINCIPAL A TIEMPO PARCIAL','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4701','william.andrade@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ANDRADE PAREDES ROBERTO OMAR','DIRECTOR DE GESTION DE LA INFORMACION YPROCESOS','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1400','roberto.andrade@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ANDRADE SALINAS GUILLERMO GABRIEL','ASISTENTE DE TECNOLOGIA DE LA INFORMACIONY COMUNICACIONES','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','0','guillermo.andrade@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ANDRADE VARELA SANTIAGO DANIEL','PROFESOR PRINCIPAL A TIEMPO COMPLETO(NIVEL 1, GRADO 6)','INSTITUTO GEOFÍSICO','02-2976300','6703','santiago.andrade@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ANDRANGO YANCHA MARCO ANTONIO','RESPONSABLE DE FISCALIZACION','DIRECCIÓN DE PLANIFICACIÓN','02-2976300','0','marco.andrango@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ANGO CHUQUI KLEBER LENIN','TECNICO DE MANTENIMIENTO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2025','kleber.ango@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ANGULO JARAMILLO PABLO ALEJANDRO','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','','pablo.angulo01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ARAUJO GRIJALVA NELSON ALEJANDRO','PROFESOR TITULAR PRINCIPAL DE ESCALAFONPREVIO TIEMPO COMPLETO','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1502','alejandro.araujo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ARAUJO MUÑOZ SARA EMILIA','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','sara.araujo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ARAUJO RAMIREZ LESLIE ANA','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','-','leslie.araujo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ARAUJO ROSAS ROMEL CLEMENTE','CONSERJE','SECRETARÍA GENERAL','02-2976300','1154','romel.araujo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ARAUJO VIZUETE GABRIELA FERNANDA','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','2711','gabriela.araujo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ARAUZ ARGUELLO DIANA CAROLINA','OFICINISTA','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','112','diana.arauz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ARAUZ CASTRO MARIA EUGENIA DE LOS ANGELES','ESPECIALISTA DE LABORATORIO DE ENSAYOS 1','DEPARTAMENTO DE GEOLOGÍA','02-2976300','3306','maria.arauz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ARCOS MARTINEZ HUGO NEPTALI','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 2, GRADO 4)','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2267','hugo.arcos@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ARGOTI ARCOS ROBERTH MIGUEL','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','2203','miguel.argoti@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ARGUELLO RIOS GABRIEL ALBERTO','PROFESOR PRINCIPAL A TIEMPO PARCIAL','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2217','gabriel.arguello@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ARIAS ERAZO HUGO MARCELO','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3149','hugo.arias@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ARIAS IZA MARCIA VANESSA','ASISTENTE DE TECNOLOGIA DE LA INFORMACIONY COMUNICACIONES','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','2203','marcia.arias@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ARIAS PUENTE HOMERO DARIO','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','0','homero.arias@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ARMAS FREIRE CATALINA ELIZABETH','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3701','elizabeth.armas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ARMENDARIZ HIDALGO FRANKLIN SANTIAGO','ASISTENTE DE CAPACITACION','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','115','franklin.armendariz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ARMIJOS ABENDAÑO JAIRO VLADIMIR','ASTROFISICO','OBSERVATORIO ASTRONÓMICO','02-2976300','6801','jairo.armijos@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ARMIJOS DELGADO KAREN ELIZABETH','SECRETARIA EJECUTIVA 2','FACULTAD DE CIENCIASADMINISTRATIVAS','02-2976300','-','karen.armijos@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ARRAIS DIAZ SANTIAGO DANIEL','ANALISTA DE REDES DE MONITOREO GEOFISICO 3','INSTITUTO GEOFÍSICO','02-2976300','6704','santiago.arrais@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ARROBA PROAÑO JHOFRE BOLIVAR','RESPONSABLE DE TALENTO HUMANO','DIRECCIÓN DE TALENTO HUMANO','02-2976300','1269','jhofre.arroba@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ARTEAGA ARIAS NATHALIE PAOLA','ESPECIALISTA DE TESORERIA 2','DIRECCIÓN FINANCIERA','02-2976300','1209','0');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ASTUDILLO MUÑOZ JUAN CARLOS','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','0','juan.astudillo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AUCANCELA TAMAYO CRISTIAN PAUL','CONSERJE EXTERNO','FACULTAD DE CIENCIAS','02-2976300','1514','cristian.aucancela@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AVALOS CASCANTE FAUSTO EDUARDO','PROFESOR PRINCIPAL A TIEMPO COMPLETO (NIVEL 1, GRADO 6)','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','5432','eduardo.avalos@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AVILA VEGA CARLOS FABIAN','PROFESOR PRINCIPAL A TIEMPO COMPLETO (NIVEL 1, GRADO 6)','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','3711','carlos.avila@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AVILA VELEZ JENNY MARCELA','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','4312','jenny.avila@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AYABACA SARRIA CESAR RICARDO','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 3, GRADO 5)','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3711','cesar.ayabaca@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AYALA AMAYA EDY RODRIGO','PROFESOR PRINCIPAL A TIEMPO COMPLETO(NIVEL 1, GRADO 6)','DEPARTAMENTO DE FÍSICA','02-2976300','1709','edy.ayala@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AYALA ESPINOZA MIGUEL ANGEL','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','-','miguel.ayala@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AYO SIMBAÑA JOSE RODRIGO','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','110','jose.ayo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'AYOL ROJANO CARLOS ANIBAL','CHOFER','INSTITUTO GEOFÍSICO','02-2976300','6701','carlos.ayol@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BADILLO ORTIZ CARLOS ANTONIO','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','carlos.badillo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BAEZ ESPINOSA CHRISTIAN VINICIO','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 3','PROYECTOS EPN','02-2976300','6701','christian.baez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BAEZ JACOME VERA SELENE','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE FÍSICA','02-2976300','1051','selene.baez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BALAREZO AGUILAR ANA LUCIA','PROFESOR PRINCIPAL A TIEMPO COMPLETO (NIVEL 1, GRADO 6)','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1910','ana.balarezo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BALCAZAR GODOS LUIS ALFREDO','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','RECTORADO','02-2976300','1001','luis.balcazar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BALDEON PARREÑO MARIA GABRIELA','RESPONSABLE ADMINISTRATIVO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2008','gabriela.baldeon@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BALDEON VALENCIA CARLOS OSWALDO','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3724','carlos.baldeon@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BANEGAS CAÑADAS KATHERINE ELIZABETH','SECRETARIA','FACULTAD DE INGENIERÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','0','katherine.banegas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BAÑO MORALES DAYSI ALEXANDRA','TECNICO DOCENTE','DEPARTAMENTO DE MATERIALES','02-2976300','3701','daysi.banom@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BAQUERO CAMPAÑA RAUL FERNANDO','ESPECIALISTA DEL CENTRO DE INVESTIGACION DELA VIVIENDA','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','1951','raul.baquero@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BARBA MOLINA HERNAN VINICIO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','-','0');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BARBIER HUGO JEAN MARC PAUL','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE FÍSICA','02-2976300','1501','hugo.barbier@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BARONA LOPEZ LORENA ISABEL','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','-','0');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BARRAGAN CAMPOS GALO HOMERO','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE MATERIALES','02-2976300','5856','homero.barragan@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BARRAGAN MAYALITA JOEL ISAAC','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','joel.barragan@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BARRENO CARVAJAL LUIS WILFRIDO','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','4736','luis.barreno@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BARRERA ENRIQUEZ GUIDO CLAUDIO','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1404','guido.barrera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BARRERA FLORES ROSARIO ELENA','ESPECIALISTA DE CIENCIA DE ALIMENTOS Y BIOTECNOLOGIA','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','4238','rosario.barrera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BARRERA SINGAÑA CARLOS ANDRES','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','0','carlos.barrera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BARRIGA ANDRADE JHONATTAN JAVIER','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4701','jhonattan.barriga@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BARRIGA CASTRO VERONICA DE LOURDES','ADMINISTRADOR 3','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','116','veronica.barriga@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BARROS LOPEZ JUAN GABRIEL','GEOFISICO 2','PROYECTOS EPN','02-2976300','6701','juan.barros@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BASILE CARRASCO LEONARDO ALBERTO','PROFESOR PRINCIPAL A TIEMPO COMPLETO(NIVEL 1, GRADO 6)','DEPARTAMENTO DE FÍSICA','02-2976300','1512','leonardo.basile@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BASTIDAS ORTEGA JUAN CARLOS','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 3','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1432','juancarlos.bastidas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BASURTO SALAZAR CRISTIAN OSWALDO','ESPECIALISTA DE FORMACION BASICA 1','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3110','cristian.basurto@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BAUTISTA HEREDIA CARLOS ROBERTO','TECNICO DE MANTENIMIENTO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2020','carlos.bautista@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BAUTISTA MOYA MARIA JOSE','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','maria.bautista01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BAYAS REA MARCO VINICIO','SUBDECANO','FACULTAD DE CIENCIAS','02-2976300','1524','marco.bayas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BEATE CONTAG BERNARDO OSCAR','PROFESOR TIEMPO PARCIAL PRINCIPAL 1','DEPARTAMENTO DE GEOLOGÍA','02-2976300','3306','bernardo.beate@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BECERRA CAMACHO FERNANDO VINICIO','TECNICO DOCENTE','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2263','fernando.becerrac@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BEDOYA BUENANO MARIA PAULINA','ANALISTA DE MARKETING 1','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','148','maria.bedoya@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BENALCAZAR BENALCAZAR ERIKA MARICELA','ASISTENTE ADMINISTRATIVO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2004','erika.benalcazar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BENALCAZAR FLORES PABLO DANIEL','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE PETRÓLEOS','02-2976300','3301','pablo.benalcazar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BENALCAZAR PALACIOS MARCO ENRIQUE','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 3, GRADO 5)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4701','marco.benalcazar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BENALCAZAR PALADINES HOLGER EFRAIN','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1557','holger.benalcazar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BENALCAZAR ROJAS DAVID EDUARDO','ANALISTA TECNICO DEL OBSERVATORIOASTRONOMICO','OBSERVATORIO ASTRONÓMICO','02-2976300','0','david.benalcazarr@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BENAVIDES BORJA XIMENA DE LOURDES','SECRETARIA','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','-','ximena.benavides01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BENAVIDES GUALAVISI JOSE ABEL','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','1604','jose.benavides@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BENAVIDES GUTIERREZ GRACE GENOVEVA','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1604','grace.benavides@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BENAVIDES LAGUAPILLO VANESSA CAROLINA','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2203','vanessa.benavides@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BENAVIDES LEMA JORGE LUIS','ANALISTA DE GESTION','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','127','jorge.benavidesj@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BENITEZ MEJIA DIEGO SANTIAGO','PROFESOR PRINCIPAL A TIEMPO PARCIAL','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2215','diego.benitez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BENITEZ RODRIGUEZ MARIA DEL CARMEN','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE CIENCIASSOCIALES','02-2976300','6051','maria.benitez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BENITEZ ROMERO MARIA JOSE','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 1, GRADO 3)','DEPARTAMENTO DE FÍSICA','02-2976300','1701','maria.benitezr@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BERMEO CUEVA SANDRA MILENA','SECRETARIA','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4702','sandra.bermeo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BERNAL CARRERA ISABEL CAROLINA','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 3, GRADO 5)','DEPARTAMENTO DE GEOLOGÍA','02-2976300','3301','isabel.bernal@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BERNAL CARRILLO IVAN MARCELO','PROFESOR PRINCIPAL A TIEMPO COMPLETO (NIVEL 1, GRADO 6)','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2338','ivan.bernal@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BERNARD BENJAMIN PIERRE THIBAUT','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','INSTITUTO GEOFÍSICO','02-2976300','6703','benjamin.bernard@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BETANCOURT MENDOZA NANCY CRISTINA','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','0','nancy.betancourt@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BETUN NAULA JULIO CESAR','AUXILIAR DE SERVICIOS GENERALES','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','4233','julio.betun@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BETUN QUISHPI WILMER WASHINGTON','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','DEPARTAMENTO DE METALURGIAEXTRACTIVA','02-2976300','5806','0');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BLANDIN ALONSO LIZANDRO JAVIER','PROFESOR PRINCIPAL A TIEMPO PARCIAL','DEPARTAMENTO DE CIENCIASADMINISTRATIVAS','02-2976300','1804','javier.blandin@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BOADA ZURITA ALFONSO XAVIER','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','3701','alfonso.boada@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BOLAÑOS VELASCO JUAN CARLOS','ASISTENTE DE TECNOLOGIAS DE INFORMACION YCOMUNICACIÓN','BIBLIOTECA GENERAL','02-2976300','0','juan.bolanos01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BONE FONTE EDWIN GIOVANNY','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','edwin.bonee@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BONILLA BOLAÑOS ANDREA GABRIELA','PROFESOR TIEMPO COMPLETO AUXILIAR 1','DEPARTAMENTO DE MATEMÁTICA','02-2976300','-','andrea.bonilla@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BONILLA HIDALGO OMAR FERNANDO','JEFE DE DEPARTAMENTO','DEPARTAMENTO DE INGENIERÍAQUÍMICA','02-2976300','4305','omar.bonilla@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BONILLA JATIVA CARLOS ARTURO RAMON','PROFESOR PRINCIPAL A TIEMPO PARCIAL','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4701','carlos.bonilla@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BONILLA MENA SORAYA MARGARITA','SECRETARIA','FACULTAD DE INGENIERÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2706','soraya.bonilla@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BONILLA PALACIOS MARCO GILBERTO','PROFESOR TIEMPO PARCIAL PRINCIPAL 1','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3711','marco.bonilla@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BONILLA RIBADENEIRA CHRISTIAN SEBASTIAN','TECNICO DOCENTE','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2721','christian.bonillar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BONILLA ZAMBRANO CARLOS ALEJANDRO','ASESOR 4','METALMECÁNICA SAN BARTOLO','02-2976300','2670823','carlos.bonillaz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BORJA BENAVIDES FREDDY RAMIRO','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','freddy.borja@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BRAVO NARVAEZ YADIRA LUCIA','SUBDECANO','FACULTAD DE INGENIERÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2273','yadira.bravo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BRAVO PALACIOS GABRIEL FERNANDO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3701','gabriel.bravo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BRAVO RAMOS MARIA JOSE','ASISTENTE DE TECNOLOGIAS DE INFORMACION YCOMUNICACIÓN','BIBLIOTECA GENERAL','02-2976300','1362','maria.bravor@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BRAVO TORRES ANA DARLENY','ASISTENTE DE TALENTO HUMANO','DIRECCIÓN DE TALENTO HUMANO','02-2976300','-','ana.bravo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BRICEÑO CUEVA DANNY ALEXANDER','ESPECIALISTA JURIDICO 1','DIRECCIÓN DE ASESORÍA JURÍDICA','02-2976300','1181','danny.briceno@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BRITO MEJIA SOFIA NATACHA','SECRETARIA','SECRETARÍA GENERAL','02-2976300','0','sofia.brito@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BUCHELI PALACIOS DARWIN MARCELO','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','VICERRECTORADO DE DOCENCIA','02-2976300','1109','darwin.bucheli@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BUENAÑO LASCANO PAUL ALEJANDRO','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','0','paul.buenano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BUITRON FLORES PEDRO ENRIQUE','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE CIENCIASADMINISTRATIVAS','02-2976300','2735','pedro.buitron@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'BURBANO RODRIGUEZ RAFAEL TIBERIO','PROFESOR PRINCIPAL TIEMPO COMPLETO','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1552','rafael.burbano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CABERO DEL RIO ANA','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE GEOLOGÍA','02-2976300','3302','ana.cabero@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CABEZAS ZAPATA IRENE DEL ROSARIO','PEDAGOGO','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','0','irene.cabezas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CABRERA CELI GABRIELA CRISTINA','TECNICO DOCENTE','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2203','gabriela.cabrera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CABRERA JARA MARCELO FABIAN','TECNICO DOCENTE','DEPARTAMENTO DE INGENIERÍAQUÍMICA','02-2976300','4334','marcelo.cabreraj@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CABRERA LAGUAPILLO MAURICIO SEBASTIAN','ASISTENTE DE TECNOLOGIA DE LA INFORMACIONY COMUNICACIONES','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','0','mauricio.cabrera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CABRERA PUCO GLORIA ELIZABETH','TECNICO ADMINISTRATIVO','DIRECCIÓN DE AUDITORÍAINTERNA','02-2976300','0','gloria.cabrera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CACERES MEJIA MONICA TATIANA','ESPECIALISTA DE PRESUPUESTO 3','DIRECCIÓN FINANCIERA','02-2976300','1202','tatiana.caceres@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CACHAGO CONUMBA JESSICA MIREYA','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','-','jessica.cachago@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CADENA ECHEVERRIA JAIME LUIS HERMEL','PROFESOR TITULAR PRINCIPAL DE ESCALAFONPREVIO TIEMPO COMPLETO','DEPARTAMENTO DE CIENCIASADMINISTRATIVAS','02-2976300','1659','jaime.cadena@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CADENA MOSQUERA JOSE MEDARDO','PROFESOR PRINCIPAL A TIEMPO PARCIAL','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2217','medardo.cadena@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CADENA ORTEGA DIEGO FERNANDO','ASISTENTE DE CAPACITACION','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','201','diego.cadena@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CADENA SANTOS LUIS EDUARDO','DIRECTOR DE TALENTO HUMANO','DIRECCIÓN DE TALENTO HUMANO','02-2976300','1260','eduardo.cadena@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CADENA TUQUINGA ANDREA BELEN','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','andrea.cadena@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CADENA VASCONEZ KAROL LISSETH','ASISTENTE DE PRESUPUESTO','DIRECCIÓN FINANCIERA','02-2976300','1205','karol.cadenal@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CADENA VILLOTA FRANCISCO XAVIER','PROFESOR PRINCIPAL A TIEMPO COMPLETO (NIVEL 1, GRADO 6)','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','2129','francisco.cadena@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CAGUA GOMEZ BRIAN JORDANO','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','brian.cagua@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CAHUASQUI LUNA JIMENA ELIZABETH','ASISTENTE DE LABORATORIO DE ENSAYO','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','2156','jimena.cahuasqui@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CAICEDO ORTIZ GANDHY','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','gandhy.caicedo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CAISALUISA IZA OSWALDO AMADOR','AUXILIAR DE MANTENIMIENTO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2017','oswaldo.caisaluisa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CAIZA ARICO BYRON FABERNEY','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','DEPARTAMENTO DE INGENIERÍAQUÍMICA','02-2976300','4322','byron.caiza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CAIZA CERACAPA ELVA MARCELA','ESPECIALISTA DE PRESUPUESTO 2','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','0','elva.caiza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CAIZA ÑACATO JULIO CESAR','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 3, GRADO 5)','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2213','julio.caiza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CAJAS GUIJARRO CARLOS DAVID','ASISTENTE DE TECNOLOGIA DE LA INFORMACIONY COMUNICACIONES','FACULTAD DE INGENIERÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','0','carlos.cajas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CALAHORRANO LEON AYME LILIANA','ENFERMERA','DIRECCIÓN DE BIENESTARESTUDIANTIL Y SOCIAL','02-2976300','-','ayme.calahorrano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CALAHORRANO RECALDE MARCO VINICIO','PROFESOR PRINCIPAL A TIEMPO COMPLETO(NIVEL 1, GRADO 6)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1559','marco.calahorrano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CALDERON DELGADO CARLOS ANDRES','ANALISTA DE INVESTIGACION Y PROYECCION SOCIAL','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','1053','carlos.calderon@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CALDERON HINOJOSA XAVIER ALEXANDER','PROFESOR TITULAR PRINCIPAL DE ESCALAFON PREVIO TIEMPO COMPLETO','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2331/2332','xavier.calderon@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CALDERON SEGOVIA JAIME ALFONSO','RECTOR','RECTORADO','02-2976300','1000','jaime.calderon@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CALLE JIMENEZ TANIA ELIZABETH','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 2, GRADO 4)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4734','tania.calle@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CALVOPIÑA ALVEAR CARMITA DEL ROCIO','ESPECIALISTA DE TESORERIA 3','DIRECCIÓN FINANCIERA','02-2976300','1244','carmita.calvopina@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CAMACHO QUINTERO OSCAR EDUARDO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','0','oscar.camacho@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CAMPAÑA CRUZ KLEBER ORLANDO','ESPECIALISTA EN DISEÑO Y PLANIFICACIONMECANICA','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','3701','kleber.campana@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CAMPAÑA ENRIQUEZ CRISTINA ALEXANDRA','TECNICO DOCENTE','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2346','cristina.campana@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CAMPAÑA ORTEGA EDUARDO MAURICIO','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4715','eduardo.campana@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CAMPIÑO LLERENA KARINA LIZETTE','ASISTENTE DE LABORATORIO DE ENSAYO','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','1604','karina.campino@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CAMPOVERDE ROBLES MARIA GABRIELA','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','-','maria.campoverde@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CANDO NARVAEZ EDGAR HERNAN','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 3, GRADO 5)','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3714','edgar.cando@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CANDO SOLIS FIDEL ENRIQUE','TECNICO DE MANTENIMIENTO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2020','fidel.cando@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CANELOS SALAZAR RAUL ANTONIO','PROFESOR TIEMPO PARCIAL PRINCIPAL 1','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2217','raul.canelos@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CANTUÑA TIGRERO FRANKLIN KLEBER','ESPECIALISTA DE CONTABILIDAD 1','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','134','franklin.cantuna@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CAÑIZARES CASARETTO MYRIAN HORTENCIA','SECRETARIA','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','209','myriam.canizares@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CAPA SANTOS HOLGER ANIBAL','PROFESOR PRINCIPAL A TIEMPO PARCIAL (NIVEL 1,GRADO 6)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1553','holger.capa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CARDENAS CARDENAS DIEGO RENATO','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE GEOLOGÍA','02-2976300','3302','diego.cardenas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CARDONA FERREIRA ADRIANA MARIA','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE FÍSICA','02-2976300','1063','adriana.cardona@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CARRASCO DELHY LUIS FERNANDO','PROFESOR AGREGADO 2 A TIEMPO PARCIAL','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4701','luis.carrasco@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CARRASCO GUEVARA SANDY MARISOL','SECRETARIA EJECUTIVA 1','FACULTAD DE CIENCIAS','02-2976300','1515','sandy.carrasco@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CARRASCO MEDINA FRANCISCO PATRICIO','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE CIENCIASADMINISTRATIVAS','02-2976300','1662','patricio.carrasco@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CARRERA BURNEO NELLY PATRICIA','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1604','nelly.carrera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CARRERA FLORES ILIANA ELIZABETH','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','5218','iliana.carreraf@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CARRERA IZURIETA IVAN MARCELO','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 3, GRADO 5)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4724','ivan.carrera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CARRERA PROAÑO GISELA JANNETH','TECNICO DOCENTE','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','','gisela.carrera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CARRERA SUAREZ LUIS FERNANDO','PROFESOR PRINCIPAL A TIEMPO COMPLETO (NIVEL 1, GRADO 6)','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2326','fernando.carrera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CARRERA VILLAROEL VIVIANA PAOLA','ANALISTA DE MARKETING 1','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','121','viviana.carrera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CARRILLO CALDERON SANTIAGO ROBERTO','PROFESOR TIEMPO COMPLETO PRINCIPAL 1','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4701','santiago.carrillo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CARRILLO MAYANQUER ANGELICA ALEXANDRA','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','angelica.carrillo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CARRILLO ZEA MARIA JOSE','ESPECIALISTA DE TALENTO HUMANO 3','DIRECCIÓN DE TALENTO HUMANO','02-2976300','1262','maria.carrilloz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CARRION TORO MAYRA DEL CISNE','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4712','mayra.carrion@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CARVAJAL CHIRIBOGA XIMENA JHADIRA','SERVIDOR PUBLICO 6','DIRECCIÓN DE TALENTO HUMANO','02-2976300','1269','ximena.carvajal@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CARVAJAL GUAMAN LOURDES ARACELY','SECRETARIA EJECUTIVA 1','DEPARTAMENTO DE CIENCIASADMINISTRATIVAS','02-2976300','1804','lourdes.carvajal@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CARVAJAL HEREDIA FRANCISCO XAVIER','GUIA DE MUSEO','OBSERVATORIO ASTRONÓMICO','02-2976300','6803','xavier.carvajal@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CARVAJAL JARA PATRICIO ARMANDO','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE CIENCIASSOCIALES','02-2976300','6051','patricio.carvajal@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CARVAJAL LOPEZ LUIS VLADIMIR','ENTOMÓLOGO','DEPARTAMENTO DE BIOLOGÍA','02-2976300','6004','vladimir.carvajal@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CARVAJAL RODRIGUEZ JORGE EDUARDO','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 2, GRADO 4)','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2206/2348','jorge.carvajal@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CASA TIPAN EDWIN PATRICIO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1604','edwin.casa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CASA VILLEGAS MARY FERNANDA','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 1, GRADO 3)','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','4310','mary.casa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CASILLAS VELA LUIS ALFREDO','CONSERJE EXTERNO','FACULTAD DE INGENIERÍA ENGEOLOGÍA Y PETRÓLEOS','02-2976300','3302','luis.casillas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CASTELLANO GUEVARA ELENA DE LOURDES','SECRETARIA EJECUTIVA 1','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2707','elena.castellano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CASTILLO DOMINGUEZ JUAN PATRICIO','PROFESOR PRINCIPAL A TIEMPO COMPLETO(NIVEL 1, GRADO 6)','DEPARTAMENTO DE CIENCIASNUCLEARES','02-2976300','4220','patricio.castillo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CASTILLO GUTIERREZ MARCELO FABIAN','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','DIRECCIÓN DE RELACIONESINSTITUCIONALES','02-2976300','1301','marcelo.castillom@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CASTILLO MARTINEZ CRISTHIAN PATRICIO','DISEÑADOR INSTRUCCIONAL','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','152','cristhian.castillom@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CASTILLO SALINAS LUIS ALBERTO','ASISTENTE DE TECNOLOGIA DE LA INFORMACIONY COMUNICACIONES','FACULTAD DE INGENIERÍA DESISTEMAS','02-2976300','4717','luis.castillo01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CASTRO LIMA WILSON RAMIRO','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 2','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1444','wilson.castro@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CASTRO MEJIA JORGE VINICIO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE CIENCIASSOCIALES','02-2976300','6051','jorge.castrom@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CASTRO MENESES ANTONIO FIDEL','ANALISTA DE REDES DE MONITOREO GEOFISICO 3','PROYECTOS EPN','02-2976300','6708','antonio.castro@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CASTRO REVELO JONATHAN FERNANDO','TECNICO DOCENTE','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3701','jonathan.castroj@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CASTRO RODRIGUEZ BERNARDO DAVID','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1604','bernardo.castro@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CASTRO TORO ROBERTO PATRICIO','ASISTENTE ADMINISTRATIVO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2023','roberto.castro@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CAZCO INIGUEZ ROBERT PATRICIO','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1604','robert.cazco@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CEDEÑO VALLEJO MARIA SOL','ESPECIALISTA DE TESORERIA 1','DIRECCIÓN FINANCIERA','02-2976300','1242','maria.cedeno@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CELA ROSERO ANDRES FERNANDO','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 3, GRADO 5)','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2241','andres.cela@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CELI APOLO LUIS ALBERTO','VICERRECTOR DE INVESTIGACIÓN Y PROYECCIÓN SOCIAL','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','1050','alberto.celi@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CELI CELI EDISON ANIBAL','ANALISTA TECNICO DEL OBSERVATORIOASTRONOMICO','OBSERVATORIO ASTRONÓMICO','02-2976300','6801','edison.celi@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CELY VELEZ BOLIVAR MAURICIO','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','-','mauricio.cely@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CEPEDA CAMPAÑA JAIME CRISTOBAL','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','-','jaime.cepeda@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CERON GUERRA IGNACIO BLADIMIR','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE PETRÓLEOS','02-2976300','3302','ignacio.ceron@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CERON LOPEZ GONZALO MAURICIO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE PETRÓLEOS','02-2976300','3302','gonzalo.ceron@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CESEN ARTEAGA MARIO ALBERTO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3711','mario.cesen@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CEVALLOS BARRAGAN CARLOS ENRIQUE','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','','carlos.cevallos02@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CEVALLOS LOPEZ ANDRES ALEJANDRO','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 2','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','0','andres.cevallosl@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CEVALLOS SALAZAR GABRIELA KATHERINE','TECNICO DOCENTE','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2714','gabriela.cevalloss@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CEVALLOS TERAN CARLOS XAVIER','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4715','carlos.cevallost@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CEVALLOS ZAMBRANO CARLOS FRANCISCO','PROFESOR PRINCIPAL A TIEMPO PARCIAL','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2213','francisco.cevallos@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CHACON CARLOSAMA PATRICIA BELEN','ESPECIALISTA DE PRESUPUESTO 2','DIRECCIÓN FINANCIERA','02-2976300','1201','patricia.chacon@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CHANCUSIG CHUQUILLA RODRIGO FABIAN','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4743','rodrigo.chancusig@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CHANCUSIG ESPIN BERNARDINO','PROFESOR PRINCIPAL A TIEMPO PARCIAL','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4701','bernardo.chancusig@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CHANGO VILLACIS JOSE IVAN','ESPECIALISTA EN TECNICAS DE ANALISIS QUIMICO','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','2127','jose.chango@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CHARRO SIMBAÑA DORYS YOLANDA','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 3','VICERRECTORADO DE DOCENCIA','02-2976300','1442','dorys.charro@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CHARRO SIMBAÑA FRANCISCO FAUSTO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','francisco.charro@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CHAVEZ BASTIDAS MAYRA SUSANA','ASISTENTE DE TESORERIA','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','158','mayra.chavez01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CHAVEZ GARCIA GEOVANNY DANILO','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 2, GRADO 4)','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','5452','danilo.chavez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CHAVEZ JACOME ERIKA ALEXANDRA','ADMINISTRADOR 2','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','0','erika.chavez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CHELA TIPANTAXI GEOVANNA MARISOL','ESPECIALISTA DE TECNOLOGÍAS DE LAINFORMACIÓN Y COMUNICACIONES 3','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1442','geovanna.chela@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CHERREZ PALACIOS LUIS GERMAN','TECNICO MECANICO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2017','luis.cherrez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CHICAIZA CRUZ EFRAIN','AUXILIAR DE INGENIERIA','DIRECCIÓN ADMINISTRATIVA','02-2976300','2017','efrain.chicaiza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CHICO HIDALGO PATRICIO IVAN','PROFESOR TITULAR PRINCIPAL DE ESCALAFON PREVIO TIEMPO COMPLETO','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2334','patricio.chico@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CHICO PROAÑO ANDRES GABRIEL','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE INGENIERÍAQUÍMICA','02-2976300','4323','andres.chico@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CHILLA PRIETO MARIO FERNANDO','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','mario.chilla@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CHILLOGANA SANTAMARIA MIGUEL ALEXANDER','TECNICO DE MANTENIMIENTO','FACULTAD DE INGENIERÍAQUÍMICA Y AGROINDUSTRIA','02-2976300','2102','miguel.chillogana@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CHIPANTIZA CASTILLO OLGA VICTORIA','RESPONSABLE DE LAS BIBLIOTECAS','BIBLIOTECA GENERAL','02-2976300','1360','olga.chipantiza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CHITO CHITO ROSA MARLENE','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 3','PROYECTOS EPN','02-2976300','6701','rosa.chito@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CHUNG LIU EDISON ALEJANDRO','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','0','edison.chung@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CISNEROS FLORES CARLA ALEJANDRA','SECRETARIA EJECUTIVA 1','OBSERVATORIO ASTRONÓMICO','02-2976300','6801','carla.cisneros@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CISNEROS JARRIN JANETH GUADALUPE','RECEPCIONISTA ESPECIALIZADO','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','101','janeth.cisneros@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CISNEROS MERA CHRISTIAN RAFAEL','ANALISTA DE REDES DE MONITOREO GEOFISICO 3','INSTITUTO GEOFÍSICO','02-2976300','6704','christian.cisneros@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CISNEROS TACO JAIRO GEOVANNY','JARDINERO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2025','jairo.cisneros@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'COBO GUALICATA RAUL ENRIQUE','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','3701','raul.cobo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'COFRE LUGUAÑA EDGAR FERNANDO','AUXILIAR DE SERVICIOS','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','1132','edgar.cofre@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'COLLANTES KLEBER GEOVANY','ESPECIALISTA DE LABORATORIO DE ENSAYOS 1','DEPARTAMENTO DE METALURGIAEXTRACTIVA','02-2976300','5807','kleber.collantes@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'COLMACHI TORRES NANCY TERESA DEL ROCIO','OFICINISTA','DEPARTAMENTO DE CIENCIASNUCLEARES','02-2976300','4203','nancy.colmachi@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'COMINA ESCOBAR MANUEL MARIA','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2702','manuel.comina@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CONGO CARCELEN WILDER FERNANDO','JARDINERO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2025','wilder.congo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CONSTANTE PARRA GIOVANNY DANIEL','AYUDANTE DE CATEDRA','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','-','giovanny.constante@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CONSTANTE SOSA MARIA FERNANDA','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','0','maria.constante01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CONZA GONSALEZ ANDREA ELIZABETH','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 2','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','126','andrea.conza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CORDOVA AGUILAR MARCO DANIEL','ASISTENTE GEOFISICO','PROYECTOS EPN','02-2976300','6701','marco.cordova@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CORDOVA BAYAS MARCOS RAUL','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','5330','raul.cordova@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CORDOVA BRAVO JORGE ARTURO','ASISTENTE GEOFISICO','PROYECTOS EPN','02-2976300','6704','jorge.cordovaj@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CORDOVA MESA CARLOS JENRY','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1603','jenry.cordova@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CORDOVA ORELLANA CLAUDIO CONSTANTE','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3150','claudio.cordova@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CORDOVA PINTADO MARÍA DANIELA','PROFESIONAL','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','0','daniela.cordova@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CORDOVA RAMOS LILIANA DE LOURDES','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 3','VICERRECTORADO DE DOCENCIA','02-2976300','1433','liliana.cordova@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CORDOVA REGALADO ANDREA ELIZABETH','ANALISTA DE REDES DE MONITOREO GEOFISICO 3','PROYECTOS EPN','02-2976300','0','andrea.cordova@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CORDOVA RIVERA MARINA ALEXANDRA','SECRETARIA EJECUTIVA 2','VICERRECTORADO DE DOCENCIA','02-2976300','1120','marina.cordova@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CORELLA GUERRA GUADALUPE ELIZABETH','ASISTENTE DE CAPACITACION','VICERRECTORADO DE DOCENCIA','02-2976300','101','guadalupe.corella@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CORELLA GUERRA MARTHA PATRICIA','SECRETARIA','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','2151','martha.corella@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CORONEL PROAÑO GISELA MYLENE','ANALISTA ADMINISTRATIVO ACADEMICO 2','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1551','gisela.coronel@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CORREA GUALOTO CARLOS XAVIER','TECNICO DE MANTENIMIENTO','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','110','carlos.correa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CORREA VALLEJO MARIA BELEN','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1604','maria.corream@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CORTES ARBOLEDA NEFERTY YAEL','SECRETARIA EJECUTIVA 1','FACULTAD DE INGENIERÍA ENGEOLOGÍA Y PETRÓLEOS','02-2976300','3302','neferty.cortes@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CORTEZ ESTRELLA MANUEL FERNANDO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1501','manuel.cortez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'COSTA VERA CESAR AUGUSTO','JEFE DE DEPARTAMENTO','DEPARTAMENTO DE FÍSICA','02-2976300','1708','cesar.costa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CRESPO ESPINOZA ANGEL FABRICIO','ESPECIALISTA DE PRESUPUESTO 3','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','119','fabricio.crespo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CRIOLLO APOLO MAURICIO JULIO','TECNICO DE LABORATORIO DE INVESTIGACION Y CONTROL AMBIENTAL','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1902','mauricio.criollo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CRIOLLO TIRADO EVELYN PAMELA','RESPONSABLE DE LABORATORIO DE ENSAYOS','DEPARTAMENTO DE METALURGIAEXTRACTIVA','02-2976300','5804','evelyn.criollo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CRUZ ARTIEDA MARIA ELENA','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE CIENCIASSOCIALES','02-2976300','6051','maria.cruz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CRUZ CASTRO SARA ELISA','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 2','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1441','sara.cruz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CRUZ COBO MAYRA ELIZABETH','CONSERJE','FACULTAD DE CIENCIASADMINISTRATIVAS','02-2976300','1804','mayra.cruz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CRUZ DAVALOS PATRICIO JAVIER','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2203','patricio.cruz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CRUZ FIALLO PABLO DAVID','AUXILIAR DE MONITOREO','INSTITUTO GEOFÍSICO','02-2976300','6711','pablo.cruz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CRUZ LOPEZ NANCY GUADALUPE','REFERENCISTA','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','nancy.cruz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CRUZ VILLARREAL JOSE ANIBAL','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE FÍSICA','02-2976300','1701','anibal.cruz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CRUZ VILLARRUEL EDMUNDO','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','edmundo.cruz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CUALCHI GUACHAMIN DIEGO GIOVANNY','TECNICO DE OPERACION Y MANTENIMIENTO DEMAQUINARIA Y/O EQUIPOS /TECNICO DE OPERACIONES','DEPARTAMENTO DE INGENIERÍA MECÁNICA','02-2976300','3711','diego.cualchi@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CUAYCAL BASTIDAS ANDRES FERNANDO','TECNICO DOCENTE','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2203','andres.cuaycal@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CUELLAR QUINTERO IVIS YOCONDA','SECRETARIA','DIRECCIÓN DE BIENESTARESTUDIANTIL Y SOCIAL','02-2976300','1261','ivis.cuellar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CUENCA SANCHEZ ALAN DANIEL','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2736','alan.cuenca@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CUESTA VEGA JESSICA OTILIA','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE FÍSICA','02-2976300','','jessica.cuesta@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CUESTAS CAZA JAVIER ALEJANDRO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','1804','javier.cuestas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CUEVA ORTIZ EMMA MARIANA','SECRETARIA EJECUTIVA 1','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3100','emma.cueva@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CUEVA RODRIGUEZ RUTH AMELIA','JEFA DE DEPARTAMENTO','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','1004','ruth.cueva@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CUICHAN CARRION LEIDER FAVIO','TECNICO DE MANTENIMIENTO','METALMECÁNICA SAN BARTOLO','02-2976300','2670823','leider.cuichan@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CUNGUAN ITAS LUIS ALFREDO','CARPINTERO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2018','luis.cunguan@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CUSTODE MEJIA FERNANDO EDMUNDO','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1630','fernando.custode@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CUSTODIO ARAUJO LOURDES MARIELA','RESPONSABLE ADMINISTRATIVO DE PROYECCIONSOCIAL','FACULTAD DE CIENCIAS','02-2976300','5217','lourdes.custodio@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CUTIOPALA CUVI CESAR RAMON','ALBANIL','DIRECCIÓN ADMINISTRATIVA','02-2976300','2025','cesar.cutiopala@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'CUVERO CALERO YANDIRA DENISSE','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','-','yandira.cuvero@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'D AMBROSIO VERDESOTO GIOVANNI PAULO','JEFE DE DEPARTAMENTO','DEPARTAMENTO DE CIENCIASADMINISTRATIVAS','02-2976300','1655','giovanni.dambrosio@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DAVILA FRIAS ALEX VICENTE','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','1815','alex.davila@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DE BENEDICTIS AREVALO LAURA ELIZABETH','SECRETARIA EJECUTIVA 1','FACULTAD DE CIENCIASADMINISTRATIVAS','02-2976300','2203','laura.debenedictis@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DE LA BASTIDA CASTILLO DIEGO FERNANDO','ASISTENTE JURIDICO','SECRETARÍA GENERAL','02-2976300','0','diego.delabastida@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DE LA CRUZ ORTEGA JOHNNY SANTIAGO','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','0','johnny.delacruz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DE LA TORRE CARRILLO JOSE MARIA','ASESOR 3','RECTORADO','02-2976300','1001','jose.delatorrec@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DE LA TORRE CHAUVIN ERNESTO HALE','DECANO','FACULTAD DE INGENIERÍAQUÍMICA Y AGROINDUSTRIA','02-2976300','5800','ernesto.delatorre@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DE LA TORRE NEIRA OSWALDO PABLO','PROFESOR TIEMPO PARCIAL PRINCIPAL 1','DEPARTAMENTO DE CIENCIASADMINISTRATIVAS','02-2976300','1804','oswaldo.delatorre@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DE LOS REYES BUENO JUAN CARLOS','PROFESOR PRINCIPAL A TIEMPO COMPLETO(NIVEL 1, GRADO 6)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1573','juan.delosreyes@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DE MORA JARRIN PAUL ANTONIO','RESPONSABLE ADMINISTRATIVO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2024','paul.demora@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DEL CASTILLO MANCHENO ANGEL EDUARDO','SECRETARIA','FACULTAD DE INGENIERÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','-','angel.delcastillo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DELGADO CHAUMANA WILSON RODRIGO','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 2','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1407','wilson.delgado@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DELGADO TORRES GIN EDUARDO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE CIENCIASSOCIALES','02-2976300','6052','eduardo.delgado@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DIAZ BUSTAMANTE JOSE CAMILO','TECNICO DOCENTE','DEPARTAMENTO DE FÍSICA','02-2976300','','jose.diaz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DIAZ CAMPOVERDE CARLOS WIME','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE MATERIALES','02-2976300','3004','carlos.diaz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DIAZ DURAN EUGENIA VERONICA','ESPECIALISTA DE LABORATORIO DE ENSAYOS 1','DEPARTAMENTO DE METALURGIAEXTRACTIVA','02-2976300','5805','eugenia.diaz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DIAZ IZA HAROLD JOSE','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','harold.diaz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DIAZ REINOSO XIMENA DE LAS MERCEDES','PROFESOR PRINCIPAL A TIEMPO COMPLETO(NIVEL 1, GRADO 6)','DEPARTAMENTO DE METALURGIAEXTRACTIVA','02-2976300','5809','ximena.diaz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DIAZ SANCHEZ JUAN PABLO','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 2, GRADO 4)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1501','juan.diaz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DIAZ VILLACIS LUIS EFREN','PROFESOR AGREGADO A TIEMPO PARCIAL (NIVEL 1, GRADO 3)','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2213','luis.diaz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DIBUJES VILLALBA EDWIN ROBERTO','TECNICO DE OPERACION Y MANTENIMIENTO DEMAQUINARIA Y/O EQUIPOS /TECNICO DE OPERACIONES','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1951','edwin.dibujes@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DOICELA GOMEZ RUTH MARCELA','SECRETARIA','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','108','ruth.doicela@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DOMINGUEZ GAVILANES DIEGO SEBASTIAN','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','-','diego.dominguez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DOMINGUEZ VACA CARLOS ROBERTO','GUARDALMACEN','DIRECCIÓN ADMINISTRATIVA','02-2976300','2022','carlos.dominguez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DOMINGUEZ VILLA LUIS GERARDO','CONSERJE EXTERNO','FACULTAD DE CIENCIASADMINISTRATIVAS','02-2976300','1819','luis.dominguez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DONOSO BAZANTE AURELINA ISABEL','ESPECIALISTA JURIDICO 2','METALMECÁNICA SAN BARTOLO','02-2976300','2670823','aurelina.donoso@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DONOSO VARGAS DAVID ANDRES','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE FÍSICA','02-2976300','1063','david.donosov@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DUEÑAS VIDAL ALVARO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE FÍSICA','02-2976300','4701','alvaro.duenas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DUQUE ALMEIDA CESAR GONZALO','CONSERJE EXTERNO','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4701','cesar.duque@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DUQUE ARIAS CHRISTIAN MAURICIO','GESTOR DE CONSULTORIA 3','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','143','christian.duque@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DUQUE CALDERON ENRIQUE MARCELO','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1572','marcelo.duque@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DUQUE OROZCO MAURICIO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','-','mauricio.duque@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'DUTAN CHACON CARMEN CECILIA','SECRETARIA','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','1604','carmen.dutan@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ECHEVERRIA AMORES JOHANNA POLET','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','1056','johanna.echeverria@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ECHEVERRIA CULQUI HENRY MANOLO','PROFESOR AGREGADO 2 A TIEMPO PARCIAL','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4701','henry.echeverria@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ECHEVERRIA FEIJOO CARLOS AUGUSTO','PROFESOR TITULAR PRINCIPAL DE ESCALAFONPREVIO TIEMPO COMPLETO','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1561','carlos.echeverria@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'EGAS ACOSTA CARLOS ROBERTO','PROFESOR TITULAR PRINCIPAL DE ESCALAFON PREVIO TIEMPO COMPLETO','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2328','carlos.egas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'EGAS BALSECA SONIA ALEXANDRA','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE CIENCIASSOCIALES','02-2976300','6051','sonia.egas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'EGUEZ DELGADO ARTURO EFRAIN','PROFESOR PRINCIPAL A TIEMPO PARCIAL','DEPARTAMENTO DE GEOLOGÍA','02-2976300','3306','arturo.eguez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'EGUEZ PAREDES CARLOS RICARDO','ESPECIALISTA DE TESORERIA 1','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','129','carlos.eguez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'EGUEZ SARZOSA VICENTE ADRIAN','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','-','adrian.eguez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ENCALADA FLORES SANTIAGO ANDRES','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','','santiago.encalada@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ENCALADA SIMBAÑA MARJORIE ELIZABETH','ASISTENTE GEOFISICO','PROYECTOS EPN','02-2976300','6701','marjorie.encalada@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ENCALADA TENESACA MILTON GEOVANNY','TECNICO DE MANTENIMIENTO','METALMECÁNICA SAN BARTOLO','02-2976300','2670823','milton.encalada@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ENDARA DRANICHNIKOVA DIANA','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 1, GRADO 3)','DEPARTAMENTO DE METALURGIAEXTRACTIVA','02-2976300','5802','diana.endara@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ENRIQUEZ LOPEZ WILSON LEONEL','PROFESOR PRINCIPAL A TIEMPO COMPLETO','INSTITUTO GEOFÍSICO','02-2976300','6704','wilson.enriquez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ENRIQUEZ PINCAY YESENIA CORINA','TECNICO DOCENTE','DEPARTAMENTO DE GEOLOGÍA','02-2976300','0','yesenia.enriquez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ENRIQUEZ REYES GRACE ALEXANDRA','RESPONSABLE DE TALENTO HUMANO','DIRECCIÓN DE TALENTO HUMANO','02-2976300','1273','grace.enriquez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ERAZO HERRERA MYLENE GRACE','COORDINADOR DE DESPACHO','RECTORADO','02-2976300','1001','grace.erazo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ERAZO PAZMIÑO JULIO MARCELO','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 1','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1581','julio.erazo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ERAZO SORIA CLARA ALEJANDRA','TECNICO DOCENTE','DEPARTAMENTO DE INGENIERÍAQUÍMICA','02-2976300','4209','clara.erazo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ESCOBAR CARDENAS JOSE LUIS','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 2','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','0','jose.escobarc@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ESCOBAR CUEVA GINA ELIZABETH','ADMINISTRADOR 2','DIRECCIÓN ADMINISTRATIVA','02-2976300','2019','gina.escobar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ESCOBAR DUCHE VANESSA LEONOR','TECNICO DOCENTE','DEPARTAMENTO DE GEOLOGÍA','02-2976300','','vanessa.escobar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ESCOBAR GUERRERO BETTY ALEXANDRA','SECRETARIA','DEPARTAMENTO DE METALURGIAEXTRACTIVA','02-2976300','-','betty.escobar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ESCOBAR ORTIZ JORGE ISMAEL','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3701','jorge.escobaro@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ESPARZA GUERRA FREDDY HILMO','AUDITOR INTERNO 3','DIRECCIÓN DE AUDITORÍAINTERNA','02-2976300','5103','freddy.esparza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ESPIN BEDON PEDRO ALEJANDRO','ANALISTA DE REDES DE MONITOREO GEOFISICO 1','PROYECTOS EPN','02-2976300','6702','pedro.espinp@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ESPIN FELIX NEYDA FERNANDA','SUBDECANO','FACULTAD DE INGENIERÍAQUÍMICA Y AGROINDUSTRIA','02-2976300','4303','neyda.espin@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ESPIN IBARRA CHRISTIAN JONATHAN','ANALISTA DE REDES DE MONITOREO GEOFISICO 1','PROYECTOS EPN','02-2976300','6701','christian.espin@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ESPIN OÑA MARLENE ELIZABETH','SECRETARIA','DEPARTAMENTO DE CIENCIASNUCLEARES','02-2976300','2105','marlene.espin@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ESPINOSA CHAUVIN DIEGO MARCELO','PROFESOR PRINCIPAL A TIEMPO PARCIAL','DEPARTAMENTO DE MATERIALES','02-2976300','5856','diego.espinosa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ESPINOSA DE LA CUEVA CESAR AUGUSTO','JEFE DE PRESUPUESTO (CAMBIO ADMINISTRATIVOCCICEV)','DIRECCIÓN FINANCIERA','02-2976300','0','cesar.espinosa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ESPINOSA GUZMAN LENIN VOLTAIRE','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE CIENCIASSOCIALES','02-2976300','0','lenin.espinosa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ESPINOSA ORDOÑEZ PABLO FERNANDO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','pablo.espinosa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ESPINOZA JARA CARMITA MARIA','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','1806','carmita.espinoza01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ESPINOZA MONTERO PATRICIO JAVIER','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1604','patricio.espinoza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ESPINOZA ORTIZ RAMIRO GUSTAVO','ADMINISTRADOR 2','DIRECCIÓN ADMINISTRATIVA','02-2976300','2023','ramiro.espinoza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ESTRADA JIMENEZ JOSE ANTONIO','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 3, GRADO 5)','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2310','jose.estrada@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ESTRADA RIVERA JUAN PATRICIO','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','juan.estrada@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ESTRELLA BURBANO DANY FERNANDO','MENSAJERO','DIRECCIÓN DE TALENTO HUMANO','02-2976300','1263','dany.estrella@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ESTUPIÑAN GARCIA DARWIN GEOVANNY','JARDINERO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2025','darwin.estupinan@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FABARA RODRIGUEZ CRISTIAN PAUL','TECNICO DOCENTE','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2203','cristian.fabara@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FAJARDO PRUNA CRISTIAN ALEXANDER','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','cristian.fajardop@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FARIAS CAIZA NANCY JANNETH','ADMINISTRADOR 1','INSTITUTO GEOFÍSICO','02-2976300','6701','nancy.fariasn@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FARINANGO CUMANICHO MARIO ALEJANDRO','TECNICO DE OPERACION Y MANTENIMIENTO DEMAQUINARIA Y/O EQUIPOS /TECNICO DE OPERACIONES','METALMECÁNICA SAN BARTOLO','02-2976300','2670823','mario.farinango@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FERNANDEZ GARCIA CARLOS','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','-','0');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FERNANDEZ JULIO CESAR','AUXILIAR DE INGENIERIA','DIRECCIÓN ADMINISTRATIVA','02-2976300','2017','cesar.fernandez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FERNANDEZ MARTINEZ LENYS MERCEDES','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','-','0');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FERNANDEZ PADILLA MARIA ISABEL','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','110','maria.fernandez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FIERRO CONCHAMBAY VANESSA FERNANDA','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','0','vanessa.fierro@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FIERRO NARANJO GRETA CAROLA','RESPONSABLE DEL CENTRO DE INVESTIGACION Y CONTROL AMBIENTAL','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','2150','greta.fierro@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FIERRO NARANJO NANCY ELIZABETH','SECRETARIA','FACULTAD DE INGENIERÍA DESISTEMAS','02-2976300','2015','nancy.fierro@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FLORES ARMAS DENYS ALBERTO','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 2, GRADO 4)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4705','denys.flores@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FLORES ARTIEDA JOFFRE ALEXIS','ASISTENTE DE CAPACITACION','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','125','joffre.flores@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FLORES BENALCAZAR CARMEN JOHANNA','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','','carmen.flores@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FLORES CABEZAS XAVIER ALEJANDRO','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','-','xavier.flores@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FLORES CADENA GARY FERNANDO','ANALISTA TECNICO DEL OBSERVATORIOASTRONOMICO','OBSERVATORIO ASTRONÓMICO','02-2976300','6804','gary.flores@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FLORES CALDERON ESTEBAN PAUL','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','-','esteban.flores02@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FLORES CAÑIZARES XIMENA PATRICIA','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 1','FACULTAD DE INGENIERÍA ENGEOLOGÍA Y PETRÓLEOS','02-2976300','3328','ximena.flores@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FLORES CIFUENTES WILLAMS FERNANDO','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2254','fernando.flores@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FLORES CRUZ JUAN CARLOS','AYUDANTE DE CARPINTERÍA','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1902','juan.flores03@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FLORES ESTEVEZ FANNY PAULINA','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2712','fanny.flores@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FLORES JUAN MANUEL','ADMINISTRADOR 2','DIRECCIÓN ADMINISTRATIVA','02-2976300','1904','juan.flores@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FLORES LAGUATE CONSUELO GRIMANESA','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 1','FACULTAD DE INGENIERÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2306','consuelo.flores@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FLORES NARANJO MHOYRI VERONICA','SECRETARIA EJECUTIVA 2','FACULTAD DE INGENIERÍA DESISTEMAS','02-2976300','4736','veronica.flores@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FLORES NARANJO PAMELA CATHERINE','PROFESOR AGREGADO 1 A TIEMPO COMPLETO (NIVEL 1, GRADO 3)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4709','pamela.flores@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FLORES SANCHEZ MIGUEL ALFONSO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1551','miguel.flores@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FLORES VIVAS KARLA DANIELA','OFICINISTA','VICERRECTORADO DE DOCENCIA','02-2976300','1101','karla.flores@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FONSECA PAVON PAULINA ISABEL','COMUNICADOR SOCIAL 1','DIRECCIÓN DE RELACIONESINSTITUCIONALES','02-2976300','1303','paulina.fonseca@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FRANCO CRESPO ANTONIO ALEXANDER','SUBDECANO','FACULTAD DE CIENCIASADMINISTRATIVAS','02-2976300','1811','antonio.franco@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FRANCO RIVADENEIRA KARLA DANIELA','ASISTENTE DE AUDITORIA INTERNA','DIRECCIÓN DE AUDITORÍAINTERNA','02-2976300','5101','karla.franco@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FREIRE BONILLA CRISTIAN PATRICIO','ASISTENTE DE LABORATORIO DE ENSAYO','INSTITUTO GEOFÍSICO','02-2976300','6701','cristian.freire@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FREIRE SARABIA MARIA EFIGENIA','AUXILIAR DE SERVICIOS GENERALES','INSTITUTO GEOFÍSICO','02-2976300','6703','0');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FREIRE SIMBAÑA FREDDY PAUL','GUIA DE MUSEO','DEPARTAMENTO DE BIOLOGÍA','02-2976300','6001','paul.freire@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FREIRE VASCONEZ PAULINA ANDREA','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','','paulina.freire@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FUENTES MEDINA DARIO ALEJANDRO','TECNICO DOCENTE','DEPARTAMENTO DE GEOLOGÍA','02-2976300','','dario.fuentes@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FUENTES ROSERO PATRICIO JAVIER','ASISTENTE DE LABORATORIO DE ENSAYO','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','3701','patricio.fuentesr@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'FUERTES DIAZ WALTER MARCELO','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4715','walter.fuertes@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GAHONA MUÑOZ KARINA DEL ROCIO','SECRETARIA','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3107','karina.gahona@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GAIBOR VILLOTA JANETH VALERIA','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE GEOLOGÍA','02-2976300','-','janeth.gaibor@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GAIBOR YAGCHIREMA LUIS FERNANDO','SECRETARIO','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','1604','luis.gaibor@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GALARRAGA SOTO EFREN PATRICIO','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE CIENCIASADMINISTRATIVAS','02-2976300','1802','efren.galarraga@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GALARZA GRANDA JOSE GERMAN','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3739','jose.galarzag@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GALARZA HIDALGO JOSE LUIS','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3701','jose.galarza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GALARZA VINUEZA JUAN CARLOS','CONSERJE','FACULTAD DE CIENCIASADMINISTRATIVAS','02-2976300','1820','juan.galarza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GALEAS HURTADO SALOME GABRIELA','ESPECIALISTA DE CARACTERIZACIÓN DEMATERIALES','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','3735','salome.galeas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GALINDO LOSADA JULIAN ANDRES','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4735','julian.galindo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GALLARDO LASTRA LORENA FERNANDA','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2718','lorena.gallardo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GALLARDO LOPEZ TERESITA DE JESUS','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE CIENCIASSOCIALES','02-2976300','6051','teresita.gallardo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GALLARDO QUINGATUÑA CARLOS FABIAN','JEFE DE DEPARTAMENTO','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2304','carlos.gallardo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GALLEGOS CALDERON MARCO FERNANDO','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','0','marco.gallegos@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GALLEGOS CASTRO ELVIA DEL CARMEN','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','1604','elvia.gallegosc@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GALLEGOS ERAS ALVARO VINICIO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE PETRÓLEOS','02-2976300','3302','alvaro.gallegos@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GAMBOA BENITEZ SILVANA DEL PILAR','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2203','silvana.gamboa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GAMEZ RIVERA SEBASTIAN ANTONIO','TECNICO DOCENTE','DEPARTAMENTO DE INGENIERÍAQUÍMICA','02-2976300','0','sebastian.gamez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GARCES DELGADO GONZALO FABRICIO','ODONTOLOGO GENERAL','DIRECCIÓN DE BIENESTARESTUDIANTIL Y SOCIAL','02-2976300','1134','gonzalo.garces@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GARCIA ACOSTA MONICA SOLEDAD','ESPECIALISTA DE TALENTO HUMANO 2','DIRECCIÓN DE TALENTO HUMANO','02-2976300','-','monica.garcia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GARCIA CASTILLO DARIO XAVIER','ASISTENTE GEOFISICO','PROYECTOS EPN','02-2976300','6704','dario.garciad@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GARCIA CEVALLOS JENNIFFER LILIANA','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','-','jenniffer.garcia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GARCIA GUERRA CARLA ELIZABETH','ADMINISTRADOR 1','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','0','carla.garcia01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GARCIA MONCAYO MARIA ELENA','ESPECIALISTA DE TESORERIA 3','DIRECCIÓN FINANCIERA','02-2976300','1240','maria.garcia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GARCIA PAZMIÑO ROBERTO XAVIER','ANALISTA DE TECNOLOGIA DE LA INFORMACION YCOMUNICACIONES','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1444','roberto.garcia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GARCIA VERA MIGUEL FRANCISCO','PROFESOR TIEMPO COMPLETO AUXILIAR 1','DEPARTAMENTO DE FÍSICA','02-2976300','-','miguel.garcia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GARZON PACHECO DIANA JEANNETH','SECRETARIA EJECUTIVA 2','FACULTAD DE INGENIERÍAQUÍMICA Y AGROINDUSTRIA','02-2976300','4302','diana.garzon@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GAUNT HELEN ELIZABETH','GEOFISICO 1','PROYECTOS EPN','02-2976300','0','0');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GAVILANES SAGÑAY FREDY MARCELO','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','0','fredy.gavilanes@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GOMEZ PARREÑO ANGEL VINICIO','ADMINISTRADOR 1','DIRECCIÓN DE TALENTO HUMANO','02-2976300','1275','angel.gomez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GOMEZ SOTO CHRISTIAN MICHAEL','COORDINADOR TÉCNICO DE LABORATORIOS DE INVESTIGACIÓN Y SERVICIO A LA COMUNIDAD','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1952','christian.gomez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GOMEZ SOTO FRANKLIN VINICIO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE PETRÓLEOS','02-2976300','3302','franklin.gomez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GONZALES ZURITA OSCAR OMAR','TECNICO DOCENTE','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','3701','oscar.gonzalesz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GONZALEZ ANDRADE SERGIO ALEJANDRO','JEFE DE DEPARTAMENTO','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1533','sergio.gonzalez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GONZALEZ ESPINOSA BLANCA SUSANA','ADMINISTRADOR 1','DIRECCIÓN ADMINISTRATIVA','02-2976300','2005','blanca.gonzalez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GONZALEZ FLORES GRACIELA SUSANA','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 3','FACULTAD DE INGENIERÍA DESISTEMAS','02-2976300','4741','graciela.gonzalez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GONZALEZ FLORES MARIA JOSE','PEDAGOGO','DEPARTAMENTO DE BIOLOGÍA','02-2976300','6001','maria.gonzalezf@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GONZALEZ FUENMAYOR SILVIA PAOLA','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1560','silvia.gonzalez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GONZALEZ GAVILANEZ JOSE DAVID','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','-','jose.gonzalez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GONZALEZ GONZALEZ FABIO MATIAS','JEFE DE DEPARTAMENTO','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2212','fabio.gonzalez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GONZALEZ MAYA JAIME OSWALDO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE PETRÓLEOS','02-2976300','3302','jaime.gonzalez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GONZALEZ VARGAS CRISTINA ALEJANDRA','ANALISTA DE REDES DE MONITOREO GEOFISICO 2','INSTITUTO GEOFÍSICO','02-2976300','6708','cristina.gonzalez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GONZALEZ VILLALVA NELLY PATRICIA','TECNICO DE LABORATORIO DE INVESTIGACION YCONTROL AMBIENTAL','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','1604','patricia.gonzalez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GORDON MOSQUERA CHRISTIAN ROBERTO','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 2','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','133','christian.gordon@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GORDON TULCAN JESSICA FERNANDA','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','jessica.gordon@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GRANDA GUTIERREZ NELSON VICTORIANO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','','nelson.granda@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GRANJA ORAMAS MARIA VICTORIA','TECNICO DOCENTE','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3701','maria.granja@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GRANJA RAMIREZ MARIO GERMAN','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 3, GRADO 5)','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3706','mario.granja@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GRIJALVA AREVALO FELIPE LEONEL','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','','felipe.grijalva@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUACHAMIN ACERO WILSON IVAN','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','','wilson.guachamin@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUACHAMIN GUERRA MARCELA ELIZABETH','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 1, GRADO 3)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1551','marcela.guachamin@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUADA GARRIDO JAIME GUILLERMO','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','0','jaime.guada@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUALLI CULQUI TANIA GUADALUPE','TECNOLOGO','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1421','tania.gualli@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUALLICHICO LLUMIQUINGA WILSON LEONEL','ALBANIL','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','1604','wilson.guallichico@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUALLPA TAMAYO CARLOS VINICIO','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','carlos.guallpa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUAMAN ALARCON MARCO VINICIO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','0','marco.guaman@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUAMAN CELA JOSE ALBERTO','CONSERJE EXTERNO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2025','jose.guamanj@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUAMAN COLCHA LUIS FERNANDO','TECNICO DE MANTENIMIENTO','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','3701','luis.guaman@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUAMAN GUALLI CARLOS','ALBANIL','DIRECCIÓN ADMINISTRATIVA','02-2976300','2025','carlos.guamanc@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUAMAN GUAMBO MANUEL','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','3701','manuel.guaman@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUAMAN ILLICACHI JOSE GREGORIO','ALBANIL','DIRECCIÓN ADMINISTRATIVA','02-2976300','2025','gregorio.guaman@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUAMAN ILLICACHI JOSE MANUEL','TECNICO EN MANTENIMIENTO','FACULTAD DE INGENIERÍAQUÍMICA Y AGROINDUSTRIA','02-2976300','4302','jm.guaman@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUAMAN LOACHAMIN DANNY SANTIAGO','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 2, GRADO 4)','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2213','danny.guaman@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUAMAN SIMBAÑA NARCISA DEL ROCIO','RECEPCIONISTA ESPECIALIZADO','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','202','narcisa.guaman@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUAMANARCA VASQUEZ WILSON HERNAN','ALBANIL','DIRECCIÓN ADMINISTRATIVA','02-2976300','2025','wilson.guamanarca@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUAMANI CLAVIJO KARINA ELIZABETH','TECNICO DOCENTE','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','-','karina.guamani@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUAMBA DIAZ JUAN PABLO','ESPECIALISTA EN MAQUINARIA PESADA YAUTOMOTRIZ','METALMECÁNICA SAN BARTOLO','02-2976300','2670823','juan.guamba@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUANDINANGO TAYA CARLOS ANDRES','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','0','carlos.guandinango@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUANOQUIZA CASANOVA JUAN CARLOS','CHOFER','FACULTAD DE INGENIERÍA ENGEOLOGÍA Y PETRÓLEOS','02-2976300','3302','juan.guanoquiza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUERRA MEDINA ANDREA ALEJANDRA','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3701','andrea.guerram@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUERRA MORA MONICA ELBA','SECRETARIA EJECUTIVA 2','FACULTAD DE INGENIERÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2203','monica.guerra@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUERRA SALCEDO SANTIAGO STALIN','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2716','santiago.guerra@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUERRA VASCONEZ ANDRES DAVID','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','0','andres.guerra@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUERRERO BARRAGAN VICTOR HUGO','DECANO','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','3000','victor.guerrero@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUERRERO CHANGO PABLO CESAR','TECNICO EN METALMECANICA','DEPARTAMENTO DE CIENCIASNUCLEARES','02-2976300','2101','pablo.guerrero@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUERRERO FLOR MARCO SEBASTIAN','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','','sebastian.guerrero@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUERRERO GANDARA JAIME PATRICIO','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 3','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2708','patricio.guerrero@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUERRERO INTRIAGO ANGELICA MARIA','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','-','angelica.guerrero@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUERRERO MONTA CARLA ESTEFANIA','ASISTENTE DE TECNOLOGIAS DE LAINFORMACION Y COMUNICACION','FACULTAD DE INGENIERÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','0','carla.guerrero@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUERRERO RUIZ HENRY MAURICIO','RECEPCIONISTA ESPECIALIZADO','INSTITUTO GEOFÍSICO','02-2976300','6701','0');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUERRERO SALAZAR KARINA PAOLA','SECRETARIA EJECUTIVA 2','DEPARTAMENTO DE FÍSICA','02-2976300','1701','karina.guerrero@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUERRERO TAPIA WILMA ELISABETH','SECRETARIA','FACULTAD DE INGENIERÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2208','wilma.guerrero@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUERRON CARVAJAL JHON FABRICIO','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','DIRECCIÓN ADMINISTRATIVA','02-2976300','2009','jhon.guerron@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUERRON ESPIN PAULINA ELIZABETH','ESPECIALISTA DE CONTABILIDAD 2','INSTITUTO GEOFÍSICO','02-2976300','6701','paulina.guerron@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUEVARA BALAREZO VANESSA KATHERINE','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','vanessa.guevarav@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUEVARA CAIQUETAN ALICIA DEL CARMEN','JEFE DE DEPARTAMENTO','DEPARTAMENTO DE METALURGIAEXTRACTIVA','02-2976300','5801','alicia.guevara@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUEVARA CAIQUETAN ROSA ELIZABETH','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 3','FACULTAD DE INGENIERÍAQUÍMICA Y AGROINDUSTRIA','02-2976300','4319','rosa.guevara@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUEVARA GAMBOA FRANKLIN LEONARDO','RESPONSABLE DE CONSULTORIA','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','109','franklin.guevara@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUEVARA MORALES TRAJANO SAUL','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','trajano.guevara@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUEVARA ROSERO GRACE CAROLINA','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1501','carolina.guevara@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUTIERREZ CASTILLO MARIA DANIELA','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 3','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1447','daniela.gutierrez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUTIERREZ GUTIERREZ LUIS SANTIAGO','AUXILIAR DE SERVICIOS','DIRECCIÓN ADMINISTRATIVA','02-2976300','2025','luis.gutierrezl@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUTIERREZ MONTALVAN SANDRA PAOLA','ASISTENTE DE LABORATORIO DE ENSAYO','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','4236','paola.gutierrez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUTIERREZ POMBOSA SANDRA ELIZABETH','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 2, GRADO 4)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1575','sandra.gutierrez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUY JOSEPH HENRY','ASESOR 2','RECTORADO','02-2976300','1116','henry.guy@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUZMAN BECKMANN LILIANA','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE INGENIERÍAQUÍMICA','02-2976300','4328','liliana.guzman@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'GUZMAN ENRIQUEZ JORGE PATRICIO','TECNICO DE INVESTIGACIONES APLICADAS APOLIMEROS','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','0','jorge.guzman01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HALLO CARRASCO MARIA ASUNCION','PROFESOR PRINCIPAL A TIEMPO COMPLETO (NIVEL 1, GRADO 6)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4704','maria.hallo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HAMAD MOHAMED KHALED MOHAMED AHMED','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1902','khaled.hamad@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HARO AYO SANTIAGO RENAN','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','0','santiago.haro@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HARO FLORES EDGAR BOLIVAR','COORDINADOR TECNICO DE FORMACIÓN BÁSICA','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3112','edgar.haro@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HARO RUIZ PATRICIA LORENA','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1919','patricia.haro@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HEREDIA CEVALLOS VERONICA CUMANDA','RESPONSABLE ADMINISTRATIVO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2012','veronica.heredia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HEREDIA ROSERO CARMEN ROCIO','ASISTENTE DE PLANIFICACION','DIRECCIÓN ADMINISTRATIVA','02-2976300','1321','rocio.heredia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HERNANDEZ ALVAREZ MYRIAM BEATRIZ','DECANO','FACULTAD DE INGENIERÍA DESISTEMAS','02-2976300','4700','myriam.hernandez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HERNANDEZ CHAVEZ MISHELL JOHANNA','SECRETARIA','FACULTAD DE CIENCIASADMINISTRATIVAS','02-2976300','0','mishell.hernandez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HERNANDEZ DIAZ YOANDY','ANALISTA OBSERVATORIO ASTRONOMICO','OBSERVATORIO ASTRONÓMICO','02-2976300','6801','yoandy.hernandez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HERNANDEZ ENDARA MARCO WLADIMIR','ASISTENTE ADMINISTRATIVO','INSTITUTO GEOFÍSICO','02-2976300','6701','marco.hernandez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HERNANDEZ HERRERA VALERIA JEANNETH','OFICINISTA','DIRECCIÓN DE RELACIONESINSTITUCIONALES','02-2976300','1302','valeria.hernandez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HERNANDEZ RODRIGUEZ LUIS TINERFE','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1902','luis.hernandezr@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HERNANDEZ SALAZAR MARIA JOSE','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE GEOLOGÍA','02-2976300','3302','maria.hernandez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HERNANDEZ STEPHEN','GEOFISICO 1','PROYECTOS EPN','02-2976300','0','0');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HERNANDEZ VILEMA MARGOTH GUADALUPE','ESPECIALISTA DE PROCESOS 2','VICERRECTORADO DE DOCENCIA','02-2976300','1441','margoth.hernandez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HERRERA GARCIA EDWIN FERNANDO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','','edwin.herrera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HERRERA GARZON MARCO ANTONIO','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2203','marco.herrera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HERRERA LLORI WILLIAM ANDRES','TECNICO GEOFISICO','PROYECTOS EPN','02-2976300','6701','william.herrera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HERRERA MUÑOZ CARLOS ALFONSO','DECANO','FACULTAD DE INGENIERÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2260','carlos.herrera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HERRERA RIVADENEIRA CESAR FERNANDO','DIRECTOR DE RELACIONES INSTITUCIONALES','DIRECCIÓN DE RELACIONESINSTITUCIONALES','02-2976300','1300','cesar.herrera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HERRERA SILVA JUAN ALBERTO','PROFESOR PRINCIPAL A TIEMPO PARCIAL','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4701','juan.herrera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HERRERA TERAN MARIBEL KATERYN','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE MATEMÁTICA','02-2976300','0','kateryn.herrera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HIDALGO BUSTAMANTE XIMENA DEL ROCIO','DECANO','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','1912','ximena.hidalgo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HIDALGO DIAZ VICTOR HUGO','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 3, GRADO 5)','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3711','victor.hidalgo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HIDALGO LASCANO PABLO WILIAN','PROFESOR TITULAR PRINCIPAL DE ESCALAFON PREVIO TIEMPO COMPLETO','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2315','pablo.hidalgo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HIDALGO MARCILLO ANGEL VICENTE','CHOFER','DIRECCIÓN ADMINISTRATIVA','02-2976300','2027','angel.hidalgom@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HIDALGO TRUJILLO SILVANA IVONNE','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 3, GRADO 5)','INSTITUTO GEOFÍSICO','02-2976300','6703','silvana.hidalgo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HIDALGO VALENCIA DANIEL ALEJANDRO','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 1','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','0','daniel.hidalgov@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HIDALGO VINUEZA DAVID ANTONIO','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','0','david.hidalgo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HIDROBO UNDA GABRIELA CRISTINA','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','4314','gabriela.hidrobo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HINOJOSA ESPINOZA DAYANARA MARIELA','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE GEOLOGÍA','02-2976300','-','dayanara.hinojosa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HORNA HUARACA LUIS ALCIDES','PROFESOR PRINCIPAL A TIEMPO COMPLETO(NIVEL 1, GRADO 6)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1565','luis.horna@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'HUILCA CAISALITIN LUIS GUSTAVO','TECNICO DE INVESTIGACIONES APLICADAS APOLIMEROS','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','0','luis.huilca@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'IBARRA BOHORQUEZ SANDRA XIMENA','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 1','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2704','sandra.ibarra@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'IBUJES VILLACIS JUAN MARCELO','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 3, GRADO 5)','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','1656','juan.ibujes@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'IGLESIAS PUEBLA TANIA MARIA','SECRETARIA','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','tania.iglesias@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'INTRIAGO LOOR MELANIA MARIA','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','','melania.intriago@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'INTRIAGO PAZMIÑO MARIA MONSERRATE','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 3, GRADO 5)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4744','monserrate.intriago@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'IÑIGUEZ JARRIN CARLOS EFRAIN','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4736','carlos.iniguez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'IRRIBARRA CAZAR ESTEBAN FELIPE','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE FÍSICA','02-2976300','1501','esteban.irribarra@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ITURRALDE SARZOSA JOHANNA PAOLA','SECRETARIA','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2701','johanna.iturralde@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JACOME AREVALO CRISTOBAL NEPTALI','TECNICO DE TECNOLOGIAS DE INFORMACION YCOMUNICACIONES','DEPARTAMENTO DE BIOLOGÍA','02-2976300','6009','cristobal.jacome@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JACOME CAMACHO GONZALO RAFAEL','TECNICO DOCENTE','DEPARTAMENTO DE CIENCIASNUCLEARES','02-2976300','4216','gonzalo.jacome@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JACOME DOMINGUEZ EDWIN ANGEL','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','-','edwin.jacome@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JACOME GARZON ROBERTO FERNANDO','AUXILIAR DE SERVICIOS DE MANTENIMIENTO','METALMECÁNICA SAN BARTOLO','02-2976300','2670823','roberto.jacome@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JAME ROMERO RENE ALFREDO','ESPECIALISTA EN TRATAMIENTOS DE EQUIPOSESPECIALES','DEPARTAMENTO DE MATERIALES','02-2976300','5856','rene.jame@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JARAMILLO BOLAÑOS LORENA IMELDA','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE INGENIERÍAQUÍMICA','02-2976300','4211','lorena.jaramillo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JARAMILLO FLORES EDISON FABIAN','CONSERJE','DEPARTAMENTO DE CIENCIASSOCIALES','02-2976300','6051','edison.jaramillo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JARAMILLO NARVAEZ DARWIN LUCIANO','GUIA DE MUSEO','OBSERVATORIO ASTRONÓMICO','02-2976300','6803','darwin.jaramillo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JARAMILLO PINOS EDUARDO SEBASTIAN','TECNICO DOCENTE','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2203','sebastian.jaramillo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JARAMILLO PROAÑO CARLOS HUMBERTOFERNANDO','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','2723','carlos.jaramillop@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JARAMILLO RUIZ ERIKA ALEXANDRA','SECRETARIA','DEPARTAMENTO DE BIOLOGÍA','02-2976300','6001','erika.jaramillo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JARAMILLO SANCHEZ LUIS ANGEL','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1917','luis.jaramillo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JARAMILLO WONG CARLOS ENRIQUE','ASISTENTE DE MARKETING','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','156','carlos.jaramillo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JARAMILLO YANEZ ANDRES GABRIEL','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4736','andres.jaramilloy@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JARRIN TAMAYO PAUL ALBERTO','GEOFISICO 2','PROYECTOS EPN','02-2976300','6702','paul.jarrinp@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JATIVA ESPINOSA TANIA KATHERINE','ESPECIALISTA DE CONTABILIDAD 3','INSTITUTO GEOFÍSICO','02-2976300','1214','tania.jativa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JATIVA GUALPA MONICA ALEXANDRA','LIDER DE PROCESOS','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1420','monica.jativa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JATIVA IBARRA JESUS AMADO','PROFESOR PRINCIPAL A TIEMPO COMPLETO(NIVEL 1, GRADO 6)','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2200','jesus.jativa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JATIVA POZO ESTEBAN JAVIER','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2728','esteban.jativa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JEREZ LLUSCA CARLOS VINICIO','DIRECTOR DE SECRETARIA GENERAL','SECRETARÍA GENERAL','02-2976300','1150','carlos.jerez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JIMENEZ ABRIGO GABRIELA VERONICA','RECAUDADOR','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','117','gabriela.jimenez02@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JIMENEZ ALVARO ELIANA FERNANDA','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE GEOLOGÍA','02-2976300','3309','eliana.jimenez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JIMENEZ CUEVA JORGE ALEXANDER','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','jorge.jimenez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JIMENEZ GARCES SANDRA DEL CARMEN','ESPECIALISTA DE PRESUPUESTO 2','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','1057','sandra.jimenez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JIMENEZ JIMENEZ MARIA SOLEDAD','PROFESOR TITULAR PRINCIPAL DE ESCALAFON PREVIO TIEMPO COMPLETO','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2335','maria.jimenez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JIMENEZ LEONES JESSICA ALEJANDRA','ASISTENTE DE TECNOLOGIA DE LA INFORMACIONY COMUNICACIONES','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','2203','jessica.jimenez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JIMENEZ RIVAS JOSE VICENTE','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','METALMECÁNICA SAN BARTOLO','02-2976300','2670823','jose.jimenez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JIMENEZ RIVERA EDISON PATRICIO','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 3','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1439','edison.jimenez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JIMENEZ VERA ANDREA ANGELICA','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','1052','andrea.jimenez01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JIMPIKIT CHUINTIAM JAIRO ENRIQUE','TECNICO DE LABORATORIO DE INVESTIGACION YCONTROL AMBIENTAL','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','1604','jairo.jimpikit@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'JUIÑA QUILACHAMIN DANIELA MARIA','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','daniela.juina@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'KANG MOREIRA LUIS ESTUARDO','AUXILIAR DE SERVICIOS GENERALES','OBSERVATORIO ASTRONÓMICO','02-2976300','6801','luis.kang@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LAGOS ALVAREZ KARINA JANNERI','ESPECIALISTA DE CARACTERIZACIÓN DEMATERIALES','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','0','karina.lagos@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LAGOS LLAGUNO SUSANA ELIZABETH','NUTRICIONISTA','DIRECCIÓN DE BIENESTARESTUDIANTIL Y SOCIAL','02-2976300','1136','susana.lagos@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LALANGUI AGUILAR KATERINE ALEXANDRA','OFICINISTA','DIRECCIÓN DE AUDITORÍAINTERNA','02-2976300','5101','katerine.lalangui@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LANCHIMBA LOPEZ CINTYA CATALINA','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1501','cintya.lanchimba@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LARA ARCE CRISTIAN DAVID','JARDINERO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2025','cristian.larac@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LARA DAMMER JOSE FRANCISCO','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 1, GRADO 3)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1501','jose.larad@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LARA PORTILLA JOSE ANSELMO','AUXILIAR DE SERVICIOS','DIRECCIÓN ADMINISTRATIVA','02-2976300','2017','jose.larap@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LARCO AMPUDIA ENRIQUE ANDRES','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 1, GRADO 3)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4703','andres.larco@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LARREA MANCHENO MARIA SOLEDAD','REFERENCISTA','BIBLIOTECA GENERAL','02-2976300','1362','soledad.larrea@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LASCANO LASCANO LUIS RODRIGO','DECANO','FACULTAD DE CIENCIAS','02-2976300','1703','luis.lascano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LATORRE AIZAGA HUGO JULIANNY','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1604','hugo.latorre@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LAVERDE LAURA ADOLFO SEBASTIAN','COMUNICADOR SOCIAL 1','VICERRECTORADO DE DOCENCIA','02-2976300','1102','adolfo.laverde@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LEDESMA GALINDO BOLIVAR SIMON','PROFESOR PRINCIPAL A TIEMPO PARCIAL','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2215','bolivar.ledesma@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LEICA ARTEAGA PAULO CESAR','JEFE DE DEPARTAMENTO','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2214','paulo.leica@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LEMA ILBIS FRANCISCO','ALBANIL','DIRECCIÓN ADMINISTRATIVA','02-2976300','2025','francisco.lemaf@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LEMA PEREZ JESSICA ALEXANDRA','SECRETARIA','DIRECCIÓN FINANCIERA','02-2976300','1201','jessica.lema@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LEMA ZAPATA VERONICA EDELINA','AUXILIAR DE MONITOREO','INSTITUTO GEOFÍSICO','02-2976300','6711','veronica.lema@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LEMUS BERMEJO CAROLINA ALEXANDRA','TECNICO DOCENTE','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1604','carolina.lemus@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LEON CALVACHE CARLOS FRANCISCO','COORDINADOR TECNICO DE FORMACIÓN BÁSICA','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3144','carlos.leon@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LEON OLIVO MONICA PAULINA','SECRETARIA EJECUTIVA 1','DEPARTAMENTO DE CIENCIASSOCIALES','02-2976300','6051','monica.leon@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LIMA DE MONTES YOCKLING ELIZABETH','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE GEOLOGÍA','02-2976300','3302','yockling.lima@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LINDAO DAVILA JOSUE FRANCISCO','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','-','josue.lindao@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LITUMA CRUZ EDWIN IVAN','ASISTENTE DE LABORATORIO DE ENSAYO','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','1604','edwin.lituma@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LLERENA CAMACHO ANGEL DAVID','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','-','angel.llerena@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LLERENA OÑA MARIO FRANCISCO','ANALISTA OBSERVATORIO ASTRONOMICO','OBSERVATORIO ASTRONÓMICO','02-2976300','6801','mario.llerena01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LLERENA SARSOZA GRACE YOLANDA','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE CIENCIASADMINISTRATIVAS','02-2976300','1806','grace.llerena@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LLUGSI CAÑAR RICARDO XAVIER','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2249','ricardo.llugsi@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LLULLUNA LLUMIQUINGA FREDY RAFAEL','PROFESOR OCASIONAL TIEMPO PARCIAL','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3702','fredy.llulluna@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LLUMIQUINGA LEGÑA JORGE WASHINGTON','INSTRUCTOR DE CULTURA FÍSICA','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','2751','jorge.llumiquinga@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LLUMIQUINGA LOYA HENRY PAUL','ANALISTA TECNICO DEL OBSERVATORIOASTRONOMICO','OBSERVATORIO ASTRONÓMICO','02-2976300','6804','henry.llumiquinga@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LLUMIQUINGA SORIA ADRIAN FABRICIO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2746','adrian.llumiquinga@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LLUMITASIG MOLINA FREDY RENATO','AUXILIAR DE SERVICIOS','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1902','fredy.llumitasig@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LOARTE CAJAMARCA BYRON GUSTAVO','TECNICO DOCENTE','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','1513','byron.loarteb@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LOARTE MONTESDEOCA EDITH MARGARITA','RESPONSABLE ADMINISTRATIVA','DIRECCIÓN ADMINISTRATIVA','02-2976300','2027','edith.loarte@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LOGACHO IZA EDISON JAVIER','ASISTENTE DE TECNOLOGIA DE INFORMACION YCOMUNICACION','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','157','edison.logacho@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LOJA JARAMILLO ALFREDO ALEXANDER','MECANICO','METALMECÁNICA SAN BARTOLO','02-2976300','2670823','alfredo.loja@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LOPEZ CHAVARREA LUPE JACQUELINE','ANALISTA ADMINISTRATIVO ACADEMICO 2','VICERRECTORADO DE DOCENCIA','02-2976300','1101','lupe.lopez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LOPEZ CHULCA CINDY PAMELA','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','0','cindy.lopez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LOPEZ FONSECA GABRIEL ROBERTO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2203','gabriel.lopez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LOPEZ IZURIETA ERICSSON DANIEL','PROFESOR PRINCIPAL A TIEMPO COMPLETO(NIVEL 1, GRADO 6)','OBSERVATORIO ASTRONÓMICO','02-2976300','6800','ericsson.lopez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LOPEZ MAYORGA WALKER PATRICIO','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE CIENCIASADMINISTRATIVAS','02-2976300','1813','patricio.lopez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LOPEZ NARVAEZ JOFFRE NECTARIO','RESPONSABLE DE CULTURA FISICA','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','2750','joffre.lopez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LOPEZ ORDOÑEZ SOFIA ALEJANDRA','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE MATEMÁTICA','02-2976300','0','sofia.lopezo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LOPEZ PERUGACHI SOLIMAR DE LOURDES','GESTOR CULTURAL','RECTORADO','02-2976300','6008','solimar.lopez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LOPEZ SOSA CARLOS ALBERTO','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE CIENCIASSOCIALES','02-2976300','6051','carlos.lopez07@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LOPEZ USHIÑA EDISON POLIVIO','OFICINISTA','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','212','0');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LOPEZ VILLADA JESUS','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3701','jesus.lopez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LOZA AGUIRRE EDISON FERNANDO','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 1, GRADO 3)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','0','edison.loza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LOZA BONILLA CHRISTIAN DAVID','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 3','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1431','christian.lozab@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LOZA CASA MALENA BELEN','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','malena.lozal@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LOZA GUANULEMA CESAR MARIO','TECNICO DE MANTENIMIENTO','DEPARTAMENTO DE CIENCIASNUCLEARES','02-2976300','2105','cesar.loza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LOZADA DEL SALTO NARCISA JAQUELINE','SECRETARIA','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3711','jaqueline.lozada@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LOZANO ORBEA JAIME HOMERO','TECNICO DE MANTENIMIENTO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2020','jaime.lozano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LUCIO CASTRO MIGUEL ANGEL','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','-','0');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LUCIO NARANJO JOSE FRANCISCO','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 3, GRADO 5)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4730','jose.lucio@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LUCIO PEÑAFIEL ELIAS LEONEL','CONSERJE EXTERNO','DIRECCIÓN FINANCIERA','02-2976300','1201','elias.lucio@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LUNA AGUILERA GLORIA MARIBEL','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 1, GRADO 3)','DEPARTAMENTO DE CIENCIASNUCLEARES','02-2976300','2107','maribel.luna@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LUNA HERMOSA GERMAN VINICIO','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1608','german.luna@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'LUPERA MORILLO PABLO ANIBAL','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 2, GRADO 4)','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2250','pablo.lupera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MACHADO SALAZAR LUIS ALEJANDRO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2743','alejandro.machado@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MAFLA GALLEGOS LUIS ENRIQUE','PROFESOR PRINCIPAL A TIEMPO COMPLETO (NIVEL 1, GRADO 6)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4726','enrique.mafla@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MALAN CHIMBOLEMA LUIS ALBERTO','MEDICO GENERAL','DIRECCIÓN DE BIENESTARESTUDIANTIL Y SOCIAL','02-2976300','1135','luis.malan@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MALDONADO ALVARADO PEDRO GUSTAVO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','4240','pedro.maldonado@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MALDONADO ANDRADE DIEGO JAVIER','TECNICO DOCENTE','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2203','diego.maldonadoa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MALDONADO ESPINOZA GENOVEVA CLEMENCIA','CONSERJE EXTERNO','DIRECCIÓN DE BIENESTARESTUDIANTIL Y SOCIAL','02-2976300','2001','genoveva.maldonado@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MALDONADO FERNANDEZ MILDRED IVANOVA','GESTOR DE CONSULTORIA 3','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','148','mildred.maldonado@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MALDONADO GONZALEZ JOANA MARISOL','ESPECIALISTA DE TALENTO HUMANO 3','DIRECCIÓN DE TALENTO HUMANO','02-2976300','1277','joana.maldonado@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MALDONADO NARVAEZ AUGUSTO DAMIAN','MECANICO','METALMECÁNICA SAN BARTOLO','02-2976300','2670823','augusto.maldonado@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MALDONADO PILA JUAN CARLOS','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 1','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1445','juan.maldonado@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MALDONADO QUINCHE OSCAR ANIBAL','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','203','oscar.maldonado@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MALDONADO RUIZ DANIEL ALEJANDRO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4744','daniel.maldonado02@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MALDONADO SOLIZ IVONNE FERNANDA','TECNICO DOCENTE','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2744','ivonne.maldonadof@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MANANGON PERUGACHI LUCIA ELIANA','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE METALURGIAEXTRACTIVA','02-2976300','5803','lucia.manangon@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MANCHENO DOMINGUEZ GABRIELA ALEJANDRA','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','1604','gabriela.mancheno@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MANCIATI JARAMILLO CARLA PAOLA','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1919','carla.manciati@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MANOSALVAS ENRIQUEZ JUAN PABLO','ANALISTA DE INVESTIGACION Y PROYECCION SOCIAL','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','0','juan.manosalvase@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MANOSALVAS GRANJA SAMY PATRICIO','ANALISTA DE REDES DE MONITOREO GEOFISICO 3','INSTITUTO GEOFÍSICO','02-2976300','6708','samy.manosalvas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MANTILLA HIDALGO MONICA ELIZABETH','COORDINADOR TECNICO DE FORMACIÓN BÁSICA','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3118','monica.mantilla@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MANZANO ORBE LUIS ANDRE','ESPECIALISTA DE PROCESOS 2','DIRECCIÓN DE TALENTO HUMANO','02-2976300','1270','luis.manzano01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MANZANO URQUIZO LUCIA RAQUEL','SECRETARIA','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','3708','lucia.manzano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MARCILLO GOMEZ MARIANELA DEL ROCIO','SECRETARIA','SECRETARÍA GENERAL','02-2976300','1152','marianela.marcillo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MARCILLO PACHECO DAYANA MERCEDES','REFERENCISTA','FACULTAD DE INGENIERÍA DESISTEMAS','02-2976300','4740','dayana.marcillo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MARTINEZ GARCIA GABRIELA NATASHA','RESPONSABLE DE LA UNIDAD DE EDUCACIONVIRTUAL','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','136','gabriela.martinezg@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MARTINEZ GOMEZ ALVARO RAFAEL','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','-','alvaro.martinez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MARTINEZ RICAURTE GUSTAVO ALFONSO','ESPECIALISTA DE LABORATORIO DE ENSAYOS 1','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1606','gustavo.martinez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MARTINEZ VILLARREAL JOANA SALOME','TECNICO DOCENTE','DEPARTAMENTO DE PETRÓLEOS','02-2976300','3302','joana.martinez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MEDINA ALVARADO NELSON JAVIER','PROFESOR PRINCIPAL A TIEMPO PARCIAL (NIVEL 1,GRADO 6)','DEPARTAMENTO DE FÍSICA','02-2976300','1710','nelson.medina@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MEDINA MORA JORGE LUIS','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2203','jorge.medinaj@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MEDINA PROAÑO FAIRA ISHTAR','RESPONSABLE DE TALENTO HUMANO','DIRECCIÓN DE TALENTO HUMANO','02-2976300','1267','faira.medina@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MEDINA PROAÑO PRISCILA JOHANNA','RESPONSABLE DE RELACIONES INSTITUCIONALES','DIRECCIÓN DE RELACIONESINSTITUCIONALES','02-2976300','1301','priscila.medina@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MEDINA SANCHEZ MARTIN DAMIAN','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','martin.medina@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MEDINA VALLEJO JULIO CESAR','PROFESOR PRINCIPAL A TIEMPO COMPLETO(NIVEL 1, GRADO 6)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1507','julio.medina@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MEDRANO CHIMBORAZO LEONARDO XAVIER','ASISTENTE DE TECNOLOGIAS DE LAINFORMACION Y COMUNICACION','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','150','leonardo.medrano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MEDRANO FLORES LUIS ALEJANDRO','ASISTENTE DE TECNOLOGIAS DE INFORMACION YCOMUNICACIÓN','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1409','alejandro.medrano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MEJIA FLORES ROBERTO ULPIANO','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE CIENCIASADMINISTRATIVAS','02-2976300','5350','roberto.mejia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MEJIA GUZMAN KLEBER HERNAN','PROFESOR TITULAR PRINCIPAL DE ESCALAFON PREVIO TIEMPO COMPLETO','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','1814','klever.mejia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MEJIA NAVARRETE RAUL DAVID','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 3, GRADO 5)','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2239','david.mejia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MEJIA PASTUISACA ANDREA FERNANDA','SECRETARIA','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','0','andrea.mejia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MEJIA PLACENCIA JESSICA GABRIELA','ANALISTA DE REDES DE MONITOREO GEOFISICO 1','PROYECTOS EPN','02-2976300','6704','jessica.mejia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MEJIA SAENZ MARTHA CECILIA','AUXILIAR DE MONITOREO','INSTITUTO GEOFÍSICO','02-2976300','6701','martha.mejia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MEJIA TAMAYO FRANCISCO XAVIER','ANALISTA DE REDES DE MONITOREO GEOFISICO 2','PROYECTOS EPN','02-2976300','6704','francisco.mejia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MELO GORDILLO VINICIO RENE','PROFESOR TITULAR PRINCIPAL DE ESCALAFONPREVIO TIEMPO COMPLETO','DEPARTAMENTO DE PETRÓLEOS','02-2976300','3329','vinicio.melo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MELO POZO RICHARD ELIAS','ADMINISTRADOR 1','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','0','richard.melo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MENA ALVARADO DARWIN ANTONIO','ANALISTA TECNICO DEL OBSERVATORIOASTRONOMICO','OBSERVATORIO ASTRONÓMICO','02-2976300','6804','darwin.mena@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MENA MALDONADO ELISA KARINA','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4744','elisa.mena@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MENA MENA MARIA TEODOLINDA','CONSERJE','FACULTAD DE INGENIERÍA DESISTEMAS','02-2976300','4701','maria.mena@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MENA SANCHEZ CARLOS ANDRES','INSTRUCTOR DE CULTURA FÍSICA','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','carlos.mena@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MENA VILLACIS RICARDO IVAN','TECNICO DOCENTE','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2203','ricardo.menav@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MENA YANEZ FRANCIS ZORAIDA','SECRETARIA','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','1261','francis.mena@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MENCIAS GAVILANES INES MARIA DEL SOCORRO','PROFESOR TIEMPO PARCIAL PRINCIPAL 1','DEPARTAMENTO DE CIENCIASADMINISTRATIVAS','02-2976300','1804','maria.mencias@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MENDOZA GARCIA MARIA DANIELA','ESPECIALISTA JURIDICO 1','DIRECCIÓN DE ASESORÍA JURÍDICA','02-2976300','1181','maria.mendoza02@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MENDOZA TAMAYO GARY JAVIER','RECEPCIONISTA ESPECIALIZADO','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','215','gary.mendoza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MERINO ROSERO PEDRO MARTIN','PROFESOR PRINCIPAL A TIEMPO COMPLETO(NIVEL 1, GRADO 6)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1574','pedro.merino@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MERINO TOAPANTA ANDRES ESTEBAN','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','-','andres.merino@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MERIZALDE AYALA JULIO ANDRES','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','1059','julio.merizalde@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MIER ARAUJO SUSANA PIEDAD','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','2715','susana.mier@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MINA GALARZA VICTOR HERNAN','ASESOR 4','DIRECCIÓN ADMINISTRATIVA','02-2976300','2002','victor.mina@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MINDA QUILUMBA CARLOS IVAN','JARDINERO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2025','carlos.minda@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MIRANDA ESPINOSA ALEXANDRA','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','0','alexandra.miranda@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MOLINA BUSTAMANTE MARCO EDUARDO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','3101','marco.molinab@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MOLINA CEVALLOS GRACIELA DEL CARMEN','BIBLIOTECARIO 1','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','3733','graciela.molina@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MOLINA DE LA CRUZ CARLA PATRICIA','TECNICO DOCENTE','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','4314','carla.molina@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MOLINA FALCON INGRID VERENICE','TECNICO EN METALMECANICA','METALMECÁNICA SAN BARTOLO','02-2976300','0','ingrid.molina@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MOLINA PAREDES MARCO ANTONIO','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','marco.molinao@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MOLINA VELASQUEZ OSWALDO JAVIER','ASISTENTE DE NOMINA','DIRECCIÓN FINANCIERA','02-2976300','1207','javier.molina@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MONAR AGUIAR TAMARA SILVANA','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','tamara.monar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MONAR MONAR WILLAN LEOPOLDO','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE MATERIALES','02-2976300','5856','william.monar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MONCAYO ALVARADO MARIA EUGENIA','MEDICO OCUPACIONAL','DIRECCIÓN DE TALENTO HUMANO','02-2976300','1270','maria.moncayo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MONCAYO ROBLES WILSON ALIRIO','RESPONSABLE ADMINISTRATIVO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2001','wilson.moncayo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MONTALUISA IPIALES DIEGO FERNANDO','ESPECIALISTA EN TRATAMIENTOS DE EQUIPOSESPECIALES','DEPARTAMENTO DE CIENCIASNUCLEARES','02-2976300','1622','diego.montaluisa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MONTALVO ESPINOZA EDITH MARGELINA','ORNITOLOGO','DEPARTAMENTO DE BIOLOGÍA','02-2976300','6006','edith.montalvo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MONTALVO MARQUEZ FRANCISCO JAVIER','TECNICO DOCENTE','DEPARTAMENTO DE MATERIALES','02-2976300','3701','francisco.montalvom@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MONTALVO MONCAYO ERICA KATERINE','ESPECIALISTA DE TALENTO HUMANO 2','DIRECCIÓN DE TALENTO HUMANO','02-2976300','1274','erika.montalvo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MONTENEGRO AGUAS LUCIA MARGARITA','PROFESORA PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍAQUÍMICA','02-2976300','4332','lucia.montenegro@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MONTENEGRO ARMAS CARLOS ESTALESMIT WILLAM','PROFESOR TITULAR PRINCIPAL DE ESCALAFON PREVIO TIEMPO COMPLETO','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4727','carlos.montenegro@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MONTENEGRO RIVERA LUIS GABRIEL','ASISTENTE DE LABORATORIO DE ENSAYO','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1902','luis.montenegro01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MONTENEGRO SALAZAR BYRON ESTEBAN','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','byron.montenegro@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MONTENEGRO VILLARREAL JESSICA ALEXANDRA','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','jessica.montenegrov@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MONTEROS TUQUERRES ALVARO IGNACIO','ASISTENTE DE TECNOLOGIAS DE LAINFORMACION Y COMUNICACION','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','0','alvaro.monteros@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MONTOYA CAMPUZANO ANA CRISTINA','RESPONSABLE TECNICO DE FORMACION BASICA','FACULTAD DE CIENCIAS','02-2976300','1518','ana.montoya@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MORA ESPINOZA FLAVIO ENRIQUE','PROFESOR TIEMPO PARCIAL PRINCIPAL 1','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','1005','flavio.mora@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MORA MARTINEZ EDGAR DAVID','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1604','edgar.mora@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MORA MERA VILMA NARCISA','SECRETARIA','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','0','vilma.mora@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MORA RIVADENEIRA RINA SUSANA','ESPECIALISTA DE CONTABILIDAD 2','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','-','0');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MORA YAGUANA JUANA CRISTINA','SECRETARIA EJECUTIVA 2','DEPARTAMENTO DE GEOLOGÍA','02-2976300','3306','cristina.mora@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MORALES ANDRADE DENISSE CAROLINA','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','denisse.morales@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MORALES AREVALO VERONICA PAULINA','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','1501','veronica.morales01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MORALES CANDO GEOVANA PAULINA','ANALISTA ADMINISTRATIVO ACADEMICO 2','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','3701','geovana.morales@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MORALES ESCOBAR LUIS ALBERTO','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 3, GRADO 5)','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2345','luis.moralesec@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MORALES LOPEZ LUIS GOVANY','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','1604','luis.morales@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MORALES MOREIRA JANETH ARACELY','RESPONSABLE DE MARKETING','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','122','janeth.morales@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MORALES TINGO ALEXANDRA CRISTINA','ESPECIALISTA DE CONTABILIDAD 3','DIRECCIÓN FINANCIERA','02-2976300','1204','alexandra.morales@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MORAN FLORES WILSON LEOPOLDO','PROFESOR TIEMPO PARCIAL AUXILIAR 1','DEPARTAMENTO DE MATERIALES','02-2976300','5856','wilson.moran@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MOREJON TOBAR RAMIRO EDUARDO','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2213','ramiro.morejon@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MORENO MAZA GEOVANNY ALFONSO','PROFESOR OCASIONAL TIEMPO PARCIAL','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3701','geovanny.morenom@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MORENO PAEZ MARIA GABRIELA','ESPECIALISTA DE TESORERIA 1','DIRECCIÓN FINANCIERA','02-2976300','1245','gabriela.moreno@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MORENO PERALTA MARIA NELLY','ASESOR 3','DIRECCIÓN DE PLANIFICACIÓN','02-2976300','1321','maria.morenom@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MORENO SERAFIN XIMENA DE LOS ANGELES','BIBLIOTECARIO 1','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4740','ximena.moreno@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MOSQUERA CORTEZ LUIS FERNANDO','PROFESOR PRINCIPAL TIEMPO PARCIAL','DEPARTAMENTO DE CIENCIASADMINISTRATIVAS','02-2976300','1804','luis.mosquera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MOSQUERA ESPINOSA EVELYN MARCELA','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','4702','evelyn.mosquerae@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MOSQUERA JORDAN MAURICIO ESTEBAN','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','4313','mauricio.mosquera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MOTHES PATRICIA ANN','GEOFISICO 3','INSTITUTO GEOFÍSICO','02-2976300','6701','patricia.mothes@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MOYA QUIMBITA MICHAEL ANDRES','ASISTENTE DE TECNOLOGIAS DE INFORMACION YCOMUNICACIÓN','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1411','michael.moyam@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MUENALA QUINGA JAIRO MOISES','ASISTENTE DE TECNOLOGIA DE LA INFORMACIONY COMUNICACIONES','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','0','jairo.muenala@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MUENTES LOOR HOLGER ORLANDO','CONDUCTOR ADMINISTRATIVO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2027','holger.muentes@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MULLO ANCHATUÑA CESAR IVAN','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 1','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','126','ivan.mullo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MUÑOZ BENITEZ CARLOS IVAN','DIRECTOR DE PLANIFICACION','DIRECCIÓN DE PLANIFICACIÓN','02-2976300','1320','ivan.munoz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MUÑOZ BENITEZ HUGO ENRIQUE','DIRECTOR FINANCIERO','DIRECCIÓN FINANCIERA','02-2976300','1200','hugo.munoz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MUÑOZ BISESTI FLORINELLA','PROFESOR PRINCIPAL A TIEMPO COMPLETO(NIVEL 1, GRADO 6)','DEPARTAMENTO DE CIENCIASNUCLEARES','02-2976300','4228','florinella.munoz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MUÑOZ CHASIPANTA MANUEL VICENTE','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','DEPARTAMENTO DE BIOLOGÍA','02-2976300','6001','manuel.munoz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MUÑOZ DE CAMACHO SAMARIA VIRGINIA','ASESOR 3','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','1055','samaria.munoz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MUÑOZ PAREDES FRANCISCA DE LOS ANGELES','AUDITOR INTERNO 3','DIRECCIÓN DE AUDITORÍAINTERNA','02-2976300','0','francisca.munoz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MUÑOZ QUINTANA PAMELA STEPHANIE','ASISTENTE ADMINISTRATIVA','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','2013','pamela.munozq@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'MURIEL GRANIZO SILVIA PATRICIA','SECRETARIA','FACULTAD DE INGENIERÍAQUÍMICA Y AGROINDUSTRIA','02-2976300','4320','silvia.muriel@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NARANJO ALVARADO MANON STELLA','ASESOR 2','RECTORADO','02-2976300','1003','manon.naranjo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NARANJO BORJA KLEVER EFRAIN','PROFESOR PRINCIPAL A TIEMPO COMPLETO (NIVEL 1, GRADO 6)','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','1800','efrain.naranjo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NARANJO CHIRIBOGA MARCO PATRICIO','PROFESOR PRINCIPAL A TIEMPO COMPLETO(NIVEL 1, GRADO 6)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1567','marco.naranjo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NARANJO ESTRADA DIANA PATRICIA','ADMINISTRADOR 2','DIRECCIÓN ADMINISTRATIVA','02-2976300','2011','diana.naranjo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NARANJO FLOR JUAN CARLOS','OFICINISTA','DIRECCIÓN DE TALENTO HUMANO','02-2976300','1268','juancarlos.naranjo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NARANJO HIDALGO MARIA FERNANDA','ANALISTA DE REDES DE MONITOREO GEOFISICO 1','PROYECTOS EPN','02-2976300','6703','maria.naranjoh@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NARANJO MENDOZA CARLOS ANDRES','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3747','carlos.naranjo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NARVAEZ ACARO JONATHAN ALONSO','ESPECIALISTA DE PRESUPUESTO 2','DIRECCIÓN ADMINISTRATIVA','02-2976300','2023','jonathan.narvaez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NARVAEZ CHICAIZA FERNANDA LUCIA','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE FÍSICA','02-2976300','1501','fernanda.narvaez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NARVAEZ CUNALATA ADRIANA ELIZABETH','GESTOR DE APOYO PEDAGÓGICO','VICERRECTORADO DE DOCENCIA','02-2976300','1112','adriana.narvaez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NARVAEZ GOMEZCOELLO JOSE RAUL','ANALISTA DE FISCALIZACIÓN','DIRECCIÓN DE PLANIFICACIÓN','02-2976300','1321','jose.narvaez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NARVAEZ GUEVARA ALEX PATRICIO','ESPECIALISTA DE CONTABILIDAD 1','DIRECCIÓN FINANCIERA','02-2976300','1201','alex.narvaez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NARVAEZ HERRERA MANUEL BENJAMIN','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','1604','manuel.narvaez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NARVAEZ RIVERA CESAR ALFONSO','SUBDECANO','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','1918','cesar.narvaez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NATES PASAJE JAMES DAVID','ASISTENTE DE LABORATORIO DE ENSAYO','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','1604','james.nates@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NAVARRETE MARIA PAULINA','ESPECIALISTA DE TALENTO HUMANO 2','DIRECCIÓN DE TALENTO HUMANO','02-2976300','1267','0');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NAVARRETE RUEDA ROSA DEL CARMEN','PROFESOR PRINCIPAL A TIEMPO COMPLETO (NIVEL 1, GRADO 6)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4731','rosa.navarrete@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NAVARRO MENDEZ DIANA VERONICA','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 2, GRADO 4)','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2312/2339/2340','veronica.navarro@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NAVAS NAVAS FELIPE ANTONIO','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3117','felipe.navas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NAZATE BURGOS PAOLA JEANNETTE','ANALISTA DE REDES DE MONITOREO GEOFISICO 1','INSTITUTO GEOFÍSICO','02-2976300','6704','paola.nazate@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NICOLALDE MESA MIRIAM ESTHER GENOVEVA','SECRETARIA','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4715','esther.nicolalde@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NICOLALDE PAREDES ALICIA CARLOTA','AUXILIAR DE SERVICIOS GENERALES','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','3701','alicia.nicolalde@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NINABANDA TENELEMA ANGEL PATRICIO','AUXILIAR DE SERVICIOS GENERALES','FACULTAD DE INGENIERÍAQUÍMICA Y AGROINDUSTRIA','02-2976300','2104','angel.ninabanda@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NOBOA CAMPUZANO DANILO RODOLFO','ANALISTA DE DISEÑO DE RECURSOS VIRTUALES','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','0','danilo.noboa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NOBOA CRUZ SHEILA LORENA','PROFESOR PRINCIPAL A TIEMPO PARCIAL','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4701','sheila.noboa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NOBOA LEON PAUL STEFAN','DIRECTOR DE AUDITORIA INTERNA','DIRECCIÓN DE AUDITORÍAINTERNA','02-2976300','5100','paul.noboa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NOVILLO RAMEIX VERONICA VICTORIA','COORDINADOR TECNICO DE FORMACIÓN BÁSICA','FACULTAD DE CIENCIAS','02-2976300','1518','victoria.novillo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NOVOA ALBUJA FABIAN EDUARDO','PROFESOR PRINCIPAL A TIEMPO PARCIAL','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2217','fabian.novoa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NOVOA GUAMAN EDISON GABRIEL','TECNICO DOCENTE','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2203','edison.novoa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NUÑEZ MOSCOSO ALEX STALIN','ESPECIALISTA DE LABORATORIO DEMETALMECANICA','METALMECÁNICA SAN BARTOLO','02-2976300','2670823','alex.nunez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NUÑEZ RAMOS CRISTHIAN ALEXANDER','TECNICO DOCENTE','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1501','cristhian.nunez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'NUÑEZ YEPEZ PAUL ALEXANDER','REFERENCISTA','BIBLIOTECA GENERAL','02-2976300','1362','paul.nunez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'OBANDO PUENAYAN LUIS FABIAN','ADMINISTRADOR 1','DIRECCIÓN ADMINISTRATIVA','02-2976300','2011','luis.obando@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'OCAÑA HARO STEFANNY NATALY','SECRETARIA','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','117','stefanny.ocana@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'OCAÑA UVIDIA ALEXANDRA ISABEL','SECRETARIA','FACULTAD DE INGENIERÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','0','alexandra.ocana@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'OCHOA GARCES JUAN PABLO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE CIENCIASSOCIALES','02-2976300','6054','juanpablo.ochoa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'OJEDA LOPEZ ANDRES ESTEBAN','AUXILIAR DE MONITOREO','INSTITUTO GEOFÍSICO','02-2976300','6711','andres.ojeda@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'OLA ORTIZ DAYSI GABRIELA','INSTRUCTOR DE CULTURA FÍSICA','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','daysi.ola@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'OLALLA ARGUELLO VICTOR GABRIEL','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 2','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','104','victor.olalla@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'OLEAS TRUJILLO SILVIA CARLOTA','ESPECIALISTA DE LABORATORIO DE ABSORCION ATÓMICA','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','4237','silvia.oleas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'OLMEDO GARCES ANDREA GABRIELA','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3701','andrea.olmedog@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ONOFA CALVOPIÑA FRANKLIN ORLANDO','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 1','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','-','franklin.onofa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'OÑA ÑACATA ALEX FABRICIO','TECNICO DOCENTE','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2701','alex.ona@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'OÑA OÑA FERNANDO VINICIO','TECNICO DE MANTENIMIENTO','METALMECÁNICA SAN BARTOLO','02-2976300','2670823','fernando.ona@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'OÑA SERRANO ALBERTO XAVIER','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','1810','xavier.ona@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORBE JATIVA DANIEL GERMANICO','TECNICO DOCENTE','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2203','daniel.orbej@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORBE PINCHAO LISETH VERENICE','ESPECIALISTA DE LABORATORIO DE ENSAYOS 1','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','1604','liseth.orbep@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORBEA ANDRADE VERONICA DE LOS ANGELES','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','FACULTAD DE CIENCIAS','02-2976300','-','veronica.orbea@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORDOÑEZ CALERO HERNAN DAVID','TECNICO DOCENTE','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','4729','hernan.ordonez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORDOÑEZ MALLA FREDDY GEOVANNY','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 3, GRADO 5)','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3746','freddy.ordonez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORDOÑEZ SANCHEZ JENNY ELIZABETH','RESPONSABLE ADMINISTRATIVO','VICERRECTORADO DE DOCENCIA','02-2976300','1104','jenny.ordonez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORELLANA ORTEGA JESSICA PILAR','AUXILIAR DE ODONTOLOGIA','DIRECCIÓN DE BIENESTARESTUDIANTIL Y SOCIAL','02-2976300','1134','jessica.orellana@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORELLANA RUBIO ANGIE MARIA','ESPECIALISTA DE PRESUPUESTO 2','DIRECCIÓN FINANCIERA','02-2976300','1201','angie.orellana@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORMAZA ABEL MAURICIO','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','abel.ormaza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORQUERA ANDRADE LUIS MIGUEL','PROFESOR PRINCIPAL TIEMPO PARCIAL','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4701','luis.orquera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORQUERA CARRANCO MARIA FERNANDA','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE CIENCIASADMINISTRATIVAS','02-2976300','1804','mariafernanda.orquera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORQUERA GUEVARA ESTEFANIA ISABEL','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','-','0');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORRALA MORENO JUAN ALFREDO','ESPECIALISTA DE TECNOLOGÍAS DE LAINFORMACIÓN Y COMUNICACIONES 2','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1438','juan.orrala@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORTEGA CAMINO LEONARDO DAVID','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 3, GRADO 5)','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2253','leonardo.ortega@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORTEGA LARA PATRICIO RUBEN','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1902','patricio.ortega@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORTEGA LOPEZ MIGUEL DARIO','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 3, GRADO 5)','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3738','miguel.ortega@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORTEGA VERINAZ RUBEN GUILLERMO','PROFESOR PRINCIPAL A TIEMPO PARCIAL','DEPARTAMENTO DE PETRÓLEOS','02-2976300','3301','ruben.ortega@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORTIZ CALDERON JUAN GABRIEL','ESPECIALISTA DE TALENTO HUMANO 2','DIRECCIÓN DE TALENTO HUMANO','02-2976300','1269','0');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORTIZ CASTRO JONATHAN ALEJANDRO','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','jonathan.ortizc@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORTIZ CASTRO JUAN REGULO','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','1657','juan.ortiz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORTIZ CEVALLOS MARTIN ALEJANDRO','ESPECIALISTA DE INVESTIGACION Y CONTROLAMBIENTAL','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','2155','martin.ortizm@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORTIZ LOPEZ PABLO SEBASTIAN','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 1','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1405','pablo.ortiz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORTIZ RAMOS SARA VILMA','BIBLIOTECARIO 1','FACULTAD DE CIENCIAS','02-2976300','1501','sara.ortiz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORTIZ REINOSO RICARDO GABRIEL','ASISTENTE DE TECNOLOGIA DE LA INFORMACIONY COMUNICACIONES','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2739','ricardo.ortiz01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ORTIZ ZAMBRANO MARIO MARCELO','AUXILIAR DE MONITOREO','INSTITUTO GEOFÍSICO','02-2976300','6701','mario.ortiz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'OSCULLO LALA JOSE ANTONIO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2203','jose.oscullo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'OSORIO CALVOPIÑA HENRRY MARCELO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE FÍSICA','02-2976300','1501','henrry.osorio@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'OTERO VALLADARES PATRICIA ELIZABETH','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','-','patricia.otero@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'OVIEDO FIERRO FAUSTO HERNAN','JEFE DE DEPARTAMENTO','DEPARTAMENTO DE MATERIALES','02-2976300','5856','fausto.oviedo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PACHACAMA SIMBAÑA CRISTIAN DAVID','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','-','cristian.pachacama01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PACHECO LOGROÑO DANIEL ALEJANDRO','ANALISTA DE REDES DE MONITOREO GEOFISICO 2','PROYECTOS EPN','02-2976300','6707','daniel.pacheco01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PADILLA VIVEROS CLEBER DAVID','AUXILIAR DE SERVICIOS GENERALES','DIRECCIÓN ADMINISTRATIVA','02-2976300','2025','cleber.padilla@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAEZ BIMOS CARLOS SEBASTIAN','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1604','carlos.paezb@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAEZ FERNANDEZ NARCIZA ELIZABETH','ANALISTA DE INVESTIGACION Y PROYECCION SOCIAL','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','0','narciza.paezf@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAEZ GARCIA GEOVANNY JAVIER','ESPECIALISTA DE TECNOLOGÍA DE LA INFORMACIÓN Y COMUNICACIONES 3','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','1051','javier.paez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAEZ LARA MARIA AUGUSTA','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','4312','maria.paez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAEZ PEREZ CARLOS LUIS','PROFESOR PRINCIPAL A TIEMPO PARCIAL','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1902','carlos.paez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAEZ VALDIVIEZO FREIRE ERNESTO','SOLDADOR','METALMECÁNICA SAN BARTOLO','02-2976300','2670823','freire.paez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PALACIOS ENCALADA JOSE LUIS','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3744','jose.palacios@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PALACIOS LOPEZ MARCO ALEJANDRO','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','marco.palacios01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PALACIOS OCHOA RENE ALEXANDER','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','2323','alexander.palacios@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PALACIOS PALACIOS PABLO BOLIVAR','GEOFISICO 2','INSTITUTO GEOFÍSICO','02-2976300','6706','pablo.palacios@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PALACIOS SERRANO DIEGO GABRIEL','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE PETRÓLEOS','02-2976300','3302','diego.palacios@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PALADINES JIMENEZ AMADA LUCIA','SECRETARIA EJECUTIVA 1','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','4233','amada.paladines@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PALAN TAMAYO CARLOS ALBERTO','PROFESOR PRINCIPAL A TIEMPO PARCIAL','DEPARTAMENTO DE CIENCIASADMINISTRATIVAS','02-2976300','1804','carlos.palan@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PALOMINO BOLAÑOS FREDDY MAURICIO','ESPECIALISTA DE CONTABILIDAD 2','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','135','freddy.palomino@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PANCHI JIMA SANDRA PATRICIA','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','0','sandra.panchi@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PANTOJA DIAZ ODETTE','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','1810','odette.pantoja@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PANTOJA SUAREZ LUIS FERNANDO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE MATERIALES','02-2976300','5851','fernando.pantoja@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAREDES AGUINAGA PAULINA ARACELY','SECRETARIA EJECUTIVA 2','DIRECCIÓN DE ASESORÍA JURÍDICA','02-2976300','1181','paulina.paredes@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAREDES BECERRA JOSE ANDRES','ESPECIALISTA DE GESTION LINGUISTICA 2','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','205','jose.paredes@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAREDES MAYORGA WALTER BENIGNO','ADMINISTRADOR 3','DIRECCIÓN ADMINISTRATIVA','02-2976300','2015','walter.paredes@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAREDES PAREDES MARTHA CECILIA','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2240','cecilia.paredes@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAREDES REGALADO ALFREDO ISRAEL','TECNICO DOCENTE','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2203','israel.paredes@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PARRA ARAUZ BACKNER XAVIER','AUXILIAR DE MONITOREO','INSTITUTO GEOFÍSICO','02-2976300','6701','backner.parra@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PARRA ESCORZA TANIA VANESA','ESPECIALISTA DE LABORATORIO DE ENSAYOS 1','FACULTAD DE INGENIERÍAQUÍMICA Y AGROINDUSTRIA','02-2976300','4302','tania.parra@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PARRA TOAZO CARLOS FERNANDO','RESPONSABLE ADMINISTRATIVO','DIRECCIÓN ADMINISTRATIVA','02-2976300','0','carlos.parra02@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PARRAGA VILLAMAR VIVIANA CRISTINA','TECNICO DOCENTE','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2714','viviana.parragav@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PARREÑO LOPEZ SONIA ELIZABETH','ESPECIALISTA DE CONTABILIDAD 3','DIRECCIÓN FINANCIERA','02-2976300','1212','sonia.parreno@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PATIÑO SALAZAR EDWIN RODRIGO','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 3','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1442','edwin.patino@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAUCAR CAIZA WILLIAM ALEXIS','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','william.paucar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAVON SIERRA DAVID ENRIQUE','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','-','0');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAVON VARGAS CARLOS IGNACIO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','-','carlos.pavon@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAZ ARIAS HENRY PATRICIO','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 1, GRADO 3)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4701','henry.paz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAZ ROJAS JOSE LUIS','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE FÍSICA','02-2976300','0','jose.pazr@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAZ VILLARROEL JOSE FRANCISCO','PROFESOR AGREGADO 2 A TIEMPO PARCIAL','DEPARTAMENTO DE PETRÓLEOS','02-2976300','3301','jose.paz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAZ Y MIÑO ESPINOZA ALEX HERNAN','CONSERJE','FACULTAD DE INGENIERÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2203','alex.pazymino@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAZMIÑO IBARRA EDDY FERNANDO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE METALURGIAEXTRACTIVA','02-2976300','5810','eddy.pazmino@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAZMIÑO JATIVA MAYRA ALEJANDRA','SECRETARIA','FACULTAD DE INGENIERÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','0','mayra.pazmino@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAZMIÑO MASACHE GABRIELA NOEMI','ASISTENTE ADMINISTRATIVA','FACULTAD DE CIENCIAS','02-2976300','0','gabriela.pazmino@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAZMIÑO MIRANDA MARIA FERNANDA','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE CIENCIASSOCIALES','02-2976300','6051','maria.pazmino02@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAZMIÑO ORTIZ LEANDRO ANTONIO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2743','leandro.pazmino@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAZMIÑO PULLAS DAVID EMMANUEL','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1501','david.pazmino@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAZMIÑO QUIROZ JORGE ALEJANDRO','RESPONSABLE ADMINISTRATIVO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2014','alejandro.pazmino@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PAZMIÑO SANTANA TANIA MIREYA','TECNICO DOCENTE','DEPARTAMENTO DE CIENCIASADMINISTRATIVAS','02-2976300','4741','tania.pazminot@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PEÑA MERIZALDE JANNETH LILIANA','ASISTENTE DE TECNOLOGIAS DE INFORMACION YCOMUNICACIÓN','FACULTAD DE CIENCIAS','02-2976300','1501','janneth.pena@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PEÑA PONTON ELIANA LIZETH','ESPECIALISTA DE LABORATORIO DE ENSAYOS 2','FACULTAD DE CIENCIASADMINISTRATIVAS','02-2976300','0','eliana.pena@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PEÑAFIEL AGUILAR MIRIAN GUADALUPE','JEFA DE DEPARTAMENTO','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','1120','myriam.penafiel@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PEÑAFIEL ESCOBAR TERESA XIMENA','ASISTENTE DE CONTABILIDAD','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','114','teresa.penafiel@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PEÑAHERRERA TAIPE MARCELA ALEXANDRA','ANALISTA DE SEGUIMIENTO Y EVALUACION 1','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','151','marcela.penaherrera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PEÑALOZA MAYORGA JUAN CAMILO','TECNICO DE INVESTIGACIONES APLICADAS APOLIMEROS','DEPARTAMENTO DE INGENIERÍAQUÍMICA','02-2976300','4214','juan.penaloza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PEÑALOZA MAYORGA MILTON FABIAN','ESPECIALISTA DE LABORATORIO DE ENSAYOS 1','DEPARTAMENTO DE MATERIALES','02-2976300','3006','milton.penaloza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PERALVO VACA ANA MARGARITA','ANALISTA DE REDES DE MONITOREO GEOFISICO 3','PROYECTOS EPN','02-2976300','0','ana.peralvo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PEREZ ALMEIDA DIEGO ANDRES','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','4710','andres.perez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PEREZ CHILIQUINGA CHRISTIAN XAVIER','ASISTENTE DE CALIDAD','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','0','christian.perez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PEREZ GUAMANZARA JADY PAULINA','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE CIENCIASNUCLEARES','02-2976300','2102','jady.perez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PEREZ GUIRACOCHA GABRIELA VANESSA','ESPECIALISTA EN TECNICAS DE ANALISIS QUIMICO','FACULTAD DE INGENIERÍAQUÍMICA Y AGROINDUSTRIA','02-2976300','4334','gabriela.perezg@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PEREZ HERNANDEZ MARIA GABRIELA','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 3, GRADO 5)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4701','maria.perez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PEREZ PINEIDA KARINA JOHANNA','ESPECIALISTA JURIDICO 2','DIRECCIÓN DE ASESORÍA JURÍDICA','02-2976300','1182','karina.perezj@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PEREZ PROAÑO MARIA SOLEDAD','PSICOLOGO CLINICO','DIRECCIÓN DE TALENTO HUMANO','02-2976300','1270','maria.perezp@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PEREZ PROAÑO RENE PAUL','DIRECTOR DE ASESORIA JURIDICA','DIRECCIÓN DE ASESORÍA JURÍDICA','02-2976300','1180','rene.perez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PEREZ RICO CRISTINA','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','-','0');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PEREZ RODRIGUEZ ARACELY LUCIA','SECRETARIA','FACULTAD DE CIENCIASADMINISTRATIVAS','02-2976300','2009','aracely.perez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PEREZ SALAZAR RUTH ALEXANDRA','RESPONSABLE ADMINISTRATIVO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2003','alexandra.perez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PEREZ YAULI FABIAN ERNESTO','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 3, GRADO 5)','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2347','fabian.perez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PERRAULT MATTHIEU','GEOFISICO 3','PROYECTOS EPN','02-2976300','0','matthieu.perrault@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PERUGACHI BETANCOURT TELMO ALFREDO','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','telmo.perugachib@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PERUGACHI PABLO WILFRIDO','CHOFER','DIRECCIÓN ADMINISTRATIVA','02-2976300','2027','pablo.perugachi@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PETIT MARTINEZ MILDRED DE LAS MERCEDES','SECRETARIA','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','3705','mildred.petit@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PICOITA BERMEO FREDDY JAVIER','GUIA DE MUSEO','OBSERVATORIO ASTRONÓMICO','02-2976300','6802','freddy.picoita@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PILACUAN DAVILA EDISON FERNANDO','TECNICO DE MANTENIMIENTO','FACULTAD DE INGENIERÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2203','edison.pilacuan@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PILAQUINGA ABADIANO DIEGO IVAN','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2203','diego.pilaquinga@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PILATUÑA CHICA INTI','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 1','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','0','inti.pilatuna@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PINAJOTA DUCHI EDDY ALFREDO','ANALISTA DE REDES DE MONITOREO GEOFISICO 3','INSTITUTO GEOFÍSICO','02-2976300','6705','eddy.pinajota@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PINEIDA IMBAQUINGO PAOLA VERONICA','SECRETARIA','FACULTAD DE INGENIERÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2211','paola.pineida@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PINO MORALES EUDORO GERARDO','ANALISTA DE REDES DE MONITOREO GEOFISICO 3','PROYECTOS EPN','02-2976300','6708','gerardo.pino@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PINTO AGUIRRE CARLOS ALBERTO','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','carlos.pinto@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PINTO BAEZ CHRISTIAN MIGUEL','PROFESOR OCASIONAL TIEMPO PARCIAL','DEPARTAMENTO DE FÍSICA','02-2976300','1051','miguel.pinto@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PINZON VENEGAS KATHIA ELIANA','TECNICO DOCENTE','FACULTAD DE CIENCIAS','02-2976300','-','kathia.pinzon@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PLATZER SONIA IVONNE','SECRETARIA EJECUTIVA 2','DIRECCIÓN DE RELACIONESINSTITUCIONALES','02-2976300','1301','ivonne.platzer@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PLAZA ESTUPIÑAN LUIS FELIPE','OFICINISTA','FACULTAD DE INGENIERÍAQUÍMICA Y AGROINDUSTRIA','02-2976300','4318','luis.plaza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PLAZA TUBON GRACE ANDREA','ADMINISTRADOR 2','FACULTAD DE CIENCIASADMINISTRATIVAS','02-2976300','1654','andrea.plaza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PLAZARTE ACHIG JUAN CARLOS','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2203','juan.plazarte@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PLUA AGUIRRE FRANK ALEX','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1604','frank.plua@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'POMA ZAMORA DANIELA ALEJANDRA','RECEPCIONISTA ESPECIALIZADO','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','-','0');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PONCE ADAMS MARIA GABRIELA','GEOFISICO 1','PROYECTOS EPN','02-2976300','6701','maria.poncep@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PONCE CALLE MARIA DEL CARMEN','ASISTENTE DEL TALENTO HUMANO','DIRECCIÓN DE TALENTO HUMANO','02-2976300','1269','maria.ponce@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PONCE CEVALLOS LEANDRO ISAAC','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','-','leandro.ponce@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PONCE GUEVARA LUIS ALFREDO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2729','luis.ponce@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PONCE VALLE MARIA GABRIELA','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','gabriela.ponce@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PONTON BRAVO PATRICIA ISABEL','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE MATERIALES','02-2976300','','patricia.ponton@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PONTON CAAMAÑO CLAUDIA IRENE','ESPECIALISTA JURIDICO 1','DIRECCIÓN DE ASESORÍA JURÍDICA','02-2976300','1156','claudia.ponton@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PORTILLA AGUILAR ANGEL ADALBERTO','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 3, GRADO 5)','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','5750','angel.portilla@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PORTILLA YANDUN SEGUNDO JESUS','JEFE DE DEPARTAMENTO','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3748','jesus.portilla@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'POSSO GERARDO ULISES','RESPONSABLE DE FISCALIZACION','DIRECCIÓN DE PLANIFICACIÓN','02-2976300','1340','gerardo.posso@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'POSSO LOPEZ PABLO RICARDO','COMUNICADOR SOCIAL 2','DIRECCIÓN DE RELACIONESINSTITUCIONALES','02-2976300','1305','pablo.posso@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'POVEDA CALDERON RICARDO ANDRES','TECNICO DOCENTE','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3701','ricardo.poveda@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'POZO PALMA PAUL MARCELO','PROFESOR PRINCIPAL A TIEMPO COMPLETO (NIVEL 1, GRADO 6)','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2355','marcelo.pozo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'POZO ROSERO EDUARDO JAVIER','ASISTENTE GEOFISICO','INSTITUTO GEOFÍSICO','02-2976300','6708','javier.pozo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'POZO VIERA NATALY ARACELY','TECNICO DOCENTE','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2226','nataly.pozo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PRADO AGUILAR MARIA ESTHER','SECRETARIA EJECUTIVA 2','FACULTAD DE CIENCIAS','02-2976300','1503','maria.pradoa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PRADO REYES EDUARDO BOLIVAR','ESPECIALISTA DE SEGURIDAD Y SALUDOCUPACIONAL','DIRECCIÓN DE TALENTO HUMANO','02-2976300','1270','eduardo.prado@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PROAÑO AGUILAR MARIANA DE LOURDES','RESPONSABLE DE NÓMINA','DIRECCIÓN FINANCIERA','02-2976300','1210','mariana.proano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PROAÑO AÑAZCO JULIO CESAR','ASESOR 4','SECRETARÍA GENERAL','02-2976300','1001','julio.proano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PROAÑO BRAZALES MARIA FERNANDA','REFERENCISTA','FACULTAD DE INGENIERÍAQUÍMICA Y AGROINDUSTRIA','02-2976300','4335','maria.proano04@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PROAÑO CARGUA JUAN CARLOS','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 3','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1430','juancarlos.proanio@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PROAÑO CHAMORRO PABLO ANDRES','TECNICO DOCENTE','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2701','pablo.proano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PROAÑO FIALLOS EDWIN ANDRES','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','5218','andres.proanof@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PROAÑO GUALSAQUI FRANCISCO ESTANISLAO','RESPONSABLE DE PRESUPUESTO','INSTITUTO GEOFÍSICO','02-2976300','6701','francisco.proano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PROAÑO PEREZ JOSE ANTONIO','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3134','antonio.proano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PROAÑO SANCHEZ PATRICIA MARIANA','ESPECIALISTA DE CARACTERIZACIÓN DEMATERIALES','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','3701','patricia.proanio@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PROAÑO SANTOS CARLOS OSWALDO','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1604','carlos.proano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PROCEL GUERRA SANDRA TERESA','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE GEOLOGÍA','02-2976300','3306','sandra.procel@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PROCEL RUIZ GALO CRISTOBAL','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','galo.procel@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PUGA MOSQUERA EDITH GRIMANESA','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1604','edith.puga@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PUMA ANDRADE EMERSON MAURICIO','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 2','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','132','emerson.puma@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'PUMISACHO ALVARO VICTOR HIPOLITO','PROFESOR TITULAR PRINCIPAL DE ESCALAFONPREVIO TIEMPO COMPLETO','DEPARTAMENTO DE CIENCIASADMINISTRATIVAS','02-2976300','1660','victor.pumisacho@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'QUIGUANGO CHASILOA JENNY GABRIELA','ASISTENTE DE TECNOLOGIA DE LA INFORMACIONY COMUNICACIONES','FACULTAD DE INGENIERÍA DESISTEMAS','02-2976300','0','jenny.quiguango@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'QUILLUPANGUI ROJAS LUIS OLMEDO','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2706','luis.quillupangui@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'QUILOANGO CHIMARRO PAOLA NATHALY','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','-','paola.quiloango@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'QUINCHAGUANO DUQUE DAVID FRANCISCO','ASISTENTE DE TECNOLOGIAS DE LA INFORMACIONY COMUNICACION','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1436','david.quinchaguano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'QUINCHIGUANGO ZUMBA YADIRA LILIANA','ASISTENTE DE TECNOLOGIA DE LA INFORMACIONY COMUNICACIONES','FACULTAD DE INGENIERÍA DESISTEMAS','02-2976300','0','yadira.quinchiguango@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'QUIROGA PEREZ WALTER RODOLFO','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','','walter.quiroga@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'QUIROZ CHAVEZ FRANCISCO JAVIER','JEFE DE DEPARTAMENTO','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','4232','francisco.quiroz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'QUISHPE VILLALBA GLADYS ENCARNACION','ESPECIALISTA DE TALENTO HUMANO 3','DIRECCIÓN DE TALENTO HUMANO','02-2976300','1264','gladys.quishpe@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'QUISPE TIPAN NANCY PATRICIA','SECRETARIA EJECUTIVA 1','FACULTAD DE CIENCIASADMINISTRATIVAS','02-2976300','1806','nancy.quispe@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RAMIREZ ALVAREZ JOSE FERNANDO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1568','jose.ramirez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RAMIREZ GUAÑA ALEX RODRIGO','TECNICO ADMINISTRATIVO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2001','alex.ramirez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RAMIREZ GUASGUA JUAN DAVID','TECNICO DOCENTE','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2203','juan.ramirezd@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RAMIREZ MONTEROS CHRISTIAN ALEXIS','TECNICO DE TECNOLOGIAS DE INFORMACION YCOMUNICACIONES','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1422','christian.ramirezm@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RAMON MALDONADO GUSTAVO ALFONSOPATRICIO','GEOFISICO 3','INSTITUTO GEOFÍSICO','02-2976300','6703','gustavo.ramon@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RAMOS LOPEZ MARIA CRISTINA','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 1, GRADO 3)','INSTITUTO GEOFÍSICO','02-2976300','6705','maria.ramos@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RAMOS PEÑA JEIMMY JHANINA','SECRETARIA EJECUTIVA 2','DEPARTAMENTO DE INGENIERÍAQUÍMICA','02-2976300','4301','jeimmy.ramos@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RAMOS RAMOS MARIA EUGENIA','GUIA DE MUSEO','OBSERVATORIO ASTRONÓMICO','02-2976300','6802','maria.ramosr@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RAMOS RAMOS VALENTINA','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 3, GRADO 5)','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','1806','valentina.ramos@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RECALDE CALAHORRANO DIEGO FERNANDO','PROFESOR PRINCIPAL A TIEMPO COMPLETO(NIVEL 1, GRADO 6)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1577','diego.recalde@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RECALDE MEJIA NURY EDITH','SECRETARIA','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','214','nury.recalde@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'REGALADO BOLAÑOS JHANIRA MARGOTH','BIOLOGO','DEPARTAMENTO DE BIOLOGÍA','02-2976300','6008','jhanira.regalado@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'REGALADO LOPEZ MARIA EUGENIA','ESPECIALISTA DE PROCESOS 3','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','1276','maria.regalado@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'REIMUNDO GUALOTUNA DIANA ELIZABETH','SECRETARIA EJECUTIVA 2','FACULTAD DE INGENIERÍA ENGEOLOGÍA Y PETRÓLEOS','02-2976300','3308','diana.reimundo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'REINA GUZMAN WASHINGTON SALVATORE','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3739','salvatore.reina@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'REINOSO CHISAGUANO DIEGO JAVIER','PROFESOR AUXILIAR NIVEL 1 GRADO 1 A TIEMPO COMPLETO','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2203','diego.reinoso@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'REINOSO CHISAGUANO IVAN CAMILO','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','1604','ivan.reinosoi@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RENGEL PACHECO ITALO ROBERTO','AUXILIAR DE MANTENIMIENTO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2017','italo.rengel@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RENGIFO CUZME JIPSON BRAYAN','MENSAJERO','FACULTAD DE INGENIERÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2203','jipson.rengifo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'REVELO REVELO DIEGO ARMANDO','CONDUCTOR ADMINISTRATIVO','DIRECCIÓN ADMINISTRATIVA','02-2976300','0','diego.revelo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'REYES BENITEZ PEDRO SANTIAGO','JEFE','DEPARTAMENTO DE GEOLOGÍA','02-2976300','3318','pedro.reyes@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'REYES CASTRO ANDRES FERNANDO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2203','andres.reyes@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'REYES CIFUENTES VICTOR HUMBERTO','TECNICO DOCENTE','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2203','victor.reyes@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RIERA ROJAS DANIEL EFRAIN','AUXILIAR DE SERVICIOS','DIRECCIÓN ADMINISTRATIVA','02-2976300','2025','daniel.riera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RIERA ROJAS LUIS ANTONIO','CARPINTERO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2018','luis.riera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RIOFRIO ALMEIDA MARIA CRISTINA','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE INGENIERÍAQUÍMICA','02-2976300','-','0');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RIOFRIO AREVALO SERVILIO DE JESUS','CHOFER','INSTITUTO GEOFÍSICO','02-2976300','6701','servilio.riofrio@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RIOS ERAZO JONATHAN GONZALO','ASISTENTE DE LABORATORIO DE ENSAYO','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','3711','jonathan.rios@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RIVADENEIRA BRACHO PABLO ANDRES','TECNICO DOCENTE','DEPARTAMENTO DE FÍSICA','02-2976300','-','pablo.rivadeneira@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RIVADENEIRA ORTIZ CARLA SOFIA','ESPECIALISTA DE TECNOLOGÍA DE LA INFORMACIÓN Y COMUNICACIONES 2','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','0','carla.rivadeneira@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RIVADENEIRA VALLEJO NOE MILTON','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE CIENCIASADMINISTRATIVAS','02-2976300','1804','milton.rivadeneira@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RIVERA ARGOTI PABLO ROBINSON','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2215','pablo.rivera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RIVERA PARRA DIANA PAMELA','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE FÍSICA','02-2976300','','pamela.rivera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RIVERA PARRA JOSE LUIS','SUBDECANO','FACULTAD DE INGENIERÍA ENGEOLOGÍA Y PETRÓLEOS','02-2976300','3330','jose.riverap@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RIVERA PERES OSWALDO ANDRES','ASISTENTE DE PLANIFICACION','DIRECCIÓN DE PLANIFICACIÓN','02-2976300','1321','oswaldo.rivera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROBALINO LOPEZ JORGE ANDRES','JEFE DE DEPARTAMENTO','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','1811','andres.robalino@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RODAS BENALCAZAR ANA VERONICA','PROFESOR TITULAR PRINCIPAL DE ESCALAFON PREVIO TIEMPO COMPLETO','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2333','ana.rodas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RODRIGUEZ GUALSAQUI NATALIA MABEL','ESPECIALISTA DE PRESUPUESTO 2','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','138','natalia.rodriguez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RODRIGUEZ HOYOS ANA FERNANDA','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 2, GRADO 4)','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2213','ana.rodriguez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RODRIGUEZ MEDRANDA FAUSTO RICARDO','TECNICO DE MANTENIMIENTO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2000','fausto.rodriguez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RODRIGUEZ MENDOZA LUIS ALBERTO','TECNICO DE OPERACION Y MANTENIMIENTO DEMAQUINARIA Y/O EQUIPOS /TECNICO DE OPERACIONES','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','4235','luis.rodriguez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RODRIGUEZ PALADINES GABRIEL ALFONSO','ASISTENTE DE TECNOLOGIA DE LA INFORMACIONY COMUNICACIONES','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','2203','gabriel.rodriguez01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RODRIGUEZ SALAZAR PATRICIA ARACELLY','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','-','patricia.rodriguez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RODRIGUEZ SOLIS EVELYN PATRICIA','ASISTENTE DE NOMINA','DIRECCIÓN FINANCIERA','02-2976300','1208','evelyn.rodriguezs@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROJAS BONILLA JAIRO RAFAEL','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','-','jairo.rojasb@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROJAS DAVALOS MAURICIO HERNAN','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE CIENCIASADMINISTRATIVAS','02-2976300','1661','mauricio.rojas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROJAS IDROVO GERMAN PATRICIO','PROFESOR PRINCIPAL A TIEMPO COMPLETO(NIVEL 1, GRADO 6)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1576','german.rojas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROJAS LEMA XIMENA BERNARDA','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','1811','ximena.rojas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROJAS MARCILLO VERONICA DAYANARA','ESPECIALISTA DE TALENTO HUMANO 3','DIRECCIÓN DE TALENTO HUMANO','02-2976300','1271','veronica.rojasm@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROJAS MOLINA ROBERTO CARLOS','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3701','roberto.rojas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROJAS SANCHEZ FRANCISCO EDUARDO','RESPONSABLE DE PLANIFICACIÓN','DIRECCIÓN DE PLANIFICACIÓN','02-2976300','1321','francisco.rojas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROMAN CARRION JOSE LUIS','PALEANTÓLOGO','DEPARTAMENTO DE BIOLOGÍA','02-2976300','6006','joseluis.roman@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROMAN VASQUEZ JOSE LUIS','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 2, GRADO 4)','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','1811','luis.roman@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROMERO CASCANTE EDUARDO RAMON','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 3','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1441','eduardo.romero@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROMERO GRANJA CRISTINA MARIA','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','4315','cristina.romero@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROMERO GUALAN JULIANA MARIBEL','ASISTENTE DE LABORATORIO DE ENSAYO','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','1604','juliana.romero@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROMERO MEJIA LUIS GEOVANNY','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3701','luis.romerom@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROMERO OBANDO MARIA PAULINA','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 3, GRADO 5)','DEPARTAMENTO DE MATERIALES','02-2976300','3737','maria.romerom@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROMERO QUISHPE GERMAN PATRICIO','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 2','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1445','german.romero@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROMERO VEGA NARCISA DE JESUS','DIRECTOR DE BIENESTAR ESTUDIANTIL Y SOCIAL','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','1652','narcisa.romero@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROMO HERRERA CARLOS ORLANDO','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','2703','carlos.romo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROSALES ACOSTA JORGE ANDRES','PROFESOR PRINCIPAL A TIEMPO COMPLETO (NIVEL 1, GRADO 6)','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2273','andres.rosales@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROSAS BRAVO ROCIO MARGOT','ESPECIALISTA DE CONTABILIDAD 1','DIRECCIÓN FINANCIERA','02-2976300','1201','rocio.rosas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROSAS LAVERDE NELLY MARIA','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 3, GRADO 5)','DEPARTAMENTO DE MATERIALES','02-2976300','3740','nelly.rosas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROSERO ANDRANGO MARITZA ELIZABETH','ASISTENTE DE TECNOLOGIAS DE LA INFORMACIONY COMUNICACION','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2740','maritza.roseroa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROSERO DAVILA WENDY ADRIANA','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','wendy.rosero@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROSERO ESCALANTE LUIS ANDRES MAURICIO','JEFE','DEPARTAMENTO DE CIENCIASSOCIALES','02-2976300','6050','luis.rosero@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROSERO PEÑA RAMIRO FABIAN','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','ramiro.rosero@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROSERO PONCE ALVARO MIGUEL','GESTOR CULTURAL','VICERRECTORADO DE DOCENCIA','02-2976300','1109','alvaro.rosero@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ROUSSEAU LARCO MONICA PATRICIA','ASESOR 4','DIRECCIÓN FINANCIERA','02-2976300','1201','patricia.rousseau@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RUALES CORRALES LUIS EDMUNDO','PROFESOR PRINCIPAL A TIEMPO PARCIAL','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2217','luis.ruales@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RUALES NAJERA JENY CUMANDA','PROFESOR PRINCIPAL A TIEMPO COMPLETO (NIVEL 1, GRADO 6)','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','4244','jenny.ruales@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RUANO CALERO MAYRA ALEXANDRA','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3302','mayra.ruano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RUEDA MANZANO MONICA CATALINA','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','-','0');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RUEDA PAREDES CHRISTIAN PATRICIO','OFICINISTA','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','146','patricio.rueda@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RUIZ COELLO MARCELO XAVIER','TECNICO DOCENTE','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1604','marcelo.ruiz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RUIZ PASQUEL BAYRON ESTUARDO','ASESOR 2','RECTORADO','02-2976300','1017','bayron.ruiz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RUIZ POZO HERNAN PATRICIO','ASISTENTE DE TESORERIA','DIRECCIÓN FINANCIERA','02-2976300','1240','hernan.ruiz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'RUIZ ROMERO MARIO CALIXTO','PROFESOR PRINCIPAL A TIEMPO COMPLETO(NIVEL 1, GRADO 6)','INSTITUTO GEOFÍSICO','02-2976300','6700','mario.ruiz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SALAS CADENA MONICA ALICIA','SECRETARIA','METALMECÁNICA SAN BARTOLO','02-2976300','2670823','monica.salas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SALAS HARO WALTER ADRIAN','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','walter.salash@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SALAS LUZURIAGA GEOVANNINA PATRICIA','ESPECIALISTA DE PLANIFICACIÓN 3','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','1322','geovannina.salas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SALAZAR ANGULO BYRON PATRICIO','ASISTENTE OBSERVATORIO ASTRONOMICO','OBSERVATORIO ASTRONÓMICO','02-2976300','6801','byron.salazar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SALAZAR LOPEZ PAULINA ELIZABETH','SECRETARIA','DIRECCIÓN DE TALENTO HUMANO','02-2976300','1261','paulina.salazar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SALAZAR MENDEZ YASMIN','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1501','yasmin.salazar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SALAZAR MONTENEGRO MARIA FERNANDA','PROFESOR PRINCIPAL A TIEMPO COMPLETO(NIVEL 1, GRADO 6)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1578','fernanda.salazar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SALAZAR ORELLANA DIEGO ISRAEL','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','1501','diego.salazar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SALAZAR RODRIGUEZ ANA MARIA','SECRETARIA','FACULTAD DE INGENIERÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','0','ana.salazar01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SALAZAR YEPEZ GABRIEL BENJAMIN','PROFESOR AGREGADO A TIEMPO PARCIAL (NIVEL3, GRADO 5)','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2216','gabriel.salazar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SALGADO TORRES FRANCISCO XAVIER','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 1, GRADO 3)','DEPARTAMENTO DE CIENCIASNUCLEARES','02-2976300','2100','francisco.salgado@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SALINAS PILLAJO ZULY LEONELA','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE MATEMÁTICA','02-2976300','','zuly.salinas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SALTOS MONTAÑO GEOVANNA VANESSA','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 3','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1440','geovanna.saltos@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SALTOS VALENCIA DENISSE ELENA','ASISTENTE DE PLANIFICACION','DIRECCIÓN DE PLANIFICACIÓN','02-2976300','-','denisse.saltos@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SALVADOR PESANTES EDWIN GONZALO','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE CIENCIASADMINISTRATIVAS','02-2976300','2732','edwin.salvador@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SALVADOR QUIÑONES MARCELO FERNANDO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE INGENIERÍAQUÍMICA','02-2976300','4210','marcelo.salvadorq@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SAMANIEGO PACTONG JOSE ANTONIO','ASISTENTE DE LABORATORIO DE ENSAYO','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','1604','jose.samaniegop@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SANCHEZ ALMEIDA TARQUINO FABIAN','VICERRECTOR DE DOCENCIA','VICERRECTORADO DE DOCENCIA','02-2976300','1100','tarquino.sanchez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SANCHEZ BALSECA JOSEPH JHAIR','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','1604','joseph.sanchezb@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SANCHEZ CATOTA FRANKLIN LEONEL','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 3, GRADO 5)','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2309','franklin.sanchez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SANCHEZ CHOEZ NAPOLEON GUILLERMO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','1815','napoleon.sanchez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SANCHEZ GORDON SANDRA PATRICIA','PROFESOR TITULAR PRINCIPAL DE ESCALAFON PREVIO TIEMPO COMPLETO','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4714','sandra.sanchez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SANCHEZ MIRANDA XIMENA JHOANA','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','ximena.sanchez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SANCHEZ TERAN ALBERTO ESTEBAN','PROFESOR PRINCIPAL A TIEMPO PARCIAL','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2215','alberto.sanchez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SANDOBALIN GUAMAN JULIO CESAR','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4701','julio.sandobalin@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SANDOBALIN GUAMAN SANTIAGO DAVID','ANALISTA TECNICO DEL OBSERVATORIOASTRONOMICO','OBSERVATORIO ASTRONÓMICO','02-2976300','6804','santiago.sandobaling@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SANDOVAL PALIS IVAN PATRICIO','PROFESOR TITULAR PRINCIPAL DE ESCALAFONPREVIO TIEMPO COMPLETO','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3151','ivan.sandoval@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SANDOVAL PAUKER CHRISTIAN FERNANDO','TECNICO DOCENTE','DEPARTAMENTO DE CIENCIASNUCLEARES','02-2976300','4302','christian.sandoval@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SANMARTIN PIEDRA ELISA BELEN','SECRETARIA','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','0','elisa.sanmartin@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SANTACRUZ TERAN CRISTIAN PATRICIO','PROFESOR PRINCIPAL A TIEMPO COMPLETO(NIVEL 1, GRADO 6)','DEPARTAMENTO DE FÍSICA','02-2976300','1516','cristian.santacruz@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SANTAMARIA FREIRE SANTIAGO DAVID','ASISTENTE GEOFISICO','PROYECTOS EPN','02-2976300','6701','santiago.santamaria01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SANTANA RIVERA NATALIA ELIZABETH','DOCUMENTALISTA 2','SECRETARÍA GENERAL','02-2976300','1151','natalia.santana@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SANTO CELA NELSON JAVIER','TECNICO GEOFISICO','INSTITUTO GEOFÍSICO','02-2976300','6711','nelson.santo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SANTORUM GAIBOR MARCO OSWALDO','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 3, GRADO 5)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4713','marco.santorum@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SANTOS RAGUS ERNESTO JR','RESPONSABLE DE LINGUÍSTCA','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','147','ernesto.santos@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SANTOS TORRES ROQUE ANTONIO','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 1, GRADO 3)','DEPARTAMENTO DE CIENCIASNUCLEARES','02-2976300','2101','roque.santos@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SARANGO LOACHAMIN SANDRA ELIZABETH','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 1','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1408','sandra.sarango@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SARMIENTO BORJA EDGAR FERNANDO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE MATERIALES','02-2976300','3701','edgar.sarmiento@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SARMIENTO PALOMINO MIGUEL ANGEL','ESPECIALISTA DE CARACTERIZACIÓN DEMATERIALES','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3721','miguel.sarmiento@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SARRADE DUEÑAS FAUSTO ERNESTO','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE CIENCIASADMINISTRATIVAS','02-2976300','1804','fausto.sarrade@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SEGOVIA REYES MONICA DEL ROCIO','GEOFISICO 2','INSTITUTO GEOFÍSICO','02-2976300','6707','monica.segovia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SEGOVIA SUAREZ JUAN FRANCISCO','ADMINISTRADOR 1','SECRETARÍA GENERAL','02-2976300','1151','juan.segovia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SEGURA MORALES MARCO ANTONIO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','','marco.segura@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SERRANO GOMEZ MARCO FABIAN','ASISTENTE DE TECNOLOGIA DE LA INFORMACIONY COMUNICACIONES','FACULTAD DE INGENIERÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','0','marco.serrano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SERRANO LOACHAMIN KLEBER ANIBAL','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 1','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1404','kleber.serrano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SILVA ALCOSER MYRIAN GABRIELA','TECNICO DOCENTE','DEPARTAMENTO DE INGENIERÍAQUÍMICA','02-2976300','-','myrian.silva@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SILVA BALLAGAN GEOCONDA ELIZABETH','ANALISTA ADMINISTRATIVO ACADEMICO 2','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1401','geoconda.silva@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SIMBAÑA BAZAN MILTON EDUARDO','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','DEPARTAMENTO DE CIENCIASNUCLEARES','02-2976300','4229','milton.simbana@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SIMBAÑA GUAÑUNA JULIAN ALBERTO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','julian.simbana@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SIMBAÑA LINCANGO JORGE EDUARDO','TECNICO DE MANTENIMIENTO','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1407','jorge.simbana@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SIMBAÑA PAUCAR ALEX SEBASTIAN','ESPECIALISTA DE CONTABILIDAD 1','DIRECCIÓN FINANCIERA','02-2976300','1201','alex.simbana01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SINCHE BARAHONA LUIS ALBERTO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍAQUÍMICA','02-2976300','4305','luis.sinche@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SINCHE MAITA SORAYA LUCIA','PROFESOR TITULAR PRINCIPAL DE ESCALAFON PREVIO TIEMPO COMPLETO','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2202','soraya.sinche@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SINCHE SERRA MARCO VINICIO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE CIENCIASNUCLEARES','02-2976300','4204','marco.sinche@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SINGAUCHO ARMAS JUAN CARLOS','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','INSTITUTO GEOFÍSICO','02-2976300','6706','juan.singaucho@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SISA ALLAYCA ALISSON DANIELA','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','0','alisson.sisa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SISALIMA BACUILIMA SANDRA MARCELA','AUXILIAR DE SERVICIOS GENERALES','DEPARTAMENTO DE INGENIERÍAQUÍMICA','02-2976300','4301','sandra.sisalima@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SOLA MARCILLO ALEXIS ROLANDO','ESPECIALISTA DE ANALISIS DE ESFUERZOS YVIBRACIONES','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','3701','alexis.sola@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SOLANO DIAZ ERIKA CRISTINA','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','erika.solanod@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SOLIS ALULIMA BYRON ERNESTO','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE GEOLOGÍA','02-2976300','-','byron.solisa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SOLIS LUNA ORLANDO RENATO','ASISTENTE DE TALENTO HUMANO','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','112','orlando.solis@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SORIA COLINA MAURICIO SANTIAGO','TECNICO DOCENTE','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2203','mauricio.soria@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SORIA PEÑAFIEL RAFAEL ANDRES','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3701','rafael.soria01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SOSA CAIZA DIEGO ANDRES','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1604','diego.sosac@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SOSA GUZMAN DANIEL EDUARDO','ESPECIALISTA DE TESORERIA 1','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','0','daniel.sosa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SOSA PARREÑO CARINA CONSUELO','ESPECIALISTA DE TESORERIA 1','DIRECCIÓN FINANCIERA','02-2976300','1211','carina.sosa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SOTO AYMAR LUIS RICARDO','PROFESOR TITULAR PRINCIPAL DE ESCALAFONPREVIO TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3727','ricardo.soto@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SOTO JACOME LEONARDO DAVID','TÉCNICO DE LABORATORIO DE INVETIGACIÓN YCONTROL AMBIENTAL','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','1604','leonardo.soto@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SOTO MORALES KAREN JASMIN','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','karen.soto@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SOTOMAYOR GALVEZ OSCAR EFRAIN','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE MATERIALES','02-2976300','3701','oscar.sotomayor@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SOTOMAYOR GRIJALVA MARIA CRISTINA','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','4244','cristina.sotomayor@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SOTOMAYOR GRIJALVA MARIA VERONICA','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE MATERIALES','02-2976300','3701','veronica.sotomayor@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SOTOMAYOR OROZCO NELSON GONZALO','PROFESOR TITULAR PRINCIPAL DE ESCALAFON PREVIO TIEMPO COMPLETO','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2303','nelson.sotomayor@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SUAREZ OBACO CARLOS ENRIQUE','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','203','carlos.suarez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SUAREZ PAREDES PIEDAD GISSELA','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1604','piedad.suarez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SUNTAXI GUALLICHICO SEGUNDO CARLOS','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3722','segundo.suntaxi@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'SUNTAXI OÑA GABRIELA LORENA','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4733','gabriela.suntaxi@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TACO VASQUEZ SEBASTIAN ANIBAL','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE INGENIERÍAQUÍMICA','02-2976300','4328','sebastian.taco@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TAIMAL JATO DARWIN JOSE','AUXILIAR DE MECANICA','METALMECÁNICA SAN BARTOLO','02-2976300','2670823','darwin.taimal@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TAIPE HIDALGO DIANA PAULINA','TECNICO DOCENTE','DEPARTAMENTO DE MATEMÁTICA','02-2976300','','diana.taipe01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TAPA CAIZA CARLOS IVAN','ASISTENTE GEOFISICO','PROYECTOS EPN','02-2976300','6705','carlos.tapac@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TAPIA ARIAS CHRISTIAN RAFAEL','TECNICO DOCENTE','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','','christian.tapia01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TAPIA CALVOPIÑA RUTH ELENA','ESPECIALISTA EN TECNICAS DE ANALISIS QUIMICO','DEPARTAMENTO DE INGENIERÍAQUÍMICA','02-2976300','4321','ruth.tapia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TAPIA MORALES ANA GABRIELA','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3701','ana.tapia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TASIGUANO POZO CRISTIAN ANDRES','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2203','cristian.tasiguano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TATAYO VINUEZA EDISON RAMIRO','ASISTENTE DE TECNOLOGIAS DE LAINFORMACION Y COMUNICACION','FACULTAD DE INGENIERÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','0','edison.tatayo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TELENCHANA LAGUA EDWIN RODRIGO','ASISTENTE GEOFISICO','PROYECTOS EPN','02-2976300','6701','edwin.telenchana@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TELENCHANA TIBAN CESAR RODRIGO','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','VICERRECTORADO DE DOCENCIA','02-2976300','1101','cesar.telenchana@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TENEMAZA VERA REGINA MARITZOL','SUBDECANO','FACULTAD DE INGENIERÍA DESISTEMAS','02-2976300','2719','maritzol.tenemaza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TENIMUELA GUANULEMA ANGEL PATRICIO','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','DIRECCIÓN ADMINISTRATIVA','02-2976300','2001','angel.tenimuela@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TERAN BENALCAZAR KATHERINE YADIRA','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','-','katherine.teran@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TERCERO CONTERON JUAN MANUEL','ALBANIL','DIRECCIÓN ADMINISTRATIVA','02-2976300','2025','juan.tercero@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TERRY HERBERT GUY','ASESOR 2','RECTORADO','02-2976300','1001','herb.terry@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TIPAN GUAYTA LILIAN GRACIELA','SECRETARIA EJECUTIVA 2','INSTITUTO GEOFÍSICO','02-2976300','6709','lilian.tipan@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TIPANTUÑA TENELEMA CHRISTIAN JOSE','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 3, GRADO 5)','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2341','christian.tipantuna@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TIPAS LUIS ECTOR','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1902','luis.tipas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TIPAS TIPAS DIEGO MAURICIO','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','146','diego.tipas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TIRIRA AREVALO MARIA ELENA','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 1','DIRECCIÓN DE TALENTO HUMANO','02-2976300','1272','maria.tirira@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TOALOMBO TIPAN FREDDY ROLANDO','ESPECIALISTA DE CONTABILIDAD 1','DIRECCIÓN FINANCIERA','02-2976300','1213','freddy.toalombo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TOAPANTA GUAMAN ROBERTO CARLOS','ANALISTA DE REDES DE MONITOREO GEOFISICO 2','INSTITUTO GEOFÍSICO','02-2976300','6701','robertocarlos.toapanta@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TOAPAXI ALVAREZ JORGE AUGUSTO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1902','jorge.toapaxi@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TOASA HECTOR RAMIRO','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','hector.toasa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TOBAR VILLACIS EVELYN NATASHA','ASISTENTE DE AUDITORIA INTERNA','DIRECCIÓN DE AUDITORÍAINTERNA','02-2976300','5101','evelyn.tobar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TOLEDO RIVADENEIRA LUCIA IRENE','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','','lucia.toledo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TORRES CALLE NANCY ELIZABETH','SECRETARIA','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','2702','nancy.torres@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TORRES CARVAJAL LUIS MIGUEL','PROFESOR PRINCIPAL A TIEMPO COMPLETO(NIVEL 1, GRADO 6)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1579','luis.torres@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TORRES CRUZ EDWIN FERNANDO','PSICOLOGO CLINICO','DIRECCIÓN DE BIENESTARESTUDIANTIL Y SOCIAL','02-2976300','1130','edwin.torres@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TORRES GORDILLO RAMIRO DANIEL','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 3, GRADO 5)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1580','ramiro.torres@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TORRES GUAYASAMIN RENE ANDRES','OFICINISTA','DIRECCIÓN DE RELACIONESINSTITUCIONALES','02-2976300','1306','rene.torres@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TORRES GUERRON MARIA CRISTINA','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1907','maria.torresg@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TORRES JACOBOWITZ CRISTINA ALEXANDRA','TECNICO DOCENTE','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1604','cristina.torresj@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TORRES LAPO IVAN DARIO','ESPECIALISTA DE CONTABILIDAD 2','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','0','ivan.torres01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TORRES LOPEZ GERMAN ATILIO','ADMINISTRADOR 3','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','146','german.torres@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TORRES LOPEZ MARIA EUFEMIA','INSTRUCTOR','DEPARTAMENTO DE CIENCIASSOCIALES','02-2976300','6051','maria.torres@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TORRES OLMEDO JENNY GABRIELA','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 3, GRADO 5)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4735','jenny.torres@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TORRES PROAÑO EDGAR PORFIRIO','PROFESOR PRINCIPAL A TIEMPO PARCIAL','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4701','edgar.torres@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TORRES TABANGO JOHANNA CECILIA','CONSERJE','FACULTAD DE CIENCIAS','02-2976300','1508','johanna.torres@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TORRES VITERI SEGUNDO ALBERTO','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','FACULTAD DE CIENCIAS','02-2976300','1501','segundo.torres@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TOSCANO JARA JOHANNA PAOLETTE','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','','johanna.toscano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TOSCANO MARTINEZ FREDY ARMANDO','AUXILIAR DE SERVICIOS GENERALES','DIRECCIÓN ADMINISTRATIVA','02-2976300','2017','fredy.toscano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TROYA NIETO GABRIELA CECILIA','ASISTENTE ADMINISTRATIVO DE LACOORDINACION DE LINGÜÍSTICA','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','211','gabriela.troya@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TROYA PROAÑO ADRIAN ESTEBAN','ENTOMÓLOGO','DEPARTAMENTO DE BIOLOGÍA','02-2976300','6005','adrian.troya@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TRUJILLO AREVALO HILDA LUCIA','RESPONSABLE DE LABORATORIO DE ENSAYOS','DEPARTAMENTO DE INGENIERÍAQUÍMICA','02-2976300','4306','hilda.trujillo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TRUJILLO GUERRERO MARIA FERNANDA','TECNICO DOCENTE','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2203','maria.trujillo01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TRUJILLO LEON MARIA FERNANDA','TECNICO DOCENTE','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','0','maria.trujillo03@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TRUJILLO ORTEGA JUAN CARLOS','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1517','juancarlos.trujillo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TUALOMBO REA MIGUEL ANGEL','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','-','miguel.tualombo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TUBON NAVARRETE JENNY PIEDAD','TRABAJADOR SOCIAL','DIRECCIÓN DE BIENESTARESTUDIANTIL Y SOCIAL','02-2976300','1139','jenny.tubon@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TUBON TACURI CARLOS LEONARDO','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','FACULTAD DE INGENIERÍAQUÍMICA Y AGROINDUSTRIA','02-2976300','4206','carlos.tubon@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TUFIÑO MONTEROS TANIA NATALI','SECRETARIA','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','1051','tania.tufino@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'TUTILLO SANCHEZ DORIS KARINA','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','4710','doris.tutillo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'UCHUPANTA MOLINA XIMENA DE LOS ANGELES','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 3','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','170','ximena.uchupanta@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'UNAPANTA BENAVIDES LUIS DANIEL','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','0','luis.unapanta@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'UNDA GALARZA LUIS XAVIER','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 2, GRADO 4)','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','1804','xavier.unda@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'UQUILLAS ANDRADE ADRIANA','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1583','adriana.uquillas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'URIBE SOTO RAFAEL ALONSO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍAQUÍMICA','02-2976300','','rafael.uribe@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'URQUIZA AGUIAR LUIS FELIPE','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2203','luis.urquiza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'URVINA MAYORGA MENTHOR OSWALDO','PROFESOR TITULAR PRINCIPAL DE ESCALAFONPREVIO TIEMPO COMPLETO','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1571','menthor.urvina@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'USHIÑA CHASIPANTA MARIA PATRICIA','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','203','maria.ushina@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'USHIÑA PUMA ANGEL FERNANDO','PROFESOR PRINCIPAL A TIEMPO PARCIAL','DEPARTAMENTO DE PETRÓLEOS','02-2976300','3301','angel.ushina@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'UTRERAS BONILLA EDWIN RICHARD','AYUDANTE DE SERVICIOS ADMINISTRATIVOS','DIRECCIÓN ADMINISTRATIVA','02-2976300','2025','edwin.utreras@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'UTRERAS FUENTES RUTH ELENA','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE MATEMÁTICA','02-2976300','','ruth.utreras@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'UTRERAS TELLO ANDRES JULIAN','TÉCNICO DOCENTE','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2203','andres.utreras@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'UVIDIA TAPIA DAISY PAMELA','ASISTENTE DE TECNOLOGIA DE LA INFORMACIONY COMUNICACIONES','FACULTAD DE INGENIERÍA DESISTEMAS','02-2976300','4738','daisy.uvidia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'UZCATEGUI ANDRADE MARCELO AUGUSTO','ESPECIALISTA EN TRATAMIENTOS DE EQUIPOSESPECIALES','FACULTAD DE INGENIERÍAQUÍMICA Y AGROINDUSTRIA','02-2976300','2102','marcelo.uzcategui@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VACA ARELLANO WALTER POLO','PROFESOR PRINCIPAL A TIEMPO COMPLETO(NIVEL 1, GRADO 6)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1562','polo.vaca@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VACA ARIAS SANDRO BENIGNO','GEOFISICO 2','INSTITUTO GEOFÍSICO','02-2976300','6706','sandro.vaca@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VACA CERDA ESTEBAN ALEJANDRO','ASISTENTE DE LABORATORIO DE ENSAYO','FACULTAD DE INGENIERÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2203','esteban.vaca@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VACA JIMENEZ SANTIAGO DAVID','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3711','santiago.vaca@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VACA PEREZ MAYRA ELIZABETH','GEOFISICO 2','INSTITUTO GEOFÍSICO','02-2976300','6705','mayra.vaca@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VACACELA GUALAN ROSA MARIA ANGELITA','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE CIENCIASSOCIALES','02-2976300','6051','rosa.vacacela@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VALENCIA ARCOS FAUSTO RAMIRO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2330','fausto.valencia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VALENCIA BONILLA NATHALIA TERESA','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 1, GRADO 3)','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1612','nathalia.valencia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VALENCIA CHAMORRO SILVIA AZUCENA','PROFESOR PRINCIPAL A TIEMPO COMPLETO (NIVEL 1, GRADO 6)','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','4243','silvia.valencia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VALENCIA DELGADO MARCO OSWALDO','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2203','marco.valenciav@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VALENCIA FLORES JORGE EDGAR','SECRETARIO','FACULTAD DE CIENCIAS','02-2976300','1266','jorge.valencia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VALENCIA TAPIA RAUL ARMANDO','JEFE DEL DEPARTAMENTO DE PETROLEOS','DEPARTAMENTO DE PETRÓLEOS','02-2976300','3307','raul.valencia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VALENCIA TORRES ESTEBAN ALEJANDRO','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 3, GRADO 5)','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3711','esteban.valencia@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VALENZUELA PEÑAFIEL RAMIRO ISAAC','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2329','ramiro.valenzuela@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VALLADARES SALAZAR CLAUDIA RAQUEL','RECEPCIONISTA ESPECIALIZADO','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','101','claudia.valladares@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VALLE ALVAREZ LAURO VLADIMIR','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','2124','vladimir.valle@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VALLEJO CIFUENTES RICARDO PATRICIO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','ricardo.vallejo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VALLEJO CRUZ CRISTIAN FERNANDO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE GEOLOGÍA','02-2976300','3302','cristian.vallejov@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VALLEJO PEREZ MARIA JOSE','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','maria.vallejo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VALLEJO TEJADA PABLO ALBERTO','PROFESOR AGREGADO 1 A TIEMPO PARCIAL','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','4318','pablo.vallejo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VALLEJO VARGAS SILVIA XIMENA','GEOFISICO 2','INSTITUTO GEOFÍSICO','02-2976300','6701','silvia.vallejo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VALVERDE BASTIDAS JAVIER GONZALO','TECNICO DOCENTE','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3701','javier.valverde@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VARGAS ALBARRACIN MAYRA ALEXANDRA','ASISTENTE DE TESORERIA','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','-','mayra.vargasa@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VARGAS CULQUI DIEGO DANILO','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','diego.vargasc@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VARGAS JENTZSCH PAUL ERNESTO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE CIENCIASNUCLEARES','02-2976300','4233','paul.vargas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VARGAS PACHA MOISES ALEJANDRO','TECNICO DOCENTE','FACULTAD DE CIENCIAS','02-2976300','-','moises.vargas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VARGAS QUISHPE MARIA BELEN','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','-','maria.vargas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VARGAS VEGA MARIAM GRACIELA','SECRETARIA EJECUTIVA 1','DIRECCIÓN DE RELACIONESINSTITUCIONALES','02-2976300','3104','mariam.vargas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VASCO CARRILLO MARIA CATALINA','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 1, GRADO 3)','DEPARTAMENTO DE CIENCIASNUCLEARES','02-2976300','4202','catalina.vasco@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VASCONEZ ALBAN FREDDY GUSTAVO','GEOFISICO 2','INSTITUTO GEOFÍSICO','02-2976300','6705','freddy.vasconez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VASCONEZ PAREDES FRANCISCO JAVIER','ANALISTA DE REDES DE MONITOREO GEOFISICO 2','PROYECTOS EPN','02-2976300','6703','francisco.vasconezp@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VASCONEZ VEGA CHRISTIAN LEONARDO','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 3, GRADO 5)','DEPARTAMENTO DE FÍSICA','02-2976300','1701','christian.vasconez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VASQUEZ FLORES ALEXANDRA ELIZABETH','RECAUDADOR','DIRECCIÓN FINANCIERA','02-2976300','1201','alexandra.vasquez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VASQUEZ MIRANDA PAUL FABRICIO','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 3, GRADO 5)','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2203','paul.vasquez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VASQUEZ PAZMIÑO NICOLAS ALEJANDRO','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 1, GRADO 3)','DEPARTAMENTO DE FÍSICA','02-2976300','1711','nicolas.vasquez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VASQUEZ PEÑAFIEL MARIA STEFANIE','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','2730','maria.vasquez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VEGA MUÑOZ PAOLA DE LOURDES','COMUNICADOR SOCIAL 2','DIRECCIÓN DE RELACIONESINSTITUCIONALES','02-2976300','1301','paola.vega@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VEGA SANCHEZ JOSE DAVID','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','','jose.vega01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VEINTIMILLA CACERES EDGAR RAUL','CHOFER','RECTORADO','02-2976300','1001','edgar.veintimilla@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VEINTIMILLA SEGOVIA DIEGO ORLANDO','OFICINISTA','DIRECCIÓN DE TALENTO HUMANO','02-2976300','1266','diego.veintimilla@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VEINTIMILLA VARGAS VERONICA DEL PILAR','GESTOR DE APOYO PEDAGÓGICO','VICERRECTORADO DE DOCENCIA','02-2976300','1103','veronica.veintimilla@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VELASCO MEDINA CARLOS FERNANDO','AYUDANTE DE CATEDRA','FACULTAD DE INGENIERÍAQUÍMICA Y AGROINDUSTRIA','02-2976300','-','carlos.velasco@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VELASTEGUI BALDA GABRIEL EDMUNDO','RESPONSABLE DE LABORATORIO DE ENSAYOS','DEPARTAMENTO DE MATERIALES','02-2976300','5856','gabriel.velastegui@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VELASTEGUI CARRILLO VIVIANA ANDREA','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','1604','viviana.velastegui@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VELASTEGUI SANCHEZ KARLA VALERIA','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 3','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1435','valeria.velastegui@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VELEZ MAYORGA LUIS ALBERTO','ANALISTA DE REDES DE MONITOREO GEOFISICO 1','PROYECTOS EPN','02-2976300','6701','luis.velez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VENEGAS SOLORZANO ELIZABETH MARINA','ESPECIALISTA EN TECNICAS DE ANALISIS QUIMICO','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','2122','elisabeth.venegas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VENEGAS TORO WILLIAM RICARDO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3711','william.venegas@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VERA CALLE EDWIN RAFAEL','PROFESOR PRINCIPAL A TIEMPO COMPLETO (NIVEL 1, GRADO 6)','DEPARTAMENTO DE CIENCIAS DELOS ALIMENTOS Y BIOTECNOLOGÍA','02-2976300','4239','edwin.vera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VERA FLORES DANIEL ALEJANDRO','DISEÑADOR GRAFICO','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','121','daniel.vera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VERA HENSIEK DANIEL JAVIER','ANALISTA OBSERVATORIO ASTRONOMICO','OBSERVATORIO ASTRONÓMICO','02-2976300','6804','daniel.verah@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VERA ROMERO PABLO ALBERTO','RESPONSABLE DE LABORATORIO DE ENSAYOS','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','1604','pablo.vera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VERA SANCHEZ EDISON MANUEL','ESPECIALISTA EN TRATAMIENTOS DE EQUIPOSESPECIALES','DEPARTAMENTO DE CIENCIASNUCLEARES','02-2976300','2104','edison.vera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VERA UBILLA JHONATHAN ISAAC','TECNICO DOCENTE','DEPARTAMENTO DE PETRÓLEOS','02-2976300','3302','jhonathan.vera@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VERGARA CASTILLO BRYAN ALEXIS','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','-','bryan.vergara@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VIDAL CHICA JACK IVAN','ASESOR 3','VICERRECTORADO DE DOCENCIA','02-2976300','1106','jack.vidal@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VIERA BAUTISTA DANIEL BENJAMIN','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 1','DIRECCIÓN DE GESTIÓN DE LAINFORMACIÓN Y PROCESOS','02-2976300','1445','daniel.vierab@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VILAÑA TRUJILLO GISSELA ELIZABETH','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1604','gissela.vilana@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VILLACIS ERAZO MARCOS JOSHUA','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 3, GRADO 5)','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1635','marcos.villacis@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VILLACIS ONOFA CARMEN ELIZABETH','RESPONSABLE DE NÓMINA','DIRECCIÓN FINANCIERA','02-2976300','1207','carmen.villacis@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VILLACIS ONOFA KATYA VERONICA','ESPECIALISTA DE TECNOLOGÍAS DE LAINFORMACIÓN Y COMUNICACIONES 2','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','149','katya.villacis@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VILLACIS OÑATE WILLIAM ESTUARDO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE CIENCIASNUCLEARES','02-2976300','2103','william.villacis@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VILLACIS PROAÑO DAVID ALEJANDRO','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1501','david.villacis01@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VILLACIS SALAZAR HUGO MARCELO','PROFESOR PRINCIPAL A TIEMPO PARCIAL','DEPARTAMENTO DE ENERGÍAELÉCTRICA Y ELECTRÓNICA','02-2976300','2217','hugo.villacis@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VILLACIS TRONCOSO EUGENIA DE LAS MERCEDES','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1), SUBDIRECTORA DE LA ESFOT','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1607','mercedes.villacis@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VILLACRES QUIMI WENDY VIVIANA','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 3','VICERRECTORADO DE DOCENCIA','02-2976300','1443','wendy.villacres@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VILLAFUERTE GUERRERO WASHINGTON FIDEL','TECNICO DE MANTENIMIENTO','METALMECÁNICA SAN BARTOLO','02-2976300','2670823','washington.villafuerte@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VILLAFUERTE LOPEZ CRISTINA ALEXANDRA','ASISTENTE ADMINISTRATIVO','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','110','cristina.villafuerte@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VILLAFUERTE VINUEZA DARIO GABRIEL','DIRECTOR ADMINISTRATIVO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2000','dario.villafuerte@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VILLAGOMEZ CAPELO ALISON ESTEFANIA','RECEPCIONISTA ESPECIALIZADO','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','117','alison.villagomez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VILLAGOMEZ PACHECO DAVID RAMON','PEDAGOGO','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','0','david.villagomez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VILLALBA LOZANO PAULINA ALEXANDRA','ASISTENTE CULTURAL','VICERRECTORADO DE DOCENCIA','02-2976300','1109','paulina.villalba@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VILLAMAR AGUILAR ALISSON PAMELA','ASISTENTE ADMINISTRATIVO','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','1059','alisson.villamar@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VILLARES JIBAJA FABIAN MARCELO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE GEOLOGÍA','02-2976300','3306','fabian.villares@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VILLARREAL PALLANGO DIEGO ROBERTO','ARQUITECTO','DIRECCIÓN DE PLANIFICACIÓN','02-2976300','1321','diego.villarreal@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VILLARREAL TARAGUAY EDWIN JAVIER','AUXILIAR DE MONITOREO','INSTITUTO GEOFÍSICO','02-2976300','6711','edwin.villarreal@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VILLARREAL VELOZ FRANK GIOVANNY','ANALISTA DE INVESTIGACION Y PROYECCION SOCIAL','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','1056','frank.villarrealv@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VILLARROEL DURAN LUIS FERNANDO','ADMINISTRADOR 2','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','146','fernando.villarroel@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VILLARROEL RAMOS JORGE PATRICIO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','-','jorge.villarroel@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VILLAVICENCIO RUEDA CHRISTIAN DAVID','ESPECIALISTA DE TECNOLOGÍA DE LAINFORMACIÓN Y COMUNICACIONES 3','PROYECTOS EPN','02-2976300','0','0');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VILLOTA CADENA ANGEL PATRICIO','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3101','angel.villota@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VINTIMILLA JARAMILLO JORGE RICARDO','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1600','jorge.vintimilla@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VINTIMILLA JARAMILLO LUZ MARINA','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','273102700','marina.vintimilla@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VINUEZA CAZCO ANDREA LIZETH','SECRETARIA','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','1604','andrea.vinueza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VINUEZA LOPEZ OSCAR GABRIEL','OFICINISTA','DIRECCIÓN DE TALENTO HUMANO','02-2976300','1266','oscar.vinueza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VINUEZA MARIA DEL CARMEN','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE CIENCIASSOCIALES','02-2976300','-','delcarmen.vinueza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VINUEZA RHOR MONICA DE LOURDES','PROFESOR PRINCIPAL TIEMPO COMPLETO','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','271702703','monica.vinueza@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VIRACUCHA QUINGA CRISTIAN RODRIGO','ASISTENTE GEOFISICO','INSTITUTO GEOFÍSICO','02-2976300','6707','cristian.viracucha@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VIRACUCHA QUINGA EDWIN GUILLERMO','ANALISTA DE REDES DE MONITOREO GEOFISICO 1','INSTITUTO GEOFÍSICO','02-2976300','6711','edwin.viracucha@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VITERI SALAZAR HECTOR OSWALDO','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 1, GRADO 3)','DEPARTAMENTO DE ESTUDIOSORGANIZACIONALES Y DESARROLLO HUMANO','02-2976300','1812','hector.viteri@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'VIZCAINO BUSTAMANTE ARACELY ALEJANDRA','ASISTENTE ADMINISTRATIVO','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','-','0');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'XULVI BRUNET RAMON','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 1, GRADO 3)','DEPARTAMENTO DE FÍSICA','02-2976300','1701','ramon.xulvi@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'YACCHIREMA VARGAS DIANA CECILIA','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4701','0');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'YACELGA PINTO MARCO ESTEBAN','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2203','marco.yacelgap@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'YAGUANA VILLAMARIN SOFIA ELIZABETH','ESPECIALISTA DE CARACTERIZACIÓN DEMATERIALES','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','3702','sofia.yaguana@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'YAMBAY BUENO CESAR OSWALDO','ESPECIALISTA DE LABORATORIO DEINVESTIGACION Y CONTROL AMBIENTAL','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','1604','cesar.yambay@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'YANCHAPANTA GOMEZ NICOLAY BERNARDO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1604','nicolay.yanchapanta@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'YANDUN TORRES ARACELY INES','TECNICO DOCENTE','DEPARTAMENTO DEAUTOMATIZACIÓN Y CONTROL INDUSTRIAL','02-2976300','2203','aracely.yandun@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'YANEZ QUESADA EDDIE HANS','PROFESOR PRINCIPAL TECNOLOGO A TIEMPO COMPLETO','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4701','eddie.yanez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'YANEZ SALCEDO MARCO VINICIO','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','3711','marco.yanez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'YANGARI SOSA MIGUEL ANGEL','PROFESOR AGREGADO A TIEMPO COMPLETO(NIVEL 3, GRADO 5)','DEPARTAMENTO DE MATEMÁTICA','02-2976300','1582','miguel.yangari@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'YASELGA GAVILIMA WILSON JAVIER','BIBLIOTECARIO 1','FACULTAD DE INGENIERÍAQUÍMICA Y AGROINDUSTRIA','02-2976300','4336','javier.yaselga@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'YASELGA LOACHAMIN JOHANA ELIZABETH','AYUDANTE DE INVESTIGACION','VICERRECTORADO DEINVESTIGACIÓN Y PROYECCIÓN SOCIAL','02-2976300','0','johana.yaselga@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'YASELGA VALLEJO SILVIO RAMIRO','PROFESOR PRINCIPAL A TIEMPO COMPLETO','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','3111','silvio.yaselga@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'YEPEZ AROSTEGUI HUGO ALFONSO','PROFESOR PRINCIPAL A TIEMPO COMPLETO(NIVEL 1, GRADO 6)','INSTITUTO GEOFÍSICO','02-2976300','6703','hugo.yepez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'YEPEZ ENRIQUEZ SANTIAGO OSWALDO','LIDER DE TECNOLOGÍAS DE LA INFORMACIÓN YCOMUNICACIONES','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','1001','santiago.yepeze@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'YEPEZ MUÑOZ ELSA PAULINA','ASISTENTE ADMINISTRATIVO','DIRECCIÓN ADMINISTRATIVA','02-2976300','2006','paulina.yepez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'YEPEZ YEPEZ MARCO ANTONIO','ASISTENTE GEOFISICO','PROYECTOS EPN','02-2976300','6702','marco.yepez@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'YEROVI GUERRA JORGE DAVID','AUXILIAR DE MONITOREO','INSTITUTO GEOFÍSICO','02-2976300','6701','jorge.yerovi@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'YOO SANG GUUN','PROFESOR AGREGADO A TIEMPO COMPLETO (NIVEL 1, GRADO 3)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','0','sang.yoo@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'YUNGAN PINTAG LIDIA NODRIZA','MEDICO GENERAL','DIRECCIÓN DE BIENESTARESTUDIANTIL Y SOCIAL','02-2976300','0','lidia.yungan@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ZABALA YUQUILEMA CLAUDIA SOFIA','ANALISTA ADMINISTRATIVO ACADEMICO 1','FACULTAD DE INGENIERÍA ENGEOLOGÍA Y PETRÓLEOS','02-2976300','3302','claudia.zabala@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ZALDUMBIDE PROAÑO JUAN PABLO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','ESCUELA DE FORMACIÓN DETECNÓLOGOS','02-2976300','2701','juan.zaldumbide@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ZAMBRANO BURGOS MARIA DEL CARMEN','SECRETARIA','RECTORADO','02-2976300','1002','maria.zambranob@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ZAMBRANO CARRANZA JOHNNY ROBINSON','DECANO','FACULTAD DE INGENIERÍA ENGEOLOGÍA Y PETRÓLEOS','02-2976300','3314','johnny.zambrano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ZAMBRANO MIRANDA JOSE ADRIAN','DIRECTOR DEL CEC','CENTRO DE EDUCACIÓNCONTINUA','02-2976300','119','jose.zambrano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ZAMBRANO OREJUELA OSCAR IVAN','SUBDECANO','FACULTAD DE INGENIERÍAMECÁNICA','02-2976300','3729','ivan.zambrano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ZAMBRANO RODRIGUEZ PATRICIO XAVIER','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DEINFORMÁTICA Y CIENCIAS DE LA COMPUTACIÓN','02-2976300','4701','patricio.zambrano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ZAMBRANO VIZUETE ANA MARIA','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DEELECTRÓNICA, TELECOMUNICACIONES Y REDES DE LA INFORMACIÓN','02-2976300','2203','ana.zambrano@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ZAPATA GUAMANCELA LUIS MIGUEL','BODEGUERO','METALMECÁNICA SAN BARTOLO','02-2976300','2670823','luis.zapata@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ZAPATA HIDALGO DANIEL ROBERTO','TECNICO DOCENTE','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','0','daniel.zapata@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ZAPATA PACHECO CLAUDIA MARGARITA','ESPECIALISTA DE CONTABILIDAD 1','DIRECCIÓN FINANCIERA','02-2976300','1201','claudia.zapata@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ZAPATA RIOS XAVIER EDUARDO','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL 1, GRADO 1)','DEPARTAMENTO DE INGENIERÍA CIVIL Y AMBIENTAL','02-2976300','1902','xavier.zapata@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ZAPATER CAMPO PABLO PATRICIO','BIBLIOTECARIO 1','FACULTAD DE INGENIERÍA ENGEOLOGÍA Y PETRÓLEOS','02-2976300','5380','pablo.zapater@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ZARATE POZO PAOLA KATHERINE','RESPONSABLE DE LABORATORIO DE ENSAYOS','DEPARTAMENTO DE CIENCIASNUCLEARES','02-2976300','4230','paola.zarate@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ZARY CORRAL PAULINA FABIOLA','PROFESOR AUXILIAR A TIEMPO COMPLETO (NIVEL1, GRADO 1)','DEPARTAMENTO DE CIENCIASSOCIALES','02-2976300','6056','paulina.zary@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ZHINGRE CHAMBA RAUL GONZALO','PROFESOR OCASIONAL 1 TIEMPO PARCIAL','DEPARTAMENTO DE CIENCIASSOCIALES','02-2976300','6051','raul.zhingre@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ZUÑIGA MORALES PAUL SANTIAGO','RESPONSABLE DE LABORATORIO DE ENSAYOS','FACULTAD DE INGENIERÍA CIVIL YAMBIENTAL','02-2976300','1605','paul.zunigam@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ZUÑIGA PUEBLA HUGO FRANCISCO','PROFESOR OCASIONAL 1 TIEMPO COMPLETO','DEPARTAMENTO DE INGENIERÍAMECÁNICA','02-2976300','','hugo.zuniga@epn.edu.ec');
INSERT INTO `nominaprofesores`(`nombreCompleto`, `puestoInstitucional`, `departamento`, `telefonoInstitucional`, `extensionTelefonica`, `correoInstitucional`)  VALUES (  'ZURITA FRANCO DARIO DAVID','TECNICO DOCENTE','DEPARTAMENTO DE FORMACIÓNBÁSICA','02-2976300','0','david.zurita@epn.edu.ec');


-- Procedimiento almacenado verificar profesor en la base de datos
DELIMITER $$
CREATE PROCEDURE spVerificarProfesor (in correo VARCHAR(25))
BEGIN

SELECT count(*) FROM sistemaoa.nominaprofesores where correoinstitucional=correo;
END$$
DELIMITER $$
-- Tabla para usuarios bloqueados
CREATE TABLE `sistemaoa`.`usuariosbloqueados` (
  `idUsuario` INT NOT NULL,
  `tipoUsuario` VARCHAR(20) NOT NULL,
  `fechaBloqueo` DATE NULL,
  `motivoBloqueo` VARCHAR(60) NULL,
  `fechaFinBloqueo` DATE NULL);
$$
-- PROCEDIMIENTO ALMACENADO PARA REGISTRAR BLOQUEO
  DROP procedure IF EXISTS `insertarUsuarioBLoqueado`;

  DELIMITER $$
  CREATE PROCEDURE `insertarUsuarioBLoqueado` (
  	IN idUsuarioIN INT,
      IN tipoUsuarioIN varchar(20),
      IN motivoBloqueoIN varchar(60),
      IN diasBloqueo INT)
  BEGIN

  	INSERT INTO usuariosbloqueados (idUsuario, tipoUsuario, fechaBloqueo, motivoBloqueo, fechaFinBloqueo) VALUES (idUsuarioIN, tipoUsuarioIN, now(), motivoBloqueoIN, DATE_ADD(now(), INTERVAL diasBloqueo DAY));

  END$$

  DELIMITER ;

  -- Procedimiento almacenado verificar usuariosBloqueados
DROP procedure IF EXISTS `spVerificarUsuarioBloqueado`;
DELIMITER $$
CREATE PROCEDURE spVerificarUsuarioBloqueado (in idUsuarioIN INT, in tipoUsuarioIN VARCHAR(20))
BEGIN

SELECT count(*) FROM sistemaoa.usuariosbloqueados where idUsuario=idUsuarioIN and tipoUsuario = tipoUsuarioIN and now()<fechaFinBLoqueo;
END$$

-- Procedimiento almacenado obtener fecha y motivo de bloqueo usuarioBloqueado
DELIMITER $$
CREATE PROCEDURE spObtenerFechaBloqueo(in idUsuarioIN INT, in tipoUsuarioIN VARCHAR(20))
BEGIN

SELECT motivoBLoqueo,fechaFinBloqueo FROM sistemaoa.usuariosbloqueados where idUsuario=idUsuarioIN and tipoUsuario = tipoUsuarioIN and now()<fechaFinBLoqueo;
END$$

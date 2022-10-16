-- Nombre de Base de Datos: Inventario

-- Usuario administrador BD (root): root
-- password: albarregas

-- Usuario: adminInventario
-- password: albarregas

-- drop database bdinventariolindin;
-- SELECT User, Host FROM mysql.user;
-- drop user 'lindin'@'localhost';


-- SET FOREIGN_KEY_CHECKS = 0;
-- DROP TABLE if EXISTS Equipos, Impresoras, Ubicacion, Usuarios, Dispositivos;
-- SET FOREIGN_KEY_CHECKS = 1;

 CREATE DATABASE IF NOT EXISTS Inventario DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
 CREATE USER IF NOT EXISTS 'adminInventario'@'localhost' IDENTIFIED BY 'albarregas';
 GRANT ALL PRIVILEGES ON Inventario.* TO 'adminInventario'@'localhost';
 FLUSH PRIVILEGES;

 USE Inventario;

   
-- Tabla Ubicacion
CREATE TABLE if not exists Ubicacion(
	idUbicacion smallInt (6) not null auto_increment PRIMARY KEY,
	departamento varchar (50) COLLATE utf8_spanish_ci not null,
	aula varchar (10) COLLATE utf8_spanish_ci not null
	);	
    
CREATE TABLE if not exists MotivosBaja(
	idMotivo smallInt (6) not null auto_increment PRIMARY KEY,
	codigoBaja varchar(6) collate utf8_spanish_ci not null,
	descripcionBaja varchar(50) collate utf8_spanish_ci not null
);
-- Tabla Equipos.
CREATE TABLE if not exists Equipos(
	idEquipo smallInt (6) not null auto_increment  PRIMARY KEY,
	numinventario varchar(8) collate utf8_spanish_ci not null,
	tipoEquipo varchar (10) COLLATE utf8_spanish_ci not null,
	marca varchar (20) COLLATE utf8_spanish_ci not null,
	modelo varchar (30) COLLATE utf8_spanish_ci not null,
	numSerie varchar (20) COLLATE utf8_spanish_ci not null,
	procesador varchar (20) COLLATE utf8_spanish_ci not null,
	memoriaRam char (3) COLLATE utf8_spanish_ci not null,
	almacenamiento char (4) not null,
	sistemaOperativo varchar (50) COLLATE utf8_spanish_ci not null,
	maquinaVirtual varchar (50) COLLATE utf8_spanish_ci null,
	componenteExtra varchar (50) COLLATE utf8_spanish_ci null,
	fechaAlta date COLLATE utf8_spanish_ci not null,
	fechaBaja date COLLATE utf8_spanish_ci not null,
	idUbicacion smallInt (6) not null,
	idMotivo smallInt (6) not null,	
	CONSTRAINT `ubicacion_equipos` FOREIGN KEY (`idUbicacion`) REFERENCES `Ubicacion` (`idUbicacion`),
	CONSTRAINT `motivoBaja_equipo` FOREIGN KEY (`idMotivo`) REFERENCES `MotivosBaja` (`idMotivo`)
	);

-- Tabla Impresoras --

CREATE TABLE if not exists Impresoras(
	idImpresora smallInt (6) not null auto_increment PRIMARY KEY,
	numInventario VARCHAR(8) COLLATE utf8_spanish_ci not null,
	marca varchar (20) COLLATE utf8_spanish_ci not null,
	modelo varchar (30) COLLATE utf8_spanish_ci not null,
	numSerie varchar (20) COLLATE utf8_spanish_ci not null,
	tipoImpresora varchar (10) COLLATE utf8_spanish_ci not null,
	enRed char(1) COLLATE utf8_spanish_ci not null,
	fechaAlta date COLLATE utf8_spanish_ci not null,
	fechaBaja date COLLATE utf8_spanish_ci not null,
	idUbicacion smallInt (6) not null,
	idMotivo smallInt (6) not null,
	CONSTRAINT `ubicacion_impresoras` FOREIGN KEY (`idUbicacion`) REFERENCES `Ubicacion` (`idUbicacion`),
	CONSTRAINT `motivoBaja_impresora` FOREIGN KEY (`idMotivo`) REFERENCES `MotivosBaja` (`idMotivo`)
	);

-- Tabla dispositivos
CREATE TABLE if not exists Dispositivos(
	idDispositivo smallInt (6) not null auto_increment PRIMARY KEY,
	numInventario VARCHAR(8) COLLATE utf8_spanish_ci not null,
	marca varchar (20) COLLATE utf8_spanish_ci not null,
	modelo varchar (30) COLLATE utf8_spanish_ci not null,
	numSerie varchar (20)COLLATE utf8_spanish_ci not null,
	fechaAlta date COLLATE utf8_spanish_ci not null,
	fechaBaja date COLLATE utf8_spanish_ci not null,
	idUbicacion smallInt (6) not null,
	idEquipo smallInt (6) null,
	idMotivo smallInt (6) not null,
	CONSTRAINT `ubicacion_dispositivo` FOREIGN KEY (`idUbicacion`) REFERENCES `Ubicacion` (`idUbicacion`),
	CONSTRAINT `equipo_dispositivo` FOREIGN KEY (`idEquipo`) REFERENCES `Equipos` (`idEquipo`),
	CONSTRAINT `motivoBaja_dispositivo` FOREIGN KEY (`idMotivo`) REFERENCES `MotivosBaja` (`idMotivo`)
	);
	
	

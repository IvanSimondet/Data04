CREATE DATABASE IF NOT EXISTS precios_productos;
USE precios_productos;

DROP TABLE IF EXISTS `sucursal`; 
CREATE TABLE IF NOT EXISTS `sucursal` (
  `id`					  VARCHAR(25) NOT NULL,
  `comercioId` 		      INT,
  `banderaId`    		  VARCHAR(100),
  `banderaDescripcion`	  VARCHAR(100),
  `comercioRazonSocial`   VARCHAR(50),
  `provincia`			  VARCHAR(50),
  `localidad` 			  VARCHAR(50),
  `direccion` 			  VARCHAR(50),
  `lat`				      DECIMAL(7,4),
  `lng`				      DECIMAL(7,4),
  `sucursalNombre` 		  VARCHAR(50),
  `sucursalTipo` 		  VARCHAR(50),
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

DROP TABLE IF EXISTS `producto`; 
CREATE TABLE IF NOT EXISTS `producto` (
  `id`					  INT NOT NULL,
  `marca` 		          VARCHAR(50),
  `nombre`    		      VARCHAR(100),
  `presentacion`	      VARCHAR(100),
  `categoria1`            VARCHAR(50),
  `categoria2`		      VARCHAR(50),
  `categoria3` 		      VARCHAR(50),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

DROP TABLE IF EXISTS `precio_semana`; 
CREATE TABLE IF NOT EXISTS `precio_semana` (
  `precio`				  INT,
  `productoId` 		      INT NOT NULL,
  `sucursalId`    		  VARCHAR(50) NOT NULL,
  FOREIGN KEY (`productoId`) REFERENCES producto(`id`),
  FOREIGN KEY (`sucursalId`) REFERENCES sucursal(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

DROP DATABASE precios_productos;

SELECT * FROM precio_semana LIMIT 10;

SELECT * FROM producto LIMIT 10;

SELECT * FROM sucursal LIMIT 10;
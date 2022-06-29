--Data Mart para BI
CREATE DATABASE EstadSeguridadHC_DM
GO

USE EstadSeguridadHC_DM
GO

CREATE TABLE Clasificacion_dim(
Clasificacion_key INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
ClasificacionID INT NOT NULL,
Nombre NVARCHAR(100) NOT NULL
);

CREATE TABLE Localidad_dim(
Localidad_key INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
LocalidadID INT NOT NULL,
Canton NVARCHAR(100) NOT NULL,
Provincia NVARCHAR(100) NOT NULL,
Poblacion INT NOT NULL,
Superficie FLOAT NOT NULL
);

CREATE TABLE Tiempo_dim(
Tiempo_key INT PRIMARY KEY IDENTITy(1, 1) NOT NULL,
Periodo DATETIME NOT NULL,
Mes INT NOT NULL,
Anio INT NOT NULL,
Trimestre INT NOT NULL,
MesAnio NVARCHAR(100) NOT NULL
);

CREATE TABLE Detalles_dim(
Detalles_key INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
EdadVictima NVARCHAR(100) NOT NULL,
GeneroPerpetuador NVARCHAR(100) NULL,
TipoArma NVARCHAR(100) NOT NULL,
);

CREATE TABLE Crimenes_fact(
Afectados INT NOT NULL,
Periodo DATETIME NOT NULL,
RegionID INT NOT NULL,
ClasificacionID INT NOT NULL,
EdadVictima NVARCHAR(100) NOT NULL,
GeneroPerpetuador NVARCHAR(100) NULL,
TipoArma NVARCHAR(100) NOT NULL,
Clasificacion_key INT NOT NULL,
Localidad_key INT NOT NULL,
Detalles_key INT NOT NULL,
Tiempo_key INT NOT NULL,
CONSTRAINT Clasificacion_key FOREIGN KEY (Clasificacion_key) REFERENCES Clasificacion_dim(Clasificacion_key),
CONSTRAINT Localidad_key FOREIGN KEY (Localidad_key) REFERENCES Localidad_dim(Localidad_key),
CONSTRAINT Detalles_key FOREIGN KEY (Detalles_key) REFERENCES Detalles_dim(Detalles_key),
CONSTRAINT Tiempo_key FOREIGN KEY (Tiempo_key) REFERENCES Tiempo_dim(Tiempo_key)
);

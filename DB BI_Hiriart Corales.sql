-- Base de datos con la información desglozada para cada crimen

CREATE DATABASE EstadSeguridadHC --Seguridad Integral Hiriart Corales
GO

USE EstadSeguridadHC
GO

CREATE TABLE Localidad(
LocalidadID INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
Canton NVARCHAR(100) NOT NULL,
Provincia NVARCHAR(100) NOT NULL,
Poblacion INT NOT NULL
);

CREATE TABLE Clasificacion(
ClasificacionID INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
Nombre NVARCHAR(100) NOT NULL
);

CREATE TABLE Crimen(
CrimenID INT PRIMARY KEy IDENTITY(1, 1) NOT NULL,
Afectados INT NOT NULL,
Periodo DATETIME NOT NULL,
LocalidadID INT NOT NULL,
ClasificacionID INT NOT NULL,
CONSTRAINT LocalidadID FOREIGN KEY (LocalidadID) REFERENCES Localidad(LocalidadID),
CONSTRAINT ClasificacionID FOREIGN KEY (ClasificacionID) REFERENCES Clasificacion(ClasificacionID)
);

CREATE TABLE DetalleCrimen(
CrimenID INT PRIMARY KEY NOT NULL,
EdadVictima NVARCHAR(100) NOT NULL,
GeneroPerpetuador NVARCHAR(100) NULL,
TipoArma NVARCHAR(100) NOT NULL,
CONSTRAINT CrimenID FOREIGN KEY (CrimenID) REFERENCES Crimen(CrimenID),
);
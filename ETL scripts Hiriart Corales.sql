USE EstadSeguridadHC
GO

-- Para clasificación y localidad se usan la tablas sin cambios

-- Tiempo
SELECT DISTINCT Periodo, Mes=DATEPART(MM, Periodo), Anio=DATEPART(YYYY, Periodo), Trimestre=DATEPART(QUARTER, Periodo), 
SemanaMes=DATEPART(DAY, DATEDIFF(DAY, 0, Periodo)/7 * 7)/7 + 1, MesAnio=DATENAME(MONTH, Periodo) FROM Crimen

-- Detalles
SELECT DISTINCT EdadVictima, GeneroPerpetuador, TipoArma FROM DetalleCrimen

--SELECT * FROM DetalleCrimen WHERE EdadVictima = '00-04' AND GeneroPerpetuador LIKE '%%' AND TipoArma = 'OTROS'

-- Crimenes

SELECT Crm.CrimenID, Crm.Afectados, /*Tmp.Tiempo_key,*/ Lcd.LocalidadID, Clsf.ClasificacionID FROM Crimen Crm
INNER JOIN Localidad Lcd ON Lcd.LocalidadID = Crm.LocalidadID
INNER JOIN Clasificacion Clsf ON Clsf.ClasificacionID = Crm.ClasificacionID
--INNER JOIN [EstadSeguridadHC_DM].[dbo].[Tiempo_dim] Tmp ON Tmp.Periodo = Crm.Periodo
--INNER JOIN [EstadSeguridadHC_DM].[dbo].[Detalles_dim] Dtld ON Dtld.EdadVictima IN (SELECT EdadVictima FROM DetalleCrimen Dtl WHERE Dtl.CrimenID = Crm.CrimenID)



SELECT Crm.* FROM Crimen Crm
USE EstadSeguridadHC
GO

-- Para Clasificación y Localidad se usan la tablas sin cambios

-- Tiempo
SELECT DISTINCT Periodo, Mes=DATEPART(MM, Periodo), Anio=DATEPART(YYYY, Periodo), Trimestre=DATEPART(QUARTER, Periodo), 
SemanaMes=DATEPART(DAY, DATEDIFF(DAY, 0, Periodo)/7 * 7)/7 + 1, MesAnio=DATENAME(MONTH, Periodo) FROM Crimen

-- Detalles
SELECT DISTINCT EdadVictima, SexoPerpetuador, TipoArma FROM DetalleCrimen

-- Crimenes
SELECT Crm.CrimenID, Crm.Afectados, 
Clsf.Clasificacion_key, Lcd.Localidad_key, Dtld.Detalles_key, Tmp.Tiempo_key
FROM Crimen Crm
INNER JOIN [EstadSeguridadHC_DM].[dbo].[Localidad_dim] Lcd ON Lcd.LocalidadID = Crm.LocalidadID
INNER JOIN [EstadSeguridadHC_DM].[dbo].[Clasificacion_dim] Clsf ON Clsf.ClasificacionID = Crm.ClasificacionID
INNER JOIN [EstadSeguridadHC_DM].[dbo].[Tiempo_dim] Tmp ON Tmp.Periodo = Crm.Periodo
INNER JOIN [EstadSeguridadHC_DM].[dbo].[Detalles_dim] Dtld ON Dtld.EdadVictima = (SELECT EdadVictima FROM DetalleCrimen Dtl WHERE Dtl.CrimenID = Crm.CrimenID) 
AND SexoPerpetuador = (SELECT SexoPerpetuador FROM DetalleCrimen Dtl WHERE Dtl.CrimenID = Crm.CrimenID) AND TipoArma = (SELECT TipoArma FROM DetalleCrimen Dtl WHERE Dtl.CrimenID = Crm.CrimenID)
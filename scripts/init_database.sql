/*
=============================================================
Datenbank und Schemata erstellen
=============================================================
Zweck des Skripts:
    Dieses Skript erstellt eine neue Datenbank mit dem Namen „DataWarehouse“, nachdem es überprüft hat, ob diese bereits vorhanden ist. 
    Wenn die Datenbank vorhanden ist, wird sie gelöscht und neu erstellt. Zusätzlich richtet das Skript drei Schemata 
    innerhalb der Datenbank ein: „bronze“, „silver“ und „gold“.
	
WARNUNG:
    Durch Ausführen dieses Skripts wird die gesamte Datenbank „DataWarehouse” gelöscht, sofern sie existiert. 
    Alle Daten in der Datenbank werden dauerhaft gelöscht. Gehen Sie vorsichtig vor 
    und stellen Sie sicher, dass Sie über ordnungsgemäße Sicherungskopien verfügen, bevor Sie dieses Skript ausführen.
*/

USE master;
GO

-- Löschen Sie die Datenbank „DataWarehouse” und erstellen Sie sie neu.
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Erstellen Sie die Datenbank „DataWarehouse“.
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

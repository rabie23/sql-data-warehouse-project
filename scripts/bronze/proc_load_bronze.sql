/*
===============================================================================
Gespeicherte Prozedur: Bronze-Ebene laden (Quelle -> Bronze)
===============================================================================
Zweck des Skripts:
    Diese gespeicherte Prozedur lädt Daten aus externen CSV-Dateien in das Schema „bronze”. 
    Sie führt die folgenden Aktionen aus:
    - TRUNCATES die Bronze-Tabellen vor dem Laden der Daten.
    - Verwendet den Befehl „BULK INSERT”, um Daten aus CSV-Dateien in Bronze-Tabellen zu laden.

Parameter:
    Keine. 
      Diese gespeicherte Prozedur akzeptiert keine Parameter und gibt keine Werte zurück.

Anwendungsbeispiel:
    EXEC bronze.load_bronze;
===============================================================================
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze 
AS 
BEGIN
    BEGIN TRY

        PRINT '===========================================';
        PRINT 'Loading Bronze Layer';
        PRINT '===========================================';

        DECLARE @start DATETIME, @end DATETIME;

        -----------------------------------------------------
        -- CRM TABLES
        -----------------------------------------------------
        PRINT '-------------------------------------------';
        PRINT 'Loading CRM Tables';
        PRINT '-------------------------------------------';

        -- crm_cust_info
        SET @start = GETDATE();
        PRINT '>> Truncating Table: bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;

        PRINT '>> Inserting Data Into: bronze.crm_cust_info';
        BULK INSERT bronze.crm_cust_info
        FROM 'C:\SQL\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
        WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );

        SET @end = GETDATE();
        PRINT '>> Duration crm_cust_info: ' + CAST(DATEDIFF(SECOND, @start, @end) AS NVARCHAR) + ' seconds';


        -- crm_prd_info
        SET @start = GETDATE();
        PRINT '>> Truncating Table: bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;

        PRINT '>> Inserting Data Into: bronze.crm_prd_info';
        BULK INSERT bronze.crm_prd_info
        FROM 'C:\SQL\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
        WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );

        SET @end = GETDATE();
        PRINT '>> Duration crm_prd_info: ' + CAST(DATEDIFF(SECOND, @start, @end) AS NVARCHAR) + ' seconds';


        -- crm_sales_details
        SET @start = GETDATE();
        PRINT '>> Truncating Table: bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;

        PRINT '>> Inserting Data Into: bronze.crm_sales_details';
        BULK INSERT bronze.crm_sales_details
        FROM 'C:\SQL\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
        WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );

        SET @end = GETDATE();
        PRINT '>> Duration crm_sales_details: ' + CAST(DATEDIFF(SECOND, @start, @end) AS NVARCHAR) + ' seconds';


        -----------------------------------------------------
        -- ERP TABLES
        -----------------------------------------------------
        PRINT '-------------------------------------------';
        PRINT 'Loading ERP Tables';
        PRINT '-------------------------------------------';

        -- erp_cust_az12
        SET @start = GETDATE();
        PRINT '>> Truncating Table: bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12;

        PRINT '>> Inserting Data Into: bronze.erp_cust_az12';
        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\SQL\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
        WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );

        SET @end = GETDATE();
        PRINT '>> Duration erp_cust_az12: ' + CAST(DATEDIFF(SECOND, @start, @end) AS NVARCHAR) + ' seconds';


        -- erp_loc_a101
        SET @start = GETDATE();
        PRINT '>> Truncating Table: bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_loc_a101;

        PRINT '>> Inserting Data Into: bronze.erp_loc_a101';
        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\SQL\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
        WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );

        SET @end = GETDATE();
        PRINT '>> Duration erp_loc_a101: ' + CAST(DATEDIFF(SECOND, @start, @end) AS NVARCHAR) + ' seconds';


        -- erp_px_cat_g1v2
        SET @start = GETDATE();
        PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        PRINT '>> Inserting Data Into: bronze.erp_px_cat_g1v2';
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\SQL\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
        WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );

        SET @end = GETDATE();
        PRINT '>> Duration erp_px_cat_g1v2: ' + CAST(DATEDIFF(SECOND, @start, @end) AS NVARCHAR) + ' seconds';


    END TRY

    BEGIN CATCH
        PRINT '!!! ERROR OCCURRED !!!';
        PRINT ERROR_MESSAGE();
    END CATCH

END;

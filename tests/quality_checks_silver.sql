/*
===============================================================================
Qualitätsprüfungen
===============================================================================
Zweck des Skripts:
    Dieses Skript führt verschiedene Qualitätsprüfungen hinsichtlich Datenkonsistenz, Genauigkeit 
    und Standardisierung in der „Silber“-Ebene durch. Es umfasst Prüfungen auf:
    - Null- oder doppelte Primärschlüssel.
    - Unerwünschte Leerzeichen in Zeichenfolgenfeldern.
    - Datenstandardisierung und -konsistenz.
    - Ungültige Datumsbereiche und Reihenfolgen.
- Datenkonsistenz zwischen verwandten Feldern.

Hinweise zur Verwendung:
    - Führen Sie diese Prüfungen nach dem Laden der Daten in die Silver-Ebene durch.
    - Untersuchen und beheben Sie alle während der Prüfungen festgestellten Unstimmigkeiten.
===============================================================================
*/

-- ====================================================================
-- Überprüfung von „silver.crm_cust_info”
-- ====================================================================
-- Überprüfung auf NULL-Werte oder Duplikate im Primärschlüssel
-- Erwartung: Keine Ergebnisse
SELECT 
    cst_id,
    COUNT(*) 
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

-- Auf unerwünschte Leerzeichen prüfen
-- Erwartung: Keine Ergebnisse
SELECT 
    cst_key 
FROM silver.crm_cust_info
WHERE cst_key != TRIM(cst_key);

-- Datenstandardisierung und -konsistenz
SELECT DISTINCT 
    cst_marital_status 
FROM silver.crm_cust_info;

-- ====================================================================
-- Überprüfung von „silver.crm_prd_info”
-- ====================================================================
-- Überprüfung auf NULL-Werte oder Duplikate im Primärschlüssel
-- Erwartung: Keine Ergebnissein Primary Key
-- Expectation: No Results
SELECT 
    prd_id,
    COUNT(*) 
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Auf unerwünschte Leerzeichen prüfen
-- Erwartung: Keine Ergebnisse
SELECT 
    prd_nm 
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- Auf NULL-Werte oder negative Werte in den Kosten prüfen
-- Erwartung: Keine Ergebnisse
SELECT 
    prd_cost 
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL;

-- Datenstandardisierung und konsistenz
SELECT DISTINCT 
    prd_line 
FROM silver.crm_prd_info;
-- Überprüfen Sie auf ungültige Datumsangaben (Startdatum > Enddatum)
-- Erwartung: Keine Ergebnisse
SELECT 
    * 
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;

-- ====================================================================
-- Überprüfung von „silver.crm_sales_details”
-- ====================================================================
-- Überprüfung auf ungültige Datumsangaben
-- Erwartung: Keine ungültigen Datumsangaben
SELECT 
    NULLIF(sls_due_dt, 0) AS sls_due_dt 
FROM bronze.crm_sales_details
WHERE sls_due_dt <= 0 
    OR LEN(sls_due_dt) != 8 
    OR sls_due_dt > 20500101 
    OR sls_due_dt < 19000101;

-- Check for Invalid Date Orders (Order Date > Shipping/Due Dates)
-- Expectation: No Results
SELECT 
    * 
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt 
   OR sls_order_dt > sls_due_dt;

-- Datenkonsistenz prüfen: Umsatz = Menge * Preis
-- Erwartung: Keine Ergebnisse
SELECT DISTINCT 
    sls_sales,
    sls_quantity,
    sls_price 
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
   OR sls_sales IS NULL 
   OR sls_quantity IS NULL 
   OR sls_price IS NULL
   OR sls_sales <= 0 
   OR sls_quantity <= 0 
   OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price;

-- ====================================================================
-- Überprüfung von „silver.erp_cust_az12”
-- ====================================================================
-- Identifizierung von Daten außerhalb des zulässigen Bereichs
-- Erwartung: Geburtsdaten zwischen dem 01.01.1924 und heute
SELECT DISTINCT 
    bdate 
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' 
   OR bdate > GETDATE();

-- Data Standardization & Consistency
SELECT DISTINCT 
    gen 
FROM silver.erp_cust_az12;

-- ====================================================================
-- Überprüfung 'silver.erp_loc_a101'
-- ====================================================================
-- Data Standardization & Consistency
SELECT DISTINCT 
    cntry 
FROM silver.erp_loc_a101
ORDER BY cntry;

-- ====================================================================
-- Überprüfung 'silver.erp_px_cat_g1v2'
-- ====================================================================
-- Check for Unwanted Spaces
-- Expectation: No Results
SELECT 
    * 
FROM silver.erp_px_cat_g1v2
WHERE cat != TRIM(cat) 
   OR subcat != TRIM(subcat) 
   OR maintenance != TRIM(maintenance);

-- Data Standardization & Consistency
SELECT DISTINCT 
    maintenance 
FROM silver.erp_px_cat_g1v2;

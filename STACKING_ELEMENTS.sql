IF OBJECT_ID('tempdb..#Malawi') IS NOT NULL
DROP TABLE #Malawi
SELECT 'BHT_EMR' AS 'Program',
       'eBRS' AS 'Table',
       [VARIABLE] AS Element INTO #Malawi
FROM [BHT_EMR].[dbo].[eBRS]
UNION
SELECT 'BHT_EMR' AS 'Program',
       'ANC' AS 'Table',
       [Variable] AS Element
FROM [BHT_EMR].[dbo].[ANC]
UNION
SELECT 'BHT_EMR' AS 'Program',
       'BART' AS 'Table',
       [VARIABLE] AS Element
FROM [BHT_EMR].[dbo].[BART]
UNION
SELECT 'BHT_EMR' AS 'Program',
       'eDRS' AS 'Table',
       [VARIABLE] AS Element
FROM [BHT_EMR].[dbo].[eDRS]
UNION
SELECT 'BHT_EMR' AS 'Program',
       'HTC' AS 'Table',
       [VARIABLE] AS Element
FROM [BHT_EMR].[dbo].[HTC]
UNION
SELECT 'BHT_EMR' AS 'Program',
       'MATERNITY' AS 'Table',
       [Variable] AS Element
FROM [BHT_EMR].[dbo].[Maternity]
UNION
SELECT 'BHT_EMR' AS 'Program',
       'OPD' AS 'Table',
       [VARIABLE] AS Element
FROM [BHT_EMR].[dbo].[OPD]
UNION
SELECT 'DHA_MIS' AS 'Program',
       'DHA' AS 'Table',
       [concept_name] AS Element
FROM [DHA_MIS].[dbo].[concept]
UNION
SELECT 'iHRIS' AS 'Program',
       'HR' AS 'Table',
       [COLUMN_NAME] AS Element
FROM [IHRIS].[INFORMATION_SCHEMA].[COLUMNS]
UNION
SELECT 'HMIS' AS 'Program',
       'DHIS' AS 'Table',
       [name] AS Element
FROM [HMIS].[dbo].[DHIS]
WHERE 3 <>'' ----------------------------------------------

    SELECT [Program],
           [Table],
           [ELEMENT] AS 'Element',
           SUBSTRING([ELEMENT],1,(CHARINDEX(' ',[ELEMENT] + ' ')-1)) AS 'Abbreviation',
           CASE
               WHEN LEFT([ELEMENT],3) = 'ANC' THEN 'ANC'
               WHEN [ELEMENT] LIKE '% HIV' THEN 'HIV'
               WHEN [ELEMENT] LIKE '% ANC %' THEN 'ANC'
               WHEN [ELEMENT] LIKE '% ART %' THEN 'ART'
               WHEN [ELEMENT] LIKE '% HIV %' THEN 'HIV'
               WHEN LEFT([ELEMENT],4) = 'HIV ' THEN 'HIV'
               WHEN LEFT([ELEMENT],4) = 'ART ' THEN 'ART'
               WHEN RIGHT([ELEMENT],4) = ' ART' THEN 'ART'
               WHEN RIGHT([ELEMENT],4) = '�ART' THEN 'ART'
               WHEN LEFT([ELEMENT],3) = 'AM ' THEN 'AM'
               WHEN LEFT([ELEMENT],4) = 'HTS ' THEN 'HTS'
               WHEN LEFT([ELEMENT],4) = 'HMIS' THEN 'HMIS'
               WHEN LEFT([ELEMENT],4) = 'CBD ' THEN 'CBD'
               WHEN LEFT([ELEMENT],4) = 'LAB ' THEN 'LAB'
               WHEN LEFT([ELEMENT],4) = 'SFP ' THEN 'FP'
               WHEN LEFT([ELEMENT],4) = 'PLC ' THEN 'OPD'
               WHEN LEFT([ELEMENT],4) = 'KMC ' THEN 'KMC'
               WHEN LEFT([ELEMENT],6) = 'MCCPP ' THEN 'MCCPP'
               WHEN LEFT([ELEMENT],5) = 'MCCP ' THEN 'MCCP'
               WHEN LEFT([ELEMENT],5) = 'IMCI  ' THEN 'IMCI'
               WHEN LEFT([ELEMENT],5) = 'IDSR  ' THEN 'IDSR'
               WHEN LEFT([ELEMENT],5) = 'RUTF ' THEN 'RUTF'
               WHEN LEFT([ELEMENT],3) = 'SS ' THEN 'SS'
               WHEN LEFT([ELEMENT],3) = 'FP ' THEN 'FP'
               WHEN LEFT([ELEMENT],3) = 'FR ' THEN 'FR'
               WHEN LEFT([ELEMENT],3) = 'CC ' THEN 'CC'
               WHEN LEFT([ELEMENT],3) = 'CS ' THEN 'CS'
               WHEN LEFT([ELEMENT],3) = 'CSB' THEN 'CSB'
               WHEN LEFT([ELEMENT],3) = 'MA ' THEN 'MA'
               WHEN LEFT([ELEMENT],3) = 'LF ' THEN 'LF'
               WHEN LEFT([ELEMENT],3) = 'PT ' THEN 'PT'
               WHEN LEFT([ELEMENT],7) = 'MALARIA' THEN 'MALARIA'
               WHEN LEFT([ELEMENT],3) = 'MA ' THEN 'MALARIA'
               WHEN LEFT([ELEMENT],4) = 'MAL ' THEN 'MALARIA'
               WHEN LEFT([ELEMENT],3) = 'MH ' THEN 'MH'
               WHEN LEFT([ELEMENT],8) = 'MATERNAL' THEN 'MATERNAL'
               WHEN LEFT([ELEMENT],9) = 'DELIVERY ' THEN 'MATERNAL'
               WHEN LEFT([ELEMENT],8) = 'PREGNANT' THEN 'MATERNAL'
               WHEN LEFT([ELEMENT],9) = 'POSTNATAL' THEN 'MATERNAL'
               WHEN LEFT([ELEMENT],6) = 'MATERN' THEN 'MATERNAL'
               WHEN LEFT([ELEMENT],4) = 'MAT ' THEN 'MATERNAL'
               WHEN LEFT([ELEMENT],4) = 'OBG ' THEN 'MATERNAL'
               WHEN LEFT([ELEMENT],5) = 'GYNA ' THEN 'MATERNAL'
               WHEN LEFT([ELEMENT],15) = 'FAMILY PLANNING' THEN 'FP'
               WHEN LEFT([ELEMENT],5) = 'YFHS ' THEN 'YFHS'
               WHEN LEFT([ELEMENT],3) = 'VC ' THEN 'VC'
               WHEN LEFT([ELEMENT],4) = 'TBCF' THEN 'TBCF'
               WHEN LEFT([ELEMENT],5) = 'TBHIV' THEN 'TBHIV'
               WHEN LEFT([ELEMENT],4) = 'TBTO' THEN 'TBTO'
               WHEN LEFT([ELEMENT],4) = 'TBUA' THEN 'TBUA'
               WHEN LEFT([ELEMENT],4) = 'PHA ' THEN 'PHA'
               WHEN LEFT([ELEMENT],4) = 'PED ' THEN 'PED'
               WHEN LEFT([ELEMENT],4) = 'OTP ' THEN 'OTP'
               WHEN LEFT([ELEMENT],4) = 'STI ' THEN 'STI'
               WHEN LEFT([ELEMENT],3) = 'TO ' THEN 'TO'
               WHEN LEFT([ELEMENT],3) = 'SK ' THEN 'SK'
               WHEN LEFT([ELEMENT],3) = 'SG ' THEN 'SG'
               WHEN LEFT([ELEMENT],3) = 'SS ' THEN 'SS'
               WHEN LEFT([ELEMENT],3) = 'SH ' THEN 'SH'
               WHEN LEFT([ELEMENT],3) = 'SC ' THEN 'SC'
               WHEN LEFT([ELEMENT],3) = 'EY ' THEN 'EY'
               WHEN LEFT([ELEMENT],4) = 'SHN ' THEN 'SHN'
               WHEN LEFT([ELEMENT],4) = 'HTC ' THEN 'HTC'
               WHEN LEFT([ELEMENT],4) = 'HBB ' THEN 'HBB'
               WHEN LEFT([ELEMENT],4) = 'MDR ' THEN 'MDR'
               WHEN LEFT([ELEMENT],4) = 'MED ' THEN 'MED'
               WHEN LEFT([ELEMENT],4) = 'NCD ' THEN 'NCD'
               WHEN LEFT([ELEMENT],4) = 'NRC ' THEN 'NRC'
               WHEN LEFT([ELEMENT],4) = 'MND ' THEN 'MND'
               WHEN LEFT([ELEMENT],4) = 'NRU ' THEN 'NRU'
               WHEN LEFT([ELEMENT],5) = 'ETAT ' THEN 'ETAT'
               WHEN LEFT([ELEMENT],3) = 'ME ' THEN 'ME'
               WHEN LEFT([ELEMENT],3) = 'FM ' THEN 'FM'
               WHEN LEFT([ELEMENT],8) = 'MEASLES ' THEN 'MEASLES'
               WHEN LEFT([ELEMENT],4) = 'ONC ' THEN 'ONC'
               WHEN LEFT([ELEMENT],6) = 'CANCER' THEN 'ONC'
               WHEN LEFT([ELEMENT],4) = 'OPD ' THEN 'OPD'
               WHEN LEFT([ELEMENT],4) = 'FIN ' THEN 'FIN'
               WHEN LEFT([ELEMENT],4) = 'ORC ' THEN 'ORC'
               WHEN LEFT([ELEMENT],3) = 'OR ' THEN 'OR'
               WHEN LEFT([ELEMENT],3) = 'ES ' THEN 'ES'
               WHEN LEFT([ELEMENT],3) = 'EC ' THEN 'EC'
               WHEN LEFT([ELEMENT],3) = 'EH ' THEN 'EH'
               WHEN LEFT([ELEMENT],3) = 'DT ' THEN 'DT'
               WHEN LEFT([ELEMENT],4) = 'EPI ' THEN 'EPI'
               WHEN LEFT([ELEMENT],9) = 'DIABETES ' THEN 'DIABETES'
               WHEN LEFT([ELEMENT],7) = 'DENTAL ' THEN 'DENTAL'
               WHEN LEFT([ELEMENT],6) = 'ACUTE ' THEN 'OPD'
               WHEN LEFT([ELEMENT],7) = 'ADULTS ' THEN 'OPD'
               WHEN LEFT([ELEMENT],11) = 'ADOLESCENT ' THEN 'OPD'
               WHEN LEFT([ELEMENT],6) = 'OTHER ' THEN 'OPD'
               WHEN LEFT([ELEMENT],2) = 'F ' THEN 'F'
               WHEN [ELEMENT] LIKE '%SEXUALLY %' THEN 'STI'
               WHEN [ELEMENT] LIKE 'DISABILITY %' THEN 'DISABILITY'
               WHEN [ELEMENT] LIKE '%CBMNC%' THEN 'CBMNC'
               WHEN [ELEMENT] LIKE '%CBMNH%' THEN 'CBMNH'
               WHEN [ELEMENT] LIKE '%VMMC%' THEN 'VMMC'
               WHEN [ELEMENT] LIKE '%NUTRITION%' THEN 'SS'
               WHEN [ELEMENT] LIKE '%PROVIDED BY%' THEN 'HR'
               ELSE ''
           END AS 'Topic' ,
           CASE
               WHEN [ELEMENT] LIKE '% HIV %' THEN 'Y'
               WHEN [ELEMENT] LIKE '% HIV' THEN 'Y'
               WHEN [ELEMENT] LIKE 'HIV %' THEN 'Y'
               WHEN LEFT([ELEMENT],4) = 'ANC ' THEN 'Y'
               WHEN [ELEMENT] LIKE '% ANC %' THEN 'Y'
               WHEN [ELEMENT] LIKE 'ART %' THEN 'Y'
               WHEN [ELEMENT] LIKE '% ART' THEN 'Y'
               WHEN [ELEMENT] LIKE '% ART %' THEN 'Y'
               WHEN [ELEMENT] LIKE '%/ART%' THEN 'Y'
               WHEN [ELEMENT] LIKE '%ON ART%' THEN 'Y'
               WHEN LEFT([ELEMENT],6) = 'MA ART' THEN 'Y'
               WHEN [ELEMENT] LIKE '% AIDS%' THEN 'Y'
               WHEN LEFT([ELEMENT],6) = 'TBHIVC' THEN 'Y'
               WHEN LEFT([ELEMENT],4) = 'TBCF' THEN 'Y'
               WHEN LEFT([ELEMENT],5) = 'TBHIV' THEN 'Y'
               WHEN LEFT([ELEMENT],4) = 'TBTO' THEN 'Y'
               WHEN LEFT([ELEMENT],4) = 'TBUA' THEN 'Y'
               WHEN [ELEMENT] LIKE 'TUBERCULOSIS' THEN 'Y'
               WHEN LEFT([ELEMENT],4) = 'STI ' THEN 'Y'
               WHEN [ELEMENT] LIKE '%SEXUALLY%' THEN 'Y'
               WHEN LEFT([ELEMENT],3) = 'SS ' THEN 'Y'
               WHEN LEFT([ELEMENT],3) = 'SH ' THEN 'Y'
               WHEN LEFT([ELEMENT],4) = 'SHN ' THEN 'Y'
               WHEN LEFT([ELEMENT],3) = 'FP ' THEN 'Y'
               ELSE 'N'
           END AS 'HIV_Flag',
           CASE
               WHEN [ELEMENT] LIKE '%TOTAL%'
                    OR [ELEMENT] LIKE '%HTC%'
                    OR [ELEMENT] LIKE '%#%'
                    OR [ELEMENT] LIKE '%NUMBER%'
                    OR [ELEMENT] LIKE '%CASES%'
                    OR [ELEMENT] LIKE '%VISITS%'
                    OR [ELEMENT] LIKE '%17%'
                    OR [ELEMENT] LIKE '%PATIENTS%'
                    OR [ELEMENT] LIKE '%DEATHS%'
                    OR [ELEMENT] LIKE '%MONTH%'
                    OR RIGHT([ELEMENT],2) = ' A'
                    OR RIGHT([ELEMENT],2) = ' B'
                    OR RIGHT([ELEMENT],2) = ' C'
                    OR RIGHT([ELEMENT],2) = ' D'
                    OR RIGHT([ELEMENT],2) = ' E'
                    OR RIGHT([ELEMENT],2) = ' F'
                    OR RIGHT([ELEMENT],2) = ' G'
                    OR RIGHT([ELEMENT],2) = ' H'
                    OR RIGHT([ELEMENT],2) = ' I'
                    OR RIGHT([ELEMENT],2) = ' J'
                    OR RIGHT([ELEMENT],2) = ' K'
                    OR RIGHT([ELEMENT],2) = ' L'
                    OR RIGHT([ELEMENT],2) = ' M' THEN 'Y'
               ELSE 'N'
           END AS 'REPORT_Flag' --,CASE WHEN LEFT([ELEMENT],2) = 'A ' OR LEFT([ELEMENT],2) = 'B ' OR LEFT([ELEMENT],2) = 'C ' OR LEFT([ELEMENT],2) = 'D ' OR LEFT([ELEMENT],2) = 'E ' OR LEFT([ELEMENT],2) = 'F ' THEN 'Y' ELSE 'N'
--END AS 'REGISTER_Flag'
,
           CASE
               WHEN [ELEMENT] LIKE '%TUBERCULOSIS%'
                    OR [ELEMENT] LIKE '%TB%' THEN 'Y'
               ELSE 'N'
           END AS 'TB_Flag',
           CASE
               WHEN [ELEMENT] LIKE '% ART'
                    OR [ELEMENT] LIKE 'ART %'
                    OR [ELEMENT] LIKE '% ART %'
                    OR RIGHT([ELEMENT],4) = '�ART' THEN 'Y'
               ELSE 'N'
           END AS 'ART_Flag',
           CASE
               WHEN [ELEMENT] LIKE '%MATERN%'
                    OR [ELEMENT] LIKE '%DELIVERY%'
                    OR [ELEMENT] LIKE '%BIRTH%'
                    OR [ELEMENT] LIKE '%PREGNAN%'
                    OR [ELEMENT] LIKE '%POSTNATAL%'
                    OR LEFT([ELEMENT],4) = 'MAT '
                    OR [ELEMENT] LIKE '%OBG%'
                    OR [ELEMENT] LIKE '%GYNA%' THEN 'Y'
               ELSE 'N'
           END AS 'Maternity_Flag',
           CASE
               WHEN [ELEMENT] LIKE '% DATE %' THEN 'Y'
               WHEN [ELEMENT] LIKE '% DATE' THEN 'Y'
               WHEN [ELEMENT] LIKE 'DATE %' THEN 'Y'
               ELSE 'N'
           END AS 'Date_Flag'
    FROM #Malawi --WHERE [Program] = 'iHRIS'

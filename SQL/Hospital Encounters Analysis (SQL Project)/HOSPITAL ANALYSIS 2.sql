-- Connect to database (MySQL only)
USE hospital_db;

-- OBJECTIVE 1: ENCOUNTERS OVERVIEW

-- a. How many total encounters occurred each year?

DESCRIBE encounters;
SELECT 
    YEAR(START) AS Year,
    COUNT(*) AS Total_Encounters
FROM encounters
GROUP BY YEAR(START)
ORDER BY Year;


-- b. For each year, what percentage of all encounters belonged to each encounter class

SELECT 
    YEAR(START) AS Year,
    ENCOUNTERCLASS,
    COUNT(*) AS Encounters,
    ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY YEAR(START)), 2) AS Percentage_of_Year
FROM encounters
GROUP BY Year, ENCOUNTERCLASS
ORDER BY Year, ENCOUNTERCLASS;

-- For each year, what percentage of all encounters belonged to each encounter class
-- (ambulatory, outpatient, wellness, urgent care, emergency, and inpatient)?
SELECT 
    YEAR(START) AS Year,
    ENCOUNTERCLASS,
    COUNT(*) AS Encounters,
    ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY YEAR(START)), 2) AS Percentage_of_Year
FROM encounters
WHERE ENCOUNTERCLASS IN ('ambulatory', 'outpatient', 'wellness', 'urgent care', 'emergency', 'inpatient')
GROUP BY Year, ENCOUNTERCLASS
ORDER BY Year, ENCOUNTERCLASS;


-- c. What percentage of encounters were over 24 hours versus under 24 hours?

SELECT 
    CASE 
        WHEN TIMESTAMPDIFF(HOUR, START, STOP) > 24 THEN 'Over 24 hours'
        ELSE 'Under or equal 24 hours'
    END AS Duration_Category,
    COUNT(*) AS Encounter_Count,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM encounters), 2) AS Percentage
FROM encounters
GROUP BY Duration_Category;


-- OBJECTIVE 2: COST & COVERAGE INSIGHTS

-- a. How many encounters had zero payer coverage, and what percentage of total encounters does this represent?
SELECT 
    COUNT(*) AS Zero_Payer_Coverage_Encounters,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM encounters), 2) AS Percentage_of_Total
FROM encounters
WHERE PAYER_COVERAGE = 0;


-- b. What are the top 10 most frequent procedures performed and the average base cost for each?
SELECT 
    CODE AS Procedure_Code,
    COUNT(*) AS Frequency,
    ROUND(AVG(BASE_ENCOUNTER_COST), 2) AS Avg_Base_Cost
FROM encounters
WHERE CODE IS NOT NULL
GROUP BY CODE
ORDER BY Frequency DESC
LIMIT 10;


-- c. What are the top 10 procedures with the highest average base cost and the number of times they were performed?

SELECT 
    CODE AS Procedure_Code,
    ROUND(AVG(BASE_ENCOUNTER_COST), 2) AS Avg_Base_Cost,
    COUNT(*) AS Frequency
FROM encounters
WHERE CODE IS NOT NULL
GROUP BY CODE
ORDER BY Avg_Base_Cost DESC
LIMIT 10;

-- d. What is the average total claim cost for encounters, broken down by payer?
SELECT 
    PAYER,
    ROUND(AVG(TOTAL_CLAIM_COST), 2) AS Avg_Total_Claim_Cost,
    COUNT(*) AS Encounter_Count
FROM encounters
GROUP BY PAYER
ORDER BY Avg_Total_Claim_Cost DESC;


-- OBJECTIVE 3: PATIENT BEHAVIOR ANALYSIS

-- a. How many unique patients were admitted each quarter over time?
SELECT
    YEAR(START) AS Year,
    QUARTER(START) AS Quarter,
    COUNT(DISTINCT PATIENT) AS Unique_Patients
FROM encounters
GROUP BY Year, Quarter
ORDER BY Year, Quarter;


-- b. How many patients were readmitted within 30 days of a previous encounter?

SELECT COUNT(DISTINCT e1.PATIENT) AS Patients_Readmitted_Within_30_Days
FROM encounters e1
JOIN encounters e2
  ON e1.PATIENT = e2.PATIENT
 AND e2.START > e1.STOP
 AND DATEDIFF(e2.START, e1.STOP) <= 30;

-- c. Which patients had the most readmissions?
SELECT 
    e1.PATIENT, 
    COUNT(*) AS Readmission_Count
FROM encounters e1
JOIN encounters e2
  ON e1.PATIENT = e2.PATIENT
 AND e2.START > e1.STOP
 AND DATEDIFF(e2.START, e1.STOP) <= 30
GROUP BY e1.PATIENT
ORDER BY Readmission_Count DESC
LIMIT 10;  -- top 10 patients with most readmissions

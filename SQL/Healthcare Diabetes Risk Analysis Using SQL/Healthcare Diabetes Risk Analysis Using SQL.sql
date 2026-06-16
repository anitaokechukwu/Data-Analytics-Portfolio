
-- Create a Database
CREATE DATABASE diabetes_project;
USE diabetes_project;

-- Create the Table
CREATE TABLE diabetes (
    Pregnancies INT,
    Glucose INT,
    BloodPressure INT,
    SkinThickness INT,
    Insulin INT,
    BMI FLOAT,
    DiabetesPedigreeFunction FLOAT,
    Age INT,
    Outcome INT
);

-- Import the CSV File
-- Verify the Import

SELECT * FROM diabetes;

-- To count rows:
SELECT COUNT(*) FROM diabetes;

-- Understand the Data
-- View First 10 Rows

SELECT *
FROM diabetes
LIMIT 10;

-- Count Total Records

SELECT COUNT(*) AS Total_Patients
FROM diabetes;



-- View diabetic patients
SELECT *
FROM diabetes
WHERE Outcome = 1;

SELECT *
FROM diabetes
WHERE Outcome = 0;

-- Average glucose level
SELECT AVG(Glucose)
FROM diabetes;

-- Patients older than 50
SELECT *
FROM diabetes
WHERE Age > 50;

-- Exploratory Data Analysis (EDA)
-- Question 1
-- How many patients have diabetes?

SELECT
    Outcome,
    COUNT(*) AS Patient_Count
FROM diabetes
GROUP BY Outcome;

-- Insight
-- Determine the proportion of diabetic vs non-diabetic patients.

-- Question 2
-- What is the average glucose level by diabetes status?

SELECT
    Outcome,
    ROUND(AVG(Glucose),2) AS Avg_Glucose
FROM diabetes
GROUP BY Outcome;

-- Insight
-- Compare glucose levels between diabetic and non-diabetic patients.

-- Question 3
-- What is the average BMI by diabetes status?

SELECT
    Outcome,
    ROUND(AVG(BMI),2) AS Avg_BMI
FROM diabetes
GROUP BY Outcome;

-- Insight
-- Evaluate whether obesity is associated with diabetes.

-- Question 4
-- What is the average age by diabetes status?

SELECT
    Outcome,
    ROUND(AVG(Age),2) AS Avg_Age
FROM diabetes
GROUP BY Outcome;

-- Insight
-- Determine whether diabetic patients tend to be older.

-- Question 5
-- What is the average family-history score by diabetes status?

SELECT
    Outcome,
    ROUND(AVG(DiabetesPedigreeFunction),3) AS Avg_Family_History
FROM diabetes
GROUP BY Outcome;

-- Insight
-- Assess the impact of family history on diabetes risk.

-- Step 4: High-Risk Patient Analysis
-- Patients with High Glucose

SELECT *
FROM diabetes
WHERE Glucose > 140;
-- Business Purpose
-- Identify patients requiring closer monitoring.

-- Patients with High BMI
SELECT *
FROM diabetes
WHERE BMI > 30;
-- Business Purpose
-- Identify obese patients at higher risk.

-- Patients with Both High Glucose and High BMI
SELECT *
FROM diabetes
WHERE Glucose > 140
AND BMI > 30;

-- Step 5: Age Group Analysis
-- Create Age Categories

SELECT
    CASE
        WHEN Age < 30 THEN 'Young'
        WHEN Age BETWEEN 30 AND 49 THEN 'Middle Age'
        ELSE 'Senior'
    END AS Age_Group,
    COUNT(*) AS Patient_Count
FROM diabetes
GROUP BY Age_Group;

-- Diabetes Cases by Age Group

SELECT
    CASE
        WHEN Age < 30 THEN 'Young'
        WHEN Age BETWEEN 30 AND 49 THEN 'Middle Age'
        ELSE 'Senior'
    END AS Age_Group,
    Outcome,
    COUNT(*) AS Patient_Count
FROM diabetes
GROUP BY Age_Group, Outcome
ORDER BY Age_Group;
-- Insight
-- Analyze diabetes prevalence across age groups.

-- Step 6: Pregnancy Analysis
-- Average Pregnancies by Diabetes Status

SELECT
    Outcome,
    ROUND(AVG(Pregnancies),2) AS Avg_Pregnancies
FROM diabetes
GROUP BY Outcome;
-- Insight
-- Investigate whether the number of pregnancies differs between diabetic and non-diabetic patients.

-- Step 7: Top 10 Highest-Risk Patients
-- Create a simple risk score.

SELECT
    Age,
    Glucose,
    BMI,
    Outcome,
    (Glucose + BMI + Age) AS Risk_Score
FROM diabetes
ORDER BY Risk_Score DESC
LIMIT 10;
-- Business Purpose
-- Identify patients who may benefit from immediate intervention.

-- Step 8: Summary Statistics
-- Minimum, Maximum, Average Glucose

SELECT
    MIN(Glucose) AS Min_Glucose,
    MAX(Glucose) AS Max_Glucose,
    ROUND(AVG(Glucose),2) AS Avg_Glucose
FROM diabetes;

-- Minimum, Maximum, Average BMI
SELECT
    MIN(BMI) AS Min_BMI,
    MAX(BMI) AS Max_BMI,
    ROUND(AVG(BMI),2) AS Avg_BMI
FROM diabetes;


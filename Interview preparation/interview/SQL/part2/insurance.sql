SELECT * FROM insurance;

-- Show records of 'male' patient from 'southwest' region.
SELECT *
FROM insurance
WHERE gender='male' and region='southwest';

-- Show all records having bmi in range 30 to 45 both inclusive.
SELECT *
FROM insurance
WHERE bmi BETWEEN 30 AND 45;

-- Show minimum and maximum bloodpressure of diabetic patient who smokes. Make column names as MinBP and MaxBP respectively
SELECT MIN(bloodpressure) AS 'MinBP',
		MAX(bloodpressure) AS 'MaxBP'
FROM insurance
WHERE diabetic = 'Yes' AND smoker='Yes';

-- Find no of unique patients who are not from southwest region.
SELECT DISTINCT(PatientID) 
FROM insurance
WHERE region != 'southwest';

-- Total claim amount from male smoker.
SELECT SUM(claim)
FROM insurance
WHERE gender='male';

-- Select all records of south region.
SELECT * 
FROM insurance
WHERE region LIKE 'south%';

-- No of patient having normal blood pressure. Normal range[90-120]
SELECT COUNT(*)
FROM insurance
WHERE bloodpressure BETWEEN 90 AND 120;

-- What is the average claim amount for non-smoking female patients who are diabetic?
SELECT AVG(claim)
FROM insurance
WHERE gender ='female' AND smoker='No' AND diabetic='Yes';

-- Write a SQL query to update the claim amount for the patient with PatientID = 1234 to 5000.
UPDATE insurance
SET claim = claim +5
WHERE PatientID BETWEEN 1234 AND 5000;

-- Write a SQL query to delete all records for patients who are smokers and have no children.
DELETE FROM insurance
WHERE smoker='Yes' AND children=0;
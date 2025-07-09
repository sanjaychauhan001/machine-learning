SELECT * FROM insurance;

-- How many patients have claimed more than the average claim amount for patients 
-- who are smokers and have at least one child, and belong to the southeast region?
SELECT COUNT(*)
FROM insurance
WHERE claim > (SELECT AVG(claim) 
				FROM insurance
				WHERE smoker = 'Yes'
				AND children >=1 
				AND region = 'southeast');

-- How many patients have claimed more than the average claim amount for patients 
-- who are not smokers and have a BMI greater than the average BMI for patients who have at least one child?
SELECT COUNT(*)
FROM insurance
WHERE claim > (SELECT AVG(claim)
			   FROM insurance
			   WHERE smoker = 'No'
			   AND bmi > (SELECT AVG(bmi)
						  FROM insurance
						  WHERE children >=1));

-- How many patients have claimed more than the average claim amount for patients 
-- who have a BMI greater than the average BMI for patients who are diabetic, have at least one child, 
-- and are from the southwest region?
SELECT COUNT(*) 
FROM insurance
WHERE claim > (SELECT AVG(claim) FROM insurance
			   WHERE bmi > (SELECT AVG(bmi)	FROM insurance
                            WHERE diabetic = 'Yes'
                            AND children >= 1
                            AND region = 'southwest'));



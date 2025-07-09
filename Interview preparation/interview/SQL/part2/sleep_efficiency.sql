SELECT * FROM sleep_efficiency;

-- Find out the average sleep duration of top 15 male candidates who's sleep duration are equal to 7.5 or greater than 7.5.
SELECT AVG(Sleep_duration) FROM sleep_efficiency
WHERE Gender = 'Male' AND Sleep_duration >=7.5
LIMIT 15;

-- Show avg deep sleep percentage for both gender. Round result at 2 decimal places.
SELECT Gender, ROUND(AVG(Deep_sleep_percentage),2)
FROM sleep_efficiency
GROUP BY Gender;

-- Find out the lowest 10th to 30th light sleep percentage records where deep sleep percentage values are between 25 to 45. Display age, light sleep percentage and deep sleep percentage columns only.
SELECT Age, Light_sleep_percentage, Deep_sleep_percentage
FROM sleep_efficiency
WHERE Deep_sleep_percentage BETWEEN 25 AND 45
ORDER BY Light_sleep_percentage ASC
LIMIT 10,20;

-- Group by on exercise frequency and smoking status and show average deep sleep time, average light sleep time and avg rem sleep time.
SELECT Exercise_frequency, Smoking_status, AVG(Light_sleep_percentage), AVG(Deep_sleep_percentage)
FROM sleep_efficiency
GROUP BY Exercise_frequency,Smoking_status
ORDER BY Exercise_frequency;

-- Group By on Awekning and show AVG Caffeine consumption, AVG Deep sleep time and AVG Alcohol consumption 
-- only for people who do exercise atleast 3 days a week. Show result in descending order awekenings
SELECT Awakenings, AVG(Caffeine_consumption), AVG(Deep_sleep_percentage), 
		AVg(Alcohol_consumption)
FROM sleep_efficiency
WHERE Exercise_frequency = 3
GROUP BY Awakenings
ORDER BY Awakenings DESC;

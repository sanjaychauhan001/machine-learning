SELECT * FROM insurance;

-- What are the top 5 patients who claimed the highest insurance amounts?
SELECT * 
FROM insurance
ORDER BY claim DESC
LIMIT 5;

-- What is the average insurance claimed by patients based on the number of children they have?
SELECT children,AVG(claim)
FROM insurance
GROUP BY children;

-- What is the highest and lowest claimed amount by patients in each region?
SELECT t1.region,t1.highest, t2.lowest 
FROM
(SELECT region, MAX(claim) AS 'highest'
FROM insurance
GROUP BY region) t1
JOIN (
SELECT region, MIN(claim) AS 'lowest'
FROM insurance
GROUP BY region) t2
ON t1.region = t2.region;



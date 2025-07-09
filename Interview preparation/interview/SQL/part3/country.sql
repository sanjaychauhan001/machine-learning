-- Find out top 10 countries' which have maximum A and D values.
SELECT t1.Country, MAX(t1.A),MAX(t2.D) 
FROM country_ab AS t1
JOIN country_cd AS t2
ON t1.Country = t2.Country
GROUP BY t1.Country
ORDER BY MAX(t1.A) DESC, MAX(t2.D) DESC
LIMIT 10;

-- Find out highest CL value for 2020 for every region. Also sort the result in descending order. 
-- Also display the CL values in descending order.
SELECT t2.Region, MAX(t1.CL)
FROM country_cl AS t1
JOIN country_efg AS t2
ON t1.Country = t2.Country
WHERE t1.Edition = 2020
GROUP BY t2.Region
ORDER BY MAX(t1.CL) DESC;


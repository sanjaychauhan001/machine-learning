SELECT * FROM athlete;

-- Display the names of athletes who won a gold medal in the 2008 Olympics and whose height is 
-- greater than the average height of all athletes in the 2008 Olympics.
SELECT *
FROM athlete
WHERE Height > (SELECT AVG(Height) FROM athlete
				WHERE Year = 2008)
AND Medal = 'Gold'
AND Year = 2008;

-- Display the names of athletes who won a medal in the sport of basketball in the 2016 Olympics 
-- and whose weight is less than the average weight of all athletes who won a medal in the 2016 Olympics.
SELECT *
FROM athlete
WHERE Sport = 'Basketball' 
AND Year = 2016
AND Weight < (SELECT AVG(Weight)
				FROM athlete
				WHERE Year = 2016
				AND Medal IS NOT NULL);

-- Display the names of all athletes who have won a medal in the sport of swimming in both the 2008 and 2016 Olympics.
SELECT *
FROM athlete
WHERE Sport = 'Swimming'
AND Year IN(2008,2016)
AND Medal IS NOT NULL;

-- Display the names of all countries that have won more than 50 medals in a single year.
SELECT DISTINCT(NOC)
FROM athlete
GROUP BY NOC,Year
HAVING COUNT(Medal) >50
ORDER BY NOC;

-- Display the names of all athletes who have won medals in more than one sport in the same year.
SELECT Name, Year, COUNT(DISTINCT(Sport))
FROM athlete
WHERE Medal IS NOT NULL
GROUP BY Name, Year
HAVING COUNT(DISTINCT(Sport)) >1;

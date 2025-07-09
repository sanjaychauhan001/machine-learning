SELECT * FROM timepass.nces330;
-- Display top 10 lowest "value" State names of which the Year either belong to 2013 or 2017 or 2021 
-- and type is 'Public In-State'.
SELECT State , Value
FROM nces330
WHERE Year IN (2013,2017,2021) AND Type = 'Public IN-State'
ORDER BY Value ASC
LIMIT 10;

-- Best state in terms of low education cost (Tution Fees) in 'Public' type university.
SELECT *
FROM nces330
WHERE Type = 'Public OUT-of-State' AND Expense = 'Fees/Tuition'
ORDER BY Value ASC;

-- 2nd Costliest state for Private education in year 2021. Consider, Tution and Room fee both.
SELECT * FROM nces330
WHERE Year = 2021
ORDER BY Value DESC
LIMIT 1,1;




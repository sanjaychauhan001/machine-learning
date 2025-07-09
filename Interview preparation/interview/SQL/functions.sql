select total_run from (
SELECT batter, sum(batsman_run) as 'total_run'
FROM timepass.ipl
GROUP BY batter) as t
where batter = 'JC Buttler';

DELIMITER $$
CREATE FUNCTION cal_total_run(name VARCHAR(50))
RETURNS INT 
DETERMINISTIC
BEGIN 
	RETURN (select total_run from (
	SELECT batter, sum(batsman_run) as 'total_run'
	FROM timepass.ipl
	GROUP BY batter) as t
	where batter = name);
END$$
DELIMITER ;

DROP FUNCTION cal_total_run;
SELECT cal_total_run('V Kohli');

SELECT * FROM ipl;

WITH CTE1 AS (SELECT bowler, SUM(isWicketDelivery) AS 'total'
FROM ipl
GROUP BY bowler)
SELECT total FROM CTE1
WHERE bowler = 'HH Pandya';

DELIMITER $$
CREATE FUNCTION cal_total_wicket(bol_name VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
   RETURN (WITH CTE1 AS (SELECT bowler, SUM(isWicketDelivery) AS 'total'
    FROM ipl
    GROUP BY bowler)
	SELECT total FROM CTE1
	WHERE bowler = bol_name);
END $$
DELIMITER ;

SELECT cal_total_wicket('HH Pandya');
SELECT * FROM timepass.powergeneration;
-- Display those power stations which have average 'Monitored Cap.(MW)' (display the values) 
-- between 1000 and 2000 and the number of occurance of the power stations (also display these values) 
-- are greater than 200. Also sort the result in ascending order.

SELECT Power_Station, AVG(Monitored_Cap) AS 'avg_monitor_cap', COUNT(Power_Station) AS 'cnt'
FROM powergeneration
GROUP BY Power_Station
HAVING avg_monitor_cap BETWEEN 1000 AND 2000 AND cnt >200
ORDER BY cnt;




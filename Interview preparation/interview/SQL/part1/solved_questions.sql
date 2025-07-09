SELECT * FROM marks;

-- retrieve second highest salary
SELECT marks from marks
ORDER BY marks DESC
LIMIT 1,1;

SELECT MAX(marks)
FROM marks
WHERE marks < (SELECT max(marks) FROM marks);

-- how to get nth highest
SELECT t.marks 
FROM (SELECT marks,DENSE_RANK() OVER(ORDER BY marks DESC) AS 'ranks' FROM marks) AS t
WHERE t.ranks=3;

-- fetch all empoyee whos salary greater than avg salary
SELECT *
FROM marks
WHERE marks > (SELECT AVG(marks) FROM marks);

-- query to display current time date
SELECT current_timestamp();

-- find duplicate record
SELECT student_id, name, branch, marks, COUNT(*) as 'ct'
FROM marks
GROUP BY student_id, name, branch, marks
HAVING ct > 1;

-- how to get common records from two table
SELECT * FROM customer t1
INNER JOIN orders t2
ON t1.cust_id = t2.cust_id; 

-- find last 3 records
SELECT * 
FROM marks
ORDER BY student_id DESC
LIMIT 3;

-- how to calculate total salary
SELECT SUm(marks)
FROM marks;

-- find the empoyee who joined in 2020
SELECT * FROM employee
WHERE join_date = 2020;

-- write a query to find the emp who name starts with a
SELECT * FROM marks
WHERE name LIKE 'a%';

-- find emp who don't have a manager
SELECT *
FROM employee
WHERE manager_id IS NULL;

-- find the dep with highers number of emp
SELECT branch , COUNT(*)
FROM marks
GROUP BY branch
ORDER BY COUNT(*) DESC
LIMIT 1;

-- find count of emp in each dep
SELECT branch , COUNT(*)
FROM marks
GROUP BY branch;

-- find the emp having highest salary in their dep
SELECT branch , name, marks
FROM marks t1
WHERE marks = (SELECT MAX(marks) FROM marks t2 WHERE t1.branch = t2.branch);

-- update the salary by 10% increase
UPDATE marks
SET marks = marks*0.1;

-- find the emp who's salary between 50000 to 100000
SELECT * FROM marks
WHERE marks BETWEEN 95 AND 99;

-- FETCH FIRTS AND LAST RECORD
(SELECT * FROM marks
ORDER BY student_id ASC
LIMIT 1)
UNION
(SELECT * FROM marks
ORDER BY student_id DESC
LIMIT 1);

-- find the total number of dep
SELECT COUNT(DISTINCT(branch)) 
FROM marks;

-- find the dep with lowest avg salary
SELECT branch , AVG(marks)
FROM marks 
GROUP BY branch
ORDER BY AVG(marks) ASC
LIMIT 1;

-- find the second highest salary of each dep
WITH cte1 AS(
SELECT *, DENSE_RANK() OVER(PARTITION BY branch ORDER BY marks DESC) AS 'ranks'
FROM marks )
SELECT * FROM cte1
WHERE ranks=2;

-- fetch students whose marks multiple of 5
SELECT * FROM marks
WHERE marks%5=0;

-- find the emp with same salary
SELECT t1.name ,t2.name, t1.marks
FROM marks t1
JOIN marks t2
on t1.marks = t2.marks
AND t1.student_id < t2.student_id;

-- update salary based on dep
UPDATE marks
SET marks = CASE WHEN branch='EEE' THEN marks+2
                 WHEN branch='CSE' THEN marks+1
                 ELSE marks
			END;	

-- find the emp whose name start and end with same letter
SELECT * FROM marks
WHERE LEFT(name,1) =RIGHT(name,1) ;



CREATE DATABASE hr_attrition;
USE hr_attrition;
SELECT * FROM attrition;

-- 
-- 1. Total number of employess
SELECT COUNT(*) as total_employees
FROM attrition;

-- 2. Count employees who left
SELECT COUNT(*) AS left_employee_count
FROM attrition
WHERE attrition = "Yes";

-- 3. Attrition rate
SELECT ROUND(SUM(CASE WHEN Attrition = "Yes" THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM attrition;

-- 4. Attrition by department
SELECT department,COUNT(*) AS attrition_count
FROM attrition
WHERE attrition = "Yes"
GROUP BY department
ORDER BY attrition_count DESC;

-- 5. Average salary of employees who left
SELECT ROUND(AVG(monthly_income),0) as Avg_salary
FROM attrition
WHERE attrition = "Yes";

-- 6. Attrition by job role
SELECT job_role,COUNT(*) AS left_employees_count
FROM attrition 
WHERE attrition = "Yes"
GROUP BY job_role
ORDER BY left_employees_count DESC;

-- 7. Employees with >5 years but left
SELECT COUNT(*) AS employees_left
FROM attrition
WHERE total_working_years > 5 AND attrition = "Yes";

-- 8. Rank departments by attrition
SELECT department,COUNT(*) AS attrition_count,
DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk
FROM attrition
WHERE attrition = 'Yes'
GROUP BY department;


-- 9. Compare attrition vs satisfaction levels
SELECT job_satisfaction,
ROUND(SUM(CASE WHEN attrition = "Yes" THEN 1 ELSE 0 END) *100/COUNT(*),2) AS attrition_rate
FROM attrition
GROUP BY job_satisfaction
ORDER BY job_satisfaction;



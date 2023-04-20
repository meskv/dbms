-- 1
SELECT LOCATION_ID, STREET_ADDRESS, CITY, STATE_PROVINCE, COUNTRY_NAME
FROM locations
NATURAL JOIN countries;

-- 2
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, DEPARTMENT_NAME 
FROM employee
JOIN departments USING (DEPARTMENT_ID);

-- 3
SELECT e.FIRST_NAME, e.LAST_NAME, e.JOB_ID, e.DEPARTMENT_ID, d.DEPARTMENT_NAME 
FROM employee e 
JOIN departments d 
ON (e.DEPARTMENT_ID = d.DEPARTMENT_ID) 
JOIN locations l ON 
(d.location_id = l.location_id) 
WHERE LOWER(l.city) = 'London';

-- 4
SELECT e.EMPLOYEE_ID 'Emp_Id', e.LAST_NAME 'Employee', 
m.EMPLOYEE_ID 'Mgr_Id', m.LAST_NAME 'Manager' 
FROM employee e 
join employee m 
ON (e.MANAGER_ID = m.EMPLOYEE_ID);

-- 5
SELECT e.FIRST_NAME, e.LAST_NAME, e.hire_date 
FROM employee e 
JOIN employee e1 
ON (e1.LAST_NAME = 'Jones') 
WHERE e1.hire_date < e.hire_date;

-- 6
SELECT DEPARTMENT_NAME AS 'Department Name', 
COUNT(*) AS 'No of Employee' 
FROM departments 
INNER JOIN employee 
ON employee.DEPARTMENT_ID = departments.DEPARTMENT_ID 
GROUP BY departments.DEPARTMENT_ID, DEPARTMENT_NAME 
ORDER BY DEPARTMENT_NAME;

-- 7
SELECT EMPLOYEE_ID, JOB_TITLE, END_DATE-START_DATE Days FROM job_history 
NATURAL JOIN jobs 
WHERE DEPARTMENT_ID=90;

-- 8
SELECT d.DEPARTMENT_ID, d.DEPARTMENT_NAME, d.MANAGER_ID, e.FIRST_NAME 
FROM departments d 
INNER JOIN employee e 
ON (d.MANAGER_ID = e.EMPLOYEE_ID);

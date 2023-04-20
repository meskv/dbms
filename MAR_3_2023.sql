-- CREATE TABLE employee (
-- 	EMPLOYEE_ID integer(20),
--     FIRST_NAME varchar(200),
--     LAST_NAME varchar(100),
--     EMAIL varchar(100),
--     PHONE_NUMBER varchar(12),
--     HIRE_DATE date,
--     JOB_ID varchar(10),
--     SALARY decimal,
--     COMMISION_PCT decimal(5, 2),
--     MANAGER_ID integer(20),
--     DEPARTMENT_ID integer(20),
--     primary key (EMPLOYEE_ID)
-- );

-- INSERTING VALUES 

-- insert into employee values(100, "Steven", "King", "SKING", "5151234567", '1987-06-17', "AD_PRES", 24000.00, 0.00, 0, 90 );

-- insert into employee values
-- (101, "Neena", "Kochhar", "NKOCHHAR", "5151234568", '1987-06-18', "AD_VP", 17000.00, 0.00, 100, 90 ),
-- (102, "Lex", "De Haan", "LDHAAN", "5151234569", '1987-06-19', "AD_VP", 17000.00, 0.00, 100, 90 );

-- 1
SELECT FIRST_NAME, LAST_NAME, SALARY FROM employee where salary <10000 or salary >15000;
 
 
-- insert into employee values(117, "Sigal", "Tobias", "STOBIAS", "5151274564", '1987-07-04', "PU_CLERK", 2800.00, 0.00, 114, 30 );
-- insert into employee values(118, "Guy", "Himaru", "GHIMARU", "5151274565", '1987-07-05', "PU_CLERK", 2600.00, 0.00, 114, 30 );
-- insert into employee values(111, "Ismael", "SCiarra", "ISCIARAA", "5151244569", '1987-06-28', "FI_ACCOUNT", 7700.00, 0.00, 108, 100 );

-- 2
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM employee where DEPARTMENT_ID = 30 or DEPARTMENT_ID = 100;
 
-- 3
SELECT FIRST_NAME, LAST_NAME, SALARY FROM employee where salary <10000 or salary >15000 and DEPARTMENT_ID = 30 or DEPARTMENT_ID = 100;

-- 4
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE FROM employee where year(HIRE_DATE) = 1987;


-- 5
SELECT FIRST_NAME FROM employee where FIRST_NAME LIKE '%b%' AND FIRST_NAME LIKE '%c%';

-- 6
-- insert into employee values(104, "Bruce", "Ernst", "BERNST", "5904234568", '1987-06-21', "IT_PROG", 6000.00, 0.00, 103, 60); 
-- insert into employee values(180, "Winston", "Taylor", "WTAYLOR", "6505079876", '1987-09-05', "SH_CLERK", 3200.00, 0.00, 120, 50 );
-- insert into employee values(181, "Jean", "Fleaur", "JFLEAUR", "6505079878", '1987-09-06', "SH_CLERK", 3100.00, 0.00, 120, 50 );

SELECT LAST_NAME, JOB_ID, SALARY FROM employee WHERE JOB_ID IN ('IT_PROG', 'SH_CLERK') AND SALARY NOT IN (4500,10000, 15000);

-- 7
-- insert into employee values(200, "Jennifer", "Whalen", "JWHALEN", "5151234444", '1987-09-25', "AD_ASST", 4400.00, 0.00, 101, 10 );
SELECT LAST_NAME FROM employee WHERE LAST_NAME LIKE '______';

-- 8
-- SELECT LAST_NAME FROM employee WHERE LAST_NAME LIKE '__e___';
SELECT LAST_NAME FROM employee WHERE LAST_NAME LIKE '__e%';
-- 9
SELECT DISTINCT JOB_ID FROM employee;

-- 10
SELECT FIRST_NAME,LAST_NAME,SALARY*.15 PF FROM employee;

-- 11
SELECT * FROM employee where LAST_NAME IN ('BLAKE', 'SCOTT', 'KING', 'FORD');










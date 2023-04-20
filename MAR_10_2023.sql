-- CREATE TABLE departments (
-- 	DEPARTMENT_ID integer(20),
--     DEPARTMENT_NAME varchar(200),
--     MANAGER_ID integer(20),
--     LOCATION_ID integer(20),
--     primary key (DEPARTMENT_ID)
-- );

-- insert into departments values
-- (20, "Marketing", 201, 1800),
-- (10, "Administration", 200, 1700);


-- -- Location Table
-- CREATE TABLE locations (
-- 	LOCATION_ID integer(20),
--     STREET_ADDRESS varchar(200),
-- 	POSTAL_CODE integer(10),
--     CITY varchar(20),
--     STATE_PROVINCE varchar(20),
--     COUNTRY_ID varchar(5),
--     primary key (LOCATION_ID)
-- );



-- insert into locations values
-- (1000, "1297 Via Cola di Rie", 989, "Roma", "", "IT"),
-- (1100, "93091 Calle della Te", 10934, "Venice", "", "IT"),
-- (1200, "Shinjuku", 1689, "Tokyo", "Tokyo Prefectu", "JP");



-- CREATE TABLE jobs (
-- 	JOB_ID varchar(20),
--     JOB_TITLE varchar(200),
--     MIN_SALARY decimal,
--     MAX_SALARY decimal,
--     primary key (JOB_ID)
-- );

-- insert into jobs values
-- ("AD_PRES", "President", 20000, 40000),
-- ("AD_VP", "Administration Vice President", 15000, 30000),
-- ("AD_ASST", "Administration Assistant", 3000, 6000),
-- ("FI_MGR", "Financial Manager", 8200, 16000);


-- insert into employee values(185, "Alexis", "Bull", "ABULL", "6505092876", '1987-09-10', "SH_CLERK", 4100.00, 0.00, 121, 50 );
-- insert into locations values (1700, "2004 Charade Rd", 98199, "Seattle", "Washington", "US");
-- insert into locations values (1500, "2011 Interiors Blvd", 99236, "South San", "California", "US");
-- insert into departments values (60, "IT", 103, 1400);

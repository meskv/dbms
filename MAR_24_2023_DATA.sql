CREATE TABLE countries (
	COUNTRY_ID varchar(20),
    COUNTRY_NAME varchar(200),
    REGION_ID decimal,
    primary key (COUNTRY_ID)
);

CREATE TABLE job_history (
	EMPLOYEE_ID integer(20),
    START_DATE date,
    END_DATE date,
    JOB_ID varchar(20),
    DEPARTMENT_ID integer(20)
);

insert into employee values
(201, "Michael"    , "Hartstein"  , "MHARTSTE", "5151235555", "1987-09-26", "MK_MAN", 13000.00, 0.00, 100, 20),
(202, "Pat"        , "Fay"        , "PFAY"    , "6031236666", "1987-09-27", "MK_REP",  6000.00, 0.00, 201, 20),
(203, "Susan"      , "Mavris"     , "SMAVRIS" , "5151237777", "1987-09-28", "HR_REP",  6500.00, 0.00, 101, 40),
(204, "Hermann"    , "Baer"       , "HBAER"   , "5151238888", "1987-09-29", "PR_REP", 10000.00, 0.00, 101, 70);


insert into employee values
(195, "Vance", "Jones", "VJONES", "6505014876", "1987-09-20", "SH_CLERK", 2800.00, 0.00, 123, 50),
(196, "Alana", "Walsh", "AWALSH", "6505079811", "1987-09-21", "SH_CLERK", 3100.00, 0.00, 124, 50),
(197, "Kevin", "Feeney", "KFEENEY", "6505079822", "1987-09-22", "SH_CLERK", 3000.00, 0.00, 124, 50),
(198, "Donald", "OConnell", "DOCONNEL", "6505079833", "1987-09-23", "SH_CLERK", 2600.00, 0.00, 124, 5);


insert into job_history values
(102, "1993-01-13", "1998-07-24", "IT_PROG", 60),
(101, "1989-09-21", "1993-10-27", "AC_ACCOUNT", 110),
(101, "1993-10-28", "1997-03-15", "AC_MGR", 110),
(201, "1996-02-17", "1999-12-19", "MK_REP", 20),
(114, "1998-03-24", "1999-12-31", "ST_CLERK", 50);

insert into job_history values
(200, "1987-09-17", "1993-06-17", "AD_ASST", 90),
(200, "1994-07-01", "1998-12-31", "AC_ACCOUNT", 90);

insert into countries values
 ("AR", "Argentina", 2),
 ("AU", "Australia", 3),
 ("BE", "Belgium", 1),
 ("BR", "Brazil", 2),
 ("CA", "Canada", 2),
 ("CH", "Switzerland", 1),
 ("CN", "China", 3),
 ("DE", "Germany", 1),
 ("DK", "Denmark", 1),
 ("EG", "Egypt", 4),
 ("FR", "France", 1),
 ("HK", "HongKong", 3),
 ("IL", "Israel", 4),
 ("IN", "India", 3),
 ("IT", "Italy", 1),
 ("JP", "Japan", 3),
 ("KW", "Kuwait", 4),
 ("MX", "Mexico", 2),
 ("NG", "Nigeria", 4),
 ("NL", "Netherlands", 1),
 ("SG", "Singapore", 3),
 ("UK", "United Kingd", 1),
 ("US", "United State", 2),
 ("ZM", "Zambia", 4),
 ("ZW", "Zimbabwe", 4);
 

insert into locations values
(2100, "1298 Vileparle (E)",    490231      , "Bombay"     , "Maharashtra"    ,"IN"),
(2200, "12-98 Victoria Stree",  2901        , "Sydney"     , "New South Wale" ,"AU"),
(2300, "198 Clementi North",    540198      , "Singapore"  ,      ""          ,"SG"),
(2400, "8204 Arthur St",        null         , "London"     ,      ""         ,"UK"),
(2700, "Schwanthalerstr. 703",  80925       , "Munich"     , "Bavaria"        ,"DE"),
(2900, "20 Rue des Corps-Sai",  1730        , "Geneva"     , "Geneve"         ,"CH"),
(3000, "Murtenstrasse 921",     3095        , "Bern"       , "BE"             ,"CH");



insert into departments values
(30, "Purchasing"          , 114, 1700),
(40, "Human Resources"     , 203, 2400),
(50, "Shipping"            , 121, 1500),
(100, "Finance"             , 108, 1700),
(110, "Accounting"          , 205, 1700),
(120, "Treasury"            ,   0, 1700),
(130, "Corporate Tax"       ,   0, 1700),
(140, "Control And Credit"  ,   0, 1700),
(150, "Shareholder Services",   0, 1700),
(160, "Benefits"            ,   0, 1700),
(170, "Manufacturing"       ,   0, 1700),
(180, "Construction"        ,   0, 1700),
(190, "Contracting"         ,   0, 1700),
(200, "Operations"          ,   0, 1700),
(210, "IT Support"          ,   0, 1700),
(220, "NOC"                 ,   0, 1700),
(230, "IT Helpdesk"         ,   0, 1700),
(240, "Government Sales"    ,   0, 1700),
(250, "Retail Sales"        ,   0, 1700),
(260, "Recruiting"          ,   0, 1700),
(270, "Payroll"             ,   0, 1700);


insert into jobs values
("AD_ASST"   , "Administration Assistant", 3000,  6000),
("FI_MGR"    , "Finance Manager"         , 8200, 16000),
("FI_ACCOUNT", "Accountant"              , 4200,  9000),
("AC_MGR"    , "Accounting Manager"      , 8200, 16000),
("AC_ACCOUNT", "Public Accountant"       , 4200,  9000);
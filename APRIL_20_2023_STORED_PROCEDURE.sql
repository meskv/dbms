-- SYNTAX

-- DELIMITER {custom delimiter}
-- CREATE PROCEDURE {procedureName}([optional parameters])
-- BEGIN
--     // procedure body...
--     // procedure body...
-- END
-- {custom delimiter}

-- create Schema/Database
CREATE SCHEMA stored_proc_tutorial;

-- table creation
CREATE TABLE studentMarks (stud_id SMALLINT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY, total_marks INT, grade VARCHAR(5));

-- insert sample data
INSERT INTO studentMarks(total_marks, grade) VALUES(450, 'A'), (480, 'A+'), (490, 'A++'), (440, 'B+'),(400, 'C+'),(380,'C')
,(250, 'D'),(200,'E'),(100,'F'),(150,'F'),(220, 'E');


-- Creating MySQL STORED PROCEDURES
SELECT * FROM studentMarks;

DELIMITER $$
CREATE PROCEDURE GetStudentData()
BEGIN
	SELECT * FROM studentMarks;
END$$
DELIMITER ;

CALL GetStudentData();

-- syntax for specifying parameters in a MySQL procedure.
-- [IN/OUT/INOUT] {parameter_name} {datatype}

-- Procedure with Input Parameters
-- 1. create a stored procedure to fetch the details of students 
-- with the student ID being passed as an input parameter.

DELIMITER //
CREATE PROCEDURE stored_proc_tutorial.spGetDetailsByStudentName(IN studentId INT)
BEGIN
    SELECT * FROM studentMarks where stud_id = studentId;
END //
DELIMITER ;

CALL stored_proc_tutorial.spGetDetailsByStudentName(1);

-- Procedure with Output Parameters
-- 3. create a stored procedure to calculate the average marks of all the 
-- students from the studentMarks table and return the average as an OUT field.
DELIMITER //
CREATE PROCEDURE stored_proc_tutorial.spGetAverageMarks(OUT average DECIMAL(5,2))
BEGIN
    SELECT AVG(total_marks) INTO average FROM studentMarks;
END //
DELIMITER ;

-- we have specified “@average_marks” which would hold the value of OUT 
-- parameter average as returned by the execution.
CALL stored_proc_tutorial.spGetAverageMarks(@average_marks);

SELECT @average_marks;

-- Procedures With INOUT PARAMETERS
DELIMITER //
CREATE PROCEDURE stored_proc_tutorial.spUpdateCounter(INOUT counter INT, IN increment INT)
BEGIN
    SET counter = counter + increment;
END //
DELIMITER ;

SET @counter=10;
CALL stored_proc_tutorial.spUpdateCounter(@counter,3);
SELECT @counter;

-- MySQL STORED PROCEDURES Local Variables
-- SYNTAX
-- DECLARE {varName} DATATYPE [DEFAULT value] ;

DELIMITER //
CREATE PROCEDURE stored_proc_tutorial.spCountOfBelowAverage(OUT countBelowAverage INT)
BEGIN
    DECLARE avgMarks DECIMAL(5,2) DEFAULT 0;
    SELECT AVG(total_marks) INTO avgMarks FROM studentMarks;
    SELECT COUNT(*) INTO countBelowAverage FROM studentMarks WHERE total_marks < avgMarks;
END //
DELIMITER ;

CALL stored_proc_tutorial.spCountOfBelowAverage(@countBelowAverage);
SELECT @countBelowAverage;

-- Listing All STORED PROCEDURES
SHOW PROCEDURE STATUS WHERE name LIKE 'sp%'

-- Updating A STORED PROCEDURE
-- There are 2 levels of updates that can be done to an existing procedure
-- ALTER PROCEDURE {procedure_name} [CHARACTERISTIC...]

DELIMITER //
CREATE PROCEDURE stored_proc_tutorial.spAlterProcTutorial()
BEGIN
    SELECT "Hello World!";
END //
DELIMITER ;

-- Now try to Alter
ALTER PROCEDURE stored_proc_tutorial.spAlterProcTutorial COMMENT 'altering comments!'

SHOW CREATE PROCEDURE stored_proc_tutorial.spAlterProcTutorial;

-- Deleting Procedures
-- DROP PROCEDURE [IF EXISTS] {stored_proc_name}

DROP PROCEDURE IF EXISTS stored_proc_tutorial.spGetAverageMarks;

-- Calling A Procedure From Another STORED PROCEDURE
-- NESTED Procedure

DELIMITER $$
CREATE PROCEDURE stored_proc_tutorial.spGetIsAboveAverage(IN studentId INT, OUT isAboveAverage BOOLEAN)
BEGIN
    DECLARE avgMarks DECIMAL(5,2) DEFAULT 0;
    DECLARE studMarks INT DEFAULT 0;
    SELECT AVG(total_marks) INTO avgMarks FROM studentMarks;
    SELECT total_marks INTO studMarks FROM studentMarks WHERE stud_id = studentId; 
    IF studMarks > avgMarks THEN
        SET isAboveAverage = TRUE;
    ELSE
        SET isAboveAverage = FALSE;
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE stored_proc_tutorial.spGetStudentResult(IN studentId INT, OUT result VARCHAR(20))
BEGIN
      -- nested stored procedure call
    CALL stored_proc_tutorial.spGetIsAboveAverage(studentId,@isAboveAverage);
    IF @isAboveAverage = 0 THEN
        SET result = "FAIL";
    ELSE
        SET result = "PASS";
    END IF;
END$$
DELIMITER ;

CALL stored_proc_tutorial.spGetStudentResult(2,@result);
SELECT @result;

CALL stored_proc_tutorial.spGetStudentResult(10,@result);
SELECT @result;

-- Using Conditional Statements

DELIMITER $$
CREATE PROCEDURE stored_proc_tutorial.spGetStudentClass(IN studentId INT, OUT class VARCHAR(20))
BEGIN
    DECLARE marks INT DEFAULT 0;
    SELECT total_marks INTO marks FROM studentMarks WHERE stud_id = studentId;
        IF marks >= 400 THEN
        SET class = "First Class";
    ELSEIF marks >=300 AND marks < 400 THEN
        SET class = "Second Class";
    ELSE
        SET class = "Failed";
    END IF;
END$$
DELIMITER ;

CALL stored_proc_tutorial.spGetStudentClass(1,@class);
SELECT @class;

CALL stored_proc_tutorial.spGetStudentClass(6,@class);
SELECT @class;

CALL stored_proc_tutorial.spGetStudentClass(11,@class);
SELECT @class;

-- CALL GetStudentData();

-- Error Handling In STORED PROCEDURES
-- DECLARE {action} HANDLER FOR {condition} {statement}
-- {ACTION} - CONTINUE or EXIT
-- {condition}: It’s the event that would cause the HANDLER to be invoked.

-- DECLARE EXIT HANDLER FOR 1062
-- BEGIN
--   SELECT 'DUPLICATE KEY ERROR' AS errorMessage;
-- END;


DELIMITER $$
CREATE PROCEDURE stored_proc_tutorial.spInsertStudentData(IN studentId INT, 
IN total_marks INT, 
IN grade VARCHAR(20),
OUT rowCount INT)
BEGIN
 
-- USING ERROR HANDLING IN STORED PROCEDURE
-- error Handler declaration for duplicate key
DECLARE EXIT HANDLER FOR 1062
    BEGIN
    SELECT 'DUPLICATE KEY ERROR' AS errorMessage;
    END;
 
-- main procedure statements
INSERT INTO studentMarks(stud_id, total_marks, grade) VALUES(studentId,total_marks,grade);
    SELECT COUNT(*) FROM studentMarks INTO rowCount;
END$$
DELIMITER ;

CALL stored_proc_tutorial.spInsertStudentData(1,450,'A+',@rowCount);
SELECT @rowCount;

-- DELETE AND DECLARE AGAIN, USE CONTINUE
DROP PROCEDURE stored_proc_tutorial.spInsertStudentData;

DELIMITER $$
CREATE PROCEDURE stored_proc_tutorial.spInsertStudentData(IN studentId INT, 
IN total_marks INT, 
IN grade VARCHAR(20),
OUT rowCount INT)
BEGIN
    DECLARE CONTINUE HANDLER FOR 1062
    BEGIN
        SELECT 'DUPLICATE KEY ERROR' AS errorMessage;
    END;
    INSERT INTO studentMarks(stud_id, total_marks, grade) VALUES(studentId,total_marks,grade);
    SELECT COUNT(*) FROM studentMarks INTO rowCount;
END$$
DELIMITER ;

CALL stored_proc_tutorial.spInsertStudentData(1,450,'A+',@rowCount);
SELECT @rowCount;



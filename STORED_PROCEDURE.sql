-- SYNTAX

-- DELIMITER {custom delimiter}k
-- CREATE PROCEDURE {procedureName}([optional parameters])
-- BEGIN
--     // procedure body...
--     // procedure body...
-- END
-- {custom delimiter}

-- create schema
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
DELIMITER //
CREATE PROCEDURE stored_proc_tutorial.spGetDetailsByStudentName(IN studentId INT)
BEGIN
    SELECT * FROM studentMarks where stud_id = studentId;
END //
DELIMITER ;

CALL stored_proc_tutorial.spGetDetailsByStudentName(1);

-- Procedure with Output Parameters
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




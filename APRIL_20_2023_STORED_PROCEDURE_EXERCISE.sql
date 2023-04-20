-- 2. create a stored procedure to fetch the details of students having 
-- certain grade with the grade being passed as an input parameter

DELIMITER //
CREATE PROCEDURE stored_proc_tutorial.spGetDetailsByStudentGrade(IN studentGrade VARCHAR(2))
BEGIN
    SELECT * FROM studentMarks where grade = studentGrade;
END //
DELIMITER ;

CALL stored_proc_tutorial.spGetDetailsByStudentGrade('A+');

-- 4. create a stored procedure to fetch the minimum mark corresponding to a grade 
-- with the grade being passed as an input parameter and return the minimum mark as 
-- an OUT field.
DELIMITER //
CREATE PROCEDURE stored_proc_tutorial.spGetMinMarks(OUT minimumMarks INT, IN studentGrade VARCHAR(2))
BEGIN
    SELECT MIN(total_marks) INTO minimumMarks FROM studentMarks WHERE grade = studentGrade;
END //
DELIMITER ;
 
-- calling procedure
CALL stored_proc_tutorial.spGetMinMarks(@minimumMarks, "F");
 
-- obtaining value of the OUT parameter
SELECT @minimumMarks;


-- 6. create a stored procedure that takes a studentID as a input parameter 
-- and increments the marks of the student by a given number as INOUT parameter.
-- The final marks of the student must be stored in the INOUT paramaeter.

DELIMITER //
CREATE PROCEDURE stored_proc_tutorial.spIncrementStudentMarks(INOUT marks INT, IN studentID INT, IN increment INT)
BEGIN
    SET marks = marks + increment;
END //
DELIMITER ;

SET @marks=10;
CALL stored_proc_tutorial.spIncrementStudentMarks(@marks, 3, 50);
SELECT @marks;

SELECT * FROM studentMarks








 -- to fetch the highest marks from a student data table. We can have one 
 -- like this with the highest marks stored in an OUT parameter
DELIMITER //
CREATE PROCEDURE stored_proc_tutorial.spGetMaxMarks(OUT highestMarks INT)
BEGIN
    SELECT MAX(total_marks) INTO highestMarks FROM studentMarks;
END //
DELIMITER ;
 
-- calling procedure
CALL stored_proc_tutorial.spGetMaxMarks(@highestMarks);
 
-- obtaining value of the OUT parameter
SELECT @highestMarks;
-- BEFORE DELETE TRIGGER

DROP TABLE IF EXISTS Salaries;

CREATE TABLE Salaries (
    employeeNumber INT PRIMARY KEY,
    validFrom DATE NOT NULL,
    amount DEC(12 , 2 ) NOT NULL DEFAULT 0
);

-- Inserting values

INSERT INTO salaries(employeeNumber,validFrom,amount)
VALUES
    (1002,'2000-01-01',50000),
    (1056,'2000-01-01',60000),
    (1076,'2000-01-01',70000);

SELECT * FROM salaries;

DROP TABLE IF EXISTS SalaryArchives;    

CREATE TABLE SalaryArchives (
    id INT PRIMARY KEY AUTO_INCREMENT,
    employeeNumber INT,
    validFrom DATE NOT NULL,
    amount DEC(12 , 2 ) NOT NULL DEFAULT 0,
    deletedAt TIMESTAMP DEFAULT NOW()
);


-- Creaeting Before Delete Trigger

DELIMITER $$

CREATE TRIGGER before_salaries_delete
BEFORE DELETE
ON salaries FOR EACH ROW
BEGIN
    INSERT INTO SalaryArchives(employeeNumber,validFrom,amount)
    VALUES(OLD.employeeNumber,OLD.validFrom,OLD.amount);
END$$    

DELIMITER ;

-- Testing

DELETE FROM salaries 
WHERE employeeNumber = 1002;

SELECT * FROM SalaryArchives;    

DELETE FROM salaries;

SELECT * FROM SalaryArchives;



-- AFTER DELETE TRIGGER
SELECT * FROM salaries;
DELETE FROM salaryarchives;

-- Inserting Values
INSERT INTO salaries(employeeNumber,validFrom,amount)
VALUES
    (1003,'2000-01-01',50000),
    (1058,'2000-01-01',60000),
    (1072,'2000-01-01',70000);

SELECT * FROM salaries;

DELIMITER $$

CREATE TRIGGER after_salaries_delete
AFTER DELETE
ON salaries FOR EACH ROW
BEGIN
    INSERT INTO SalaryArchives(employeeNumber,validFrom,amount)
    VALUES(OLD.employeeNumber,OLD.validFrom,OLD.amount);
END$$    

DELIMITER ;

-- Testing
DELETE FROM salaries 
WHERE employeeNumber = 1058;

SELECT * FROM SalaryArchives;    

DELETE FROM salaries;

SELECT * FROM SalaryArchives;







 
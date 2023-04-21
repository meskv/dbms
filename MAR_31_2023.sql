-- db1 - MINOR DEGREE MARCH 31, 2023
USE db1;
DROP TABLE IF EXISTS WorkCenters;

CREATE TABLE WorkCenters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    capacity INT NOT NULL
);

DROP TABLE IF EXISTS WorkCenterStats;

CREATE TABLE WorkCenterStats(
    totalCapacity INT NOT NULL
);

DELIMITER $$
CREATE TRIGGER before_workcenters_insert
BEFORE INSERT
ON WorkCenters FOR EACH ROW
BEGIN
    DECLARE rowcount INT;
    
    SELECT COUNT(*) 
    INTO rowcount
    FROM WorkCenterStats;
    
    IF rowcount > 0 THEN
        UPDATE WorkCenterStats
        SET totalCapacity = totalCapacity + new.capacity;
    ELSE
        INSERT INTO WorkCenterStats(totalCapacity)
        VALUES(new.capacity);
    END IF; 

END $$
DELIMITER ;

SELECT * FROM WorkCenters;
SELECT * FROM WorkCenterStats;

-- Testing
INSERT INTO WorkCenters(name, capacity)
VALUES('Mold Machine',100);

SELECT * FROM WorkCenters;
SELECT * FROM WorkCenterStats;

-- After Trigger

DELIMITER $$
CREATE TRIGGER after_workcenters_insert
AFTER INSERT
ON WorkCenters FOR EACH ROW
BEGIN
	DECLARE rowcount INT;
    
    SELECT COUNT(*) 
    INTO rowcount
    FROM WorkCenterStats;
    
    IF rowcount > 0 THEN
        UPDATE WorkCenterStats
        SET totalCapacity = totalCapacity + new.capacity;
    ELSE
        INSERT INTO WorkCenterStats(totalCapacity)
        VALUES(new.capacity);
	END IF;
END$$
DELIMITER ;

-- Testing
INSERT INTO WorkCenters(name, capacity)
VALUES('Mold Machine 2',200);

SELECT * FROM WorkCenters;
SELECT * FROM WorkCenterStats;


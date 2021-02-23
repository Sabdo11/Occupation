-- occupations database
-- created at: 02/22/21
-- author: Selamawit T. Abdo

CREATE DATABASE occupations;

-- USE the created database
USE occupations;

-- Drop table if it exists
DROP TABLE IF EXISTS Occupations;

-- TODOd: create table Occupations
CREATE TABLE Occupations(
    id INT NOT NULL AUTO_INCREMENT ,
    code VARCHAR(20),
    occupation VARCHAR(100),
    jobFamily VARCHAR(50),
    PRIMARY KEY (id)
    );

-- TODOd: populate occupations table
LOAD DATA LOCAL INFILE '/Users/selamawitabdo/Desktop/Spring2021/database/Homeworks/Occupations/occupations.csv' INTO TABLE Occupations FIELDS Terminated By ',' ENCLOSED BY '"' IGNORE 1 ROWS(code, occupation , jobFamily);

-- TODOd: a) the total number of occupations (expect 1016).
SELECT COUNT(*) FROM Occupations;

-- TODOd: b) a list of all job families in alphabetical order (expect 23).
SELECT DISTINCT jobFamily from Occupations ORDER BY jobFamily ASC;

-- TODOd: c) the total number of job families (expect 23)
Select count(DISTINCT jobFamily) from Occupations;

-- TODOd: d) the total number of occupations per job family in alphabetical order of job family.
SELECT jobFamily , count(*) AS 'Total Number Of Occupations' FROM Occupations GROUP BY jobFamily ORDER BY jobFamily ASC;

-- TODOd: e) the number of occupations in the "Computer and Mathematical" job family (expect 38)
SELECT count(*) FROM Occupations WHERE jobFamily LIKE "Computer and Mathematical";

-- TODOd: f) an alphabetical list of occupations in the "Computer and Mathematical" job family.
SELECT occupation FROM Occupations WHERE jobFamily LIKE "Computer and Mathematical" ORDER BY occupation ASC;

-- TODOd: g) an alphabetical list of occupations in the "Computer and Mathematical" job family that begins with the word "Database"
SELECT occupation FROM Occupations WHERE jobFamily LIKE "Computer and Mathematical" AND occupation LIKE "DATABASE%";
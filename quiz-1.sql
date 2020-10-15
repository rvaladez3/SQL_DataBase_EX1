CREATE TABLE Classes(
class CHAR(25),
type CHAR(2),
country CHAR(25),
numGuns INT(2),
bore INT(2),
displacement INT(5)
);

CREATE TABLE Ships(
name CHAR(25),
class CHAR (25),
launched INT(4)
);

CREATE TABLE Battles(
name CHAR(25),
date date
);

CREATE TABLE Outcomes(
ship CHAR(25),
battle CHAR(25),
result CHAR(7)
);

INSERT INTO Classes VALUES("Bismarck", "bb","Germany",8,15,42000);
INSERT INTO Classes VALUES("Iowa","bb","USA",9,16,46000);
INSERT INTO Classes VALUES("Kongo", "bc","Japan",8,14,32000);
INSERT INTO Classes VALUES("North Carolina","bb","USA",9,16,37000);
INSERT INTO Classes VALUES("Renown","bc","Britain",6,15,32000);
INSERT INTO Classes VALUES("Revenge","bb","Britain",8,15,29000);
INSERT INTO Classes VALUES("Tennessee","bb","USA",12,14,32000);
INSERT INTO Classes VALUES("Yamato","bb","Japan",9,18,65000);

INSERT INTO Battles VALUES("Denmark Strait", "05/24/41"); 
INSERT INTO Battles VALUES("Guadalcanal", "11/15/42");
INSERT INTO Battles VALUES("North Cape", "12/26/43");
INSERT INTO Battles VALUES("Surigao Strait", "10/25/44");

INSERT INTO Outcomes VALUES("California", "Surigao Strait", "ok"); 
INSERT INTO Outcomes VALUES("Kirishima", "Guadalcanal","sunk");
INSERT INTO Outcomes VALUES("Resolution", "Denmark Strait","ok");
INSERT INTO Outcomes VALUES("Wisconsin", "Guadalcanal","damaged");
INSERT INTO Outcomes VALUES("Tennessee", "Surigao Strait","ok"); 
INSERT INTO Outcomes VALUES("Washington", "Guadalcanal","ok");
INSERT INTO Outcomes VALUES("New Jersey", "Surigao Strait","ok");
INSERT INTO Outcomes VALUES("Yamato", "Surigao Strait","sunk");
INSERT INTO Outcomes VALUES("Wisconsin", "Surigao Strait","damaged"); 

INSERT INTO Ships VALUES("California", "Tennessee", "1915"); 
INSERT INTO Ships VALUES("Haruna", "Kongo","1915");
INSERT INTO Ships VALUES("Hiei", "Kongo","1915");
INSERT INTO Ships VALUES("Iowa", "Iowa","1933");
INSERT INTO Ships VALUES("Kirishima", "Kongo","1915"); 
INSERT INTO Ships VALUES("Kongo", "Kongo","1913");
INSERT INTO Ships VALUES("Missouri", "Iowa","1935");
INSERT INTO Ships VALUES("Musashi", "Yamato","1942");
INSERT INTO Ships VALUES("New Jersey", "Iowa","1936"); 
INSERT INTO Ships VALUES("North Carolina", "North Carolina", "1941"); 
INSERT INTO Ships VALUES("Ramillies", "Revenge","1917");
INSERT INTO Ships VALUES("Renown", "Renown","1916");
INSERT INTO Ships VALUES("Repulse", "Renown","1916");
INSERT INTO Ships VALUES("Resolution", "Revenge","1916"); 
INSERT INTO Ships VALUES("Revenge", "Revenge","1916");
INSERT INTO Ships VALUES("Royal Oak", "Revenge","1916");
INSERT INTO Ships VALUES("Royal Sovereign", "Revenge","1916");
INSERT INTO Ships VALUES("Tennessee", "Tennessee","1915"); 
INSERT INTO Ships VALUES("Washington", "North Carolina","1941");
INSERT INTO Ships VALUES("Wisconsin", "Iowa","1940");
INSERT INTO Ships VALUES("Yamato", "Yamato","1941"); 

-- Problem #3
SELECT class, country from Classes where bore >= 15;

-- Problem #4
SELECT name FROM Ships WHERE launched < 1918; 

-- Problem #5
SELECT ship FROM Outcomes WHERE result = "sunk" AND battle = "Surigao Strait";

-- Problem #6
SELECT name FROM Classes JOIN Ships ON Classes.displacement > 40000 AND Ships.launched > 1921;

-- Problem #7
SELECT ship, displacement, numGuns FROM Outcomes JOIN Ships ON Outcomes.ship = Ships.name JOIN Classes ON Ships.class = Classes.class WHERE Outcomes.battle = "Surigao Strait";

-- Problem #8
SELECT name FROM Ships UNION SELECT class FROM Classes UNION SELECT ship FROM Outcomes; 

-- Problem #9
SELECT class FROM Ships Group BY class HAVING COUNT(*) = 2;

-- Problem #10
SELECT country FROM Classes GROUP BY country HAVING count(DISTINCT Classes.type) = 2;

-- Problem #11
SELECT DISTINCT ship FROM Outcomes WHERE Outcomes.result = "damaged";





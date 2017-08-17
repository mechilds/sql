/* Question 1 */

DROP SCHEMA IF EXISTS BuildingEnergy;

CREATE SCHEMA BuildingEnergy;

USE BuildingEnergy;

/* Question 2 */ 

DROP TABLE IF EXISTS EnergyCategory;

CREATE TABLE EnergyCategory(
	categoryID INT NOT NULL,
    category CHAR(20) NOT NULL,
    PRIMARY KEY (categoryID)
);
    
INSERT INTO EnergyCategory
(categoryID, category)
VALUES
(1, 'Fossil'),
(2, 'Renewable');

DROP TABLE IF EXISTS EnergyTypes;

CREATE TABLE EnergyTypes(
	energytypeID INT NOT NULL, 
	energytype CHAR(20) NOT NULL,
	categoryID INT NOT NULL,
	PRIMARY KEY (energytypeID)
);

INSERT INTO EnergyTypes
(energytypeID, energytype, categoryID)
VALUES 
(1, 'Electricity', 1),
(2, 'Gas', 1),
(3, 'Steam', 1),
(4, 'Fuel Oil', 1),
(5, 'Solar', 2),
(6, 'Wind', 2);

/* Question 3 */

SELECT
EnergyCategory.category, EnergyTypes.energytype
FROM EnergyTypes
LEFT JOIN EnergyCategory ON EnergyTypes.categoryID = EnergyCategory.categoryID
ORDER BY EnergyTypes.energytype, EnergyCategory.category;

/* Question 4 and 5 */

DROP TABLE IF EXISTS Buildings;

CREATE TABLE Buildings(
    buildingname CHAR(40) NOT NULL,
    buildingID INT NOT NULL,
    PRIMARY KEY (buildingID)
);

INSERT INTO Buildings
VALUES
('Empire State Building', 1),
('Borough of Manhattan Community College', 2),
('Chrysler Building', 3);


DROP TABLE IF EXISTS BuildingEnergyType;

CREATE TABLE BuildingEnergyType(
	buildingenergytypeID INT NOT NULL,
    buildingID INT NOT NULL,
    energytypeID INT NOT NULL,
    PRIMARY KEY(buildingenergytypeID)
);

INSERT INTO BuildingEnergyType
VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 1),
(5, 2, 3),
(6, 2, 5),
(7, 3, 1),
(8, 3, 3);

SELECT 
Buildings.buildingname, EnergyTypes.energytype
FROM
Buildings
LEFT JOIN BuildingEnergyType 
ON Buildings.buildingID = BuildingEnergyType.buildingID
LEFT JOIN EnergyTypes
ON EnergyTypes.energytypeID = BuildingEnergyType.energytypeID
ORDER BY Buildings.buildingname, EnergyTypes.energytype;

/* Question 6 */

INSERT INTO Buildings
VALUES
('Bronx Lion House', 4),
('Brookly Childrens Museum', 5);

INSERT INTO EnergyTypes
VALUES
(7, 'Geothermal', 2);

INSERT INTO BuildingEnergyType
VALUES
(9, 4, 7),
(10, 5, 1),
(11, 5, 7);

/*Question 7 */

SELECT 
Buildings.buildingname, EnergyCategory.category
FROM
Buildings
LEFT JOIN BuildingEnergyType 
ON Buildings.buildingID = BuildingEnergyType.buildingID
LEFT JOIN EnergyTypes
ON EnergyTypes.energytypeID = BuildingEnergyType.energytypeID
LEFT JOIN EnergyCategory
ON EnergyTypes.categoryID = EnergyCategory.categoryID
WHERE EnergyCategory.categoryID = 2
ORDER BY Buildings.buildingname, EnergyCategory.category;

/* Question 8 */


SELECT 
Energytypes.energytype,
COUNT(energytype) AS 'Instances'
FROM
EnergyTypes
LEFT JOIN BuildingEnergyType 
ON EnergyTypes.energytypeID = BuildingEnergyType.energytypeID
GROUP BY EnergyTypes.energytype
ORDER BY Instances DESC;

/* Question 9a: Add foriegn key constraints */

ALTER TABLE EnergyTypes MODIFY COLUMN categoryID INT NOT NULL,
ADD CONSTRAINT EnergyCategory_categoryID_fk
FOREIGN KEY (categoryID)
REFERENCES EnergyCategory(categoryID);

ALTER TABLE BuildingEnergyType MODIFY COLUMN buildingID INT NOT NULL,
ADD CONSTRAINT Buildings_buildingID_fk
FOREIGN KEY (buildingID)
REFERENCES Buildings(buildingID);

ALTER TABLE BuildingEnergyType MODIFY COLUMN energytypeID INT NOT NULL,
ADD CONSTRAINT EnergyTypes_energytypeID_fk
FOREIGN KEY (energytypeID)
REFERENCES EnergyTypes(energytypeID);

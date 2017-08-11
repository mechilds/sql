
DROP SCHEMA IF EXISTS organization_chart;

CREATE SCHEMA organization_chart;
 
USE organization_chart;
 
DROP TABLE IF EXISTS organization;

CREATE TABLE organization(
	employee_id INT PRIMARY KEY NOT NULL,
	employee_firstname VARCHAR(20),
    manager_id INT,
	employee_supervisor VARCHAR(20),
	employee_title VARCHAR(40)
);

INSERT INTO organization VALUES (1, 'Jack', NULL, NULL, 'Executive');
INSERT INTO organization VALUES (2, 'Liz', 1, 'Jack', 'Head Writer');
INSERT INTO organization VALUES (3, 'Pete', 1, 'Jack', 'Producer');
INSERT INTO organization VALUES (4, 'Frank', 2, 'Liz', 'Writer');
INSERT INTO organization VALUES (5, 'Cerie', 2, 'Liz', 'Assistant');
INSERT INTO organization VALUES (6, 'Jonathan', 1, 'Jack', 'Executive Assistant');
INSERT INTO organization VALUES (7, 'Tracey', 3, 'Pete', 'Actor');

SELECT 
employees.employee_firstname AS 'Employee Name',
managers.employee_firstname AS 'Manager Name',
employees.employee_title AS 'Title'
FROM organization AS employees
LEFT JOIN organization AS managers
ON employees.manager_id = managers.employee_id
ORDER BY managers.employee_firstname

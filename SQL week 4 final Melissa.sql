CREATE TABLE users(username TEXT, usergroup TEXT)
INSERT INTO users VALUES('Modesto', 'IT');
INSERT INTO users VALUES('Ayine', 'IT');
INSERT INTO users VALUES('Christopher', 'Sales');
INSERT INTO users VALUES('Cheong Woo', 'Sales');
INSERT INTO users VALUES('Saulat', 'Administration');
INSERT INTO users VALUES(NULL, 'Operations');
INSERT INTO users VALUES('Heidy', NULL);

CREATE TABLE access (room TEXT, usergroup TEXT)
INSERT INTO access VALUES('101', 'IT');
INSERT INTO access VALUES('102', 'IT');
INSERT INTO access VALUES('Auditorium A','Sales');
INSERT INTO access VALUES('Auditorium B', NULL);
INSERT INTO access VALUES('102', 'Sales')


CREATE TABLE jobgroup (usergroup TEXT)
INSERT INTO jobgroup VALUES('IT');
INSERT INTO jobgroup VALUES('Sales');
INSERT INTO jobgroup VALUES('Administration');
INSERT INTO jobgroup VALUES('Operations');


/* all groups and users in each group */
SELECT 
*
FROM users

/* all rooms, and the groups assigned to each room */
SELECT 
*
FROM access

/* all users, the groups they belong to, and rooms they are assigned to, sorted by user, then group, then room */

SELECT 
users.username AS 'User',
access.room AS 'Room',
jobgroup.usergroup AS 'Job'
FROM users
LEFT JOIN jobgroup
ON users.usergroup = jobgroup.usergroup
LEFT JOIN access
ON jobgroup.usergroup = access.usergroup
WHERE users.username IS NOT NULL
ORDER BY users.username, jobgroup.usergroup





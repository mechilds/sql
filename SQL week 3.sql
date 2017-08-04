CREATE TABLE videos (uniqueid INTEGER, title TEXT, length INTEGER, url TEXT)
INSERT INTO videos VALUES(1, 'my sql database tutorial - 22 - how to join tables', 508, 'https://www.youtube.com/watch?v=6BfofgkrI3Y')
INSERT INTO videos VALUES(2, 'my sql tutorial', 2649, 'https://www.youtube.com/watch?v=yPu6qV5byu4')
INSERT INTO videos VALUES(3, 'sql server queries part 1 - writing basic queries', 976,'https://www.youtube.com/watch?v=2-1XQHAgDsM')
INSERT INTO videos VALUES(4, 'sql basics - lesson 1 - introduction', 1909, 'https://www.youtube.com/watch?v=pJCyTBkoIKA')

CREATE TABLE reviews (uniqueid INTEGER, username TEXT, rating INTEGER, review TEXT)
INSERT INTO reviews VALUES (1, 'anonymous', 5, 'great video!')
INSERT INTO reviews VALUES (1, 'sql-123', 2, 'i did not like this video')
INSERT INTO reviews VALUES (2, 'random', 5, 'i learned a lot about sql')
INSERT INTO reviews VALUES (3, 'unique-name', 3, 'this video was okay')
INSERT INTO reviews VALUES (4, 'person', 4, 'good introduction to sql')
INSERT INTO reviews VALUES (4, 'someone', 3, 'average tutorial')

SELECT *
FROM videos
INNER JOIN reviews
ON videos.uniqueid = reviews.uniqueid
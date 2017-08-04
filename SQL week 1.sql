/* Question 1 */
/* The farthest destination is "HNL', the distance is 4938 */
SELECT 
dest,
distance
FROM flights
ORDER BY distance DESC


/* Question 2 */
/* Each plane has 1, 2, 3, or 4 engines. 
The greatest number of seats for a one-engine aircraft is the 150 model, and has 2 seats. 
For the two-engine aircraft, the EMB-145XR model has the most seats with 55 seats.
 For the three-engine aircraft, the A330-223 model has the most seats with 379 seats.
 For the four-engine aircraft, the A340-313 model has the most seats with 375 seats.*/
SELECT 
DISTINCT
engines
FROM planes

SELECT
engines, 
seats, 
model
FROM planes
GROUP BY engines
ORDER BY engines, seats DESC

/* Question 3 */
/* The total number of flights = 336776 */
SELECT flight,
COUNT(flight) AS 'number of total flights'
FROM flights


/* Question 4 */
SELECT carrier,
COUNT(carrier) AS 'total number of flights per carrier'
FROM flights
GROUP BY carrier
ORDER BY carrier

/* Question 5 */
SELECT carrier,
COUNT(carrier) AS 'total number of flights per carrier'
FROM flights
GROUP BY carrier
ORDER BY 2 DESC

/* Question 6 */
SELECT carrier,
COUNT(carrier) AS 'total number of flights per carrier'
FROM flights
GROUP BY carrier
ORDER BY 2 DESC
LIMIT 5

/* Question 7 */
SELECT carrier, distance,
COUNT(carrier) AS 'total number of flights per carrier'
FROM flights
WHERE distance >1000
GROUP BY carrier, distance
ORDER BY distance DESC
LIMIT 5

/* Question 8 */
/* What month did the most flights depart from JFK? */
SELECT 
origin, month,
COUNT(flight) AS 'Total Flights'
FROM flights
WHERE origin = 'JFK'
GROUP BY origin, month
ORDER BY 3 DESC
LIMIT 1

-- Create Table to Import our CSV file into it
CREATE TABLE flights (
    id INT,
    year INT,
    month INT,
    day INT,
    dep_time INT,
    sched_dep_time INT,
    dep_delay INT,
    arr_time INT,
    sched_arr_time INT,
    arr_delay INT,
    carrier VARCHAR,
    flight INT,
    tailnum VARCHAR,
    origin VARCHAR,
    dest VARCHAR,
    air_time INT,
    distance INT,
    hour INT,
    minute INT,
    time_hour TIMESTAMP,
    name VARCHAR
);

-----------------------------------------------------------
-- Query 1 – Top 5 Airlines by Number of Flights 

SELECT carrier, COUNT(*) AS total_flights FROM flights
GROUP BY carrier
ORDER BY total_flights DESC
LIMIT 5;

-----------------------------------------------------------

-- Query 2 – Average Departure Delay by Airline

SELECT carrier, ROUND(AVG(dep_delay), 2) AS avg_dep_delay
FROM flights
GROUP BY carrier
ORDER BY avg_dep_delay DESC;

------------------------------------------------
--  Query 3 – Top 5 Destination Airports

SELECT dest, COUNT(*) AS total_arrivals
FROM flights
GROUP BY dest
ORDER BY total_arrivals DESC
LIMIT 5;

---------------------------------------------------
--  Query 4 – Monthly Average Departure Delay

SELECT month, ROUND(AVG(dep_delay), 2) AS avg_monthly_delay
FROM flights
GROUP BY month
ORDER BY avg_monthly_delay DESC;

--------------------------------------------------
-- Query 5 – Average Departure Delay by Scheduled Hour

SELECT hour, 
       ROUND(AVG(dep_delay), 2) AS avg_dep_delay,
       COUNT(*) AS total_flights
FROM flights
GROUP BY hour
ORDER BY hour;

--------------------------------------------------
-- Query 6 – Average Departure Delay for Morning vs Evening Flights

SELECT 
  CASE 
    WHEN hour BETWEEN 5 AND 11 THEN 'Morning (5AM-11AM)'
    WHEN hour BETWEEN 12 AND 17 THEN 'Afternoon (12PM-5PM)'
    WHEN hour BETWEEN 18 AND 23 THEN 'Evening (6PM-11PM)'
    ELSE 'Night (12AM-4AM)'
  END AS time_period,
  ROUND(AVG(dep_delay), 2) AS avg_dep_delay,
  COUNT(*) AS total_flights
FROM flights
GROUP BY time_period
ORDER BY time_period;

--------------------------------------------------
-- Query 7 – Average Departure Delay by Airline and Time Period

SELECT 
  carrier,
  CASE 
    WHEN hour BETWEEN 5 AND 11 THEN 'Morning (5AM-11AM)'
    WHEN hour BETWEEN 12 AND 17 THEN 'Afternoon (12PM-5PM)'
    WHEN hour BETWEEN 18 AND 23 THEN 'Evening (6PM-11PM)'
    ELSE 'Night (12AM-4AM)'
  END AS time_period,
  ROUND(AVG(dep_delay), 2) AS avg_dep_delay,
  COUNT(*) AS total_flights
FROM flights
GROUP BY carrier, time_period
ORDER BY carrier, time_period;

---------------------------------------------------------------
-- Query 8 – Average Arrival Delay by Airline
SELECT carrier, ROUND(AVG(arr_delay), 2) AS avg_arr_delay
FROM flights
GROUP BY carrier
ORDER BY avg_arr_delay DESC;

---------------------------------------------------------------
-- Query 9 – Correlation Between Departure and Arrival Delays
SELECT corr(dep_delay, arr_delay) AS dep_arr_delay_correlation
FROM flights
WHERE dep_delay IS NOT NULL AND arr_delay IS NOT NULL;


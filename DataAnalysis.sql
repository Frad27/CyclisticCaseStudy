-- Data Analysis

-- Calculating average, min, max and mode
SELECT
	AVG(ride_length) AS avg_ride_length,
	MIN(ride_length) AS min_ride_length,
	MAX(ride_length) AS max_ride_length,
	(SELECT 
    	mode() WITHIN GROUP ( ORDER BY day_of_week )
	FROM cyclistic2023clean) AS mode_day_of_week
FROM cyclistic2023clean;

-- Average ride length by member type

SELECT
	member_casual,
	AVG(ride_length) AS avg_ride_length
FROM cyclistic2023clean
GROUP BY member_casual;

-- Number of rides per day of the week

SELECT
	CASE day_of_week
    WHEN '1' THEN 'Monday'
    WHEN '2' THEN 'Tuesday'
    WHEN '3' THEN 'Wednesday'
    WHEN '4' THEN 'Thursday'
    WHEN '5' THEN 'Friday'
    WHEN '6' THEN 'Saturday'
	WHEN '0' THEN 'Sunday'
  	END AS day_of_week,
	COUNT(*) AS number_of_rides,
	member_casual AS member_type
FROM cyclistic2023clean
GROUP BY member_casual, day_of_week
ORDER BY member_casual;

-- Number of rides per hour 

SELECT
	EXTRACT (hour FROM started_at) AS ride_started_hour,
	COUNT(*) AS number_of_rides,
	member_casual AS member_type
FROM cyclistic2023clean
GROUP BY member_casual, ride_started_hour
ORDER BY member_casual, ride_started_hour;

-- Number of rides per month

SELECT
	EXTRACT (month FROM started_at) AS ride_month,
	COUNT(*) AS number_of_rides,
	member_casual AS member_type
FROM cyclistic2023clean
GROUP BY member_casual, ride_month
ORDER BY member_casual, ride_month;

-- Number of rides per starting and ending locations

SELECT -- starting location
	start_station_name,
	COUNT(*) AS number_of_rides,
	member_casual AS member_type,
	AVG(start_lat) AS start_lat, 
	AVG(start_lng) AS start_lng
FROM cyclistic2023clean
GROUP BY start_station_name, member_casual
ORDER BY start_station_name, member_casual;

SELECT -- ending location
	end_station_name,
	COUNT(*) AS number_of_rides,
	member_casual AS member_type,
	AVG(end_lat) AS end_lat, 
	AVG(end_lng) AS end_lng
FROM cyclistic2023clean
GROUP BY end_station_name, member_casual
ORDER BY end_station_name, member_casual;

-- Number of rides by bike type

SELECT
	rideable_type,
	COUNT(*) AS number_of_rides,
	member_casual AS member_type
FROM cyclistic2023clean
GROUP BY rideable_type, member_casual
ORDER BY member_casual



		 
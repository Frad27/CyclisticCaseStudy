-- Determining how many null values we have in each column

SELECT
 COUNT(*) - COUNT(rideable_type) rideable_type,
 COUNT(*) - COUNT(started_at) started_at,
 COUNT(*) - COUNT(ended_at) ended_at,
 COUNT(*) - COUNT(start_station_name) start_station_name,
 COUNT(*) - COUNT(start_station_id) start_station_id,
 COUNT(*) - COUNT(end_station_name) end_station_name,
 COUNT(*) - COUNT(end_station_id) end_station_id,
 COUNT(*) - COUNT(start_lat) start_lat,
 COUNT(*) - COUNT(start_lng) start_lng,
 COUNT(*) - COUNT(end_lat) end_lat,
 COUNT(*) - COUNT(end_lng) end_lng,
 COUNT(*) - COUNT(member_casual) member_casual
FROM
  cyclistic2023

-- Creating new table with removed rows with null values

CREATE TABLE cyclistic2023clean AS
SELECT *
FROM cyclistic2023
WHERE start_station_name IS NOT NULL
  AND start_station_id IS NOT NULL
  AND end_station_name IS NOT NULL
  AND end_lat IS NOT NULL
  AND end_lng IS NOT NULL;

-- Checking if all rows with null values are removed from new table

SELECT COUNT(*) AS number_of_null_values
FROM cyclistic2023clean
WHERE start_station_name IS NULL
   OR start_station_id IS NULL
   OR end_station_name IS NULL
   OR end_lat IS NULL
   OR end_lng IS NULL;
   
-- Creating new columns for ride length and day of week

-- Step 1: Add the ride_length and day_of_week columns
ALTER TABLE cyclistic2023clean
ADD COLUMN ride_length interval,
ADD COLUMN day_of_week integer;

-- Step 2: Update the ride_length column
UPDATE cyclistic2023clean
SET ride_length = ended_at - started_at;

-- Step 3: Update the day_of_week column
UPDATE cyclistic2023clean
SET day_of_week = EXTRACT(DOW FROM started_at);




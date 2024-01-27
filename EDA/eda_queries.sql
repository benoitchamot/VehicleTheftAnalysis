/*
Author: Benoit Chamot
Date created: 27 Jan 2024
---
This file is used to explore the different tables in the database
in MySQL Workbench before connecting them to Python for further 
analysis

*/

-- Get a preview of the locations table
SELECT *
FROM locations
LIMIT 5;

-- Make sure only New Zealand is covered
-- Result: only New Zealand is returned
SELECT DISTINCT country
FROM locations;

-- Get the count and name of distincts region
-- Results: 16 different regions
SELECT COUNT(DISTINCT region) AS nb_of_regions
FROM locations;
SELECT DISTINCT location_id, region AS regions
FROM locations;

-- Get a preview of the make_details table
SELECT *
FROM make_details
LIMIT 5;

-- Get a list of the make_type
-- Results "Standard" and "Luxury"
SELECT DISTINCT make_type
FROM make_details;

-- Count the "Standard" and "Luxury" makes
-- Results: "Standard" = 123 and "Luxury" = 15
SELECT make_type, SUM(1) AS count
FROM make_details
GROUP BY make_type;

-- Count number of unique makes
-- Results: 138
SELECT COUNT(DISTINCT make_name)
FROM make_details;

-- Get a preview of the stolen_vehicles table
SELECT *
FROM stolen_vehicles
LIMIT 5;

-- Count the number of entries
-- Rsults: 4553
SELECT COUNT(vehicle_id)
FROM stolen_vehicles;
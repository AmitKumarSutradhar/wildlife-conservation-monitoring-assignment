-- Table Creation 
CREATE TABLE rangers (
	ranger_id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	region VARCHAR(100)
);

CREATE TABLE species(
	species_id SERIAL PRIMARY KEY,
	common_name VARCHAR(100),
	scientific_name VARCHAR(100),
	discovery_date TIMESTAMP,
	conservation_status VARCHAR(100)
);

CREATE TABLE sightings(
	sighting_id SERIAL PRIMARY KEY,
	ranger_id INTEGER REFERENCES rangers(ranger_id),
	species_id INTEGER REFERENCES species(species_id),
	sighting_time TIMESTAMP,
	location VARCHAR(100),
	notes VARCHAR(100)
);

-- Sample Data
INSERT INTO rangers(name, region) 
VALUES
	('Alice Green', 'Northern Hills'),
	('Bob White', 'River Delta'),
	('Carol King', 'Mountain Range');

INSERT INTO species(common_name, scientific_name, discovery_date, conservation_status)
VALUES
	('Snow Leopard ', 'Panthera uncia', '1775-01-01', 'Endangered'),
	('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
	('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
	('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

INSERT INTO sightings(ranger_id, species_id, sighting_time, location, notes)
VALUES
	(1, 1, '2024-05-10 07:45:00', 'Peak Ridge', 'Camera trap image captured'),
	(2, 2, '2024-05-12 16:20:00', 'Bankwood Area', 'Juvenile seen'),
	(3, 3, '2024-05-15 09:10:00', 'Bamboo Grove East', 'Feeding observed'),
	(2, 1, '2024-05-18 18:30:00', 'Snowfall Pass', '');
	

-- Show Sample Data Table 
SELECT * FROM species;
SELECT * FROM rangers;
SELECT * FROM sightings;



-- Problem 1 
INSERT INTO rangers(name, region) 
VALUES('Derek Fox', 'Coastal Plains');

-- Problem 2 
SELECT COUNT(DISTINCT species_id) AS unique_species_count 
FROM sightings;

-- Problem 3 
SELECT * FROM sightings WHERE location ILIKE '%Pass%';

-- Problem 4 
SELECT r.name, COUNT(s.sighting_id) AS total_sightings
FROM rangers r
LEFT JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.ranger_id, r.name
ORDER BY r.name ASC;

-- Problem 5 
SELECT sp.common_name
FROM species sp
LEFT JOIN sightings s ON sp.species_id = s.species_id
WHERE s.species_id IS NULL;

-- Problem 6 
SELECT 
	species.common_name,
	s.sighting_time,
	r.name AS name
FROM sightings s
JOIN rangers r ON s.ranger_id = r.ranger_id
JOIN species ON s.species_id = species.species_id
ORDER BY sighting_time DESC
LIMIT 2;

-- Problem 7 
UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';

-- Problem 8 
SELECT
    sighting_id,
    CASE
        WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 16 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;

-- Problem 9 
DELETE FROM rangers
WHERE NOT EXISTS (
    SELECT 1
    FROM sightings
    WHERE sightings.ranger_id = rangers.ranger_id
);


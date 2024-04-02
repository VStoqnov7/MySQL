USE `journey_db`;

DELIMITER $$
CREATE FUNCTION udf_count_colonists_by_destination_planet(planet_name VARCHAR(30))
RETURNS INT
BEGIN
	DECLARE c_count INT;
	SET c_count := (
	SELECT count(c.`id`)
	FROM `colonists` AS c
	JOIN `travel_cards` tc 
	ON c.id = tc.colonist_id
	JOIN `journeys` AS j 
	ON tc.`journey_id` = j.`id`
	JOIN `spaceports` AS s 
	ON j.`destination_spaceport_id` = s.`id`
	JOIN `planets` AS p 
	ON s.`planet_id` = p.`id`
	WHERE p.`name` = planet_name
	);
	RETURN c_count;
END$$
  
DELIMITER ;
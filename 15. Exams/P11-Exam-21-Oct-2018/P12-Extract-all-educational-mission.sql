USE `journey_db`;

SELECT p.`name`,
	s.`name`
	FROM `planets` AS p 
	JOIN `spaceports` AS s
	on p.`id` = s.`planet_id`
	JOIN `journeys` AS j
	ON s.`id` = j.`destination_spaceport_id`
	WHERE j.`purpose` = 'Educational'
	ORDER BY s.`name` DESC;
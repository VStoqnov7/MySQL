USE `journey_db`;

SELECT sp.`name`,
	s.`name`
	FROM `spaceships` AS sp
	JOIN `journeys` AS j
	ON sp.`id` = j.`spaceship_id`
	JOIN `spaceports` AS s
	ON j.`destination_spaceport_id` = s.`id`
	ORDER BY sp.`light_speed_rate` DESC
	LIMIT 1;
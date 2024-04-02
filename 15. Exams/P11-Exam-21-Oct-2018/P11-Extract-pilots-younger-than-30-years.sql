USE `journey_db`;

SELECT DISTINCT s.`name`,
	s.`manufacturer`
	FROM `spaceships` AS s
	JOIN `journeys` AS j
	ON s.`id` =  j.`spaceship_id`
	JOIN `travel_cards` AS tc
	ON j.`id` = tc.`journey_id`
	JOIN `colonists` AS c
	ON tc.`colonist_id` = c.`id`
	WHERE year(c.`birth_date`) > year(DATE_SUB('2019-01-01', INTERVAL 30 YEAR)) 
	AND tc.`job_during_journey` = 'Pilot'
	ORDER BY s.`name`;
        
        
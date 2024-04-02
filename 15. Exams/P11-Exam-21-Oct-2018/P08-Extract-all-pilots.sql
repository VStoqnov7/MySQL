USE `journey_db`;

SELECT c.`id`,
	CONCAT_WS(' ', `first_name`, `last_name`) AS `full_name`
	FROM `colonists` AS c
	JOIN `travel_cards` AS tc
	ON c.`id` = tc.`colonist_id`
	WHERE `job_during_journey` = 'Pilot'
	ORDER BY `id`;
        
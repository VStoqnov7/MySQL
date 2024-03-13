USE `airlines_db`;

UPDATE `flights` AS f
	JOIN `countries` AS c
	ON f.`departure_country` = c.`id`
	SET f.`airplane_id` = f.`airplane_id` + 1
	WHERE c.`name` = 'Armenia';
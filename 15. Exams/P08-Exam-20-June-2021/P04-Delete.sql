USE `cars`;

DELETE c
	FROM `clients` AS c
	LEFT JOIN `courses` AS co
	ON c.`id` = co.`client_id`
	WHERE co.`id` IS NULL AND LENGTH(c.`full_name`) > 3;
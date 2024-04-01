USE `journey_db`;

SELECT `id`,
	CONCAT(`first_name`, ' ', `last_name`) AS `full_name`,
	`ucn`
	FROM `colonists`
	ORDER BY `first_name`, `last_name`, `id`;
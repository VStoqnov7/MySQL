USE `preserves_db`;

INSERT INTO `preserves`(`name`, `latitude`, `longitude`, `area`, `type`, `established_on`)
	SELECT CONCAT(`name`, ' ', 'is in South Hemisphere') AS `name`,
			`latitude` AS `latitude`,
			`longitude` AS `longitude`,
			`area` * `id` AS `area`,
			LOWER(`type`) AS `type`,
			`established_on` AS `established_on`
	FROM `preserves`
	WHERE `latitude` < 0 ;
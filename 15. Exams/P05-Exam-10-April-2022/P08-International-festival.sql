USE `softuni_imdb`;

SELECT `name`,
	COUNT(`country_id`) AS `movies_count`
	FROM `countries` AS c
	JOIN `movies` AS m
	ON c.`id` = m.`country_id`
	GROUP BY `name`
	HAVING `movies_count` >= 7
	ORDER BY `name` DESC;
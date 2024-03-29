USE `users_db`; 

SELECT p.`id`,
	p.`date` AS `date_and_time`,
	p.`description`,
	COUNT(c.`id`) AS `commentsCount`
	FROM `photos` as p
	JOIN `comments` AS c
	ON p.`id` = c.`photo_id`
	GROUP BY `id`, `date_and_time`, `description`
	ORDER BY `commentsCount` DESC, `id`
	LIMIT 5;
		
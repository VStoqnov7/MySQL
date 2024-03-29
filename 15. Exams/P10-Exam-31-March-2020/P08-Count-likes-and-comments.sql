USE `users_db`; 

SELECT p.`id` AS `photo_id`,
	IFNULL(COUNT(DISTINCT l.`id`), 0) AS `liKes_count`,
	IFNULL(COUNT(DISTINCT c.`id`), 0) AS `comments_count`
	FROM `photos` AS p
	LEFT JOIN `likes` AS l
	ON p.`id` = l.`photo_id`
	LEFT JOIN `comments` AS c
	ON p.`id` = c.`photo_id`
	GROUP BY p.`id`
	ORDER BY `liKes_count` DESC, `comments_count` DESC ,  p.`id`;
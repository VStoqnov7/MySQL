USE `users_db`; 

SELECT CONCAT(u.`id`, ' ', u.`username`) AS `id_username`,
	u.`email`
	FROM `users` as u
	JOIN `users_photos` AS up
	ON u.`id` = up.`user_id`
	WHERE u.`id` = up.`photo_id`
	ORDER BY u.`id`;
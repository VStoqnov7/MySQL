USE `users_db`; 

INSERT INTO `addresses`(`address`, `town`, `country`, `user_id`)
	SELECT `username` AS `address`,
			`password` AS  `town`,
			`ip` AS `country`,
			`age` AS `user_id`
	FROM `users`
	WHERE `gender` = 'M';
        
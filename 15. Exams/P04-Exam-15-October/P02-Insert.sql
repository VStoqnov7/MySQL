USE `restaurant_db`;

INSERT INTO `products`(`name`, `type`, `price`)
	SELECT CONCAT(`last_name`, ' ', 'specialty') AS `name`,
		'Cocktail' AS `type`,
		CEIL(`salary` * 0.01) AS `price`
	FROM `waiters`
	WHERE `id` > 6;
USE `online_store`;

INSERT INTO `reviews`(`content`, `picture_url`, `published_at`, `rating`)
	SELECT SUBSTRING(`description`, 1, 15) AS `content`,
			REVERSE(`name`) AS `picture_url`,
			'2010-10-10' AS `published_at`,
			`price` / 8 AS `rating`
	FROM `products`
	WHERE `id` >= 5;
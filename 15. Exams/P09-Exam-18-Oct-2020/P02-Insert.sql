USE `softuni`;

INSERT INTO `products_stores`(`product_id`, `store_id`)
	SELECT p.`id`, 1
	FROM `products` AS p
	LEFT JOIN `products_stores` AS ps 
	ON p.`id` = ps.`product_id`
	WHERE ps.`product_id` IS NULL;
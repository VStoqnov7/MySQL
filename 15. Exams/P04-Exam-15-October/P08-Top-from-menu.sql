USE `restaurant_db`;

SELECT p.`id`,
	p.`name`,
	COUNT(`product_id`) AS `count`
	FROM `products` AS p
	JOIN `orders_products` AS op 
	ON p.`id` = op.`product_id`
	GROUP BY `id`,`name`
	HAVING `count` >= 5
	ORDER BY `count` DESC, `name`;
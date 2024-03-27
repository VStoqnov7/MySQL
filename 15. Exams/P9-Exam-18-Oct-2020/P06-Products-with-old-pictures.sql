USE `softuni`;

SELECT p.`name` AS `product_name`,
	p.`price`,
	p.`best_before`,
	CONCAT(SUBSTRING(`description`, 1, 10), '...') AS `short_description`,
	`url`
	FROM `products` as p
	JOIN `pictures` AS pc
	ON p.`pIcture_id` = pc.`id`
	WHERE LENGTH(p.`description`) > 100 AND 
	YEAR(pc.`added_on`) < 2019 AND 
	p.`price` > 20
	ORDER BY p.`price` DESC;
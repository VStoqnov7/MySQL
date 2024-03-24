USE `restaurant_db`;

SELECT  o.`table_id`,
	t.`capacity`,
	COUNT(oc.`order_id`) AS `count_clients`,
	CASE 
		WHEN COUNT(oc.`order_id`) < `capacity` THEN 'Free seats'
		WHEN COUNT(oc.`order_id`) = `capacity` THEN 'Full'
		WHEN COUNT(oc.`order_id`) > `capacity` THEN 'Extra seats'
		END
	AS `availability`
	FROM `tables` AS t
	JOIN `orders` AS o
	ON t.`id` = o.`table_id`
	JOIN `orders_clients` AS oc
	ON o.`id` = oc.`order_id`
	WHERE t.`floor` = 1
	GROUP BY
	o.`table_id`, t.`capacity`
	ORDER BY o.`table_id` DESC;
        
        
USE `cars`;

SELECT c.`full_name`,
	COUNT(ca.`id`) AS `count_of_cars`,
	SUM(co.`bill`) AS `total_sum`
	FROM `clients` AS c
	JOIN `courses` AS co
	ON c.`id` = co.`client_id`
	JOIN `cars` AS ca
	ON co.`car_id` = ca.`id`
	WHERE c.`full_name` LIKE '_a%'
	GROUP BY c.`full_name`
	HAVING `count_of_cars` > 1
	ORDER BY c.`full_name`;
USE `cars`;

SELECT c.`id`,
	c.`make`,
	c.`mileage`,
	COALESCE(COUNT(co.`id`), 0) AS `count_of_courses`,
	COALESCE(ROUND(AVG(co.`bill`), 2), NULL) AS `avg_bill`
	FROM `cars` AS c
	LEFT JOIN `courses` AS co ON c.`id` = co.`car_id`
	GROUP BY c.`id`, c.`make`, c.`mileage`
	HAVING `count_of_courses` <> 2
	ORDER BY `count_of_courses` DESC, c.`id`;
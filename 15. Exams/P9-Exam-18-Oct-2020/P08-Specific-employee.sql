USE `softuni`;

SELECT CONCAT(e.`first_name`, ' ', e.`last_name`) AS `full_name`,
	s.`name`,
	a.`name`,
	e.`salary`
	FROM `employees` AS e
	JOIN `stores` AS s
	ON e.`store_id` = s.`id`
	JOIN `addresses` AS a
	ON s.`address_id` = a.`id`
	WHERE e.`salary` < 4000 AND
	a.`name` LIKE '%5%' AND 
	LENGTH(s.`name`) >= 8 AND 
	e.`last_name` LIKE '%n';
        